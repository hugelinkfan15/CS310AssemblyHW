;HW05
.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
fibSeq WORD 1,1, 5 dup(?)

.code
main PROC
mov ax,0

mov ebx, (OFFSET fibSeq + TYPE fibSeq)
mov ecx, (LENGTHOF fibSeq) - 2
mov ax,[ebx]

L1:
	add ax, [ebx-TYPE fibSeq]
	add ebx, TYPE fibSeq
	mov [ebx], ax
	loop L1

INVOKE ExitProcess, 0
main ENDP

END main   ;specify the program's entry point