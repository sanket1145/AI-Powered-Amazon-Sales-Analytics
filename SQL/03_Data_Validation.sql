

-- ============================================================
-- SECTION 1 : DATA VALIDATION
-- ============================================================
-- ------------------------------------------------------------
-- Query 1 : Total Records
-- Business Question: Did all records get imported successfully?
-- Expected Output:
-- 100000
-- ------------------------------------------------------------
USE amazon_ai_sales_analytics;

SELECT COUNT(*) AS Total_Records
FROM sales_data;

-- ------------------------------------------------------------
-- Query 2A : Duplicate Order Summary
-- Business Question: How many duplicate Order IDs exist in the dataset?
-- Expected Output:
-- 0
-- ------------------------------------------------------------
SELECT COUNT(*) AS Duplicate_OrderIDs
FROM (
    SELECT OrderID
    FROM sales_data
    GROUP BY OrderID
    HAVING COUNT(*) > 1
) AS duplicates;
-- ------------------------------------------------------------
-- Query 3 : Missing Customer IDs
-- Business Question: Are any customer IDs missing?
-- ------------------------------------------------------------
SELECT COUNT(*) AS Missing_CustomerID
from sales_data
WHERE CustomerID IS NULL;

-- ------------------------------------------------------------
-- Query 4 : Dataset Date Range
-- Business Question: What is the earliest and latest order date available?
-- ------------------------------------------------------------
SELECT
    MIN(STR_TO_DATE(OrderDate, '%d-%m-%Y')) AS First_Order_Date,
    MAX(STR_TO_DATE(OrderDate, '%d-%m-%Y')) AS Last_Order_Date
FROM sales_data;

-- ------------------------------------------------------------
-- Query 5A : Total Product Categories Business Question:
-- How many unique product categories exist?
-- ------------------------------------------------------------
SELECT COUNT(DISTINCT Category) AS Total_Categories
FROM sales_data;

-- ------------------------------------------------------------
-- Query 5B : List All Product Categories
-- Business Question: Which product categories are available?
-- ------------------------------------------------------------
SELECT DISTINCT Category
FROM sales_data
ORDER BY Category;

-- ------------------------------------------------------------
-- Query 6 : Order Status Distribution
-- Business Question: How many orders belong to each order status?
-- ------------------------------------------------------------

SELECT
    OrderStatus,
    COUNT(*) AS Total_Orders
FROM sales_data
GROUP BY OrderStatus
ORDER BY Total_Orders DESC;

-- ------------------------------------------------------------
-- Query 7 : Payment Method Distribution
-- Business Question:
-- Which payment methods are used by customers, and how many
-- orders were placed using each payment method?
-- ------------------------------------------------------------

SELECT
    PaymentMethod,
    COUNT(*) AS Total_Orders
FROM sales_data
GROUP BY PaymentMethod
ORDER BY Total_Orders DESC;

-- ------------------------------------------------------------
-- Query 8 : Country Distribution
-- Business Question:
-- Which countries are represented in the dataset, and how many
-- orders were placed from each country?
-- ------------------------------------------------------------
SELECT
    Country,
    COUNT(*) AS Total_Orders
FROM sales_data
GROUP BY Country
ORDER BY Total_Orders DESC;
