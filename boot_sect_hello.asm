mov ah, 0x0e ; TTY mode (TeleTYpe mode)
mov al, 'H'
int 0x10 ; Interrupr for Video services
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
int 0x10 ; Because the character stored in al is stil 'l'
mov al, 'o'
int 0x10

jmp $ ; Jump to current address = Infinte loop

times 510 - ($-$$) db 0 ; Add '0' for next all bytes
dw 0xaa55 ; Except for 3 bytes, i.e. AA55 to tell it is a BOOT LOADER