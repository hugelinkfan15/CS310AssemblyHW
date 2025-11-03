;HW03
.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
val1 DWORD 50000h
X DWORD 2

.code
main PROC
mov eax, 1

cmp val1,ecx
JL NOCHANGE
cmp ecx, edx
JL NOCHANGE
mov X, eax
NOCHANGE:

INVOKE ExitProcess, 0
main ENDP

END main   ;specify the program's entry point