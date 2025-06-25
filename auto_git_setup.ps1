# Автоматическая настройка Git
$ErrorActionPreference = "Stop"

Set-Location "C:\Users\user\PycharmProjects\CRM_call"

# Поиск Git
$gitPath = $null
$gitPaths = @(
    "C:\Program Files\Git\bin\git.exe",
    "C:\Program Files (x86)\Git\bin\git.exe", 
    "$env:LOCALAPPDATA\Programs\Git\bin\git.exe"
)

foreach ($path in $gitPaths) {
    if (Test-Path $path) {
        $gitPath = $path
        break
    }
}

if (-not $gitPath) {
    try {
        $gitPath = (Get-Command git -ErrorAction Stop).Path
    } catch {
        Write-Host "ERROR: Git not found! Install from https://git-scm.com/download/win" -ForegroundColor Red
        exit 1
    }
}

Write-Host "Git found: $gitPath" -ForegroundColor Green

# Выполнение команд Git
& $gitPath status

# Добавление remote
& $gitPath remote remove origin 2>$null
& $gitPath remote add origin https://github.com/obertruper/CRM_call.git

Write-Host "`nRemotes:" -ForegroundColor Yellow
& $gitPath remote -v

Write-Host "`nPushing to GitHub..." -ForegroundColor Yellow
& $gitPath push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host "`nSUCCESS!" -ForegroundColor Green
    Write-Host "Repository: https://github.com/obertruper/CRM_call" -ForegroundColor Cyan
} else {
    Write-Host "`nIf authentication failed, create a token at:" -ForegroundColor Yellow
    Write-Host "https://github.com/settings/tokens" -ForegroundColor Cyan
    Write-Host "Use the token as password when prompted" -ForegroundColor Yellow
}

Write-Host "`nPress any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")