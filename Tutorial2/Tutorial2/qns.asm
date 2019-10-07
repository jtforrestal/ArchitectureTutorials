option casemap:none
includelib	legacy_stdio_definitions.lib
extern	printf:near
.data

txt		db	'qns/n',0AH,00H

.code

public	qnsShadowSpace

qnsShadowSpace:
	
	sub		rsp,32	;allocating shadow space
	
	lea		rcx,txt
	call	printf
	add		rsp,32	;deallocating shadow space
	ret
	; This version of qns will return 6 as that is the number of characters in"'qns/n',0AH,00H" 

	


public	qnsNoSpace
qnsNoSpace:
	
	;No Shadow Space Allocated

	lea		rcx,txt
	call	printf

	
	ret
	;This version of qns hits an exception handler as printf attempts to overwrite the return address for the stack frame
	
	end