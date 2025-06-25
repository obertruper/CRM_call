# Исправление Git настройки
Set-Location "C:\Users\user\PycharmProjects\CRM_call"

$git = "C:\Program Files\Git\bin\git.exe"

Write-Host "1. Adding all files..." -ForegroundColor Yellow
& $git add .

Write-Host "`n2. Creating commit..." -ForegroundColor Yellow  
& $git commit -m "Initial commit: CRM automation setup"

Write-Host "`n3. Adding GitHub remote..." -ForegroundColor Yellow
& $git remote add origin https://github.com/obertruper/CRM_call.git 2>$null
if ($LASTEXITCODE -ne 0) {
    & $git remote set-url origin https://github.com/obertruper/CRM_call.git
}

Write-Host "`n4. Pushing to GitHub..." -ForegroundColor Yellow
& $git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host "`nSUCCESS! Check: https://github.com/obertruper/CRM_call" -ForegroundColor Green
} else {
    Write-Host "`nNeed GitHub authentication:" -ForegroundColor Yellow
    Write-Host "1. Go to: https://github.com/settings/tokens" -ForegroundColor Cyan
    Write-Host "2. Create token with 'repo' scope" -ForegroundColor Cyan
    Write-Host "3. Use token as password when prompted" -ForegroundColor Cyan
    
    Write-Host "`nTrying push again..." -ForegroundColor Yellow
    & $git push -u origin main
}

pause