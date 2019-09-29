
.686                                ; create 32 bit code
.model flat, C                      ; 32 bit memory model
 option casemap:none           

.data 
public		g
g			DWORD	4
.code

min2:		push	ebp
			mov		ebp,esp
			mov		eax, [ebp+8]
			mov		ebx, [ebp+12]
			cmp		eax, ebx
			jle		min2_reta
			mov		eax,ebx
min2_reta:	mov		esp, ebp
			pop		ebp
			ret		0

public		min

min:		push	ebp
			mov		ebp, esp
			push	[ebp+8]
			push	[ebp+12]
			call	min2
			push	[ebp+16]
			push	eax
			call	min2
			mov		esp, ebp
			pop		ebp
			ret		0

public		p

p:			push	ebp
			mov		ebp, esp	
			sub		esp,8

			push	[g]
			push	[ebp+8]
			call	min2
			push	eax
			push	[ebp+12]
			call	min2
			push	eax
			push	[ebp+16]
			call	min2
			push	eax
			push	[ebp+20]
			call	min2
			mov		esp, ebp
			pop		ebp

			ret	0

public		gcd


gcd:		push	ebp
			mov		ebp, esp
			mov		eax, [ebp+8]
			mov		ebx, [ebp+12]
			cmp		ebx, 0
			je		reta
			cdq
			idiv	ebx
			mov		eax,edx
			push	eax
			push	ebx
			call	gcd

reta:
			mov		esp,ebp
			pop		ebp
			ret		0
end
			