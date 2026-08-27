/* ============================================================
   SALES PERFORMANCE DASHBOARD - COMPLETE SQL ANALYSIS
   ============================================================

   Project: Sales Performance Dashboard

   Tools Used:
   - Excel
   - MySQL
   - Power BI
   - DAX

   Dataset:
   Superstore Sales Dataset

   Analysis Covers:
   1. Data Exploration
   2. Data Quality Checks
   3. Overall KPIs
   4. Executive Sales Analysis
   5. Profitability & Discount Analysis
   6. Product & Regional Analysis
   7. Year-over-Year Growth
   8. Window Functions & Ranking

   ============================================================ */


/* ============================================================
   1. SELECT DATABASE
   ============================================================ */

USE superstore_sales_db;


/* ============================================================
   2. DATA EXPLORATION
   ============================================================ */

-- View sample records
SELECT *
FROM sales
LIMIT 10;


-- Check total records
SELECT COUNT(*) AS total_records
FROM sales;


-- Check table structure
DESCRIBE sales;


/* ============================================================
   3. DATA QUALITY CHECKS
   ============================================================ */

-- Check for duplicate Row IDs
SELECT
    `Row ID`,
    COUNT(*) AS duplicate_count
FROM sales
GROUP BY `Row ID`
HAVING COUNT(*) > 1;


-- Check for missing values
SELECT
    SUM(`Row ID` IS NULL) AS missing_row_id,
    SUM(`Order ID` IS NULL) AS missing_order_id,
    SUM(`Order Date` IS NULL) AS missing_order_date,
    SUM(`Ship Date` IS NULL) AS missing_ship_date,
    SUM(`Customer ID` IS NULL) AS missing_customer_id,
    SUM(`Customer Name` IS NULL) AS missing_customer_name,
    SUM(`Product ID` IS NULL) AS missing_product_id,
    SUM(`Product Name` IS NULL) AS missing_product_name,
    SUM(`Sales` IS NULL) AS missing_sales,
    SUM(`Quantity` IS NULL) AS missing_quantity,
    SUM(`Discount` IS NULL) AS missing_discount,
    SUM(`Profit` IS NULL) AS missing_profit
FROM sales;


/* ============================================================
   DASHBOARD 1: EXECUTIVE SALES OVERVIEW
   ============================================================ */


/* ============================================================
   4. OVERALL BUSINESS KPIs
   ============================================================ */

SELECT
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit,
    SUM(`Quantity`) AS total_quantity,
    COUNT(DISTINCT `Order ID`) AS total_orders,
    COUNT(DISTINCT `Customer ID`) AS total_customers,
    ROUND(
        SUM(`Profit`) / SUM(`Sales`) * 100,
        3
    ) AS overall_profit_margin
FROM sales;


/* ============================================================
   5. AVERAGE ORDER VALUE
   ============================================================ */

SELECT
    ROUND(
        SUM(`Sales`) / COUNT(DISTINCT `Order ID`),
        2
    ) AS average_order_value
FROM sales;


/* ============================================================
   6. SALES AND PROFIT BY REGION
   ============================================================ */

SELECT
    `Region`,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit
FROM sales
GROUP BY `Region`
ORDER BY total_sales DESC;


/* ============================================================
   7. SALES BY CATEGORY
   ============================================================ */

SELECT
    `Category`,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit,
    ROUND(
        SUM(`Profit`) / SUM(`Sales`) * 100,
        2
    ) AS profit_margin
FROM sales
GROUP BY `Category`
ORDER BY total_sales DESC;


/* ============================================================
   8. SALES BY CUSTOMER SEGMENT
   ============================================================ */

SELECT
    `Segment`,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit,
    COUNT(DISTINCT `Customer ID`) AS total_customers,
    ROUND(
        SUM(`Profit`) / SUM(`Sales`) * 100,
        2
    ) AS profit_margin
FROM sales
GROUP BY `Segment`
ORDER BY total_sales DESC;


/* ============================================================
   9. MONTHLY SALES AND PROFIT TREND
   ============================================================ */

SELECT
    `Order Month Number`,
    `Order Month`,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit
FROM sales
GROUP BY
    `Order Month Number`,
    `Order Month`
ORDER BY `Order Month Number`;


/* ============================================================
   10. TOP 10 PRODUCTS BY SALES
   ============================================================ */

SELECT
    `Product Name`,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit
FROM sales
GROUP BY `Product Name`
ORDER BY total_sales DESC
LIMIT 10;


/* ============================================================
   11. PROFIT BY REGION
   ============================================================ */

SELECT
    `Region`,
    ROUND(SUM(`Profit`), 2) AS total_profit
FROM sales
GROUP BY `Region`
ORDER BY total_profit DESC;


/* ============================================================
   12. YEARLY SALES PERFORMANCE
   ============================================================ */

