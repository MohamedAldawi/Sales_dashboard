-- SQL Script to Create Dimension Tables for Veterinary Trading Company
-- Author: Sales Analysis Project
-- Date: 2025-09-10

-- Create DimDate Table
CREATE TABLE DimDate (
    DateKey INT PRIMARY KEY,
    Date DATE NOT NULL,
    Year INT,
    Quarter INT,
    Month INT,
    Week INT,
    Day INT,
    Weekday VARCHAR(20),
    IsHoliday BIT DEFAULT 0,
    FiscalYear INT,
    FiscalQuarter INT
);

-- Create DimProduct Table
CREATE TABLE DimProduct (
    ProductKey INT IDENTITY(1,1) PRIMARY KEY,
    ProductID VARCHAR(20) NOT NULL UNIQUE,
    ProductName VARCHAR(100) NOT NULL,
    ProductCategory VARCHAR(50),
    ProductSubcategory VARCHAR(50),
    Brand VARCHAR(50),
    UnitOfMeasure VARCHAR(20),
    PackSize VARCHAR(20),
    IsPrescriptionRequired BIT DEFAULT 0,
    ShelfLifeDays INT,
    StorageRequirements VARCHAR(100)
);

-- Create DimCustomer Table
CREATE TABLE DimCustomer (
    CustomerKey INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID VARCHAR(20) NOT NULL UNIQUE,
    CustomerName VARCHAR(100) NOT NULL,
    CustomerType VARCHAR(30),
    CustomerSegment VARCHAR(30),
    RegistrationDate DATE,
    PhoneNumber VARCHAR(20),
    Email VARCHAR(100),
    Address VARCHAR(200),
    City VARCHAR(50),
    State VARCHAR(50),
    Country VARCHAR(50),
    CreditLimit DECIMAL(10,2),
    IsActive BIT DEFAULT 1
);

-- Create DimSupplier Table
CREATE TABLE DimSupplier (
    SupplierKey INT IDENTITY(1,1) PRIMARY KEY,
    SupplierID VARCHAR(20) NOT NULL UNIQUE,
    SupplierName VARCHAR(100) NOT NULL,
    SupplierType VARCHAR(50),
    ContactPerson VARCHAR(100),
    PhoneNumber VARCHAR(20),
    Email VARCHAR(100),
    Address VARCHAR(200),
    City VARCHAR(50),
    State VARCHAR(50),
    Country VARCHAR(50),
    PaymentTerms VARCHAR(50),
    IsActive BIT DEFAULT 1
);

-- Create DimSalesRep Table
CREATE TABLE DimSalesRep (
    SalesRepKey INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID VARCHAR(20) NOT NULL UNIQUE,
    SalesRepName VARCHAR(100) NOT NULL,
    HireDate DATE,
    Department VARCHAR(50),
    Manager VARCHAR(100),
    TerritoryAssigned VARCHAR(50),
    CommissionRate DECIMAL(5,4),
    IsActive BIT DEFAULT 1
);

-- Create DimTerritory Table
CREATE TABLE DimTerritory (
    TerritoryKey INT IDENTITY(1,1) PRIMARY KEY,
    TerritoryID VARCHAR(20) NOT NULL UNIQUE,
    TerritoryName VARCHAR(100) NOT NULL,
    Region VARCHAR(50),
    Country VARCHAR(50),
    TerritoryManager VARCHAR(100),
    IsActive BIT DEFAULT 1
);