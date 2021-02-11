@echo off

echo DISM will run, it can take a LONG time.

echo Do not close the Command Prompt in the middle of execution.

echo Do not turn off the computer.

echo Do not interrupt the program.

echo This program must be run as an Administrator.

echo Detecting privileges ...

net session >nul 2>&1

if %errorLevel% == 0 (

	rem //Comandos com privilegios de Administrador

	echo Confirmed Administrator privileges.

	rem //Captura da unidade

	@echo Example c, d,
	set /p unidade=Enter the Windows ISO drive: 

	echo The ISO unit is '%unidade%:'.

	rem //Dism

	echo Looking for problems

	DISM.exe /Online /Cleanup-image /Scanhealth

	echo Restoring health

	Dism /Online /Cleanup-Image /RestoreHealth /Source:%unidade%:\sources\install.wim

	echo Fim do Programa
	
	pause >nul

	exit

) else (

    rem //Comandos sem privilegios de Administrador

    echo No Administrator privileges. Close the Program and open as an Administrator.
)

pause >nul
exit