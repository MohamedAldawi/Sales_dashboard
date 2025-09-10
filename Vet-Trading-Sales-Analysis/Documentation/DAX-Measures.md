# DAX Measures for Veterinary Trading Sales Analysis

## Sales Performance Measures

### Core Sales Metrics
```DAX
// Total Sales Revenue
Total Sales = SUM(FactSales[LineTotal])

// Total Quantity Sold
Total Quantity = SUM(FactSales[QuantitySold])

// Average Order Value
Average Order Value = DIVIDE([Total Sales], DISTINCTCOUNT(FactSales[TransactionID]), 0)

// Total Gross Profit
Total Gross Profit = SUM(FactSales[GrossProfit])

// Gross Profit Margin
Gross Profit Margin = DIVIDE([Total Gross Profit], [Total Sales], 0)

// Total Discount
Total Discount = SUM(FactSales[DiscountAmount])

// Discount Rate
Discount Rate = DIVIDE([Total Discount], [Total Sales], 0)
```

### Time Intelligence Measures
```DAX
// Sales Previous Year
Sales PY = CALCULATE([Total Sales], SAMEPERIODLASTYEAR(DimDate[Date]))

// Sales Year-over-Year Growth
Sales YoY Growth = DIVIDE([Total Sales] - [Sales PY], [Sales PY], 0)

// Sales Month-to-Date
Sales MTD = TOTALMTD([Total Sales], DimDate[Date])

// Sales Year-to-Date
Sales YTD = TOTALYTD([Total Sales], DimDate[Date])

// Sales Quarter-to-Date
Sales QTD = TOTALQTD([Total Sales], DimDate[Date])

// Sales Previous Month
Sales PM = CALCULATE([Total Sales], PREVIOUSMONTH(DimDate[Date]))

// Sales Month-over-Month Growth
Sales MoM Growth = DIVIDE([Total Sales] - [Sales PM], [Sales PM], 0)
```

### Customer Analysis Measures
```DAX
// Customer Count
Customer Count = DISTINCTCOUNT(FactSales[CustomerKey])

// New Customers
New Customers = 
CALCULATE(
    DISTINCTCOUNT(FactSales[CustomerKey]),
    FILTER(
        ALL(DimDate),
        DimDate[Date] = CALCULATE(MIN(FactSales[OrderDate]), ALL(DimDate))
    )
)

// Returning Customers
Returning Customers = [Customer Count] - [New Customers]

// Customer Retention Rate
Customer Retention Rate = DIVIDE([Returning Customers], [Customer Count], 0)

// Average Customer Value
Average Customer Value = DIVIDE([Total Sales], [Customer Count], 0)

// Top 10 Customers Sales
Top 10 Customers Sales = 
CALCULATE(
    [Total Sales],
    TOPN(10, VALUES(DimCustomer[CustomerName]), [Total Sales], DESC)
)
```

### Product Analysis Measures
```DAX
// Product Count
Product Count = DISTINCTCOUNT(FactSales[ProductKey])

// Average Price per Unit
Average Price per Unit = DIVIDE([Total Sales], [Total Quantity], 0)

// Best Selling Product
Best Selling Product = 
CALCULATE(
    MAX(DimProduct[ProductName]),
    TOPN(1, VALUES(DimProduct[ProductName]), [Total Quantity], DESC)
)

// Most Profitable Product
Most Profitable Product = 
CALCULATE(
    MAX(DimProduct[ProductName]),
    TOPN(1, VALUES(DimProduct[ProductName]), [Total Gross Profit], DESC)
)

// Product Performance Rank
Product Performance Rank = 
RANKX(
    ALL(DimProduct[ProductName]),
    [Total Sales],
    ,
    DESC
)
```

