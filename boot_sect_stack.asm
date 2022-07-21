mov ah, 0x0e

mov bp, 0x8000 ; An address far away from 0x7c00, which doesn't gets overwritten
mov sp, bp ; Copy Base address to Stack Pointer

push 'A'
push 'B'
push 'C'

; To show how the stack grows downwards
mov al, [0x7ffe] ; 0x8000 - 0x02 = 0x7ffe
int 0x10 ; General interrupt for video output

; Recover our characters using the standard procedure : 'pop'
; We can only pop full words so we need an auxiliary register to manipulate
; The lower byte
pop bx 
mov al, bl
int 0x10 ; Prints C

pop bx 
mov al, bl
int 0x10 ; Prints B

pop bx 
mov al, bl
int 0x10 ; Prints A

; Data That has been pop'd from the stack is garbage now
mov al, [0x8000]
int 0x10

jmp $
times 510-($-$$) db 0
dw 0xaa55
