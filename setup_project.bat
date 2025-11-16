@echo off

echo ==================================================================
echo Setting up the Python project environment...

REM Ensure Python is installed
echo Checking for Python installation...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Python is not installed. Please install Python 3.8 or higher and try again.
    exit /b 1
)
echo Python installation found.

REM Ensure python version is at least 3.8
echo Checking Python version...
for /f "tokens=2 delims=." %%a in ('python -c "import sys; print('.'.join(map(str, sys.version_info[:2])))"') do (
    set PY_MAJOR=%%a
    set PY_MINOR=%%b
)
echo Detected System Python version: %PY_MAJOR%.%PY_MINOR%
if %PY_MAJOR% lss 3 (
    echo Python version is less than 3.8. Please install Python 3.8 or higher and try again.
    exit /b 1
) else if %PY_MAJOR%==3 if %PY_MINOR% lss 8 (
    echo Python version is less than 3.8. Please install Python 3.8 or higher and try again.
    exit /b 1
)

REM Ensure pip is installed
echo Checking for pip...
pip --version >nul 2>&1
if %errorlevel% neq 0 (
    echo pip is not installed. Please install pip and try again.
    exit /b 1
)
echo pip installation found.

REM Check for a virtual environment, create one if it doesn't exist
echo Checking for virtual environment...
if not exist ".venv\Scripts\activate.bat" (
    echo Virtual environment not found.
    echo Creating virtual environment...
    python -m venv .venv
    if %errorlevel% neq 0 (
        echo Failed to create virtual environment.
        exit /b 1
    )
) else (
    echo Virtual environment found.
)

REM Activate the virtual environment
echo Activating virtual environment...
call .venv\Scripts\activate

REM Update pip to the latest version
echo Updating pip to the latest version...
python -m pip install --upgrade pip
if %errorlevel% neq 0 (
    echo Failed to update pip. Please check your internet connection and try again.
    exit /b 1
)

REM Install package and all dependencies based on pyproject.toml using pip
echo Installing required packages...
pip install -e .

REM Installation completed, add other setup steps below if necessary.

echo Setup completed successfully!
echo.
echo You can now activate the virtual environment using:
echo call .venv\Scripts\activate.bat
echo.
echo To deactivate, simply run:
echo deactivate
echo.
echo To run the project, use:
echo python main.py
echo OR simply type in liftlogger in the command line.
echo ==================================================================
