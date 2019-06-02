        extern _printf

        section __TEXT,__text
        global _main

_main:
        push rbx                ; save the rbx register since we're using it
        mov ecx, 90             ; count down from 90

        ;;  rax is the current number, and starts at zero
        xor rax, rax            ; zero rax

        ;;  rbx is the next number in the sequence, it starts at 1
        xor rbx, rbx            ; zero rbx
        inc rbx                 ; start rbx at 1

print:
        ;;  save some registers
        push rax                ; caller needs to save it's register
        push rcx                ; caller needs to save it's register

        lea rdi, [rel format]   ; load the address of the format string into rdi (1st parameter)
        mov rsi, rax            ; move the current number into rsi (second parameter)
        xor rax, rax            ; rax should hold the number of floats passed to a variadic function (none in this case)
        call _printf             ; printf(format, current number)
        pop rcx                 ; restore rcx
        pop rax                 ; restore rax

        ;; calculate the next fibbonacci number
        mov rdx, rax            ; move the current number into a temporary buffer
        mov rax, rbx            ; make the next number current
        add rbx, rdx            ; the next number is the last number plus the current number

        dec ecx                 ; count down
        jnz print               ; if we aren't at zero, loop

        pop rbx                 ; restore rbx
        ret

        section .data
format: db "%20ld", 10, 0
