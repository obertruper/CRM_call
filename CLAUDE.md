# Claude Code - Памятка для проекта CRM_call

## 📋 О проекте
Это CRM система для автоматизации работы с звонками. Проект настроен для автоматического запуска через Windows Task Scheduler и GitHub Actions.

## 🛠 Основные компоненты
- `crm_automation.py` - главный скрипт автоматизации
- `run_crm_automation.bat` - запуск через Windows
- `.github/workflows/crm-automation.yml` - CI/CD через GitHub Actions

## 🚀 Команды для быстрой работы

### Запуск автоматизации:
```bash
python crm_automation.py
```

### Отправка на GitHub:
```bash
powershell.exe -ExecutionPolicy Bypass -File "git_push.ps1"
```
Или просто дважды кликните на `SEND_TO_GITHUB.bat`

### Проверка линтеров:
```bash
flake8 . --max-line-length=127
black . --check
```

## 📁 Структура проекта
```
CRM_call/
├── .github/workflows/     # GitHub Actions конфигурация
├── scripts/git/          # Вспомогательные Git скрипты
├── logs/                 # Логи выполнения (создается автоматически)
├── data/                 # Данные и отчеты (создается автоматически)
├── crm_automation.py     # Основной скрипт
├── requirements.txt      # Python зависимости
└── SEND_TO_GITHUB.bat   # Быстрая отправка на GitHub
```

## 🔧 Переменные окружения
Для работы с реальным CRM API добавьте в GitHub Secrets:
- `CRM_API_KEY` - ключ доступа к API
- `CRM_API_URL` - базовый URL API

## 📝 TODO для будущих улучшений
- [ ] Добавить интеграцию с реальным CRM API
- [ ] Настроить отправку email уведомлений
- [ ] Добавить веб-интерфейс для мониторинга
- [ ] Создать Docker контейнер для развертывания
- [ ] Добавить тесты для основных функций

## 🎯 Автоматизация запущена
- **Windows Task Scheduler**: ежедневно в 9:00
- **GitHub Actions**: при каждом push и ежедневно в 9:00 UTC

## 💡 Полезные команды Windows
```powershell
# Просмотр задачи в планировщике
Get-ScheduledTask -TaskName "CRM Call Automation"

# Ручной запуск задачи
Start-ScheduledTask -TaskName "CRM Call Automation"

# Проверка логов
Get-Content logs\crm_automation_*.log -Tail 50
```

## 🔗 Ссылки
- GitHub репозиторий: https://github.com/obertruper/CRM_call
- Email для CRM: ilpnqw1001@gmail.com

## ⚡ Быстрые исправления

### Если Git не работает:
```powershell
$env:Path += ";C:\Program Files\Git\bin"
```

### Если Python не найден:
```powershell
python --version
# Если ошибка, установите Python с https://python.org
```

### Если виртуальное окружение не активируется:
```powershell
.venv\Scripts\Activate.ps1
```

---
*Последнее обновление: 2025-06-25*