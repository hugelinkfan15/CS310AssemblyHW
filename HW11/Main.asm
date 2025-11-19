;HW11
.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data

myArray SDWORD 10h,30h,60h,20h,5h,80h,10h

.code
main PROC

	push OFFSET myArray
	push LENGTHOF myArray
	CALL FindLargest

INVOKE ExitProcess, 0
main ENDP

FindLargest PROC
	push ebp
	mov ebp,esp

	mov esi, [ebp+12]  ;move first value of myArray to eax
	mov ecx, [ebp+8]   ;set, then dec ecx by one
	dec ecx
	mov eax, [esi]

	L1:
	add esi, 4
	cmp eax, [esi]   ; See if current largest value is still largest, if not change to new largest value
	jge NOCHANGE
	mov eax, [esi]
	NOCHANGE:
	loop L1

	mov esp, ebp
	pop ebp
	ret 8
	FindLargest ENDP

END main   ;specify the program's entry point