#include <ctype.h>
#include <errno.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <signal.h>
#include <sys/wait.h>
#include <termios.h>
#include <unistd.h>
#include <dirent.h>
#include <fcntl.h>

#include "tokenizer.h"

/* Convenience macro to silence compiler warnings about unused function parameters. */
#define unused __attribute__((unused))

/* Whether the shell is connected to an actual terminal or not. */
bool shell_is_interactive;

/* File descriptor for the shell input */
int shell_terminal;

/* Terminal mode settings for the shell */
struct termios shell_tmodes;

/* Process group id for the shell */
pid_t shell_pgid;

int cmd_exit(struct tokens *tokens);
int cmd_help(struct tokens *tokens);
int cmd_chdir(struct tokens *tokens);
int cmd_pwd(struct tokens *tokens);
int cmd_exec(struct tokens *tokens);
int cmd_exec2(char *path, char *name, char **args, char *filename, int direction);

/* Built-in command functions take token array (see parse.h) and return int */
typedef int cmd_fun_t(struct tokens *tokens);

/* Built-in command struct and lookup table */
typedef struct fun_desc {
  cmd_fun_t *fun;
  char *cmd;
  char *doc;
} fun_desc_t;

fun_desc_t cmd_table[] = {
  {cmd_help, "?", "show this help menu"},
  {cmd_exit, "exit", "exit the command shell"},
  {cmd_chdir, "cd", "change the current directory"},
  {cmd_pwd, "pwd", "print the working directory"},
  {cmd_exec, "execv", "execute the file"}
};

/* Change the current working directory */
int cmd_chdir(unused struct tokens *tokens) {
  size_t len = tokens_get_length(tokens);
  if (len > 2) {
    char str[30];
    sprintf(str, "expect 0 or 1 argument, %lu are given\n", len-1);
    perror(str);
    exit(1);
  }
  else if (len == 2){
    char *path = tokens_get_token(tokens, 1);
    chdir(path);
  }
  else {
    char *home = getenv("HOME");
    chdir(home);
  }
  return 0;
}

/* Prints the current working directory */
int cmd_pwd(unused struct tokens *tokens) {
  char buf[4096];
  if (getcwd(buf, sizeof(buf)) == NULL)
    perror("pwd error\n");
  else
    printf("%s\n", buf);
  return 0;
}

/* Prints a helpful description for the given command */
int cmd_help(unused struct tokens *tokens) {
  for (unsigned int i = 0; i < sizeof(cmd_table) / sizeof(fun_desc_t) - 1; i++)
    printf("%s - %s\n", cmd_table[i].cmd, cmd_table[i].doc);
  return 1;
}

/* Exits this shell */
int cmd_exit(unused struct tokens *tokens) {
  exit(0);
}

/* execute the command */
int cmd_exec(unused struct tokens *tokens) {
  printf("the parent pid is %d and pgrp ID is %d\n", getpid(), getpgrp());
  char *cmd = tokens_get_token(tokens, 0);
  int len = tokens_get_length(tokens);
  char *args[len+1];
  char *filename = NULL;
  int direction = 0;
  int background = 0;

  if (len > 0 && strcmp(tokens_get_token(tokens, len-1), "&") == 0) {
    background = 1;
    len -= 1;
  }

  if (len-2 > 0) {
    char *sign = tokens_get_token(tokens, len-2);
    if (strcmp(sign, "<") == 0 || strcmp(sign, ">") == 0) {
      direction = strcmp(sign, "<") == 0 ? -1 : 1;
      filename = tokens_get_token(tokens, len-1);
    }
  }

  size_t args_length = direction == 0 ? len : len-2;
  for (int i = 0; i < args_length; i++) {
    args[i] = tokens_get_token(tokens, i);
  }
  args[args_length] = NULL;

  pid_t cpid;

  if (access(cmd, F_OK) != -1) {
    if ((cpid=fork()) == 0) {
      printf("the child pgid is %d\n", getpgrp());
      int fd;
      if (direction == -1) {
        fd = open(filename, O_RDONLY);
        dup2(fd, 0);
        close(fd);
      }
      else if (direction == 1) {
         fd = open(filename, O_CREAT | O_WRONLY, 0644);
         dup2(fd, 1);
         close(fd);
      }
      execv(cmd, args);
    }
    else {
      if (!background) {
        setpgid(cpid, cpid);
        signal(SIGTTOU, SIG_IGN);
        tcsetpgrp(0, cpid);
        int status;
        wait(&status);
        tcsetpgrp(0, getpid());
        signal(SIGTTOU, SIG_DFL);
      }
    }
  }
  else {
    char *paths = getenv("PATH");
    int start;
    int end;
    for (start = 0, end = 0; paths[end] !='\0'; end++) {
      if (paths[end] == ':') {
        char path[end-start+1];
        int idx = 0;
        for (int i = start; i < end; i++)
          path[idx++] = paths[i];
        path[idx] = '\0';
        start = end+1;
        if (cmd_exec2(path, cmd, args, filename, direction) == 0)
          return 0;
      }
    }
    char path[end-start+1];
    int idx = 0;
    for (int i = start; i < end; i++)
      path[idx++] = paths[i];
    if (cmd_exec2(path, cmd, args, filename, direction) == 0)
      return 0;
  }
  return -1;
}

