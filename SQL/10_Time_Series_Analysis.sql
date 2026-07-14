-- ============================================================
-- SECTION 8 : TIME SERIES ANALYSIS
-- Description:
-- This section analyzes sales trends over time, including
-- monthly, quarterly, and yearly revenue and order trends.
-- ============================================================

use amazon_ai_sales_analytics;

-- ------------------------------------------------------------
-- Query 1 : Monthly Revenue
-- Business Question: How much revenue was generated in each month?
-- ------------------------------------------------------------
select date_format(str_to_date(OrderDate,'%d-%m-%Y'),'%Y-%m') as Month,
sum(TotalAmount) as Total_Revenue
FROM sales_data
group by Month
order by Month;

-- ------------------------------------------------------------
-- Query 2 : Monthly Orders
-- Business Question: How many orders were placed each month?
-- ------------------------------------------------------------
select date_format(str_to_date(OrderDate,'%d-%m-%Y'),'%Y-%m') as Month,
count(OrderId) as Number_of_Orders
from sales_data
group by month
order by Month desc;

-- ------------------------------------------------------------
-- Query 3 : Yearly Revenue
-- Business Question: How much revenue was generated each year?
-- ------------------------------------------------------------
select year(str_to_date(OrderDate,'%d-%m-%Y')) as Year,
sum(TotalAmount) as Total_Revenue
from sales_data
group by Year
order by Year

-- ------------------------------------------------------------
-- Query 4 : Yearly Orders
-- Business Question: How many orders were placed each year?
-- ------------------------------------------------------------
select YEAR(str_to_date(OrderDate,'%d-%m-%Y')) as Year, count(OrderID) as Total_Orders
from sales_data
group by Year
order by Year;

-- ------------------------------------------------------------
-- Query 5 : Quarterly Revenue
-- Business Question:  How much revenue was generated in each quarter?
-- ------------------------------------------------------------
select Concat( YEAR(STR_TO_DATE(OrderDate,'%d-%m-%Y')),'-Q',QUARTER(STR_TO_DATE(OrderDate,'%d-%m-%Y'))) 
as Quarter, sum(TotalAmount) as Total_Revenue
from sales_data
group by Quarter
order by Quarter;