@echo off
echo === Git Setup Script ===
echo.

cd /d "C:\Users\user\PycharmProjects\CRM_call"

echo Checking current Git status...
git status
echo.

echo Adding remote repository...
git remote add origin git@github.com:obertruper/CRM_call.git 2>nul
if %errorlevel% neq 0 (
    echo Remote already exists, updating URL...
    git remote set-url origin git@github.com:obertruper/CRM_call.git
)

echo.
echo Current remotes:
git remote -v
echo.

echo Checking SSH key...
ssh -T git@github.com 2>&1
if %errorlevel% neq 0 (
    echo.
    echo SSH key not configured. Generating new SSH key...
    ssh-keygen -t ed25519 -C "ilpnqw1001@gmail.com" -f "%USERPROFILE%\.ssh\id_ed25519" -N ""
    
    echo.
    echo Your SSH public key:
    echo ==============================
    type "%USERPROFILE%\.ssh\id_ed25519.pub"
    echo ==============================
    echo.
    echo Add this key to GitHub: https://github.com/settings/keys
    echo Press any key after adding the key to GitHub...
    pause >nul
)

echo.
echo Pushing to GitHub...
git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo === SUCCESS ===
    echo Repository pushed successfully!
    echo URL: https://github.com/obertruper/CRM_call
) else (
    echo.
    echo === PUSH FAILED ===
    echo Trying HTTPS instead...
    git remote set-url origin https://github.com/obertruper/CRM_call.git
    git push -u origin main
)

echo.
echo === Current Status ===
git status
echo.
git log --oneline -5

pause