        section __TEXT,__text
        global _sumvec

        ;; uint64_t _sumvec(uint64_t* elems, uint64_t len)
        ;; ^__rax           ^__rdi            ^__rsi
_sumvec:
        push rbx                ; store rbx
        xor rax, rax            ; zero out the return value
        mov rcx, rsi            ; take the second parameter and store it
        cmp rcx, 0
        jz finish               ; finish the function if rbx == 0
loop:
        dec rcx
        add rax, [rdi + rcx*8]
        cmp rcx, 0
        jnz loop
finish:
        pop rbx
        ret
