# Инструкция по настройке GitHub для CRM проекта

## 1. Инициализация Git репозитория (на Windows)

Откройте PowerShell или Git Bash и выполните:

```bash
cd C:\Users\user\PycharmProjects\CRM_call
git init
git config core.filemode false
git branch -m main
```

## 2. Создание репозитория на GitHub

1. Перейдите на https://github.com/new
2. Введите имя репозитория: `CRM_call`
3. Выберите приватность (Private/Public)
4. НЕ инициализируйте с README
5. Создайте репозиторий

## 3. Подключение локального репозитория к GitHub

```bash
git add .
git commit -m "Initial commit: CRM automation setup"
git remote add origin https://github.com/YOUR_USERNAME/CRM_call.git
git push -u origin main
```

## 4. Настройка GitHub Secrets для Actions

В настройках репозитория (Settings → Secrets and variables → Actions):

Добавьте следующие секреты:
- `CRM_API_KEY` - ключ API для CRM системы
- `CRM_API_URL` - URL API CRM системы

## 5. Активация GitHub Actions

1. Перейдите в раздел Actions вашего репозитория
2. GitHub Actions должен автоматически обнаружить workflow файл
3. Нажмите "Enable Actions" если требуется

## 6. Настройка GitHub App (для Claude Code)

### Вариант 1: Автоматическая установка
```bash
# В Claude Code выполните:
/install-github-app
```

### Вариант 2: Ручная настройка

1. Создайте Personal Access Token:
   - Settings → Developer settings → Personal access tokens → Tokens (classic)
   - Generate new token
   - Выберите права: repo, workflow, read:org
   - Сохраните токен

2. Настройте Claude Code:
   ```bash
   export GITHUB_TOKEN=your_token_here
   ```

## 7. Проверка работы

### Локальный запуск:
```bash
python crm_automation.py
```

### Запуск через GitHub Actions:
1. Сделайте любой коммит и push
2. Перейдите в Actions → выберите workflow → Run workflow

### Запуск по расписанию:
GitHub Actions автоматически запустит задачу в 9:00 UTC каждый день

## 8. Мониторинг

- **Логи Actions**: Actions → выберите run → посмотрите логи
- **Артефакты**: В каждом run доступны логи автоматизации
- **Уведомления**: При ошибках создается Issue

## Полезные команды Git

```bash
# Проверка статуса
git status

# Добавление изменений
git add .

# Коммит
git commit -m "Описание изменений"

# Отправка на GitHub
git push

# Получение изменений
git pull

# Просмотр истории
git log --oneline

# Создание новой ветки
git checkout -b feature/new-feature

# Переключение веток
git checkout main
```

## Устранение проблем

### Ошибка permissions в WSL:
```bash
git config core.filemode false
```

### Ошибка аутентификации:
```bash
# Используйте Personal Access Token вместо пароля
git config --global credential.helper manager
```

### GitHub Actions не запускается:
1. Проверьте синтаксис YAML файла
2. Убедитесь, что Actions включены в репозитории
3. Проверьте наличие необходимых секретов