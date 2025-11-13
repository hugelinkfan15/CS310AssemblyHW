;HW07
.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
date WORD 0010011001101010b
day BYTE ?
month BYTE ?
year BYTE ?

.code
main PROC
mov ax, 0
mov dx, 0
mov dx, date
mov ax, dx

;get day
and al, 00011111b
mov day, al
mov al, dl

;get month
shr ax,5
and al, 00001111b
mov month, al
mov ax, dx

;get year
shr ax, 1
and ah, 01111111b
mov year, ah

mov edx, OFFSET day
mov edx, OFFSET month
mov edx, OFFSET year

INVOKE ExitProcess, 0
main ENDP

END main   ;specify the program's entry point