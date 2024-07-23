global _start
section .text
_start:

print:
        MOV eax, 0x1
        MOV edi, 0x1
        MOV esi, prompt
        MOV edx, msglen
        SYSCALL

read:
        MOV eax, 0x0
	MOV edi, 0x0
	MOV esi, buffer
	MOV edx, msgleni
	SYSCALL

match:
	lea rsi, cmd_exit
	lea rdi, buffer
	mov rcx, 4
compare:
	repe cmpsb
	je cmd_exit_handler

match1:
	lea rsi, cmd_help
	lea rdi, buffer
	mov rcx, 4
compare1:
	repe cmpsb
	je cmd_help_handler

match2:
	lea rsi, cmd_echo
	lea rdi, buffer
	mov rcx, 4
compare2:
	repe cmpsb
	je cmd_echo_handler


unknown_command:
	mov eax, 1          ; sys_write
        mov edi, 1          ; file descriptor (stdout)
	mov rsi, msg
        mov rdx, uk_len
        syscall
	jmp print	


cmd_exit_handler:
	mov eax, 0x3c
	mov edi, 0x0
	syscall
	jmp print

cmd_help_handler:
	mov eax, 0x1
	mov edi, 0x1
	mov rsi, help
	mov rdx, helplen
	syscall
	jmp print

	mov rsi, buffer
cmd_echo_handler:
	lodsb
	mov al,0
cmd_echo_handler_main:
	mov eax, 0x1
	mov edi, 0x1
	mov rsi, rsi
	mov rdx, bufferlen
	syscall
	jmp print




section .data
        prompt: DB"shell> ", 0x0
	msglen: equ $-prompt
	help: DB"a smol program build by me. available commands are 1) echo 2) help 3) exit", 0xA
	helplen: equ $  -help
	msg: db"unknown command. use help",0xA
	uk_len: equ $ - msg
	cmd_exit: DB "exit\n", 0
	cmd_help: DB "help\n", 0
	cmd_echo: DB "echo\n", 0
	cmd_ls: db"ls", 0
	msgleni: equ 0x40



section .bss
	buffer: resb 64
	bufferlen: equ $ - buffer