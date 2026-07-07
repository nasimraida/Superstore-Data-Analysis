-- ========================
-- Superstore Data Analysis
-- =========================

USE superstore_project;

-- Basic Metrics
SELECT *
FROM superstore
LIMIT 10;

SELECT COUNT(*) AS Total_Orders
FROM superstore;

DESCRIBE superstore;


-- Business Metrics
-- Total Revenue
SELECT
    ROUND(SUM(Sales),2) AS Total_Revenue
FROM superstore;

-- Total Profit
SELECT
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore;

-- Profit Margin
SELECT
    ROUND((SUM(Profit)/SUM(Sales))*100,2) AS Profit_Margin_Percent
FROM superstore;


-- Business Insights
-- Top 10 Products by Revenue
SELECT
    `Product Name`,
    ROUND(SUM(Sales),2) AS Revenue
FROM superstore
GROUP BY `Product Name`
ORDER BY Revenue DESC
LIMIT 10;

-- States in Order by Revenue
SELECT
    State,ROUND(SUM(Sales),2) AS Revenue
FROM superstore
GROUP BY State
ORDER BY Revenue DESC;

-- Top 10 States by Revenue
SELECT
    State,
    ROUND(SUM(Sales),2) AS Revenue
FROM superstore
GROUP BY State
ORDER BY Revenue DESC
LIMIT 10;

-- Top 10 Customers by Sales
SELECT
    `Customer Name`, ROUND(SUM(Sales),2) as Sales
FROM superstore
GROUP BY `Customer Name`
ORDER BY Sales DESC
LIMIT 10;

-- Sales by Segment
SELECT
    Segment, ROUND(SUM(Sales),2) AS Sales
FROM superstore
GROUP BY Segment
ORDER BY Sales DESC;

-- Products with High Sales but Low Profit
SELECT
    `Product Name`,
    ROUND(SUM(Sales),2) AS Revenue,
    ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY `Product Name`
HAVING Revenue > 10000
ORDER BY Profit ASC
LIMIT 20;


-- Category Analysis
-- Revenue by Category
SELECT
    Category, ROUND(SUM(Sales),2) AS Revenue
FROM superstore
GROUP BY Category
ORDER BY Revenue DESC;

-- Profit by Category
SELECT
    Category, ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY Category
ORDER BY Profit DESC;

