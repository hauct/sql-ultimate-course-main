-- Connect to the default database (typically postgres)
\c postgres

-- Drop the sales database if it exists and then create it.
DROP DATABASE IF EXISTS "Sales";
CREATE DATABASE "Sales";

-- Connect to the newly created database.
\c "Sales"

-- Drop the Sales schema if it exists (CASCADE drops dependent objects) and create a new one.
DROP SCHEMA IF EXISTS "Sales" CASCADE;
CREATE SCHEMA "Sales";

-- ======================================================
-- Table: Customers
-- ======================================================
CREATE TABLE "Sales".Customers (
    CustomerID VARCHAR NOT NULL,
    FirstName VARCHAR(50) NULL,
    LastName VARCHAR(50) NULL,
    Country VARCHAR(50) NULL,
    Score INT NULL,
    CONSTRAINT pk_customers PRIMARY KEY (CustomerID)
);

\copy "Sales".Customers FROM './sales/Customers.csv' DELIMITER ',' CSV;

-- ======================================================
-- Table: Employees
-- ======================================================
CREATE TABLE "Sales".Employees (
    EmployeeID VARCHAR NOT NULL,
    FirstName VARCHAR(50) NULL,
    LastName VARCHAR(50) NULL,
    Department VARCHAR(50) NULL,
    BirthDate DATE NULL,
    Gender CHAR(1) NULL,
    Salary INT NULL,
    ManagerID VARCHAR NULL,
    CONSTRAINT pk_employees PRIMARY KEY (EmployeeID)
);

\copy "Sales".Employees FROM './sales/Employees.csv' DELIMITER ',' CSV;

-- ======================================================
-- Table: Products
-- ======================================================
CREATE TABLE "Sales".Products (
    ProductID VARCHAR NOT NULL,
    Product VARCHAR(50) NULL,
    Category VARCHAR(50) NULL,
    Price INT NULL,
    CONSTRAINT pk_products PRIMARY KEY (ProductID)
);

\copy "Sales".Products FROM './sales/Products.csv' DELIMITER ',' CSV;

-- ======================================================
-- Table: Orders
-- ======================================================
CREATE TABLE "Sales".Orders (
    OrderID VARCHAR NOT NULL,
    ProductID VARCHAR NULL,
    CustomerID VARCHAR NULL,
    SalesPersonID VARCHAR NULL,
    OrderDate DATE NULL,
    ShipDate DATE NULL,
    OrderStatus VARCHAR(50) NULL,
    ShipAddress VARCHAR NULL,
    BillAddress VARCHAR NULL,
    Quantity INT NULL,
    Sales INT NULL,
    CreationTime TIMESTAMP NULL
);

\copy "Sales".Orders FROM './sales/Orders.csv' DELIMITER ',' CSV;

\dt (Sales).*