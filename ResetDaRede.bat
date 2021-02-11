@echo off
echo Vamos executar uma Re inicializacao da sua Rede.

echo Nao feche esse Prompt de Comando do meio da execucao.

echo Nao desligue o computador.

echo Esse programa deve ser executado como Administrador.

echo Detectando privilegios...

net session >nul 2>&1

if %errorLevel% == 0 (

    rem //Comandos com privilegios de Administrador

    echo Privilegios de Administrador confirmados.

@echo Re iniciando rede...

netsh winsock reset all
netsh int 6to4 reset all
netsh int ipv4 reset all
netsh int ipv6 reset all
netsh int httpstunnel reset all
netsh int isatap reset all
netsh int portproxy reset all
netsh int tcp reset all
netsh int teredo reset all

echo Rede Re iniciada.

pause >nul

) else (

    rem //Comandos sem privilegios de Administrador

    echo Sem privilegios de Administrador. Feche o Programa e abra como Administrador.
)

pause >nul
