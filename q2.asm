org 0x7c00
bits 16

mov ax, 0
mov ds, ax

cli

int 0x13
mov ah, 0x02
mov al, 1
mov ch, 0
mov dh, 0
mov cl, 2
mov bx, 0x7e00
int 0x13

mov ah, 0x0e
reset:
	mov si, matricula

dec:
	mov al, [bx]
	
	cmp al, 0
	je .fim

	mov dl, [si]

	cmp dl, 10
	je reset
 	
	sub al, dl
	
	int 0x10
	
	inc si
	inc bx
	
	jmp dec
		
.fim:
	hlt
	
matricula:
	db 4,1,8,4,6,5,10

times 510 - ($-$$) db 0
dw 0xaa55

