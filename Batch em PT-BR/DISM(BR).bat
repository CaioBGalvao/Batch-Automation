@echo off

echo Vamos executar o DISM, isso pode demorar MUITO.

echo Nao feche esse Prompt de Comando do meio da execucao.

echo Nao desligue o computador.

echo Esse programa deve ser executado como Administrador.

rem //Verificacao de privilegios

echo Detectando privilegios...

net session >nul 2>&1

if %errorLevel% == 0 (

	rem //Comandos com privilegios de Administrador

	echo Privilegios de Administrador confirmados.

	rem //Captura da unidade

	@echo Exemplo c, d,
	set /p unidade=Informe a unidade da ISO do Windows: 

	echo A unidade da ISO e '%unidade%:'.

	rem //Dism

	echo Procurando problemas

	DISM.exe /Online /Cleanup-image /Scanhealth

	echo Restaurando saude

	Dism /Online /Cleanup-Image /RestoreHealth /Source:%unidade%:\sources\install.wim

	echo Fim do Programa

	pause >nul
	
	exit

) else (

    rem //Comandos sem privilegios de Administrador

    echo Sem privilegios de Administrador. Feche o Programa e abra como Administrador.
)

pause >nul
exit