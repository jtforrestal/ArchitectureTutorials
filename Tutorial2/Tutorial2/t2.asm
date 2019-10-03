option casemap:none
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

pX64:	push	r9	;store our inputs k and l
		push	r8

		mov		r8,rdx	;move our original parameters into appropriate registers for min call
		mov		rdx,rcx
		mov		rcx,#g

		sub		rsp,32	;allocate 32 bits of sadow space

		call	min

		add		rsp,32	;temporarily deallocating shadow space to retrieve k and l
		mov		rcx,rax
		pop		rdx
		pop		r8

		sub		rsp,32	;alloc

		call	min

		add		rsp,32	;dalloc
		ret				;min call returns result to rax anyways so we can return again


public	gcdX64

gcdX64:	mov		rax,rcx		;Push parameters into appropriate registers
		mov		rbx,rdx

		cmp		rbx,0		;Check if param b is eqaul to 0
		je		reta
		cqo
		idiv	rbx			;Modulo result stored in rdx, so it wil already be second parameter for recursive call
		mov		rcx,rbx		;move b to be first param

		sub		rsp,32		;allocating shadow space
		call	gcdX64
		add		rsp,32		;all varaible stored in registers so nothing to be cleaned up before deallocating chadow space

reta:	ret					;First paramter already been pushed to rax, so if there is no recursion we still get teh correct result	
		
public	qX64

qX64:	mov		rax,rcx		;Add each parameter together store sum in rax
		add		rax,rdx
		add		rax,r8
		add		rax,r9

		pop		rbx

		add		rax,rbx

		push	r9			;pushing our excess variables to teh stack
		push	rbx
		push	rax

		mov		r9,r8		
		mov		r8,rdx	
		mov		rdx,rcx		
		lea		rcx,qxp		;push the string for printf to first param


		sub		rsp,32		;Alocating shadow space
		call	printf
		add		rsp,32		;Deallocating Shadow
		pop		rax
		ret
		end