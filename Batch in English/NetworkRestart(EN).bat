@echo off

echo We will perform a restart of your Network.

echo Do not close the Command Prompt in the middle of execution.

echo Do not turn off the computer.

echo Do not interrupt the program.

echo This program must be run as an Administrator.

echo Detecting privileges ...

net session >nul 2>&1

if %errorLevel% == 0 (

	rem //Comandos com privilegios de Administrador
	
	echo Confirmed Administrator privileges.

	@echo Restarting network ...

	netsh winsock reset all
	netsh int 6to4 reset all
	netsh int ipv4 reset all
	netsh int ipv6 reset all
	netsh int httpstunnel reset all
	netsh int isatap reset all
	netsh int portproxy reset all
	netsh int tcp reset all
	netsh int teredo reset all

	echo Network restarted.

	pause >nul

	exit

) else (

    rem //Comandos sem privilegios de Administrador

    echo No Administrator privileges. Close the Program and open as an Administrator.
)

pause >nul
exit