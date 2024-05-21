section .data
input_string_first db "- - * - - * - - * ", 0xa
input_string db "-- -- -- -* -- -- -* -- -- -* -- -- -- -* -- -- -* -- -- -* *- *- *- ** *- *- ** *- *- ** -- -- -- -* -- -- -* -- -- -* -- -- -- -* -- -- -* -- -- -* *- *- *- ** *- *- ** *- *- ** -- -- -- -* -- -- -* -- -- -* -- -- -- -* -- -- -* -- -- -* *- *- *- ** *- *- ** *- *- ** ---", 0xa

section .text
global _func_asm
extern _atoi

_func_asm:
    push rdi ; 첫 인자로 들어온 값 스택에 저장

    mov rax, 0x2000004 ; write 주소 저장
    mov rdi, 1 ; 파일 디스크립터 값 저장
    lea rsi, [rel input_string_first] ; 출력 문장 - - * - - * - - * 저장
    mov rdx, 18 ; 18문장
    syscall

    pop rdi ; 스택에서 숫자 빼서 rdi에 저장
    call _atoi ; atoi 함수 콜

    mov rdx, rax ; 숫자로 변경된 값 rdx로 이동
    sub rdx, 10
    add rdx, 1
    imul rdx, 3 ; 얼마나 출력할지 계산
    mov rax, 0x2000004 ; write 주소 저장
    mov rdi, 1 ; 파일 디스크립터 값 설정
    lea rsi, [rel input_string] ; 출력할 문장
    syscall

    ret