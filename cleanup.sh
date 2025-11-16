#/bin/bash
set +x
echo "=================================================================="
echo "Restoring the project environment to its original state..."

# Deactivate the virtual environment if it's active
if [ -n "$VIRTUAL_ENV" ]; then
    echo "Deactivating virtual environment..."
    deactivate
    if [ $? -ne 0 ]; then
        echo "Failed to deactivate virtual environment."
        exit 1
    else
        echo "Virtual environment deactivated."
    fi
else
    echo "No active virtual environment found."
fi

# Remove the virtual environment directory
if [ -d ".venv" ]; then
    echo "Removing virtual environment directory..."
    rm -rf .venv
    if [ $? -ne 0 ]; then
        echo "Failed to remove virtual environment directory."
        exit 1
    else
        echo "Virtual environment directory removed."
    fi
else
    echo "No virtual environment directory found to remove."
fi

# Remove __pycache__ directories
echo "Removing __pycache__ directories..."
find . -type d -name "__pycache__" -exec rm -rf {} +
if [ $? -ne 0 ]; then
    echo "Failed to remove __pycache__ directories."
    exit 1
else
    echo "__pycache__ directories removed."
fi

# Remove .pytest_cache directory
if [ -d ".pytest_cache" ]; then
    echo "Removing .pytest_cache directory..."
    rm -rf .pytest_cache
    if [ $? -ne 0 ]; then
        echo "Failed to remove .pytest_cache directory."
        exit 1
    else
        echo ".pytest_cache directory removed."
    fi
else
    echo "No .pytest_cache directory found to remove."
fi

# Remove .egg-info directories
echo "Removing .egg-info directories..."
find . -type d -name "*.egg-info" -exec rm -rf {} +
if [ $? -ne 0 ]; then
    echo "Failed to remove .egg-info directories."
    exit 1
else
    echo ".egg-info directories removed."
fi

echo "Project environment restoration complete."
echo "=================================================================="
