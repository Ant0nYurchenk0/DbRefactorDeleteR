# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /mnt/d/Prog/C++/Refactoring-Labs/Lab2_SaveR

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/d/Prog/C++/Refactoring-Labs/Lab2_SaveR/build

# Include any dependencies generated for this target.
include CMakeFiles/lab2.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/lab2.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/lab2.dir/flags.make

CMakeFiles/lab2.dir/lex.yy.c.o: CMakeFiles/lab2.dir/flags.make
CMakeFiles/lab2.dir/lex.yy.c.o: ../lex.yy.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Prog/C++/Refactoring-Labs/Lab2_SaveR/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/lab2.dir/lex.yy.c.o"
	/usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lab2.dir/lex.yy.c.o   -c /mnt/d/Prog/C++/Refactoring-Labs/Lab2_SaveR/lex.yy.c

CMakeFiles/lab2.dir/lex.yy.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lab2.dir/lex.yy.c.i"
	/usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/d/Prog/C++/Refactoring-Labs/Lab2_SaveR/lex.yy.c > CMakeFiles/lab2.dir/lex.yy.c.i

CMakeFiles/lab2.dir/lex.yy.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lab2.dir/lex.yy.c.s"
	/usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/d/Prog/C++/Refactoring-Labs/Lab2_SaveR/lex.yy.c -o CMakeFiles/lab2.dir/lex.yy.c.s

CMakeFiles/lab2.dir/lex.yy.c.o.requires:

.PHONY : CMakeFiles/lab2.dir/lex.yy.c.o.requires

CMakeFiles/lab2.dir/lex.yy.c.o.provides: CMakeFiles/lab2.dir/lex.yy.c.o.requires
	$(MAKE) -f CMakeFiles/lab2.dir/build.make CMakeFiles/lab2.dir/lex.yy.c.o.provides.build
.PHONY : CMakeFiles/lab2.dir/lex.yy.c.o.provides

CMakeFiles/lab2.dir/lex.yy.c.o.provides.build: CMakeFiles/lab2.dir/lex.yy.c.o


CMakeFiles/lab2.dir/parser.tab.c.o: CMakeFiles/lab2.dir/flags.make
CMakeFiles/lab2.dir/parser.tab.c.o: ../parser.tab.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Prog/C++/Refactoring-Labs/Lab2_SaveR/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/lab2.dir/parser.tab.c.o"
	/usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lab2.dir/parser.tab.c.o   -c /mnt/d/Prog/C++/Refactoring-Labs/Lab2_SaveR/parser.tab.c

CMakeFiles/lab2.dir/parser.tab.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lab2.dir/parser.tab.c.i"
	/usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/d/Prog/C++/Refactoring-Labs/Lab2_SaveR/parser.tab.c > CMakeFiles/lab2.dir/parser.tab.c.i

CMakeFiles/lab2.dir/parser.tab.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lab2.dir/parser.tab.c.s"
	/usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/d/Prog/C++/Refactoring-Labs/Lab2_SaveR/parser.tab.c -o CMakeFiles/lab2.dir/parser.tab.c.s

CMakeFiles/lab2.dir/parser.tab.c.o.requires:

.PHONY : CMakeFiles/lab2.dir/parser.tab.c.o.requires

CMakeFiles/lab2.dir/parser.tab.c.o.provides: CMakeFiles/lab2.dir/parser.tab.c.o.requires
	$(MAKE) -f CMakeFiles/lab2.dir/build.make CMakeFiles/lab2.dir/parser.tab.c.o.provides.build
.PHONY : CMakeFiles/lab2.dir/parser.tab.c.o.provides

CMakeFiles/lab2.dir/parser.tab.c.o.provides.build: CMakeFiles/lab2.dir/parser.tab.c.o


CMakeFiles/lab2.dir/main.c.o: CMakeFiles/lab2.dir/flags.make
CMakeFiles/lab2.dir/main.c.o: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Prog/C++/Refactoring-Labs/Lab2_SaveR/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/lab2.dir/main.c.o"
	/usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lab2.dir/main.c.o   -c /mnt/d/Prog/C++/Refactoring-Labs/Lab2_SaveR/main.c

CMakeFiles/lab2.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lab2.dir/main.c.i"
	/usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/d/Prog/C++/Refactoring-Labs/Lab2_SaveR/main.c > CMakeFiles/lab2.dir/main.c.i

CMakeFiles/lab2.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lab2.dir/main.c.s"
	/usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/d/Prog/C++/Refactoring-Labs/Lab2_SaveR/main.c -o CMakeFiles/lab2.dir/main.c.s

CMakeFiles/lab2.dir/main.c.o.requires:

.PHONY : CMakeFiles/lab2.dir/main.c.o.requires

CMakeFiles/lab2.dir/main.c.o.provides: CMakeFiles/lab2.dir/main.c.o.requires
	$(MAKE) -f CMakeFiles/lab2.dir/build.make CMakeFiles/lab2.dir/main.c.o.provides.build
.PHONY : CMakeFiles/lab2.dir/main.c.o.provides

CMakeFiles/lab2.dir/main.c.o.provides.build: CMakeFiles/lab2.dir/main.c.o


# Object files for target lab2
lab2_OBJECTS = \
"CMakeFiles/lab2.dir/lex.yy.c.o" \
"CMakeFiles/lab2.dir/parser.tab.c.o" \
"CMakeFiles/lab2.dir/main.c.o"

# External object files for target lab2
lab2_EXTERNAL_OBJECTS =

lab2: CMakeFiles/lab2.dir/lex.yy.c.o
lab2: CMakeFiles/lab2.dir/parser.tab.c.o
lab2: CMakeFiles/lab2.dir/main.c.o
lab2: CMakeFiles/lab2.dir/build.make
lab2: CMakeFiles/lab2.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/mnt/d/Prog/C++/Refactoring-Labs/Lab2_SaveR/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C executable lab2"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lab2.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/lab2.dir/build: lab2

.PHONY : CMakeFiles/lab2.dir/build

CMakeFiles/lab2.dir/requires: CMakeFiles/lab2.dir/lex.yy.c.o.requires
CMakeFiles/lab2.dir/requires: CMakeFiles/lab2.dir/parser.tab.c.o.requires
CMakeFiles/lab2.dir/requires: CMakeFiles/lab2.dir/main.c.o.requires

.PHONY : CMakeFiles/lab2.dir/requires

CMakeFiles/lab2.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/lab2.dir/cmake_clean.cmake
.PHONY : CMakeFiles/lab2.dir/clean

CMakeFiles/lab2.dir/depend:
	cd /mnt/d/Prog/C++/Refactoring-Labs/Lab2_SaveR/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/d/Prog/C++/Refactoring-Labs/Lab2_SaveR /mnt/d/Prog/C++/Refactoring-Labs/Lab2_SaveR /mnt/d/Prog/C++/Refactoring-Labs/Lab2_SaveR/build /mnt/d/Prog/C++/Refactoring-Labs/Lab2_SaveR/build /mnt/d/Prog/C++/Refactoring-Labs/Lab2_SaveR/build/CMakeFiles/lab2.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/lab2.dir/depend
