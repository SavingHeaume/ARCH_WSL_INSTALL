@echo off

cd /d %~dp0

set DISTRO_NAME=Arch
set IMAGE_PATH=D:\WSL\archlinux-bootstrap.tar

wsl --import %DISTRO_NAME% D:\WSL\Arch  %IMAGE_PATH%
if %ERRORLEVEL% NEQ 0 (pause & exit /b %ERRORLEVEL%)

wsl -d %DISTRO_NAME% -u root ./setup.sh
if %ERRORLEVEL% NEQ 0 (pause & exit /b %ERRORLEVEL%)

wsl --shutdown

pause
