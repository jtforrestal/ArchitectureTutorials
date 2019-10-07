

option casemap:none
includelib	legacy_stdio_definitions.lib
extrn	printf:near
.data
public	g
g		QWORD	4

qxp		db	'"a = %I64d b = %I64d c = %I64d d = %I64d e = %I64d sum = %I64d', 0AH,00H

.code



public	minX64

minX64:	mov		rax,rcx
		cmp		rax,rdx
		jle		bnotlv		
		mov		rax,rdx
bnotlv:	cmp		rax,r8
		jle		cnotlv
		mov		rax,r8
cnotlv:	ret



public	pX64

pX64:	
		sub		rsp,48	;allocate 32 bits of sadow space + two variables
		mov		[rsp+40],r9	;store our inputs k and l
		mov		[rsp+32],r8

		mov		r8,rdx	;move our original parameters into appropriate registers for min call
		mov		rdx,rcx
		mov		rcx,g

		call	minX64

		mov		rcx,rax
		mov		rdx,[rsp+40]
		mov		r8,	[rsp+32]

		call	minX64

		add		rsp,48	;deallocating shadow space and variable space
		ret				;min call returns result to rax anyways so we can return again


public	gcdX64

gcdX64:	mov		rax,rcx		;Push parameters into appropriate registers
		mov		rbx,rdx

		cmp		rbx,0		;Check if param b is eqaul to 0
		je		reta
		cqo
		idiv	rbx			;Modulo result stored in rdx, so it wil already be second parameter for recursive call
		mov		rcx,rbx		;move b to be first param

		sub		rsp,32		;allocating shadow space, no variable on stack, so only need 32bytes
		call	gcdX64
		add		rsp,32		;all varaible stored in registers so nothing to be cleaned up before deallocating chadow space

reta:	ret					;First paramter already been pushed to rax, so if there is no recursion we still get teh correct result	
		
public	qX64

qX64:	
		mov		rbx,[rsp+40]	;access the e input parameter from above shadow space
		sub		rsp,56	;Creating shadow space and allocating space for variables
		
		mov		rax,rcx		;adding all the inputs
		add		rax,rbx
		add		rax,rdx
		add		rax,r8
		add		rax,r9

		mov		[rsp+48],rax		;placing paramters 5,6,7 for printf above the shadow space
		mov		[rsp+40],rbx
		mov		[rsp+32],r9
		
		mov		r9,r8		;moving the bottom four parameters into the correct registers
		mov		r8,rdx
		mov		rdx,rcx
		lea		rcx,qxp
		call	printf
		mov		rax,[rsp+48]	; collecting out sum 
		add		rsp,56			;de allocating the shadow space

		ret
		end