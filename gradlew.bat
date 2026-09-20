@echo off
setlocal
where gradle >nul 2>nul
if %ERRORLEVEL% EQU 0 (
  gradle %*
  exit /b %ERRORLEVEL%
)
echo Gradle is not installed. On GitHub Actions, use the included workflow.
echo For local Windows use, install Gradle 8.9 or generate a standard Gradle wrapper.
exit /b 1
