@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo ========================================
echo   Deploy resume to GitHub Pages
echo ========================================
echo.

git add -A

git diff --cached --quiet
if %errorlevel%==0 (
  echo [INFO] No local changes, nothing new to commit.
) else (
  git commit -m "update resume %date% %time%"
  if errorlevel 1 goto fail
)

git push
if errorlevel 1 goto fail

echo.
echo [OK] Pushed successfully.
echo      Live site: https://hcz000.github.io
echo      Wait about 1 minute, then refresh the page.
echo.
pause
exit /b 0

:fail
echo.
echo [ERROR] Deploy failed. Please check the messages above.
echo.
pause
exit /b 1
