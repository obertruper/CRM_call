@echo off
:: Простой батник для отправки на GitHub
:: Просто дважды кликните для запуска

echo ===================================
echo     ОТПРАВКА НА GITHUB
echo ===================================
echo.

cd /d "C:\Users\user\PycharmProjects\CRM_call"

:: Запуск PowerShell скрипта
powershell.exe -ExecutionPolicy Bypass -File "auto_git_push.ps1" -CommitMessage "Update from %date% %time%"

echo.
echo ===================================
echo Нажмите любую клавишу для выхода
echo ===================================
pause >nul