### Inventory Analysis Measures
```DAX
// Current Stock Level
Current Stock Level = 
CALCULATE(
    SUM(FactInventory[ClosingStock]),
    FILTER(
        ALL(DimDate),
        DimDate[Date] = MAX(DimDate[Date])
    )
)

// Average Inventory Value
Average Inventory Value = AVERAGE(FactInventory[InventoryValue])

// Inventory Turnover Ratio
Inventory Turnover Ratio = 
DIVIDE(
    SUM(FactSales[COGS]),
    [Average Inventory Value],
    0
)

// Days Sales Outstanding
Days Sales Outstanding = DIVIDE(365, [Inventory Turnover Ratio], 0)

// Stock Out Products
Stock Out Products = 
CALCULATE(
    DISTINCTCOUNT(FactInventory[ProductKey]),
    FILTER(FactInventory, FactInventory[ClosingStock] = 0)
)
```

### Territory & Sales Rep Performance
```DAX
// Sales by Territory
Sales by Territory = 
CALCULATE(
    [Total Sales],
    ALLEXCEPT(DimTerritory, DimTerritory[TerritoryName])
)

// Top Performing Sales Rep
Top Performing Sales Rep = 
CALCULATE(
    MAX(DimSalesRep[SalesRepName]),
    TOPN(1, VALUES(DimSalesRep[SalesRepName]), [Total Sales], DESC)
)

// Territory Performance Rank
Territory Performance Rank = 
RANKX(
    ALL(DimTerritory[TerritoryName]),
    [Total Sales],
    ,
    DESC
)

// Sales Rep Commission
Sales Rep Commission = 
SUMX(
    FactSales,
    FactSales[LineTotal] * RELATED(DimSalesRep[CommissionRate])
)

// Average Sales per Rep
Average Sales per Rep = 
DIVIDE(
    [Total Sales],
    DISTINCTCOUNT(FactSales[SalesRepKey]),
    0
)
```

### Advanced Analytics Measures
```DAX
// Pareto Analysis (80/20 Rule)
Pareto Customer Percentage = 
VAR CustomerSales = 
SUMMARIZE(
    FactSales,
    DimCustomer[CustomerName],
    "CustomerTotal", [Total Sales]
)
VAR TotalSales = [Total Sales]
VAR CumulativePercentage = 
DIVIDE(
    SUMX(
        FILTER(
            CustomerSales,
            [CustomerTotal] >= EARLIER([CustomerTotal])
        ),
        [CustomerTotal]
    ),
    TotalSales
)
RETURN
IF(CumulativePercentage <= 0.8, "Top 80%", "Bottom 20%")

// Seasonal Index
Seasonal Index = 
VAR CurrentMonthAvg = CALCULATE([Total Sales], VALUES(DimDate[Month]))
VAR YearlyAvg = CALCULATE([Total Sales], ALL(DimDate[Month]))
RETURN DIVIDE(CurrentMonthAvg, YearlyAvg, 0)

// Customer Lifetime Value (simplified)
Customer Lifetime Value = 
DIVIDE([Total Sales], [Customer Count], 0) * 12 * 3  // Assuming 3-year average lifespan
```

## KPI Targets and Thresholds

### Performance Indicators
```DAX
// Sales Target Achievement
Sales Target = 1000000  // Set your target
Sales Target Achievement = DIVIDE([Total Sales], [Sales Target], 0)

// Profit Margin Status
Profit Margin Status = 
SWITCH(
    TRUE(),
    [Gross Profit Margin] >= 0.30, "Excellent",
    [Gross Profit Margin] >= 0.20, "Good",
    [Gross Profit Margin] >= 0.10, "Fair",
    "Poor"
)

// Inventory Health Status
Inventory Health Status = 
SWITCH(
    TRUE(),
    [Inventory Turnover Ratio] >= 12, "Excellent",
    [Inventory Turnover Ratio] >= 8, "Good",
    [Inventory Turnover Ratio] >= 4, "Fair",
    "Poor"
)
```

## Usage Instructions

1. **Creating Measures in Power BI**:
   - Right-click on any table in Fields pane
   - Select "New Measure"
   - Copy and paste the DAX code
   - Press Enter to save

2. **Organizing Measures**:
   - Create a separate "Measures" table for better organization
   - Group related measures using display folders

3. **Testing Measures**:
   - Create simple visuals to test each measure
   - Verify calculations with sample data
   - Check for any error messages

4. **Performance Optimization**:
   - Use variables in complex measures
   - Avoid using ALL() unnecessarily
   - Test performance with larger datasets