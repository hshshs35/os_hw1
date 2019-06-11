#include <unistd.h>
#include <stdio.h>
int main() {
  while (1) {
    printf("tick tok!\n");
    sleep(5);
  }
}