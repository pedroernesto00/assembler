org 0x7c00
bits 16

mov ax, 0
mov ds, ax

cli

mov al, 0x13
int 0x10

int 0x13
mov ah, 0x02
mov al, 32
mov ch, 0
mov dh, 0
mov cl, 2
mov bx, 0x7e00
int 0x13

mov ax, 0xa000
mov es, ax
mov cx, 0

lerImagem:
	mov di, cx
	mov ax, [bx]
	mov [es:di], ax
	
	cmp cx, 16000
	je .fim
	
	inc cx
	inc bx

	jmp lerImagem

.fim:
	jmp .fim		
times 510 - ($-$$) db 0
dw 0xaa55
