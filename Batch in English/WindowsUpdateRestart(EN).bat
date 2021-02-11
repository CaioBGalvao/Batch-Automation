@echo off

echo We will perform a restart of the Windows Update services.

echo Do not close the Command Prompt in the middle of execution.

echo Do not turn off the computer.

echo Do not interrupt the program.

echo This program must be run as an Administrator.

echo Detecting privileges ...

net session >nul 2>&1

if %errorLevel% == 0 (

	rem //Comandos com privilegios de Administrador

	echo Confirmed Administrator privileges.

	echo Let's disable services
	
	net stop bits
	net stop wuauserv
	net stop cryptsvc 
	net stop msiserver

	echo Let's restart everything

	net start bits
	net start wuauserv
	net start cryptsvc
	net start msiserver

	echo All right!

	pause >nul

	exit

) else (

    rem //Comandos sem privilegios de Administrador

    echo No Administrator privileges. Close the Program and open as an Administrator.
)

pause >nul
exit