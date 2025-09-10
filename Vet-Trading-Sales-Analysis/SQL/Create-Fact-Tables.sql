-- SQL Script to Create Fact Tables for Veterinary Trading Company
-- Author: Sales Analysis Project
-- Date: 2025-09-10

-- Create FactSales Table
CREATE TABLE FactSales (
    SalesKey INT IDENTITY(1,1) PRIMARY KEY,
    DateKey INT NOT NULL,
    ProductKey INT NOT NULL,
    CustomerKey INT NOT NULL,
    SalesRepKey INT NOT NULL,
    SupplierKey INT NOT NULL,
    TerritoryKey INT NOT NULL,
    QuantitySold DECIMAL(10,2),
    UnitPrice DECIMAL(10,2),
    LineTotal DECIMAL(12,2),
    COGS DECIMAL(12,2),
    GrossProfit DECIMAL(12,2),
    DiscountAmount DECIMAL(10,2),
    TaxAmount DECIMAL(10,2),
    TransactionID VARCHAR(50),
    OrderDate DATE,
    
    -- Foreign Key Constraints
    FOREIGN KEY (DateKey) REFERENCES DimDate(DateKey),
    FOREIGN KEY (ProductKey) REFERENCES DimProduct(ProductKey),
    FOREIGN KEY (CustomerKey) REFERENCES DimCustomer(CustomerKey),
    FOREIGN KEY (SalesRepKey) REFERENCES DimSalesRep(SalesRepKey),
    FOREIGN KEY (SupplierKey) REFERENCES DimSupplier(SupplierKey),
    FOREIGN KEY (TerritoryKey) REFERENCES DimTerritory(TerritoryKey)
);

-- Create FactInventory Table
CREATE TABLE FactInventory (
    InventoryKey INT IDENTITY(1,1) PRIMARY KEY,
    DateKey INT NOT NULL,
    ProductKey INT NOT NULL,
    SupplierKey INT NOT NULL,
    OpeningStock DECIMAL(10,2),
    ClosingStock DECIMAL(10,2),
    StockReceived DECIMAL(10,2),
    StockSold DECIMAL(10,2),
    StockAdjustments DECIMAL(10,2),
    InventoryValue DECIMAL(12,2),
    UnitCost DECIMAL(10,2),
    
    -- Foreign Key Constraints
    FOREIGN KEY (DateKey) REFERENCES DimDate(DateKey),
    FOREIGN KEY (ProductKey) REFERENCES DimProduct(ProductKey),
    FOREIGN KEY (SupplierKey) REFERENCES DimSupplier(SupplierKey)
);

-- Create indexes for better performance
CREATE INDEX IX_FactSales_DateKey ON FactSales(DateKey);
CREATE INDEX IX_FactSales_ProductKey ON FactSales(ProductKey);
CREATE INDEX IX_FactSales_CustomerKey ON FactSales(CustomerKey);
CREATE INDEX IX_FactInventory_DateKey ON FactInventory(DateKey);
CREATE INDEX IX_FactInventory_ProductKey ON FactInventory(ProductKey);