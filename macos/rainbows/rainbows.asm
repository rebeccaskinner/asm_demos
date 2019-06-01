        global start
        section .text
start:
        ;; Registers:
        ;; rdx holds the output buffer
        ;; r8: holds the length of the current line
        ;; r9: holds the number of items written on the current line
        mov rdx, output         ; store the address of the output buffer in rdx
        mov r8, 1               ; initialize line to 1
        mov r9, 0               ; intitilize number written to 0
line:
        mov byte [rdx], 0xf0    ; rainbow byte 1
        inc rdx
        mov byte [rdx], 0x9f
        inc rdx
        mov byte [rdx], 0x8c
        inc rdx
        mov byte [rdx], 0x88
        inc rdx
        inc r9                  ; incr the number of items written
        cmp r9, r8              ; if items written != line number
        jne line                ; goto line
lineDone:
        mov byte [rdx], 10      ; write a newline
        inc rdx
        inc r8
        mov r9, 0
        cmp r8, maxlines
        jng line                ; jump if r8 <= maxlines
done:
        mov rax, 0x02000004     ; write system call
        mov rdi, 1              ; rdi is the first argument; fd 1
        mov rsi, output         ; rsi is the second argument; the buffer
        mov rdx, dataSize       ; rdx is the third argument, the size
        syscall                 ; call write
        mov rax, 0x02000001     ; the exit system call
        xor rdi, rdi            ; zero the rdi register
        syscall                 ;call exit

        section .bss
maxlines equ 8
dataSize equ 152        ; sum [(x * 4) + 1 | x <- [1..8]]
output: resb dataSize
