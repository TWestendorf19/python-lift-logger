"""!
@file test_db_manager.py
@brief Unit tests for the DBManager module.
@details This module contains unit tests for the DBManager class, which is 
responsible for connecting to and managing the SQLite database for the lifting
logger application.
@note This module uses the 'unittest' framework for testing.

This module was developed using Python version: 3.15.7
"""

import unittest
import os
import sqlite3
from db_manager import DBManager

class TestDBManager(unittest.TestCase):
    """!
    @brief Unit tests for the DBManager class.
    @details This class contains unit tests to verify the functionality of the
    DBManager class, including database connection and table creation.
    """

    def setUp(self):
        """!
        @brief Sets up the test environment.
        @details Initializes a DBManager instance and creates a temporary
        database file for testing.
        """
        self.test_db_path = "test_lifting_logger.db"
        self.db_manager = DBManager(self.test_db_path)

    def tearDown(self):
        """!
        @brief Cleans up the test environment.
        @details Closes the database connection and removes the temporary
        database file after tests are completed.
        """
        self.db_manager.close_connection()
        if os.path.exists(self.test_db_path):
            os.remove(self.test_db_path)

    def test_connection(self):
        """!
        @brief Tests the database connection.
        @details Verifies that the DBManager can successfully connect to the
        SQLite database.
        """
        self.db_manager.connect()
        self.assertIsNotNone(self.db_manager.connection)

    def test_create_tables(self):
        """!
        @brief Tests table creation in the database.
        @details Verifies that the necessary tables are created in the SQLite
        database.
        """
        self.db_manager.connect()
        self.db_manager.create_tables()
        
        cursor = self.db_manager.connection.cursor()
        cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
        tables = cursor.fetchall()
        
        expected_tables = {('users',), ('logs',)}
        self.assertEqual(set(tables), expected_tables)
