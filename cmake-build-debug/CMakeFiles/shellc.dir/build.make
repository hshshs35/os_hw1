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
include CMakeFiles/shellc.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/shellc.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/shellc.dir/flags.make

CMakeFiles/shellc.dir/shell.c.o: CMakeFiles/shellc.dir/flags.make
CMakeFiles/shellc.dir/shell.c.o: ../shell.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/sha.huang/ucb/hw1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/shellc.dir/shell.c.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/shellc.dir/shell.c.o   -c /Users/sha.huang/ucb/hw1/shell.c

CMakeFiles/shellc.dir/shell.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/shellc.dir/shell.c.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/sha.huang/ucb/hw1/shell.c > CMakeFiles/shellc.dir/shell.c.i

CMakeFiles/shellc.dir/shell.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/shellc.dir/shell.c.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/sha.huang/ucb/hw1/shell.c -o CMakeFiles/shellc.dir/shell.c.s

CMakeFiles/shellc.dir/tokenizer.c.o: CMakeFiles/shellc.dir/flags.make
CMakeFiles/shellc.dir/tokenizer.c.o: ../tokenizer.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/sha.huang/ucb/hw1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/shellc.dir/tokenizer.c.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/shellc.dir/tokenizer.c.o   -c /Users/sha.huang/ucb/hw1/tokenizer.c

CMakeFiles/shellc.dir/tokenizer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/shellc.dir/tokenizer.c.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/sha.huang/ucb/hw1/tokenizer.c > CMakeFiles/shellc.dir/tokenizer.c.i

CMakeFiles/shellc.dir/tokenizer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/shellc.dir/tokenizer.c.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/sha.huang/ucb/hw1/tokenizer.c -o CMakeFiles/shellc.dir/tokenizer.c.s

# Object files for target shellc
shellc_OBJECTS = \
"CMakeFiles/shellc.dir/shell.c.o" \
"CMakeFiles/shellc.dir/tokenizer.c.o"

# External object files for target shellc
shellc_EXTERNAL_OBJECTS =

shellc: CMakeFiles/shellc.dir/shell.c.o
shellc: CMakeFiles/shellc.dir/tokenizer.c.o
shellc: CMakeFiles/shellc.dir/build.make
shellc: CMakeFiles/shellc.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/sha.huang/ucb/hw1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable shellc"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/shellc.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/shellc.dir/build: shellc

.PHONY : CMakeFiles/shellc.dir/build

CMakeFiles/shellc.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/shellc.dir/cmake_clean.cmake
.PHONY : CMakeFiles/shellc.dir/clean

CMakeFiles/shellc.dir/depend:
	cd /Users/sha.huang/ucb/hw1/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/sha.huang/ucb/hw1 /Users/sha.huang/ucb/hw1 /Users/sha.huang/ucb/hw1/cmake-build-debug /Users/sha.huang/ucb/hw1/cmake-build-debug /Users/sha.huang/ucb/hw1/cmake-build-debug/CMakeFiles/shellc.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/shellc.dir/depend

