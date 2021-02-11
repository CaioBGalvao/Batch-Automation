@echo off
echo Vamos executar uma reinicialização dos serviços do Windows Update.

echo Nao feche esse Prompt de Comando do meio do processo.

echo Nao desligue o computador.

echo Esse programa deve ser executado como Administrador.

echo Detectando privilegios...

net session >nul 2>&1

if %errorLevel% == 0 (

    rem //Comandos com privilegios de Administrador

    echo Privilegios de Administrador confirmados.

echo Vamos desativar os serviços
net stop bits
net stop wuauserv
net stop cryptsvc 
net stop msiserver

echo Vamos re iniciar tudo

net start bits
net start wuauserv
net start cryptsvc
net start msiserver

echo Tudo certo!

pause >nul

) else (

    rem //Comandos sem privilegios de Administrador

    echo Sem privilegios de Administrador. Feche o Programa e abra como Administrador.
)

pause >nul
exit
