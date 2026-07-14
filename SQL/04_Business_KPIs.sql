-- ============================================================
-- SECTION 2 : BUSINESS KEY PERFORMANCE INDICATORS (KPIs)
-- Description:
-- This section calculates the core business metrics used by
-- management to evaluate overall sales performance.
-- ============================================================
USE amazon_ai_sales_analytics;
-- ------------------------------------------------------------
-- Query 1 : Total Revenue
-- Business Question: What is the total revenue generated from all customer orders?
-- ------------------------------------------------------------
SELECT
    SUM(TotalAmount) AS Total_Revenue
FROM sales_data;

-- ------------------------------------------------------------
-- Query 2 : Total Orders
-- Business Question: How many customer orders are present in the dataset?
-- ------------------------------------------------------------
select count(OrderId) as Total_Orders
from sales_data;

-- ------------------------------------------------------------
-- Query 3 : Total Customers
-- Business Question: How many unique customers have placed orders?
-- ------------------------------------------------------------
select count(distinct(CustomerId)) as Total_Customers
from sales_data;

-- ------------------------------------------------------------
-- Query 4 : Total Quantity Sold
-- Business Question: How many product units have been sold across all orders?
-- ------------------------------------------------------------
SELECT Category,
       SUM(Quantity) AS Total_Units_Sold
FROM sales_data
GROUP BY Category;

-- ------------------------------------------------------------
-- Query 5 : Average Order Value (AOV)
-- Business Question: What is the average value of a customer order?
-- ------------------------------------------------------------
SELECT
    AVG(TotalAmount) AS Average_Order_Value
FROM sales_data;

-- ------------------------------------------------------------
-- Query 6 : Average Discount
-- Business Question: What is the average discount provided across all orders?
-- ------------------------------------------------------------
select avg(Discount) as Average_Discount 
from sales_data;

-- ------------------------------------------------------------
-- Query 7 : Average Shipping Cost
-- Business Question: What is the average shipping cost charged per order?
-- ------------------------------------------------------------\
select avg(ShippingCost) as Average_Shipping_Cost
from sales_data;

-- ------------------------------------------------------------
-- Query 8 : Average Tax
-- Business Question: What is the average tax charged per order?
-- ------------------------------------------------------------
select avg(Tax) as Average_Tax
from sales_data;
