# Data Dictionary - Veterinary Trading Sales Analysis

## Overview

This data dictionary provides detailed information about all data elements used in the Veterinary Trading Sales Analysis solution. It includes table structures, column definitions, data types, and business rules.

## Dimension Tables

### DimDate
**Purpose**: Time dimension for temporal analysis and time intelligence calculations

| Column Name | Data Type | Description | Business Rules | Sample Values |
|-------------|-----------|-------------|----------------|---------------|
| DateKey | Integer | Primary key in YYYYMMDD format | Unique, Not Null | 20240101, 20240102 |
| Date | Date | Calendar date | Not Null, Valid date | 2024-01-01, 2024-01-02 |
| Year | Integer | Calendar year | 4-digit year | 2024, 2023 |
| Quarter | Integer | Calendar quarter (1-4) | 1-4 | 1, 2, 3, 4 |
| Month | Integer | Month number (1-12) | 1-12 | 1, 2, 12 |
| Week | Integer | Week number of year | 1-53 | 1, 26, 52 |
| Day | Integer | Day of month | 1-31 | 1, 15, 31 |
| Weekday | VARCHAR(20) | Day of week name | Full day name | Monday, Tuesday |
| IsHoliday | BIT | Holiday indicator | 0=No, 1=Yes | 0, 1 |
| FiscalYear | Integer | Fiscal year (July-June) | Year + 1 if month >= 7 | 2024, 2025 |
| FiscalQuarter | Integer | Fiscal quarter (1-4) | Based on July start | 1, 2, 3, 4 |

### DimProduct
**Purpose**: Product master data for veterinary products and supplies

| Column Name | Data Type | Description | Business Rules | Sample Values |
|-------------|-----------|-------------|----------------|---------------|
| ProductKey | Integer | Auto-generated primary key | Identity, Not Null | 1, 2, 3 |
| ProductID | VARCHAR(20) | Business product identifier | Unique, Not Null, Format: VET### | VET001, VET002 |
| ProductName | VARCHAR(100) | Product display name | Not Null | Amoxicillin 500mg, Rimadyl 75mg |
| ProductCategory | VARCHAR(50) | High-level product category | Required | Antibiotics, Pain Management |
| ProductSubcategory | VARCHAR(50) | Detailed product subcategory | Required | Oral Antibiotics, NSAIDs |
| Brand | VARCHAR(50) | Product brand name | Required | VetPharm, Pfizer |
| UnitOfMeasure | VARCHAR(20) | Unit of measure | Required | Tablets, ml, kg |
| PackSize | VARCHAR(20) | Package size description | Required | 100 tablets, 5 kg bag |
| IsPrescriptionRequired | BIT | Prescription requirement flag | 0=No, 1=Yes | 0, 1 |
| ShelfLifeDays | Integer | Product shelf life in days | Positive number | 730, 1095 |
| StorageRequirements | VARCHAR(100) | Storage condition requirements | Required | Room Temperature, Refrigerated |

### DimCustomer
**Purpose**: Customer master data for veterinary clinics, hospitals, and practitioners

| Column Name | Data Type | Description | Business Rules | Sample Values |
|-------------|-----------|-------------|----------------|---------------|
| CustomerKey | Integer | Auto-generated primary key | Identity, Not Null | 1, 2, 3 |
| CustomerID | VARCHAR(20) | Business customer identifier | Unique, Not Null, Format: CUST### | CUST001, CUST002 |
| CustomerName | VARCHAR(100) | Customer business name | Not Null | PetCare Veterinary Hospital |
| CustomerType | VARCHAR(30) | Type of customer | Required | Hospital, Clinic, Individual |
| CustomerSegment | VARCHAR(30) | Customer segment classification | Required | Large Practice, Small Practice |
| RegistrationDate | Date | Date customer was registered | Valid date | 2020-01-15 |
| PhoneNumber | VARCHAR(20) | Primary contact phone | Valid phone format | 555-0101 |
| Email | VARCHAR(100) | Primary contact email | Valid email format | info@petcarevet.com |
| Address | VARCHAR(200) | Street address | Required | 123 Main Street |
| City | VARCHAR(50) | City name | Required | Springfield |
| State | VARCHAR(50) | State/Province | Required | IL |
| Country | VARCHAR(50) | Country name | Required | USA |
| CreditLimit | DECIMAL(10,2) | Customer credit limit | Positive number | 25000.00 |
| IsActive | BIT | Customer status flag | 0=Inactive, 1=Active | 1 |

### DimSupplier
**Purpose**: Supplier/vendor master data for product sourcing

