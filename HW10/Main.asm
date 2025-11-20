;HW10
.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
var1 DWORD 10
var2 DWORD 15
var3 DWORD 20

.code
main PROC

push var1
push var2
push var3
CALL SPA

INVOKE ExitProcess, 0
main ENDP

SPA PROC
	push ebp
	mov ebp, esp
	sub esp, 12

	;find sum
	mov eax, [ebp + 16] ; first parameter
	add eax, [ebp + 12] ; second parameter
	add eax, [ebp + 8]  ; third parameter
	mov [ebp -12], eax  ; store sum in local variable

	;find product
	mov eax, [ebp + 16] ; first parameter
	mul DWORD PTR [ebp + 12]      ; multiply by second parameter
	mul DWORD PTR[ebp + 8]       ; multiply by third parameter
	mov [ebp -8], eax   ; store product in local variable

	;find average
	mov eax, [ebp -12]   ; move sum to eax
	mov ecx, 3
	div ecx            ; divide sum by 3
	mov [ebp-4], eax  ; store average in local variable

	;set return values
	mov eax, [ebp -12]  ; return sum in eax
	mov ebx, [ebp -8]  ; return product in edx
	mov ecx, [ebp-4]     ; return average in ecx

	mov esp, ebp
	pop ebp
	ret 12		; clear passed parameters from stack
SPA ENDP

END main   ;specify the program's entry point