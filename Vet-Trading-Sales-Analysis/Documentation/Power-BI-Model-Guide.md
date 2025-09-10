# Power BI Data Model Implementation Guide

## Data Model Architecture

### Star Schema Design
The data model follows a star schema with:
- **Central Fact Tables**: FactSales, FactInventory
- **Surrounding Dimension Tables**: DimDate, DimProduct, DimCustomer, DimSupplier, DimSalesRep, DimTerritory

### Relationships Configuration

#### Primary Relationships
1. **FactSales to Dimensions** (Many-to-One):
   - FactSales[DateKey] → DimDate[DateKey]
   - FactSales[ProductKey] → DimProduct[ProductKey]
   - FactSales[CustomerKey] → DimCustomer[CustomerKey]
   - FactSales[SalesRepKey] → DimSalesRep[SalesRepKey]
   - FactSales[SupplierKey] → DimSupplier[SupplierKey]
   - FactSales[TerritoryKey] → DimTerritory[TerritoryKey]

2. **FactInventory to Dimensions** (Many-to-One):
   - FactInventory[DateKey] → DimDate[DateKey]
   - FactInventory[ProductKey] → DimProduct[ProductKey]
   - FactInventory[SupplierKey] → DimSupplier[SupplierKey]

### Data Import Instructions

1. **Create New Power BI File**
   - Open Power BI Desktop
   - Create new blank report

2. **Import CSV Files**
   - Go to Home → Get Data → Text/CSV
   - Import files in this order:
     1. DimDate.csv
     2. DimProduct.csv
     3. DimCustomer.csv
     4. DimSupplier.csv
     5. DimSalesRep.csv
     6. DimTerritory.csv
     7. FactSales.csv
     8. FactInventory.csv

3. **Configure Data Types**
   - Ensure all Key columns are Whole Number
   - Set Date columns to Date type
   - Set Currency columns to Currency type
   - Set Percentage columns to Percentage type

4. **Create Relationships**
   - Go to Model view
   - Create relationships as specified above
   - Set cross filter direction to Single for all relationships
   - Mark DimDate as Date Table (Table Tools → Mark as Date Table)

### Calculated Columns

#### DimDate Calculated Columns
```DAX
// Fiscal Year (July-June)
FiscalYear = IF(MONTH(DimDate[Date]) >= 7, YEAR(DimDate[Date]) + 1, YEAR(DimDate[Date]))

// Fiscal Quarter
FiscalQuarter = 
SWITCH(
    TRUE(),
    MONTH(DimDate[Date]) >= 7 && MONTH(DimDate[Date]) <= 9, 1,
    MONTH(DimDate[Date]) >= 10 && MONTH(DimDate[Date]) <= 12, 2,
    MONTH(DimDate[Date]) >= 1 && MONTH(DimDate[Date]) <= 3, 3,
    4
)

// Month Year
MonthYear = FORMAT(DimDate[Date], "MMM YYYY")
```

#### FactSales Calculated Columns
```DAX
// Profit Margin
ProfitMargin = DIVIDE(FactSales[GrossProfit], FactSales[LineTotal], 0)

// Net Sales (after discount)
NetSales = FactSales[LineTotal] - FactSales[DiscountAmount]
```

## Quality Assurance Checklist

- [ ] All relationships created correctly
- [ ] Date table marked as Date Table
- [ ] Data types configured properly
- [ ] Calculated columns added
- [ ] Data preview looks correct
- [ ] No data loading errors