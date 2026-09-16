@echo off
:: Ensure script is run with Administrative privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Error: Please run this batch file as Administrator.
    pause
    exit /b 1
)

:: Delete Registry Keys
reg delete "HKLM\SOFTWARE\GPL Ghostscript\8.71" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\GPL Ghostscript" /f >nul 2>&1

:: Delete Start Menu Shortcuts
del /f /q "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Ghostscript\Ghostscript 8.71 (x86).lnk" >nul 2>&1
del /f /q "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Ghostscript\Ghostscript Readme 8.71 (x86).lnk" >nul 2>&1
rmdir "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Ghostscript" >nul 2>&1

del /f /q "%AppData%\Microsoft\Windows\Start Menu\Programs\Ghostscript\Ghostscript 8.71 (x86).lnk" >nul 2>&1
del /f /q "%AppData%\Microsoft\Windows\Start Menu\Programs\Ghostscript\Ghostscript Readme 8.71 (x86).lnk" >nul 2>&1
rmdir "%AppData%\Microsoft\Windows\Start Menu\Programs\Ghostscript" >nul 2>&1

:: Delete Files and Directory
if exist "C:\Program Files (x86)\gs\gs8.71" (
    rmdir /s /q "C:\Program Files (x86)\gs\gs8.71"
)

if exist "C:\Program Files (x86)\gs" (
    rmdir "C:\Program Files (x86)\gs" >nul 2>&1
)

echo GPL Ghostscript 8.71 has been completely uninstalled.
pause