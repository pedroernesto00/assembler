org 0x7c00
bits 16

mov ax, 0
mov ds, ax

cli

mov al, 0x13
int 0x10

mov ax, 0xa000
mov es, ax


lerTecla:
    mov ax, 0
    int 0x16

    mov cx, 6400

    .pinta: 
        mov di, cx
        mov [es:di], al
        dec cx
        or cx, cx
        jnz lerTecla
        jmp .pinta 


times 510 - ($-$$) db 0
dw 0xaa55