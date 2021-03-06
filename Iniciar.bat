@echo off
title Iniciar Programas



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
timeout /t 30
)

::AudioSwitcher
set audioSwitcher=c:\"Program Files\Audio Switcher\AudioSwitcher.exe"
tasklist /nh /fi "Imagename eq AudioSwitcher.exe" | find /i "AudioSwitcher.exe" >nul && ( echo: ) || ( 
start %audioSwitcher% 
timeout /t 15
)

::Shotty
set shotty=c:\"Program Files\Shotty\Shotty.exe"
tasklist /nh /fi "Imagename eq Shotty.exe" | find /i "Shotty.exe" >nul && ( echo: ) || ( 
start %shotty% 
timeout /t 15
)

::::Zoom
::set zoom=c:\"Users\gianti.cristian\AppData\Roaming\Zoom\bin\Zoom.exe"
::tasklist /nh /fi "Imagename eq Zoom.exe" | find /i "Zoom.exe" >nul && ( echo: ) || ( 
::start %zoom% 
::timeout /t 15
::)

::Outlook
set outlook=c:\"Program Files (x86)\Microsoft Office\Office14\Outlook.exe"
tasklist /nh /fi "Imagename eq Outlook.exe" | find /i "Outlook.exe" >nul && ( echo: ) || ( 
start %outlook% 
timeout /t 60
)

::Tickets
set tickets=c:\"Program Files\Microsoft System Center 2012 R2\Service Manager\Microsoft.EnterpriseManagement.ServiceManager.UI.Console.exe"
tasklist /nh /fi "Imagename eq Microsoft.EnterpriseManagement.ServiceManager.UI.Console.exe" | find /i "Microsoft.EnterpriseManagement.ServiceManager.UI.Console.exe" >nul && ( echo: ) || ( 
start %tickets%
timeout /t 120
)

::InternetExplorer
set internetExplorer=c:\"Program Files (x86)\Internet Explorer\iexplore.exe"
tasklist /nh /fi "Imagename eq iexplore.exe" | find /i "iexplore.exe" >nul && ( echo: ) || ( 
start %internetExplorer% "oep.servicios.oca"
timeout /t 60
)

::SQL
set sql=c:\"Program Files (x86)\Microsoft SQL Server\110\Tools\Binn\ManagementStudio\Ssms.exe"
tasklist /nh /fi "Imagename eq Ssms.exe" | find /i "Ssms.exe" >nul && ( echo: ) || ( 
start %sql%
timeout /t 60
)

::OneDrive
set oneDrive=c:\Users\gianti.cristian\AppData\Local\Microsoft\OneDrive\OneDrive.exe
tasklist /nh /fi "Imagename eq OneDrive.exe" | find /i "OneDrive.exe" >nul && ( echo: ) || ( 
start %oneDrive% /background
timeout /t 60
)

::Teams
set teams=C:\Users\gianti.cristian\AppData\Local\Microsoft\Teams\current\Teams.exe
tasklist /nh /fi "Imagename eq Teams.exe" | find /i "Teams.exe" >nul && ( echo: ) || ( 
start %teams% /background 
goto Salir
)

:Salir
exit