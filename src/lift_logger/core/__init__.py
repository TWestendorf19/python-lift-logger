"""!
@package core
@brief Core modules for the lift-logger python application.
@details This package provides the core modules for the lift-logger python
application consisting of the main functions and methods used to log lifts,
weights, sets, and repetitions. It also includes functionality for viewing
and managing lifting logs.
"""

__version__ = "0.1.0"

from . import (
        Logger,
        )

__all__ = [
        "Logger",
        ]
