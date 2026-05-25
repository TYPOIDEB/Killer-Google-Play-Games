@echo off
:: Включаем поддержку UTF-8 для корректного отображения языков
chcp 65001 > nul

:menu
cls
echo =======================================
echo  Выберите язык / Select language:
echo =======================================
echo  1. Русский
echo  2. English
echo =======================================
echo.

set /p choice="Введите цифру (1 или 2) и нажмите Enter: "

if "%choice%"=="1" goto russian
if "%choice%"=="2" goto english

:: Если ввели неверную цифру, возвращаем в меню
goto menu

:russian
cls
echo (закрываем Google Play Games)
echo.
timeout /t 2 > nul

taskkill /f /im Service.exe 2>nul
if "%ERRORLEVEL%"=="0" (echo [OK] Service.exe успешно закрыт.) else (echo [-] Service.exe не запущен.)

taskkill /f /im crosvm.exe 2>nul
if "%ERRORLEVEL%"=="0" (echo [OK] crosvm.exe успешно закрыт.) else (echo [-] crosvm.exe не запущен.)

taskkill /f /im client.exe 2>nul
if "%ERRORLEVEL%"=="0" (echo [OK] client.exe успешно закрыт.) else (echo [-] client.exe не запущен.)

echo.
echo Все указанные процессы обработаны.
goto end

:english
cls
echo (закрываем Google Play Games)
echo.
timeout /t 2 > nul

taskkill /f /im Service.exe 2>nul
if "%ERRORLEVEL%"=="0" (echo [OK] Service.exe successfully closed.) else (echo [-] Service.exe is not running.)

taskkill /f /im crosvm.exe 2>nul
if "%ERRORLEVEL%"=="0" (echo [OK] crosvm.exe successfully closed.) else (echo [-] crosvm.exe is not running.)

taskkill /f /im client.exe 2>nul
if "%ERRORLEVEL%"=="0" (echo [OK] client.exe successfully closed.) else (echo [-] client.exe is not running.)

echo.
echo All specified processes have been processed.
goto end

:end
pause
