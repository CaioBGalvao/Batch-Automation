@echo off
echo Vamos agendar uma verificacao do disco para ser iniciada na reinicializacao do sistema.

echo Essa operacao demora MUITO. Tenha certeza de que voce tem tempo para fazer isso.

echo Recomendo que faca durante a noite, deixe executando enquanto dorme.

echo Nao interrompa o programa.

echo Ele pode parecer congelado em alguns momentos, isso e normal por ate 2 horas de congelamento. Mas que isso pode siguinificar danos severos ao HD Hard Disk.

echo Esse programa deve ser executado como Administrador.

echo Detectando privilegios...

net session >nul 2>&1

if %errorLevel% == 0 (

    rem //Comandos com privilegios de Administrador

    echo Privilegios de Administrador confirmados.

schtasks /create /tn CheckDisk /tr C:\Windows\System32\chkdsk.exe /F /R /X /B /sc onstart

echo tarefa agendada com sucesso

echo desligando seu computador para realizacao do reparo

shutdown /r /c "Até daqui a pouco"

pause >nul

) else (

    rem //Comandos sem privilegios de Administrador

    echo Sem privilegios de Administrador. Feche o Programa e abra como Administrador.
)

pause >nul
exit
