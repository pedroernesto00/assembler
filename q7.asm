org 0x7c00
bits 16

mov ax, 0
mov ds, ax

cli

voltar:
	mov cx, 0
pegarNumero:
	
	mov ah, 0
	int 0x16
	
	cmp al, 13
	je .UmNaoEhPrimo
	
	mov ah, 0x0e
	int 0x10
	
	sub al, 48

	imul cx, 10
	add cl, al
	
	jmp pegarNumero
	
	.UmNaoEhPrimo:
		cmp cx, 1
		je .fimNaoPrimo
		push cx
		mov ax, cx 

	.checarPrimo:
		mov dx, 0
		dec cx
		
		cmp cx, 1
		je .fimPrimo

		div cx
		
		or dx, dx
		jz .fimNaoPrimo
		
		pop ax
		push ax
		jmp .checarPrimo
		

.fimPrimo:
	mov bx, ehPrimo
	mov ah, 0x0e
	jmp .print

.fimNaoPrimo:
	mov bx, naoPrimo
	mov ah, 0x0e
	jmp .print

.print:
	mov al, [bx]
	
	int 0x10
	cmp al, "!"
	je .fim

	inc bx
	jmp .print
		
.fim:
	hlt


ehPrimo:
	db " eh primo!"
naoPrimo:
	db " nao eh primo!"

times 510 - ($-$$) db 0
dw 0xaa55
