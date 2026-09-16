@echo off
title Advanced Network Fixer
cls

echo ===========================================
echo  1. FLUSHING DNS CACHE
echo ===========================================
ipconfig /flushdns

echo.
echo ===========================================
echo  2. RENEWING ACTIVE WI-FI ADAPTER
echo ===========================================
echo Releasing Wi-Fi...
ipconfig /release "Wi-Fi" >nul 2>&1
timeout /t 2 >nul

echo Requesting new IP for Wi-Fi...
ipconfig /renew "Wi-Fi"
echo.

echo ===========================================
echo  3. RESETTING NETWORK STACK (Winsock/IP)
echo ===========================================
:: Quietly resets the core Windows network catalog
netsh winsock reset >nul 2>&1
netsh int ip reset >nul 2>&1

echo.
echo Network troubleshooting complete! 
echo (If you still can't connect, try restarting your PC)
echo.
pause
