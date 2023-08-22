@echo off
set SCRIPT_DIR=%~dp0

echo Pulling latest changes from the repository...
cd %SCRIPT_DIR%
git pull

echo Updating submodules...
git submodule update --init --recursive
echo Submodules updated!

call "%SCRIPT_DIR%venv\Scripts\activate"
python "%SCRIPT_DIR%ComfyUI\main.py" --auto-launch

pause