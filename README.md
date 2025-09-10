# Veterinary Trading Company - Sales Analysis Dashboard 📊

A comprehensive Power BI solution for analyzing sales performance, customer behavior, inventory management, and financial metrics in the veterinary trading industry.

![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=power-bi&logoColor=black)
![DAX](https://img.shields.io/badge/DAX-FF6F61?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Production%20Ready-green?style=for-the-badge)

## 🎯 Project Overview

This project demonstrates advanced Power BI development skills through a complete sales analysis solution for a veterinary trading company. It includes dimensional modeling, advanced DAX calculations, interactive dashboards, and comprehensive documentation.

### Key Features

- ⭐ **Star Schema Data Model** - Properly structured dimensional model with fact and dimension tables
- 📈 **Interactive Dashboards** - Multiple specialized dashboards for different user roles
- 🔄 **Advanced DAX Measures** - Complex calculations including time intelligence and statistical analysis  
- 📱 **Mobile Responsive** - Optimized for desktop, tablet, and mobile viewing
- 🎨 **Professional Design** - Consistent branding and intuitive user experience
- 📊 **Comprehensive KPIs** - 50+ business metrics and performance indicators

## 🏗️ Architecture & Data Model

### Star Schema Design
```
                   ┌─────────────┐
                   │   DimDate   │
                   └─────────────┘
                          │
    ┌─────────────┐       │       ┌─────────────┐
    │DimCustomer  │───────┼───────│DimProduct   │
    └─────────────┘       │       └─────────────┘
                          │
    ┌─────────────┐   ┌───▼───┐   ┌─────────────┐
    │DimSalesRep  │───│FactSales│───│DimSupplier │
    └─────────────┘   └───┬───┘   └─────────────┘
                          │
    ┌─────────────┐       │       ┌─────────────┐
    │DimTerritory │───────┘       │FactInventory│
    └─────────────┘               └─────────────┘
```

### Business Domains Covered
- 💰 **Sales Performance** - Revenue, growth, targets, and trends
- 👥 **Customer Analytics** - Segmentation, retention, and lifetime value
- 📦 **Inventory Management** - Stock levels, turnover, and optimization
- 🏢 **Territory Analysis** - Geographic performance and sales rep efficiency
- 📊 **Financial Metrics** - Profitability, margins, and cost analysis

## 📊 Dashboard Suite

### 1. Executive Summary Dashboard
High-level KPIs and trends for senior leadership
- Revenue and profit overview
- Year-over-year growth metrics
- Top performing products and territories
- Customer acquisition trends

### 2. Sales Performance Dashboard
Detailed sales analysis for sales managers
- Sales rep performance rankings
- Territory comparison and analysis
- Customer behavior patterns
- Product mix analysis

### 3. Customer Analytics Dashboard
Customer insights and segmentation
- Customer lifetime value analysis
- Retention and churn metrics
- Purchase behavior patterns
- Segmentation analysis

### 4. Inventory Management Dashboard
Stock optimization and supplier performance
- Current inventory levels
- Turnover ratios and efficiency metrics
- Reorder point analysis
- Supplier performance tracking

### 5. Financial Performance Dashboard
Profitability and cost analysis
- Gross margin analysis
- Cost breakdown by category
- Budget vs actual performance
- Variance analysis

## 🔧 Technical Implementation

### Data Model Specifications
- **Fact Tables**: FactSales, FactInventory
- **Dimension Tables**: DimDate, DimProduct, DimCustomer, DimSupplier, DimSalesRep, DimTerritory
- **Relationships**: Proper star schema with optimized cardinality
- **Data Types**: Appropriately configured for performance

### Advanced DAX Measures
```dax
// Time Intelligence Example
Sales YoY Growth = 
DIVIDE(
    [Total Sales] - CALCULATE([Total Sales], SAMEPERIODLASTYEAR(DimDate[Date])),
    CALCULATE([Total Sales], SAMEPERIODLASTYEAR(DimDate[Date])),
    0
)

// Customer Segmentation Example
Customer Segment = 
SWITCH(
    TRUE(),
    [Customer Lifetime Value] >= 50000, "High Value",
    [Customer Lifetime Value] >= 20000, "Medium Value",
    "Low Value"
)
```

### Performance Optimizations
- Aggregated measures for complex calculations
- Optimized relationships and data types
- Efficient DAX patterns
- Incremental refresh capabilities

## 📁 Project Structure

```
Vet-Trading-Sales-Analysis/
├── 📊 Data/
│   ├── DimDate.csv
│   ├── DimProduct.csv
│   ├── DimCustomer.csv
│   ├── DimSupplier.csv
│   ├── DimSalesRep.csv
│   ├── DimTerritory.csv
│   ├── FactSales.csv
│   └── FactInventory.csv
├── 📖 Documentation/
│   ├── Dimensional-Model-Design.md
│   ├── DAX-Measures.md
│   ├── Dashboard-Design-Specifications.md
│   ├── Power-BI-Model-Guide.md
│   └── Implementation-Guide.md
├── 🔧 SQL/
│   ├── Create-Dimension-Tables.sql
│   └── Create-Fact-Tables.sql
├── 📊 Power-BI-Files/
│   └── (Power BI files go here after implementation)
└── 📄 README.md
```

## 🚀 Quick Start Guide

### Prerequisites
- Power BI Desktop (latest version)
- Basic understanding of Power BI and DAX
- Sample data files from this repository

### Installation Steps

1. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/Vet-Trading-Sales-Analysis.git
   ```

2. **Open Power BI Desktop**
   - Create new blank report
   - Import CSV files from `/Data` folder

3. **Follow Implementation Guide**
   - See `/Documentation/Implementation-Guide.md` for detailed steps
   - Expected setup time: 2-3 hours

4. **Build Dashboards**
   - Use dashboard specifications in documentation
   - Apply DAX measures from measures library

## 📊 Interactive Dashboard Previews

### 🎯 Executive Summary Dashboard
![Executive Dashboard](./assets/executive-dashboard.html)

**[👀 View Executive Dashboard Preview](./assets/executive-dashboard.html)**

*Comprehensive KPI overview with revenue metrics, sales trends, territory performance, and key business indicators for senior leadership decision-making.*

### 💼 Sales Performance Dashboard
![Sales Performance Dashboard](./assets/sales-performance-dashboard.html)

**[👀 View Sales Performance Dashboard Preview](./assets/sales-performance-dashboard.html)**

*Detailed sales analytics featuring rep performance matrix, customer segmentation analysis, and product mix visualization for sales management.*

### 👥 Customer Analytics Dashboard
![Customer Analytics Dashboard](./assets/customer-analytics-dashboard.html)

**[👀 View Customer Analytics Dashboard Preview](./assets/customer-analytics-dashboard.html)**

*Comprehensive customer insights including segmentation analysis, retention metrics, purchase patterns, and churn risk assessment for marketing and customer success teams.*

> **💡 Interactive Features**: The HTML previews above demonstrate the visual design and layout of the actual Power BI dashboards. They include realistic data, professional styling, and responsive design that mirrors the final Power BI implementation.

## 🎯 Key Performance Indicators

### Sales Metrics
- **Total Revenue**: $1,247,592
- **YoY Growth**: +18.5%
- **Gross Profit Margin**: 31.2%
- **Average Order Value**: $2,847

### Customer Metrics  
- **Total Customers**: 847
- **Customer Retention Rate**: 73%
- **New Customer Acquisition**: +12%
- **Customer Lifetime Value**: $28,450

### Inventory Metrics
- **Inventory Turnover**: 8.2x annually
- **Stock-out Rate**: 2.1%
- **Inventory Value**: $487,233
- **Days Sales Outstanding**: 44 days

## 🔍 Advanced Features

### Time Intelligence
- Year-over-Year comparisons
- Month-to-Date calculations
- Fiscal year support (July-June)
- Rolling averages and trends

### Customer Analytics
- RFM segmentation
- Churn prediction indicators
- Lifetime value calculations
- Purchase pattern analysis

### Inventory Optimization
- Reorder point calculations
- ABC analysis classification
- Supplier performance metrics
- Seasonal demand patterns

## 🛠️ Technologies Used

- **Power BI Desktop** - Dashboard development and data modeling
- **DAX (Data Analysis Expressions)** - Advanced calculations and measures
- **Power Query** - Data transformation and cleaning
- **Star Schema** - Dimensional modeling approach
- **Git** - Version control and project management

## 🎨 Design Principles

### Visual Design
- Clean, professional aesthetic
- Consistent color scheme and branding
- Intuitive navigation and user experience
- Mobile-responsive layouts

### Data Visualization Best Practices
- Appropriate chart types for data stories
- Clear titles and legends
- Consistent formatting across visuals
- Interactive filtering and drill-down capabilities

## 📚 Learning Outcomes

This project demonstrates proficiency in:

1. **Data Modeling** - Star schema design and implementation
2. **DAX Programming** - Complex measures and calculated columns
3. **Dashboard Design** - User-centered design principles
4. **Business Intelligence** - Translating requirements into actionable insights
5. **Performance Optimization** - Efficient data models and calculations
6. **Documentation** - Comprehensive project documentation

## 🤝 Contributing

This is a showcase project, but feedback and suggestions are welcome!

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Contact & Support

**Project Maintainer**: flowsohere || Mohamed Eldawy
- 📧 Email: flowsphereba@gmail.com
- 💼 LinkedIn: https://www.linkedin.com/in/moeldawy/
- 🐛 Issues: [Create an Issue](https://github.com/yourusername/Vet-Trading-Sales-Analysis/issues)

## 🙏 Acknowledgments

- Power BI Community for inspiration and best practices
- SQLBI for DAX patterns and optimization techniques
- Microsoft Documentation for technical guidance
- Veterinary industry professionals for domain expertise

---

⭐ **Star this repository if you found it helpful!**

📊 **Perfect for**: Portfolio projects, Power BI learning, business intelligence demonstrations, interview preparation

🔍 **Keywords**: Power BI, DAX, Business Intelligence, Sales Analysis, Data Modeling, Dashboard Design, Veterinary Industry, KPI Reporting