| Column Name | Data Type | Description | Business Rules | Sample Values |
|-------------|-----------|-------------|----------------|---------------|
| SupplierKey | Integer | Auto-generated primary key | Identity, Not Null | 1, 2, 3 |
| SupplierID | VARCHAR(20) | Business supplier identifier | Unique, Not Null, Format: SUP### | SUP001, SUP002 |
| SupplierName | VARCHAR(100) | Supplier company name | Not Null | VetPharm Distributors |
| SupplierType | VARCHAR(50) | Type of supplier | Required | Pharmaceutical, Equipment |
| ContactPerson | VARCHAR(100) | Primary contact name | Required | John Smith |
| PhoneNumber | VARCHAR(20) | Primary contact phone | Valid phone format | 800-555-0201 |
| Email | VARCHAR(100) | Primary contact email | Valid email format | john.smith@vetpharm.com |
| Address | VARCHAR(200) | Supplier address | Required | 100 Pharma Boulevard |
| City | VARCHAR(50) | City name | Required | New York |
| State | VARCHAR(50) | State/Province | Required | NY |
| Country | VARCHAR(50) | Country name | Required | USA |
| PaymentTerms | VARCHAR(50) | Payment terms agreement | Required | Net 30, Net 45 |
| IsActive | BIT | Supplier status flag | 0=Inactive, 1=Active | 1 |

### DimSalesRep
**Purpose**: Sales representative information for performance tracking

| Column Name | Data Type | Description | Business Rules | Sample Values |
|-------------|-----------|-------------|----------------|---------------|
| SalesRepKey | Integer | Auto-generated primary key | Identity, Not Null | 1, 2, 3 |
| EmployeeID | VARCHAR(20) | Employee identifier | Unique, Not Null, Format: EMP### | EMP001, EMP002 |
| SalesRepName | VARCHAR(100) | Full name of sales rep | Not Null | Alex Thompson |
| HireDate | Date | Date of hire | Valid date | 2020-03-15 |
| Department | VARCHAR(50) | Department assignment | Required | Sales |
| Manager | VARCHAR(100) | Manager name | Required | Sarah Manager |
| TerritoryAssigned | VARCHAR(50) | Assigned territory | Required | North Region |
| CommissionRate | DECIMAL(5,4) | Commission rate percentage | 0.0000-1.0000 | 0.0350 |
| IsActive | BIT | Employment status flag | 0=Inactive, 1=Active | 1 |

### DimTerritory
**Purpose**: Sales territory information for geographic analysis

| Column Name | Data Type | Description | Business Rules | Sample Values |
|-------------|-----------|-------------|----------------|---------------|
| TerritoryKey | Integer | Auto-generated primary key | Identity, Not Null | 1, 2, 3 |
| TerritoryID | VARCHAR(20) | Territory identifier | Unique, Not Null, Format: TER### | TER001, TER002 |
| TerritoryName | VARCHAR(100) | Territory display name | Not Null | North Illinois |
| Region | VARCHAR(50) | Higher-level region | Required | North Region |
| Country | VARCHAR(50) | Country name | Required | USA |
| TerritoryManager | VARCHAR(100) | Territory manager name | Required | Sarah Manager |
| IsActive | BIT | Territory status flag | 0=Inactive, 1=Active | 1 |

## Fact Tables

### FactSales
**Purpose**: Transactional sales data at line item level

| Column Name | Data Type | Description | Business Rules | Sample Values |
|-------------|-----------|-------------|----------------|---------------|
| SalesKey | Integer | Auto-generated primary key | Identity, Not Null | 1, 2, 3 |
| DateKey | Integer | Foreign key to DimDate | Not Null, Valid DateKey | 20240101 |
| ProductKey | Integer | Foreign key to DimProduct | Not Null, Valid ProductKey | 1, 2, 3 |
| CustomerKey | Integer | Foreign key to DimCustomer | Not Null, Valid CustomerKey | 1, 2, 3 |
| SalesRepKey | Integer | Foreign key to DimSalesRep | Not Null, Valid SalesRepKey | 1, 2, 3 |
| SupplierKey | Integer | Foreign key to DimSupplier | Not Null, Valid SupplierKey | 1, 2, 3 |
| TerritoryKey | Integer | Foreign key to DimTerritory | Not Null, Valid TerritoryKey | 1, 2, 3 |
| QuantitySold | DECIMAL(10,2) | Quantity of product sold | Positive number | 100.00, 50.00 |
| UnitPrice | DECIMAL(10,2) | Price per unit | Positive number | 45.50, 89.99 |
| LineTotal | DECIMAL(12,2) | Total line amount (Qty × Price) | Calculated field | 4550.00 |
| COGS | DECIMAL(12,2) | Cost of goods sold | Positive number | 3200.00 |
| GrossProfit | DECIMAL(12,2) | Gross profit (LineTotal - COGS) | Calculated field | 1350.00 |
| DiscountAmount | DECIMAL(10,2) | Discount applied | >= 0 | 0.00, 200.00 |
| TaxAmount | DECIMAL(10,2) | Tax amount | >= 0 | 364.00 |
| TransactionID | VARCHAR(50) | Transaction identifier | Not Null | TXN001, TXN002 |
| OrderDate | Date | Order date | Valid date | 2024-01-01 |

