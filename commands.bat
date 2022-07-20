@ECHO OFF
ECHO.
ECHO Compiling...
ECHO.
:start

IF EXIST "%1.asm" (
    nasm -fbin %1.asm -o %1.bin
    ECHO Compiled Successfully!
) ELSE (
    ECHO File %1.asm not found!
    ECHO Compiled Failed!
    goto :end
)

set /P c=Do you want to execute in QEMU? [Y/N] 
IF /I "%c%" EQU "Y" goto :qemu
IF /I "%c%" EQU "N" goto :end

:qemu 
    ECHO.
    ECHO Starting...
    qemu-system-x86_64 %1.bin

:end
    ECHO Exiting Script...
    ECHO.
    EXIT