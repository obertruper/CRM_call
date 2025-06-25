# 🚀 Простое руководство по Git для CRM проекта

## 📝 Что вам нужно знать:

### 1️⃣ **Отправить изменения на GitHub (самое важное!)**
Дважды кликните на файл:
```
auto_git_push.ps1
```
Или в PowerShell:
```powershell
.\auto_git_push.ps1
```

### 2️⃣ **Отправить с custom сообщением**
```powershell
.\auto_git_push.ps1 -CommitMessage "Добавил новую функцию"
```

---

## 🔧 Первая настройка (делается один раз)

### Создайте GitHub Token:
1. Откройте: https://github.com/settings/tokens/new
2. Название: `CRM_call_token`
3. Выберите срок: 90 days (или No expiration)
4. Отметьте галочками: `repo` (все подпункты)
5. Нажмите зеленую кнопку `Generate token`
6. **ВАЖНО**: Скопируйте токен сразу! (он показывается только один раз)

### При первом push:
- **Username**: `obertruper` (ваш логин GitHub)
- **Password**: вставьте токен (НЕ ваш пароль от GitHub!)

После первого успешного входа Windows запомнит токен.

---

## 📋 Полезные команды

### Посмотреть что изменилось:
```powershell
git status
```

### Посмотреть историю:
```powershell
git log --oneline -10
```

### Скачать изменения с GitHub:
```powershell
git pull
```

---

## ⚡ Быстрые действия

### Кнопка "Отправить всё на GitHub":
Создайте ярлык на рабочем столе:
1. Правый клик → Создать → Ярлык
2. Расположение: `powershell.exe -File "C:\Users\user\PycharmProjects\CRM_call\auto_git_push.ps1"`
3. Имя: `Отправить на GitHub`

### Автоматическая отправка каждый день:
Добавьте в Планировщик задач Windows задачу, которая запускает `auto_git_push.ps1`

---

## ❓ Частые проблемы

### "fatal: not a git repository"
Вы не в папке проекта. Перейдите:
```powershell
cd C:\Users\user\PycharmProjects\CRM_call
```

### "rejected - non-fast-forward"
Сначала скачайте изменения:
```powershell
git pull
.\auto_git_push.ps1
```

### "Authentication failed"
Создайте новый токен (см. выше) и используйте его как пароль.

---

## 🎯 Главное правило
**Просто запускайте `auto_git_push.ps1` после внесения изменений!**