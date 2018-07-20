::c:\camara\PruImagen.exe
::c:\windows\Transmisor.exe


title Seleccionar Transmisor
@echo off
set espera=5


:Inicio
cls
echo Seleccionar Transmisor
echo ----------------------
echo.
echo [1] Transmisor Unix/Telegramas
echo [2] Transmisor Imagenes
echo [3] Cerrar todos
echo [4] Salir

set opcion=
set /p opcion=Seleccione una opcion: 
if not '%opcion%'=='' set opcion=%opcion:~0,1%
if '%opcion%'=='1' goto Unix/Telegramas
if '%opcion%'=='2' goto Imagenes
if '%opcion%'=='3' goto CerrarTodo
if '%opcion%'=='4' goto Salir
echo "%opcion%" no es una opcion valida
echo.
goto Inicio

:Unix/Telegramas
tasklist /nh /fi "Imagename eq Transmisor.exe" | find /i "Transmisor.exe" >nul && (
cls
echo El Transmisor Unix/Telegramas ya estaba corriendo
echo    --------------------------
timeout /t %espera%
goto Inicio
) || (
tasklist /nh /fi "Imagename eq PruImagen.exe" | find /i "PruImagen.exe" >nul && (
taskkill /f /im "PruImagen.exe"
)
cls
start Transmisor.exe
echo Activando Transmisor Unix/Telegramas
echo           --------------------------
echo Puede demorar varios minutos en abrir
goto Exit
)

:Imagenes
tasklist /nh /fi "Imagename eq PruImagen.exe" | find /i "PruImagen.exe" >nul && (
cls
echo El Transmisor Imagenes ya estaba corriendo
echo    -------------------
timeout /t %espera%
goto Inicio
) || (
tasklist /nh /fi "Imagename eq Transmisor.exe" | find /i "Transmisor.exe" >nul && (
taskkill /f /im "Transmisor.exe"
)
cls
start c:\camara\PruImagen.exe
echo Activando Transmisor Imagenes
echo           -------------------
goto Exit
)

:CerrarTodo
tasklist /nh /fi "Imagename eq Transmisor.exe" | find /i "Transmisor.exe" >nul && (
taskkill /f /im "Transmisor.exe"
)
tasklist /nh /fi "Imagename eq PruImagen.exe" | find /i "PruImagen.exe" >nul && (
taskkill /f /im "PruImagen.exe"
)
cls
echo Se cerraron todos los transmisores
goto Exit

:Salir
echo Salir
goto Exit

:Exit
timeout /t %espera%