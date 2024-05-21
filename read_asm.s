section .text
	global _read_asm

_read_asm:
	mov rax, 0x2000003
	syscall
	ret