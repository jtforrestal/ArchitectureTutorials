
.686                                ; create 32 bit code
.model flat, C                      ; 32 bit memory model
 option casemap:none           

.data 
public		g
g			DWORD	4
.code

public		min

min:		push	ebp
			mov		ebp, esp
			mov		eax, [ebp+8]
			mov		ebx, [ebp+12]
			cmp		eax, ebx		;if(eax < = ebx)
			jle		min_alessb
			mov		eax, [ebp+12]
			mov		ebx, [ebp+16]
			jmp		min_fin

min_alessb:	mov		ebx, [ebp+16]
			mov		eax, [ebp+8]
			
min_fin:	cmp		eax, ebx
			jle		min_reta

min_retb:	mov		eax, ebx
		
min_reta:	mov		esp, ebp
			pop		ebp
			ret		0

public		p

p:			push	ebp
			mov		ebp, esp
;;			mov		eax, [ebp+16]	Debugging 

			push	[g]
			push	[ebp+8]
			push	[ebp+12]
			call	min
			push	eax
			push	[ebp+16]
			push	[ebp+20]
			call	min



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
			