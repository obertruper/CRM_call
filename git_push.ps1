# Автоматический Git Push
param(
    [string]$Message = "Auto update: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
)

Set-Location "C:\Users\user\PycharmProjects\CRM_call"

# Установка пути к Git
$env:Path += ";C:\Program Files\Git\bin"

Write-Host "=== Git Auto Push ===" -ForegroundColor Cyan

# Проверка изменений
$status = git status --porcelain
if (-not $status) {
    Write-Host "No changes to commit" -ForegroundColor Green
    exit 0
}

# Показать изменения
Write-Host "`nChanges found:" -ForegroundColor Yellow
git status -s

# Добавление и коммит
Write-Host "`nCommitting..." -ForegroundColor Yellow
git add .
git commit -m "$Message"

# Настройка credential helper
git config --global credential.helper wincred

# Push
Write-Host "`nPushing to GitHub..." -ForegroundColor Yellow
git push origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host "`nSuccess! View at: https://github.com/obertruper/CRM_call" -ForegroundColor Green
} else {
    Write-Host "`nPush failed! Create token at:" -ForegroundColor Red
    Write-Host "https://github.com/settings/tokens/new" -ForegroundColor Cyan
    Write-Host "Use token as password when prompted" -ForegroundColor Yellow
    
    # Retry
    git push origin main
}

Write-Host "`nDone!" -ForegroundColor Cyan