### FactInventory
**Purpose**: Daily inventory levels and movements by product

| Column Name | Data Type | Description | Business Rules | Sample Values |
|-------------|-----------|-------------|----------------|---------------|
| InventoryKey | Integer | Auto-generated primary key | Identity, Not Null | 1, 2, 3 |
| DateKey | Integer | Foreign key to DimDate | Not Null, Valid DateKey | 20240101 |
| ProductKey | Integer | Foreign key to DimProduct | Not Null, Valid ProductKey | 1, 2, 3 |
| SupplierKey | Integer | Foreign key to DimSupplier | Not Null, Valid SupplierKey | 1, 2, 3 |
| OpeningStock | DECIMAL(10,2) | Stock level at start of day | >= 0 | 500.00 |
| ClosingStock | DECIMAL(10,2) | Stock level at end of day | >= 0 | 400.00 |
| StockReceived | DECIMAL(10,2) | Stock received during day | >= 0 | 0.00, 100.00 |
| StockSold | DECIMAL(10,2) | Stock sold during day | >= 0 | 100.00 |
| StockAdjustments | DECIMAL(10,2) | Inventory adjustments | Can be negative | 0.00, -5.00 |
| InventoryValue | DECIMAL(12,2) | Total inventory value | Calculated field | 12800.00 |
| UnitCost | DECIMAL(10,2) | Cost per unit | Positive number | 32.00 |

## Business Rules and Constraints

### Data Integrity Rules

1. **Referential Integrity**
   - All foreign keys must reference valid primary keys
   - Cascade rules defined for deletions and updates

2. **Data Validation**
   - Email addresses must follow valid format
   - Phone numbers must follow valid format
   - Dates must be valid and within reasonable ranges

3. **Business Logic**
   - LineTotal = QuantitySold × UnitPrice
   - GrossProfit = LineTotal - COGS
   - InventoryValue = ClosingStock × UnitCost
   - Fiscal year starts in July

### Data Quality Standards

1. **Completeness**
   - All required fields must be populated
   - No null values in primary and foreign keys

2. **Accuracy**
   - Financial calculations must balance
   - Inventory movements must reconcile
   - Customer and product information must be current

3. **Consistency**
   - Standardized naming conventions
   - Consistent data formats across tables
   - Uniform code values and descriptions

### Calculation Logic

#### Sales Metrics
```
Net Sales = LineTotal - DiscountAmount
Profit Margin = GrossProfit / LineTotal
Average Order Value = Total Sales / Count of Transactions
```

#### Inventory Metrics
```
Inventory Turnover = COGS / Average Inventory Value
Days Sales Outstanding = 365 / Inventory Turnover
Stock Coverage Days = Current Stock / Average Daily Sales
```

#### Customer Metrics
```
Customer Lifetime Value = Average Order Value × Purchase Frequency × Customer Lifespan
Retention Rate = Returning Customers / Total Customers from Previous Period
```

## Data Lineage and Sources

### Source Systems
- **Sales Data**: Order Management System (OMS)
- **Customer Data**: Customer Relationship Management (CRM)
- **Product Data**: Product Information Management (PIM)
- **Inventory Data**: Warehouse Management System (WMS)
- **Employee Data**: Human Resources Information System (HRIS)

### Data Processing Steps
1. **Extraction**: Data extracted from source systems via APIs or file exports
2. **Transformation**: Data cleansing, standardization, and business rule application
3. **Loading**: Data loaded into dimensional model with proper relationships
4. **Validation**: Data quality checks and reconciliation with source systems

### Update Frequency
- **Real-time**: Sales transactions (every 15 minutes)
- **Daily**: Inventory levels (overnight batch)
- **Weekly**: Customer and product master data
- **Monthly**: Employee and territory data

## Data Security and Privacy

### Access Controls
- Row-level security based on user roles
- Column-level security for sensitive information
- Audit logging for all data access

### Data Classification
- **Public**: Product categories, territory names
- **Internal**: Sales performance, inventory levels  
- **Confidential**: Customer details, pricing information
- **Restricted**: Employee compensation, customer financial data

### Compliance Requirements
- GDPR compliance for customer data
- SOX compliance for financial data
- Industry-specific veterinary regulations
- Company data governance policies

---

**Document Version**: 1.0  
**Last Updated**: September 10, 2025  
**Next Review**: December 10, 2025