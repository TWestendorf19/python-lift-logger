@echo off

echo ===========================================================
echo Restoring the project environment to its original state...

REM Deactivate the virtual environment if it is activated
if defined VIRTUAL_ENV (
    echo Deactivating virtual environment...
    call %VIRTUAL_ENV%\Scripts\deactivate.bat
    if errorlevel 1 (
        echo Failed to deactivate the virtual environment.
    ) else (
        echo Virtual environment deactivated successfully.
)
else (
    echo No virtual environment is currently activated.
)

REM Remove the virtual environment directory
if exist .venv (
    echo Removing virtual environment directory...
    rmdir /s /q .venv
    if errorlevel 1 (
        echo Failed to remove the virtual environment directory.
    ) else (
        echo Virtual environment directory removed successfully.
    )
) else (
    echo No virtual environment directory found to remove.
)

REM Remove __pycache__ directories
echo Removing __pycache__ directories...
for /r %%d in (__pycache__) do (
    echo Removing %%d...
    rmdir /s /q "%%d"
    if errorlevel 1 (
        echo Failed to remove %%d.
    ) else (
        echo %%d removed successfully.
    )
)

REM Remove .pytest_cache directory
if exist .pytest_cache (
    echo Removing .pytest_cache directory...
    rmdir /s /q .pytest_cache
    if errorlevel 1 (
        echo Failed to remove .pytest_cache directory.
    ) else (
        echo .pytest_cache directory removed successfully.
    )
) else (
    echo No .pytest_cache directory found to remove.
)

REM Remove .egg-info directories
echo Removing .egg-info directories...
for /r %%d in (*.egg-info) do (
    echo Removing %%d...
    rmdir /s /q "%%d"
    if errorlevel 1 (
        echo Failed to remove %%d.
    ) else (
        echo %%d removed successfully.
    )
)

echo "Project environment cleanup completed."

echo ===========================================================
