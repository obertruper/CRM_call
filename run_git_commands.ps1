# PowerShell скрипт для настройки Git
Set-Location "C:\Users\user\PycharmProjects\CRM_call"

# Поиск Git
$gitPaths = @(
    "C:\Program Files\Git\bin\git.exe",
    "C:\Program Files (x86)\Git\bin\git.exe",
    "${env:LOCALAPPDATA}\Programs\Git\bin\git.exe",
    "${env:ProgramFiles}\Git\bin\git.exe"
)

$gitPath = $null
foreach ($path in $gitPaths) {
    if (Test-Path $path) {
        $gitPath = $path
        break
    }
}

if (-not $gitPath) {
    # Попробуем найти через where
    try {
        $gitPath = (Get-Command git -ErrorAction Stop).Path
    } catch {
        Write-Host "Git не найден! Установите Git для Windows с https://git-scm.com/download/win" -ForegroundColor Red
        exit 1
    }
}

Write-Host "Git найден: $gitPath" -ForegroundColor Green

# Создаем алиас для git
Set-Alias git $gitPath

# Выполнение команд
Write-Host "`nТекущий статус:" -ForegroundColor Yellow
& $gitPath status

Write-Host "`nДобавление remote..." -ForegroundColor Yellow
& $gitPath remote add origin git@github.com:obertruper/CRM_call.git 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "Remote уже существует, обновляем..." -ForegroundColor Yellow
    & $gitPath remote set-url origin git@github.com:obertruper/CRM_call.git
}

Write-Host "`nТекущие remotes:" -ForegroundColor Yellow
& $gitPath remote -v

Write-Host "`nПроверка SSH..." -ForegroundColor Yellow
$sshTest = & ssh -T git@github.com 2>&1
if ($LASTEXITCODE -ne 1) {
    Write-Host "Настройка SSH ключа..." -ForegroundColor Yellow
    
    $sshKeyPath = "$env:USERPROFILE\.ssh\id_ed25519"
    if (-not (Test-Path $sshKeyPath)) {
        ssh-keygen -t ed25519 -C "ilpnqw1001@gmail.com" -f $sshKeyPath -N '""'
        
        Write-Host "`nВаш SSH ключ:" -ForegroundColor Green
        Write-Host "=============================" -ForegroundColor Cyan
        Get-Content "$sshKeyPath.pub"
        Write-Host "=============================" -ForegroundColor Cyan
        Write-Host "`nДобавьте этот ключ на GitHub: https://github.com/settings/keys" -ForegroundColor Yellow
        Write-Host "Нажмите Enter после добавления ключа..." -ForegroundColor Yellow
        Read-Host
    }
}

Write-Host "`nPush в GitHub..." -ForegroundColor Yellow
& $gitPath push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n=== УСПЕХ ===" -ForegroundColor Green
    Write-Host "Репозиторий успешно загружен!" -ForegroundColor Green
    Write-Host "URL: https://github.com/obertruper/CRM_call" -ForegroundColor Cyan
} else {
    Write-Host "`nПробуем через HTTPS..." -ForegroundColor Yellow
    & $gitPath remote set-url origin https://github.com/obertruper/CRM_call.git
    & $gitPath push -u origin main
}

Write-Host "`nИтоговый статус:" -ForegroundColor Yellow
& $gitPath status
& $gitPath log --oneline -5