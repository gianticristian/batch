@echo off
title Iniciar Programas
set esperaCorta=15
set esperaLarga=30


:Inicio
cls
echo Iniciar Programas
echo -----------------
echo:
echo [1] Iniciar Todo
echo [2] Salir

set opcion=
set /p opcion=Seleccione una opcion: 
if not '%opcion%'=='' set opcion=%opcion:~0,1%
if '%opcion%'=='1' goto IniciarTodo
if '%opcion%'=='2' goto Salir
echo "%opcion%" no es una opcion valida
echo:
goto Inicio


:IniciarTodo
::Fichador
set fichador=d:\"OneDrive - OCA\Instaladores\UNIX Sucursales\- Fichada.r2w"
tasklist /nh /fi "Imagename eq r2win.exe" | find /i "r2win.exe" >nul && ( echo: ) || ( 
start /max %fichador% 
timeout /t %esperaLarga%
)

::AudioSwitcher
set audioSwitcher=c:\"Program Files\Audio Switcher\AudioSwitcher.exe"
tasklist /nh /fi "Imagename eq AudioSwitcher.exe" | find /i "AudioSwitcher.exe" >nul && ( echo: ) || ( 
start %audioSwitcher% 
timeout /t %esperaCorta%
)

::Shotty
set shotty=c:\"Program Files\Shotty\Shotty.exe"
tasklist /nh /fi "Imagename eq Shotty.exe" | find /i "Shotty.exe" >nul && ( echo: ) || ( 
start %shotty% 
timeout /t %esperaCorta%
)

::OneDrive
set oneDrive=c:\Users\gianti.cristian\AppData\Local\Microsoft\OneDrive\OneDrive.exe
tasklist /nh /fi "Imagename eq OneDrive.exe" | find /i "OneDrive.exe" >nul && ( echo: ) || ( 
start %oneDrive% /background 
timeout /t %esperaLarga%
)

::Outlook
set outlook=c:\"Program Files (x86)\Microsoft Office\Office14\Outlook.exe"
tasklist /nh /fi "Imagename eq Outlook.exe" | find /i "Outlook.exe" >nul && ( echo: ) || ( 
start %outlook% 
timeout /t %esperaLarga%
)

::Tickets
set tickets=c:\"Program Files\Microsoft System Center 2012 R2\Service Manager\Microsoft.EnterpriseManagement.ServiceManager.UI.Console.exe"
tasklist /nh /fi "Imagename eq Microsoft.EnterpriseManagement.ServiceManager.UI.Console.exe" | find /i "Microsoft.EnterpriseManagement.ServiceManager.UI.Console.exe" >nul && ( echo: ) || ( 
start %tickets%
timeout /t %esperaLarga%
)

::InternetExplorer
set internetExplorer=c:\"Program Files (x86)\Internet Explorer\iexplore.exe"
tasklist /nh /fi "Imagename eq iexplore.exe" | find /i "iexplore.exe" >nul && ( echo: ) || ( 
start %internetExplorer% "oep.servicios.oca"
timeout /t %esperaCorta%
)

::SQL
set sql=c:\"Program Files (x86)\Microsoft SQL Server\110\Tools\Binn\ManagementStudio\Ssms.exe"
tasklist /nh /fi "Imagename eq Ssms.exe" | find /i "Ssms.exe" >nul && ( echo: ) || ( 
start %sql%
timeout /t %esperaLarga%
goto Salir
)

:Salir
exit