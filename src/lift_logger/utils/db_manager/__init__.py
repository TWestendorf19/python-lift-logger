"""!
@package lift_logger_db
@brief This package contains the core modules and sub-packages for the
database management of the lift-logger python application.
"""

__version__ = "0.1.0"
__author__ = "Tyson Westendorf"

from .db_manager import (
    DBManager,
        )

__all__ = [
    "DBManager",
        ]