SELECT
    `Order Year`,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit,
    ROUND(
        SUM(`Profit`) / SUM(`Sales`) * 100,
        2
    ) AS profit_margin
FROM sales
GROUP BY `Order Year`
ORDER BY `Order Year`;


/* ============================================================
   DASHBOARD 2: PROFITABILITY & DISCOUNT ANALYSIS
   ============================================================ */


/* ============================================================
   13. OVERALL PROFITABILITY KPIs
   ============================================================ */

SELECT
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit,
    ROUND(
        SUM(`Profit`) / SUM(`Sales`) * 100,
        3
    ) AS overall_profit_margin
FROM sales;


/* ============================================================
   14. LOSS-MAKING PRODUCT COUNT
   ============================================================ */

SELECT
    COUNT(*) AS loss_making_products
FROM (
    SELECT
        `Product Name`
    FROM sales
    GROUP BY `Product Name`
    HAVING SUM(`Profit`) < 0
) AS loss_products;


/* ============================================================
   15. DISCOUNT VS PROFITABILITY
   ============================================================ */

SELECT
    `Discount`,
    COUNT(*) AS total_transactions,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit,
    ROUND(
        SUM(`Profit`) / SUM(`Sales`) * 100,
        2
    ) AS profit_margin
FROM sales
GROUP BY `Discount`
ORDER BY `Discount`;


/* ============================================================
   16. DISCOUNT LEVEL VS PROFITABILITY
   ============================================================ */

SELECT
    CASE
        WHEN `Discount` = 0 THEN 'No Discount'
        WHEN `Discount` > 0
             AND `Discount` <= 0.20 THEN 'Low Discount'
        WHEN `Discount` > 0.20
             AND `Discount` <= 0.40 THEN 'Medium Discount'
        WHEN `Discount` > 0.40 THEN 'High Discount'
    END AS discount_level,

    COUNT(*) AS total_transactions,

    ROUND(SUM(`Sales`), 2) AS total_sales,

    ROUND(SUM(`Profit`), 2) AS total_profit,

    ROUND(
        SUM(`Profit`) / SUM(`Sales`) * 100,
        2
    ) AS profit_margin

FROM sales

GROUP BY
    CASE
        WHEN `Discount` = 0 THEN 'No Discount'
        WHEN `Discount` > 0
             AND `Discount` <= 0.20 THEN 'Low Discount'
        WHEN `Discount` > 0.20
             AND `Discount` <= 0.40 THEN 'Medium Discount'
        WHEN `Discount` > 0.40 THEN 'High Discount'
    END

ORDER BY
    CASE discount_level
        WHEN 'No Discount' THEN 1
        WHEN 'Low Discount' THEN 2
        WHEN 'Medium Discount' THEN 3
        WHEN 'High Discount' THEN 4
    END;


/* ============================================================
   17. PROFIT BY SUB-CATEGORY
   ============================================================ */

SELECT
    `Sub-Category`,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit,
    ROUND(
        SUM(`Profit`) / SUM(`Sales`) * 100,
        2
    ) AS profit_margin
FROM sales
GROUP BY `Sub-Category`
ORDER BY total_profit DESC;


/* ============================================================
   18. PROFITABLE VS LOSS-MAKING SUB-CATEGORIES
   ============================================================ */

SELECT
    `Sub-Category`,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit,
    ROUND(
        SUM(`Profit`) / SUM(`Sales`) * 100,
        2
    ) AS profit_margin,

    CASE
        WHEN SUM(`Profit`) < 0 THEN 'Loss-Making'
        ELSE 'Profitable'
    END AS profitability_status

FROM sales
GROUP BY `Sub-Category`
ORDER BY total_profit ASC;


/* ============================================================
   19. LOSS-MAKING SUB-CATEGORIES ONLY
   ============================================================ */

SELECT
    `Sub-Category`,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit,
    ROUND(
        SUM(`Profit`) / SUM(`Sales`) * 100,
        2
    ) AS profit_margin
FROM sales
GROUP BY `Sub-Category`
HAVING SUM(`Profit`) < 0
ORDER BY total_profit ASC;


/* ============================================================
   20. TOP LOSS-MAKING PRODUCTS
   ============================================================ */

SELECT
    `Product Name`,
    `Category`,
    `Sub-Category`,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit,
    ROUND(AVG(`Discount`) * 100, 2) AS average_discount_percentage,
    'Loss-Making' AS profitability_status

FROM sales

GROUP BY
    `Product Name`,
    `Category`,
    `Sub-Category`

HAVING SUM(`Profit`) < 0

ORDER BY total_profit ASC;


/* ============================================================
   21. PROFIT MARGIN BY CATEGORY
   ============================================================ */

