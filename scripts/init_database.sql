/*
===============================================================================
Create Database and Schemas
===============================================================================
Script purpose: 
  This script creates a new databse named 'DataWarehouse' after checking if it already exists.
  If the databse exists, it is dropped and recreated. Additionall, the script sets up three schemas
  within the databse: 'bronze', 'silver', 'gold' ( Medallion arch)

Warning:
  Running this script will drop the entire 'DataWarehouse' database if it exists.
  All data in the database will be permanently deleted. Proceed with caution.
  and ensure you have proper backups before running this script.
*/

USE master;
GO

--Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databses WHERE name = 'DataWarehouse')
BEGIN
  ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE DataWarehouse;
END;
GO

--Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

--Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
