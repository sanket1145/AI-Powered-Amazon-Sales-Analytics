-- ============================================================
-- SECTION 4 : CUSTOMER ANALYSIS
-- Description:
-- This section analyzes customer purchasing behavior,
-- spending patterns, repeat purchases, and customer
-- contribution to business revenue.
-- ============================================================
use amazon_ai_sales_analytics;

-- ------------------------------------------------------------
-- Query 1 : Top 10 Customers by Revenue
-- Business Question: Which customers have generated the highest total revenue?
-- ------------------------------------------------------------
select CustomerID, CustomerName, SUM(TotalAmount) AS Total_Revenue
from sales_data
group by CustomerID, CustomerName
order by  Total_Revenue desc limit 10;

-- ------------------------------------------------------------
-- Query 2 : Top 10 Customers by Number of Orders
-- Business Question: Which customers have placed the highest number of orders?
-- ------------------------------------------------------------
select CustomerId,CustomerName, count(OrderId) as Number_Of_Orders
from sales_data
group by CustomerId,CustomerName 
order by Number_Of_Orders desc limit 10;

-- ------------------------------------------------------------
-- Query 3 : Average Customer Spending
-- Business Question:  What is the average amount spent by each customer?
-- ------------------------------------------------------------
select CustomerID, CustomerName,
    round(avg(TotalAmount), 2) as Average_Customer_Spending
from sales_data
group by  CustomerID, CustomerName
order by Average_Customer_Spending desc;

-- ------------------------------------------------------------
-- Query 4 : Customers with Repeat Purchases
-- Business Question: Which customers have placed more than one order?
-- ------------------------------------------------------------
select CustomerId,CustomerName,count(OrderId) as Number_Of_Orders
from sales_data
group by CustomerId,CustomerName
having count(OrderId) >1
order by Number_Of_Orders desc;

-- ------------------------------------------------------------
-- Query 5 : One-Time Customers
-- Business Question: Which customers have placed only one order?
-- ------------------------------------------------------------
select CustomerId,CustomerName,count(OrderId) as Number_Of_Orders
from sales_data
group by CustomerId,CustomerName
having count(OrderId)=1
order by CustomerId;

-- ------------------------------------------------------------
-- Query 6 : Customer Distribution by Country
-- Business Question: How many unique customers belong to each country?
-- ------------------------------------------------------------
select Country,count(distinct CustomerID) as Total_Customers
from sales_data
group by Country
order by Total_Customers desc;
