org 0x7c00
bits 16

mov ax, 0
mov ds, ax

cli

mov al, 0x13
int 0x10

mov bx, 0xa000
mov es, bx

pegarTecla:
	mov ah, 0
	int 0x16
	mov di, 0
	.printar:
		mov [es:di], al
		
		cmp di, 64000
		je pegarTecla
		inc di
		jmp .printar	

times 510 - ($-$$) db 0
dw 0xaa55
