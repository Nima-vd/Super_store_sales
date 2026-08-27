# 📊 Superstore Sales Analysis | SQL + Power BI

> **End-to-end Data Analytics & Business Intelligence project** transforming 9,994 Superstore sales records into actionable business insights using **MySQL, SQL, Excel, and Power BI**.

[![SQL](https://img.shields.io/badge/SQL-MySQL-blue)](#)
[![Power BI](https://img.shields.io/badge/Power%20BI-DAX-yellow)](#)
[![Excel](https://img.shields.io/badge/Excel-Data%20Cleaning-green)](#)
[![Data Analytics](https://img.shields.io/badge/Data-Analytics-orange)](#)

## 🎯 Project Overview

This project analyses sales, profitability, regional performance, product performance, and discount impact to support **data-driven business decision-making**.

The analysis combines **SQL-based data analysis** with **interactive Power BI dashboards**, covering:

* Sales and profit performance
* Year-over-year sales trends
* Regional and category performance
* Discount vs. profitability analysis
* Loss-making products and sub-categories
* Product ranking using SQL window functions
* Interactive KPI-driven business dashboards

## 📈 Key Performance Indicators

| KPI                     |            Result |
| ----------------------- | ----------------: |
| 💰 Total Sales          | **$2,297,201.07** |
| 📊 Total Profit         |   **$286,397.79** |
| 📈 Profit Margin        |        **12.47%** |
| 📦 Quantity Sold        |        **37,873** |
| 🛒 Orders               |         **5,009** |
| 👥 Customers            |           **793** |
| 💵 Average Order Value  |       **$458.61** |
| 🔴 Loss-Making Products |           **301** |

## 🛠️ Tech Stack

**SQL / MySQL** — Data storage, aggregations, CTEs, subqueries, ranking and window functions
**Power BI** — KPI Development,, DAX, KPIs, interactive dashboards and business reporting
**Excel** — Data cleaning, validation and preparation
**GitHub** — Version control and project documentation

## 🔄 Project Workflow

```text
Kaggle Dataset
      ↓
Excel Data Cleaning & Validation
      ↓
MySQL Database
      ↓
SQL Business Analysis
(CTEs • Window Functions • Ranking)
      ↓
MySQL → Power BI via ODBC
      ↓
DAX Measures 
      ↓
3 Interactive Dashboards
      ↓
Business Insights & Recommendations
```

## 🗄️ SQL Analysis

The project demonstrates practical SQL skills including:

`SELECT` · `WHERE` · `GROUP BY` · `HAVING` · `CASE WHEN` · Aggregations · **CTEs** · **Subqueries** · **Window Functions**

Used `RANK()`, `DENSE_RANK()`, `ROW_NUMBER()`, `LAG()` and `PARTITION BY` to identify top-performing products and analyse trends.

**Example use case:** ranking the top 3 most profitable products within each region.

## 📊 Power BI Dashboards

### 1. Executive Sales Dashboard

* Sales, profit, quantity, orders, customers and margin KPIs
* Monthly sales trends
* Category, region and segment performance
* Top 10 products
* Interactive Year, Region and Category filters

### 2. Profitability & Discount Analysis

* Discount level vs. profit margin
* Category and sub-category profitability
* Loss-making product analysis
* Regional and category margin comparison

### 3. Product & Regional Performance

* Regional sales/profit ranking
* Top products by region and category
* Loss-making product analysis
* Region × Category performance matrix
* Interactive Year, Region, Category and Segment filters

## 🔎 Key Business Insights

* **West** is the strongest region with **$725K sales, $108K profit and 14.94% margin**.
* **Central** generates significant revenue but has the lowest regional margin at **7.92%**.
* **Technology** delivers the highest category margin at **17.40%**.
* **Furniture** generates $742K sales but only **2.49% profit margin**, highlighting a profitability issue.
* **Tables** are loss-making with approximately **-$17.7K profit**.
* Profitability drops sharply as discounts increase: **29.51% margin with no discount vs. -77.40% at high discount levels**.
* Sales increased strongly in **2016 (+29.47%)** and **2017 (+20.36%)**.
* **301 products** generate negative total profit and require further investigation.

## 💡 Business Recommendations

1. **Review discount policies** and introduce controls for high-discount transactions.
2. **Investigate Furniture pricing, sourcing and discount strategy** to improve margins.
3. **Audit loss-making products** for repricing, supplier negotiation or discontinuation.
4. **Improve Central region profitability** by identifying cost and discount drivers.
5. **Prioritise high-margin categories and products** for growth opportunities.

## 📂 Repository Structure

```text
Super_store_sales/
├── sales.sql
├── Superstore_sales_cleaned.csv
├── Sales.pbix
├── dashboard1.png
├── dashboard2.png
├── dashboard3.png
└── README.md
```

## 🚀 Skills Demonstrated

**SQL:** MySQL · CTEs · Window Functions · Ranking · Aggregations · Subqueries
**Power BI:** DAX · KPI Development · Interactive Dashboards · Slicers · Data Visualization ·  Data preparation 
**Analytics:** Data Cleaning · Business Analysis · KPI Analysis · Data Storytelling · Business Intelligence

## 🔮 Future Improvements

* Sales forecasting
* Customer segmentation / RFM analysis
* Customer Lifetime Value (CLV)
* Predictive profit modelling
* Shipping and delivery performance analysis
* Automated Power BI data refresh

## 👤 Author

**Nima Norbu Sherpa**
*Aspiring Data Analyst | SQL • Python • Excel • Power BI • Data Analytics*

🔗 [LinkedIn](https://www.linkedin.com/in/nima-norbu-sherpa-026819262/) · [GitHub](https://github.com/Nima-vd)

⭐ **If you found this project useful, consider starring the repository.**
