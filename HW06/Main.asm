;HW06
.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data

.code



INVOKE ExitProcess, 0
main ENDP

END main   ;specify the program's entry point