#/bin/bash
set +x
echo "=================================================================="
echo "Setting up the Python project environment..."

# Ensure Python is installed
echo "Checking for Python installation..."
python3 --version >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Python is not installed. Please install Python 3.6 or higher."
    exit 1
fi
echo "Python installation found."

# Ensure Python version is 3.8 or higher
echo "Checking Python version..."
PYTHON_MAJOR=$(python3 -c 'import sys; print(sys.version_info.major)')
PYTHON_MINOR=$(python3 -c 'import sys; print(sys.version_info.minor)')
echo "Detected Python version: $PYTHON_MAJOR.$PYTHON_MINOR"
if [ $PYTHON_MAJOR -lt 3 ] || { [ $PYTHON_MAJOR -eq 3 ] && [ $PYTHON_MINOR -lt 8 ]; }; then
    echo "Python 3.8 or higher is required. Please upgrade your Python installation."
    exit 1
fi

# Ensure pip is installed
echo "Checking for pip..."
pip3 --version >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "pip is not installed. Please install pip and try again:"
    echo "https://pip.pypa.io/en/stable/installation/"
    exit 1
fi
echo "pip installation found."

# Update pip to the latest version
echo "Updating pip..."
python3 -m pip install --upgrade pip
if [ $? -ne 0 ]; then
    echo "Failed to update pip. Please check your internet connection and try again."
    exit 1
fi

# Check for virtual environment and create one if it doesn't exist
echo "Checking for virtual environment..."
if [ ! -d ".venv" ]; then
    echo "Virtual environment not found."
    echo "Creating virtual environment..."
    python3 -m venv venv
    if [ $? -ne 0 ]; then
        echo "Failed to create virtual environment."
        exit 1
    fi
else
    echo "Virtual environment already exists."
fi

# Activate the virtual environment
echo "Activating virtual environment..."
source .venv/bin/activate

# Install package and all dependencies based on pyproject.toml using pip
echo "Installing package and dependencies..."
pip install -e .

# Installation completed, add other setup steps below if necessary.

echo "Setup completed successfully!"
echo.
echo "You can now activate the virtual environment using:"
echo "source .venv/bin/activate"
echo.
echo "To deactivate the virtual environment, simply run:"
echo "deactivate"
echo.
echo "To run the project, use:"
echo "python main.py"
echo "OR simply type in liftlogger in the command line."
echo "=================================================================="