/* search the cmd in the directory and execute the cmd */
int cmd_exec2(char *path, char *name, char **args, char *filename, int direction) {
  printf("direcotry: %s, cmd: %s\n", path, name);
  DIR *dir;
  struct dirent *entry;
  if (name == NULL)
    return -1;
  if ((dir = opendir(path)) == NULL) {
    perror("unable to open the directory");
  }
  else {
    while ((entry = readdir(dir)) != NULL) {
      if (strcmp(name, entry->d_name) == 0) {
        if (fork() == 0) {
          char exec_path[strlen(path) + strlen(name) + 2];
          strcpy(exec_path, path);
          strcat(exec_path, "/");
          strcat(exec_path, entry->d_name);
          int fd;
          if (direction == -1) {
            fd = open(filename, O_RDONLY);
            dup2(fd, 0);
            close(fd);
          }
          else if (direction == 1) {
            fd = open(filename, O_CREAT | O_WRONLY, 0644);
            dup2(fd, 1);
            close(fd);
          }
          execv(exec_path, args);
        }
        else {
          int status;
          wait(&status);
          if (status == 0)
            return 0;
        }
      }
    }
    closedir(dir);
  }
  return -1;
}

/* Looks up the built-in command, if it exists. */
int lookup(char cmd[]) {
  for (unsigned int i = 0; i < sizeof(cmd_table) / sizeof(fun_desc_t) - 1; i++)
    if (cmd && (strcmp(cmd_table[i].cmd, cmd) == 0))
      return i;
  return sizeof(cmd_table) / sizeof(fun_desc_t) - 1;
}

/* Intialization procedures for this shell */
void init_shell() {
  /* Our shell is connected to standard input. */
  shell_terminal = STDIN_FILENO;

  /* Check if we are running interactively */
  shell_is_interactive = isatty(shell_terminal);

  if (shell_is_interactive) {
    /* If the shell is not currently in the foreground, we must pause the shell until it becomes a
     * foreground process. We use SIGTTIN to pause the shell. When the shell gets moved to the
     * foreground, we'll receive a SIGCONT. */
    while (tcgetpgrp(shell_terminal) != (shell_pgid = getpgrp()))
      kill(-shell_pgid, SIGTTIN);

    /* Saves the shell's process id */
    shell_pgid = getpid();

    /* Take control of the terminal */
    tcsetpgrp(shell_terminal, shell_pgid);

    /* Save the current termios to a variable, so it can be restored later. */
    tcgetattr(shell_terminal, &shell_tmodes);
  }
}

int main(unused int argc, unused char *argv[]) {
  init_shell();

  static char line[4096];
  int line_num = 0;

  /* Please only print shell prompts when standard input is not a tty */
  if (shell_is_interactive)
    fprintf(stdout, "%d: ", line_num);

  while (fgets(line, 4096, stdin)) {
    /* Split our line into words. */
    struct tokens *tokens = tokenize(line);

    /* Find which built-in function to run. */
    int fundex = lookup(tokens_get_token(tokens, 0));

    if (fundex >= 0) {
      cmd_table[fundex].fun(tokens);
    } else {
      /* REPLACE this to run commands as programs. */
      fprintf(stdout, "This shell doesn't know how to run programs.\n");
    }

    if (shell_is_interactive)
      /* Please only print shell prompts when standard input is not a tty */
      fprintf(stdout, "%d: ", ++line_num);

    /* Clean up memory */
    tokens_destroy(tokens);
  }

  return 0;
}
