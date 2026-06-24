@echo off
cd /d "%~dp0"

set "GIT_EXE=git"
where git >nul 2>nul
if errorlevel 1 set "GIT_EXE=C:\Users\10001164149\.cache\codex-runtimes\codex-primary-runtime\dependencies\native\git\cmd\git.exe"

"%GIT_EXE%" add .
"%GIT_EXE%" diff --cached --quiet
if not errorlevel 1 (
  echo No changes to commit.
) else (
  "%GIT_EXE%" commit -m "site update"
  if errorlevel 1 goto error
)

"%GIT_EXE%" push origin main
if errorlevel 1 goto error

echo.
echo GitHub Pages update complete.
pause
exit /b 0

:error
echo.
echo Update failed. Check the message above.
pause
exit /b 1
