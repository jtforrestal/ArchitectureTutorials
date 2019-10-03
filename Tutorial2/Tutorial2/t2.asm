option casemap:none
.data
public	g
g		DWORD	4
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


		end