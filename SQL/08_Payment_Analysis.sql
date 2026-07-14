-- ============================================================
-- SECTION 6 : PAYMENT ANALYSIS
-- Description:
-- This section analyzes customer payment preferences,
-- payment-wise revenue contribution, and average order value
-- across different payment methods.
-- ============================================================

use amazon_ai_sales_analytics;

-- ------------------------------------------------------------
-- Query 1 : Revenue by Payment Method
-- Business Question: How much revenue has each payment method generated?
-- ------------------------------------------------------------
select PaymentMethod, sum(TotalAmount) as Total_Revenue
from sales_data
group by PaymentMethod
order by Total_Revenue desc;

-- ------------------------------------------------------------
-- Query 2 : Number of Orders by Payment Method
-- Business Question: How many orders were placed using each payment method?
-- ------------------------------------------------------------
select PaymentMethod,count(OrderId) as Total_Orders
from sales_data
group by PaymentMethod
order by Total_Orders desc;

-- ------------------------------------------------------------
-- Query 3 : Average Order Value by Payment Method
-- Business Question: What is the average order value for each payment method?
-- ------------------------------------------------------------
select PaymentMethod, round(AVG(TotalAmount), 2) as Average_Order_Value
from sales_data
group by PaymentMethod
order by Average_Order_Value desc;

-- ------------------------------------------------------------
-- Query 4 : Most Preferred Payment Method
-- Business Question: Which payment method is used most frequently by customers?
-- ------------------------------------------------------------
select PaymentMethod, count(OrderID) as Total_Orders
from sales_data
group by PaymentMethod
order by Total_Orders desc LIMIT 1;

-- ------------------------------------------------------------
-- Query 5 : Payment Method Distribution
-- Business Question: What percentage of total orders does each payment method represent?
-- ------------------------------------------------------------
select PaymentMethod, count(OrderID) as Total_Orders,
ROUND((COUNT(OrderID) * 100.0) / (select count(*) from sales_data),2) as Percentage_of_Orders
from sales_data
group by PaymentMethod
order by Percentage_of_Orders desc;