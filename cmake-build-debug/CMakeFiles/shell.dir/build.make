# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/sha.huang/ucb/hw1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/sha.huang/ucb/hw1/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/shell.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/shell.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/shell.dir/flags.make

CMakeFiles/shell.dir/shell.c.o: CMakeFiles/shell.dir/flags.make
CMakeFiles/shell.dir/shell.c.o: ../shell.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/sha.huang/ucb/hw1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/shell.dir/shell.c.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/shell.dir/shell.c.o   -c /Users/sha.huang/ucb/hw1/shell.c

CMakeFiles/shell.dir/shell.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/shell.dir/shell.c.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/sha.huang/ucb/hw1/shell.c > CMakeFiles/shell.dir/shell.c.i

CMakeFiles/shell.dir/shell.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/shell.dir/shell.c.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/sha.huang/ucb/hw1/shell.c -o CMakeFiles/shell.dir/shell.c.s

CMakeFiles/shell.dir/process.c.o: CMakeFiles/shell.dir/flags.make
CMakeFiles/shell.dir/process.c.o: ../process.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/sha.huang/ucb/hw1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/shell.dir/process.c.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/shell.dir/process.c.o   -c /Users/sha.huang/ucb/hw1/process.c

CMakeFiles/shell.dir/process.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/shell.dir/process.c.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/sha.huang/ucb/hw1/process.c > CMakeFiles/shell.dir/process.c.i

CMakeFiles/shell.dir/process.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/shell.dir/process.c.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/sha.huang/ucb/hw1/process.c -o CMakeFiles/shell.dir/process.c.s

CMakeFiles/shell.dir/tokenizer.c.o: CMakeFiles/shell.dir/flags.make
CMakeFiles/shell.dir/tokenizer.c.o: ../tokenizer.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/sha.huang/ucb/hw1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/shell.dir/tokenizer.c.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/shell.dir/tokenizer.c.o   -c /Users/sha.huang/ucb/hw1/tokenizer.c

CMakeFiles/shell.dir/tokenizer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/shell.dir/tokenizer.c.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/sha.huang/ucb/hw1/tokenizer.c > CMakeFiles/shell.dir/tokenizer.c.i

CMakeFiles/shell.dir/tokenizer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/shell.dir/tokenizer.c.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/sha.huang/ucb/hw1/tokenizer.c -o CMakeFiles/shell.dir/tokenizer.c.s

# Object files for target shell
shell_OBJECTS = \
"CMakeFiles/shell.dir/shell.c.o" \
"CMakeFiles/shell.dir/process.c.o" \
"CMakeFiles/shell.dir/tokenizer.c.o"

# External object files for target shell
shell_EXTERNAL_OBJECTS =

shell: CMakeFiles/shell.dir/shell.c.o
shell: CMakeFiles/shell.dir/process.c.o
shell: CMakeFiles/shell.dir/tokenizer.c.o
shell: CMakeFiles/shell.dir/build.make
shell: CMakeFiles/shell.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/sha.huang/ucb/hw1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C executable shell"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/shell.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/shell.dir/build: shell

.PHONY : CMakeFiles/shell.dir/build

CMakeFiles/shell.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/shell.dir/cmake_clean.cmake
.PHONY : CMakeFiles/shell.dir/clean

CMakeFiles/shell.dir/depend:
	cd /Users/sha.huang/ucb/hw1/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/sha.huang/ucb/hw1 /Users/sha.huang/ucb/hw1 /Users/sha.huang/ucb/hw1/cmake-build-debug /Users/sha.huang/ucb/hw1/cmake-build-debug /Users/sha.huang/ucb/hw1/cmake-build-debug/CMakeFiles/shell.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/shell.dir/depend
