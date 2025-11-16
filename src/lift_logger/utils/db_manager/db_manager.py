"""!
@file db_manager.py

@brief This module contains the DBManager class for managing database operations
for the lift-logger python application.

@details The DBManager class provides methods to connect to the database,
execute queries, and handle database transactions.

@note This module uses the sqlite3 library for database operations.

This module was developed using Python version: 
"""

import sqlite3

class DBManager:
    """!
    @brief Class for managing database operations.

    @details The DBManager class provides methods to connect to the database,
    execute queries, and handle database transactions.
    """

    def __init__(self, db_name: str) -> None:
        """!
        @brief Initializes the DBManager with the specified database name.

        @param db_name The name of the database file.
        """
        self.db_name = db_name
        self.connection = None

    def close(self) -> None:
        """!
        @brief Closes the database connection.
        """
        if self.connection:
            self.connection.close()
            self.connection = None
