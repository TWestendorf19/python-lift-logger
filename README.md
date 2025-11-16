# LiftLogger
LiftLogger is a Python application designed to help anyone lifting weights to 
log their workouts easily and efficiently. It provides a simple interface to 
record exercises, sets, reps, and weights lifted, allowing users to track their
progress over time and see consistency in their training. 

## Features (All currently WIP)
- Log workouts with details such as exercise name, sets, reps, and weight.
- View past workouts to track progress.
- Graphical representation of progress over time.
- Save and load workout data from files.
- Optional terminal-based user interface for a unique and efficient logging
    experience.
- Export workout data to CSV for further analysis.

## Installation
To install LiftLogger, you need to have Python 3.8 or higher installed on your
system. You can then clone the repository and run the setup script to install
the required dependencies and the application itself.

1. Navigate to your desired installation directory and clone the repository:

```bash
git clone https://github.com/TWestendorf19/python-lift-logger.git
```
2. Change into the cloned directory:

```bash
cd python-lift-logger
```
3. Run the appropriate setup script to install dependencies:

#### Automated Setup
- On Windows:

```bash
setup_project.bat
```
- On macOS/Linux:

```bash
bash setup_project.sh
```

#### Manual Setup
If you prefer to set up the environment manually, follow these steps:
- Create a virtual environment (optional but recommended):

```bash
python -m venv .venv
```
- Activate the virtual environment:
  - On Windows:

```bash
.venv\Scripts\activate
```
  - On macOS/Linux:

```bash
source .venv/bin/activate
```
- Install the required dependencies:

```bash
pip install -r requirements.txt
```

## Usage
After installation, you can run LiftLogger to start logging your workouts.

If you ran the setup script, simply execute:
```bash
liftlogger
```
If you set up the environment manually, run the main script with:
```bash
python lift_logger.py
```
This will launch the application, and you can begin logging your workouts.

## Contributing
Contributions to LiftLogger are welcome! If you have ideas for new features,
bug fixes, or improvements, please feel free to fork the repository and submit a
pull request. Make sure to follow the existing code style and include tests for
any new functionality.

## License
LiftLogger is licensed under the Apache License 2.0. See the LICENSE file for
more details.
