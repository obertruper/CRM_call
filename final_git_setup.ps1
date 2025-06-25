# Финальная настройка Git
Set-Location "C:\Users\user\PycharmProjects\CRM_call"

$git = "C:\Program Files\Git\bin\git.exe"

Write-Host "Setting up Git user..." -ForegroundColor Yellow
& $git config --global user.email "ilpnqw1001@gmail.com"
& $git config --global user.name "obertruper"

Write-Host "`nCurrent config:" -ForegroundColor Green
& $git config --global user.email
& $git config --global user.name

Write-Host "`nCommitting files..." -ForegroundColor Yellow
& $git add .
& $git commit -m "Initial commit: CRM automation setup with Windows Task Scheduler and GitHub Actions"

Write-Host "`nPushing to GitHub..." -ForegroundColor Yellow
& $git push -u origin main

if ($LASTEXITCODE -ne 0) {
    Write-Host "`nAuthentication required!" -ForegroundColor Red
    Write-Host "`nOption 1 - Use Personal Access Token:" -ForegroundColor Yellow
    Write-Host "1. Open: https://github.com/settings/tokens/new" -ForegroundColor Cyan
    Write-Host "2. Name: CRM_call_token" -ForegroundColor Cyan
    Write-Host "3. Select scopes: repo (all)" -ForegroundColor Cyan
    Write-Host "4. Generate token and copy it" -ForegroundColor Cyan
    Write-Host "5. Use it as password when Git prompts" -ForegroundColor Cyan
    
    Write-Host "`nOption 2 - Use GitHub CLI:" -ForegroundColor Yellow
    Write-Host "gh auth login" -ForegroundColor Cyan
    
    Write-Host "`nPress Enter to try push again..." -ForegroundColor Yellow
    Read-Host
    
    & $git push -u origin main
}

Write-Host "`nDone! Repository should be at: https://github.com/obertruper/CRM_call" -ForegroundColor Green
pause