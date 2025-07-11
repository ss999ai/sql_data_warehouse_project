/*
=============================================================
Database Creation Script: DataWarehouse
=============================================================

Purpose:
    This script creates a new PostgreSQL database named 'DataWarehouse_Project'. 
    If the database already exists, it will be dropped and recreated.

    After creating the database, the script sets up three schemas within it:
        - bronze
        - silver
        - gold

Warning:
    ⚠️ This script will permanently delete the 'DataWarehouse' database if it already exists.
    All existing data in the database will be lost.
    Make sure to back up any important information before executing this script.

Instructions:
    1. Ensure you are connected to a different database (e.g., 'postgres') before running.
    2. Run the script in a PostgreSQL environment that has sufficient privileges.

*/

==================================================
==================================================
==================================================

-- CREATE the 'Datawarehouse_Project' database

DROP DATABASE IF EXISTS Datawarehouse_Project;
CREATE DATABASE Datawarehouse_Project;


==================================================
==================================================
==================================================

-- Create Schemas

CREATE SCHEMA bronze;
CREATE SCHEMA silver;
CREATE SCHEMA gold;










