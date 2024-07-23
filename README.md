# ASM projects (x86_64)

# 1. Basic Shell in Assembly Language

## Overview

This project is a basic shell implemented in assembly language. It demonstrates fundamental concepts of system programming, such as handling user input, executing commands, and managing processes at a low level. The shell is designed to be simple and educational, making it a great starting point for understanding how operating systems and command-line interfaces work.

## Features

- **Command Prompt**: Displays a prompt to the user and waits for input.
- **Command Execution**: Executes basic shell commands.
- **Process Management**: Handles the creation and management of processes.

## TO_DO's

- **Input Parsing**: Parses user input to extract commands and arguments.
  
- Here are some additional commands that can be implemented:

1. **List Directory Contents (`ls`)**:
   - **Description**: Lists the contents of the current directory.
   - **Implementation**: Use system calls to read directory contents and print them to the console.

2. **Print Working Directory (`pwd`)**:
   - **Description**: Prints the current working directory.
   - **Implementation**: Use system calls to retrieve and print the current directory path.

3. **Change Directory (`cd`)**:
   - **Description**: Changes the current working directory.
   - **Implementation**: Use system calls to change the directory based on user input.

4. **Clear Screen (`clear`)**:
   - **Description**: Clears the terminal screen.
   - **Implementation**: Send the appropriate terminal escape codes to clear the screen.

## NOTE

- only echo, help and exit commands are available. workin' on more soon.
- echo dosen't parse input properly causing an issue.
- string comparision is not the best.
