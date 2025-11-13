;HW09
.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
num DWORD 20

.code
main PROC

push num
CALL ISEven

INVOKE ExitProcess, 0
main ENDP

IsEven PROC
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8] ; Get the parameter (number)
    and eax, 1
    cmp eax, 0
    jne ODD

    mov eax, 1
    jmp DONE

    ODD:
     mov eax, 0

    DONE:
    mov esp, ebp
    pop ebp
    ret 4
IsEven ENDP

END main   ;specify the program's entry point