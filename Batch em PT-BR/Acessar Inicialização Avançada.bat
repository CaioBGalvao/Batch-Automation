@echo off

echo Renicialização para o menu avançado de inicialização.

echo Tenha certeza de salvar todos os trabalhos.

echo Esse programa deve ser executado como Administrador.

rem //Verificacao de privilegios

echo Detectando privilegios...

net session >nul 2>&1

if %errorLevel% == 0 (

	rem //Comandos com privilegios de Administrador

	echo Privilegios de Administrador confirmados.

	shutdown /r /o /f /t 00
	
	echo Fim do Programa

	pause >nul
	
	exit

) else (

    rem //Comandos sem privilegios de Administrador

    echo Sem privilegios de Administrador. Feche o Programa e abra como Administrador.
)

pause >nul
exit
