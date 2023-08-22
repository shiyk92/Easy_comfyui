@echo off
setlocal enabledelayedexpansion

if not exist "%~dp0%venv" (
    echo Creating VENV...
    python -m venv "%~dp0%venv"
) else (
    echo already existing...
)

call "%~dp0%venv\Scripts\activate.bat"

if exist "%~dp0%requirements.txt" (
    echo Installing requirements.txt...
    pip install -r "%~dp0%requirements.txt"
) else (
    echo could not fund requirements.txt
    exit /b 1
)
git pull
echo successfully！

if exist "%~dp0%RUN_Shiyk.BAT" (
    call "%~dp0%RUN_Shiyk.BAT"
) else (
    echo could not fund RUN_Shiyk.BAT
    exit /b 1
)

endlocal
exit /b 0
