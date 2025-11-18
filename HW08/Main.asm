;HW08
.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
myArray DWORD 10h, 20h, 30h, 40h
theSum DWORD ?
.code
main PROC

	push OFFSET myArray
	push LENGTHOF myArray
	CALL SumArray

	mov theSum, eax

INVOKE ExitProcess, 0
main ENDP

SumArray PROC
	push ebp
	mov ebp, esp

	mov ecx, [ebp +8]
	mov eax, 0
	mov esi, [ebp +12]
	
	L1:
		add eax, [esi]
		add esi, TYPE [esi]
		loop L1

	mov esp,ebp
	pop ebp
	ret 8
SumArray ENDP

END main   ;specify the program's entry point