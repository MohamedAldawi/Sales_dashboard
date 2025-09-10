# Veterinary Trading Company - Dimensional Model Design

## Overview
This document outlines the dimensional model design for the veterinary trading company sales analysis. The model follows Kimball's dimensional modeling methodology with a star schema approach.

## Business Requirements
- Track sales performance across different time periods
- Analyze product performance by category and supplier
- Monitor customer purchasing patterns and segmentation
- Evaluate sales representative and territory performance
- Analyze profit margins and inventory turnover

## Dimensional Model Structure

### Fact Tables

#### 1. FactSales
**Grain**: One row per line item on each sales transaction
**Measures**:
- Quantity Sold
- Unit Price
- Line Total
- Cost of Goods Sold (COGS)
- Gross Profit
- Discount Amount
- Tax Amount

**Foreign Keys**:
- DateKey → DimDate
- ProductKey → DimProduct
- CustomerKey → DimCustomer
- SalesRepKey → DimSalesRep
- SupplierKey → DimSupplier
- TerritoryKey → DimTerritory

#### 2. FactInventory
**Grain**: One row per product per day for inventory levels
**Measures**:
- Opening Stock
- Closing Stock
- Stock Received
- Stock Sold
- Stock Adjustments
- Inventory Value

**Foreign Keys**:
- DateKey → DimDate
- ProductKey → DimProduct
- SupplierKey → DimSupplier

### Dimension Tables

#### 1. DimDate
**Purpose**: Time dimension for temporal analysis
**Attributes**:
- DateKey (PK)
- Date
- Year
- Quarter
- Month
- Week
- Day
- Weekday
- Is Holiday
- Fiscal Year
- Fiscal Quarter

#### 2. DimProduct
**Purpose**: Product master data
**Attributes**:
- ProductKey (PK)
- Product ID
- Product Name
- Product Category
- Product Subcategory
- Brand
- Unit of Measure
- Pack Size
- Is Prescription Required
- Shelf Life Days
- Storage Requirements

#### 3. DimCustomer
**Purpose**: Customer master data
**Attributes**:
- CustomerKey (PK)
- Customer ID
- Customer Name
- Customer Type (Clinic, Hospital, Individual)
- Customer Segment
- Registration Date
- Phone Number
- Email
- Address
- City
- State
- Country
- Credit Limit
- Is Active

#### 4. DimSupplier
**Purpose**: Supplier/Vendor information
**Attributes**:
- SupplierKey (PK)
- Supplier ID
- Supplier Name
- Supplier Type
- Contact Person
- Phone Number
- Email
- Address
- City
- State
- Country
- Payment Terms
- Is Active

#### 5. DimSalesRep
**Purpose**: Sales representative information
**Attributes**:
- SalesRepKey (PK)
- Employee ID
- Sales Rep Name
- Hire Date
- Department
- Manager
- Territory Assigned
- Commission Rate
- Is Active

#### 6. DimTerritory
**Purpose**: Sales territory information
**Attributes**:
- TerritoryKey (PK)
- Territory ID
- Territory Name
- Region
- Country
- Territory Manager
- Is Active

## Key Performance Indicators (KPIs)

### Sales Performance
- Total Revenue
- Revenue Growth (YoY, MoM)
- Average Order Value
- Sales by Product Category
- Top Selling Products
- Customer Acquisition Rate

### Profitability
- Gross Profit Margin
- Net Profit Margin
- Profit by Product Category
- Profit by Customer Segment
- Cost Analysis

### Inventory Management
- Inventory Turnover Ratio
- Stock-out Frequency
- Overstock Items
- Inventory Value Trends
- Reorder Point Analysis

### Customer Analytics
- Customer Lifetime Value
- Customer Retention Rate
- New vs Returning Customers
- Customer Segmentation Analysis
- Top Customers by Revenue

### Territory & Sales Rep Performance
- Sales by Territory
- Sales Rep Performance Rankings
- Territory Growth Rates
- Commission Analysis