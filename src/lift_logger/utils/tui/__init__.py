"""!
@package tui
@brief This package contains the core modules and sub-packages for the
text user interface (TUI) of the lift-logger python application.
"""

__version__ = "0.1.0"
__author__ = "Tyson Westendorf"

from .logger_tui import (
    LoggerTUI,
        )

__all__ = [
    "LoggerTUI",
        ]
