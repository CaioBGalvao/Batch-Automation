@echo off

echo We will schedule a disk check to be initiated at system restart.

echo This operation takes a LOT. Make sure you have time to do this.

echo I recommend you do it at night, let it run while you sleep.

echo Do not interrupt the program.

echo It can appear frozen at times, this is normal for up to 2 hours of freezing. But that can mean severe damage to the Hard Disk.

echo This program must be run as an Administrator.

echo Detecting privileges ...

net session >nul 2>&1

if %errorLevel% == 0 (

	rem //Comandos com privilegios de Administrador

	echo Confirmed Administrator privileges.

	schtasks /create /tn CheckDisk /tr C:\Windows\System32\chkdsk.exe /F /R /X /B /sc onstart

	echo task successfully scheduled

	echo shutting down your computer to perform the repair

	shutdown /r /c "See you soon"

	pause >nul

	exit

) else (

    rem //Comandos sem privilegios de Administrador

    echo No Administrator privileges. Close the Program and open as an Administrator.
)

pause >nul
exit