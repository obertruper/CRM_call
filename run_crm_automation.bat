@echo off
REM Batch файл для запуска CRM автоматизации через Планировщик задач Windows
REM Автор: CRM Automation System
REM Дата создания: %date%

echo ========================================
echo CRM Automation Script
echo Запуск: %date% %time%
echo ========================================

REM Переход в директорию проекта
cd /d "C:\Users\user\PycharmProjects\CRM_call"

REM Активация виртуального окружения
echo Активация виртуального окружения...
call .venv\Scripts\activate.bat

REM Проверка наличия Python
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ОШИБКА: Python не найден или не установлен
    goto :error
)

REM Запуск скрипта автоматизации
echo Запуск CRM автоматизации...
python crm_automation.py

REM Проверка результата выполнения
if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo Автоматизация успешно завершена
    echo Время завершения: %time%
    echo ========================================
) else (
    echo.
    echo ========================================
    echo ОШИБКА: Автоматизация завершилась с ошибкой
    echo Код ошибки: %errorlevel%
    echo ========================================
    goto :error
)

REM Деактивация виртуального окружения
deactivate

REM Пауза для просмотра результатов (можно убрать для автоматического запуска)
REM pause

exit /b 0

:error
echo Произошла ошибка при выполнении скрипта
REM Отправка уведомления об ошибке (опционально)
REM powershell -Command "Send-MailMessage -To 'admin@example.com' -From 'crm@example.com' -Subject 'CRM Automation Error' -Body 'Ошибка при выполнении CRM автоматизации' -SmtpServer 'smtp.example.com'"
pause
exit /b 1