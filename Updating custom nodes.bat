@echo off
set SCRIPT_DIR=%~dp0

call "%SCRIPT_DIR%venv\Scripts\activate"

cd "%SCRIPT_DIR%ComfyUI\custom_nodes"

for /D %%i in (*) do (
    echo.
    echo Processing node: %%i
    cd "%%i"
    
    echo Checking for updates...
    git fetch
    git status | findstr "Your branch is behind" >nul
    if errorlevel 1 (
        echo No updates found for %%i.
    ) else (
        echo Updates found for %%i. Pulling latest changes...
        git pull
    )
    
    if exist "requirements.txt" (
        echo Installing dependencies for %%i...
        pip install -r requirements.txt
    ) else (
        echo No requirements.txt found for %%i.
    )

    cd "%SCRIPT_DIR%ComfyUI\custom_nodes"
)

echo.
echo All nodes processed.
pause
