 create database task2;
Query OK, 1 row affected (0.02 sec)

mysql> use task2;
Database changed
mysql> CREATE TABLE Employees (
    ->     ID INTEGER PRIMARY KEY,
    ->     Name TEXT NOT NULL,
    ->     Age INTEGER DEFAULT 25,
    ->     Department TEXT,
    ->     Salary REAL
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> -- Full insert
mysql> INSERT INTO Employees (ID, Name, Age, Department, Salary)
    -> VALUES (1, 'Alice', 30, 'HR', 50000);
Query OK, 1 row affected (0.02 sec)

mysql>
mysql> -- Partial insert with default Age
mysql> INSERT INTO Employees (ID, Name, Department, Salary)
    -> VALUES (2, 'Bob', 'IT', 60000);
Query OK, 1 row affected (0.00 sec)

mysql>
mysql> -- Insert with NULL
mysql> INSERT INTO Employees (ID, Name, Age, Department, Salary)
    -> VALUES (3, 'Charlie', NULL, NULL, NULL);
Query OK, 1 row affected (0.00 sec)

mysql> -- Update a single row
mysql> UPDATE Employees
    -> SET Salary = 65000
    -> WHERE Name = 'Bob';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> -- Update multiple rows
mysql> UPDATE Employees
    -> SET Department = 'Operations'
    -> WHERE Department IS NULL;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> -- Delete a specific row
mysql> DELETE FROM Employees
    -> WHERE ID = 3;
Query OK, 1 row affected (0.02 sec)

mysql> BEGIN TRANSACTION;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'TRANSACTION' at line 1
mysql> DELETE FROM Employees WHERE Name = 'Alice';
Query OK, 1 row affected (0.02 sec)

mysql> ROLLBACK;
Query OK, 0 rows affected (0.00 sec)

mysql> -- Duplicate entry for testing
mysql> INSERT INTO Employees (ID, Name, Age, Department, Salary)
    -> SELECT 4, Name, Age, Department, Salary
    -> FROM Employees
    -> WHERE ID = 1;
Query OK, 0 rows affected (0.00 sec)
Records: 0  Duplicates: 0  Warnings: 0