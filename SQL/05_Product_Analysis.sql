-- ============================================================
-- SECTION 3 : PRODUCT ANALYSIS
-- Description:
-- This section analyzes product and category performance to
-- identify top-performing products, brands, and categories
-- based on revenue, sales quantity, and pricing.
-- ============================================================

use amazon_ai_sales_analytics;

-- ------------------------------------------------------------
-- Query 1 : Revenue by Category
-- Business Question: Which product categories generate the highest revenue?
-- ------------------------------------------------------------
select Category, sum(TotalAmount) as Total_Revenue 
from sales_data
group by Category 
order by Total_Revenue desc;

-- ------------------------------------------------------------
-- Query 2 : Revenue by Brand
-- Business Question: Which brands generate the highest revenue?
-- ------------------------------------------------------------
select Brand, sum(TotalAmount) as Total_Revenue 
from sales_data 
group by Brand 
order by Total_Revenue desc;

-- ------------------------------------------------------------
-- Query 3 : Top 10 Products by Revenue
-- Business Question: Which products generate the highest revenue?
-- ------------------------------------------------------------
select ProductName, sum(TotalAmount) as Total_Revenue 
from sales_data 
group by ProductName 
order by Total_Revenue desc limit 10;

-- ------------------------------------------------------------
-- Query 4 : Top 10 Products by Quantity Sold
-- Business Question: Which products have sold the highest number of units?
-- ------------------------------------------------------------
select ProductName , sum(Quantity) as Quantity_Sold
from sales_data
group  by ProductName
order by  Quantity_Sold desc limit 10;

-- ------------------------------------------------------------
-- Query 5 : Bottom 10 Products by Revenue
-- Business Question: Which products generate the lowest revenue?
-- ------------------------------------------------------------
select ProductName, sum(TotalAmount) as Total_Revenue
from sales_data
group by ProductName
order by Total_Revenue asc limit 10;

-- ------------------------------------------------------------
-- Query 6 : Average Product Price by Category
-- Business Question:What is the average unit price of products in each category?
-- ------------------------------------------------------------
select Category, round((avg(UnitPrice), 2)) as Average_Unit_Price
from sales_data
group by Category
order by Average_Unit_Price desc;

-- ------------------------------------------------------------
-- Query 7 : Highest Revenue Product
-- Business Question: Which product has generated the highest total revenue?
-- ------------------------------------------------------------
select ProductName,sum(TotalAmount) as Total_revenue
from sales_data
group by ProductName
order by Total_revenue desc limit 1;

-- ------------------------------------------------------------
-- Query 8 : Lowest Revenue Product
-- Business Question: Which product has generated the lowest total revenue?
-- ------------------------------------------------------------
select ProductName,sum(TotalAmount) as Total_revenue
from sales_data
group by ProductName
order by Total_revenue asc limit 1;

-- ------------------------------------------------------------
-- Query 9 : Average Revenue per Product Category
-- Business Question: What is the average revenue generated per order in each product category?
-- ------------------------------------------------------------
select Category,Round(avg(TotalAmount),2) as Average_Revenue
from sales_data
group by Category
order by Average_Revenue;

-- ------------------------------------------------------------
-- Query 10 : Average Revenue per Brand
-- Business Question: What is the average revenue generated per order for each brand?
-- ------------------------------------------------------------
select Brand,Round(avg(TotalAmount),2) as Average_Revenue
from sales_data
group by Brand
order by Average_Revenue;