SELECT
    `Category`,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit,
    ROUND(
        SUM(`Profit`) / SUM(`Sales`) * 100,
        2
    ) AS profit_margin
FROM sales
GROUP BY `Category`
ORDER BY profit_margin DESC;


/* ============================================================
   22. REGION PROFIT MARGIN
   ============================================================ */

SELECT
    `Region`,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit,
    ROUND(
        SUM(`Profit`) / SUM(`Sales`) * 100,
        2
    ) AS profit_margin
FROM sales
GROUP BY `Region`
ORDER BY profit_margin DESC;


/* ============================================================
   DASHBOARD 3: PRODUCT & REGIONAL ANALYSIS
   ============================================================ */

/* ============================================================
   23. REGIONAL PERFORMANCE SCORECARD 
   ============================================================ */
WITH regional_performance AS (
    SELECT
        `Region`,
        SUM(`Sales`) AS total_sales,
        SUM(`Profit`) AS total_profit,
        SUM(`Profit`) / SUM(`Sales`) * 100 AS profit_margin,
        SUM(`Sales`) /
        (SELECT SUM(`Sales`) FROM sales) * 100 AS sales_margin_percentage
    FROM sales
    GROUP BY `Region`
)
SELECT
    `Region`,
    ROUND(total_sales, 2) AS total_sales,
    ROUND(sales_margin_percentage, 2) AS sales_margin_percentage,
    ROUND(total_profit, 2) AS total_profit,
    ROUND(profit_margin, 2) AS profit_margin,
    RANK() OVER (
        ORDER BY total_profit DESC
    ) AS regional_profit_rank,
    RANK() OVER (
        ORDER BY total_sales DESC
    ) AS regional_sales_rank
FROM regional_performance
ORDER BY regional_sales_rank;

/* ============================================================
   24. TOP 3 PRODUCTS BY PROFIT IN EACH REGION
   ============================================================ */
WITH product_profit AS (
    SELECT
        `Region`,
        `Product Name`,
        SUM(`Sales`) AS total_sales,
        SUM(`Profit`) AS total_profit
    FROM sales
    GROUP BY `Region`, `Product Name`
),
ranked_products AS (
    SELECT
        `Region`,
        `Product Name`,
        total_sales,
        total_profit,
        RANK() OVER (
            PARTITION BY `Region`
            ORDER BY total_profit DESC
        ) AS product_rank
    FROM product_profit
)
SELECT `Region`, `Product Name`,
       ROUND(total_sales, 2) AS total_sales,
       ROUND(total_profit, 2) AS total_profit,
       product_rank
FROM ranked_products
WHERE product_rank <= 3
ORDER BY `Region`, product_rank;


/* ============================================================
   25. TOP 3 PRODUCTS BY SALES IN EACH CATEGORY
   ============================================================ */
WITH product_sales AS (
    SELECT `Category`, `Product Name`, SUM(`Sales`) AS total_sales
    FROM sales
    GROUP BY `Category`, `Product Name`
),
ranked_products AS (
    SELECT `Category`, `Product Name`, total_sales,
           RANK() OVER (
               PARTITION BY `Category`
               ORDER BY total_sales DESC
           ) AS product_rank
    FROM product_sales
)
SELECT `Category`, `Product Name`,
       ROUND(total_sales, 2) AS total_sales,
       product_rank
FROM ranked_products
WHERE product_rank <= 3
ORDER BY `Category`, product_rank;


/* ============================================================
   26. LOSS-MAKING PRODUCTS
   ============================================================ */
SELECT
    `Product Name`, `Category`, `Sub-Category`,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit,
    ROUND(AVG(`Discount`) * 100, 2) AS average_discount_percentage,
    'Loss-Making' AS profitability_status
FROM sales
GROUP BY `Product Name`, `Category`, `Sub-Category`
HAVING SUM(`Profit`) < 0
ORDER BY total_profit ASC;


/* ============================================================
   27. REGION × CATEGORY PERFORMANCE
   ============================================================ */
SELECT
    `Region`, `Category`,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit,
    ROUND(SUM(`Profit`) / SUM(`Sales`) * 100, 2) AS profit_margin
FROM sales
GROUP BY `Region`, `Category`
ORDER BY `Region`, total_sales DESC;
/* ============================================================
   END OF SQL ANALYSIS
   ============================================================

   Key SQL Skills Demonstrated:

   - SELECT
   - WHERE
   - GROUP BY
   - HAVING
   - ORDER BY
   - Aggregate Functions
   - COUNT DISTINCT
   - CASE Statements
   - Subqueries
   - Common Table Expressions (CTEs)
   - Window Functions
   - RANK()
   - LAG()
   - Year-over-Year Growth Analysis
   - Discount Analysis
   - Profitability Analysis
   - Product Ranking
   - Regional Performance Analysis

   ============================================================ */