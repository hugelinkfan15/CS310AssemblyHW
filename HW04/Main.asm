;HW04
.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
myArray DWORD 10h,20h,30h,5h,40h,15h
sum DWORD 0

.code
main PROC
mov eax, 0
mov ebx, 0
mov ecx, 0
mov edx, 0

mov ebx, OFFSET myArray
mov ecx, LENGTHOF myArray
mov edx, TYPE myArray

L1:
	add eax, [ebx]
	add ebx, edx
	loop L1

mov sum, eax

INVOKE ExitProcess, 0
main ENDP

END main   ;specify the program's entry point