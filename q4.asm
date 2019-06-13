org 0x7c00
bits 16

mov ax, 0
mov ds, ax

cli

mov al, 0x13
int 0x10

mov bx, 0xa000
mov es, bx

mov cx, 0
mov di, 0
push cx

printar:
	mov [es:di], cx
	
	cmp di, 64000
	je .reset
	
	inc cx
	inc di
	jmp printar

.reset:
	pop cx
	inc cx
	push cx
	mov di, 0
	jmp printar
	
times 510 - ($-$$) db 0
dw 0xaa55
