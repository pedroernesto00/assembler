org 0x7c00
bits 16

mov ax, 0
mov ds, ax

cli

mov cx, 0
lerPalavra:
	mov ah, 0
	int 0x16
	
	cmp al, 13
	je .inverter
	
	push ax
	inc cx
	mov ah, 0x0e
	int 0x10
	
	jmp lerPalavra

.inverter:
	mov ah, 0x02
	mov dh, 1
	int 0x10

	.contrario:
		or cx, cx
		jz .fim
		dec cx

		pop ax
		mov ah, 0x0e
		int 0x10
		jmp .contrario

.fim:
	hlt	
times 510 - ($-$$) db 0
dw 0xaa55

