-- ============================================================
-- SECTION 5 : GEOGRAPHICAL ANALYSIS
-- Description:
-- This section analyzes sales performance across different
-- geographical locations such as countries, states, and cities
-- to identify high-performing markets and regional trends.
-- ============================================================

use amazon_ai_sales_analytics;

-- ------------------------------------------------------------
-- Query 1 : Revenue by Country
-- Business Question: How much revenue has each country generated?
-- ------------------------------------------------------------
select Country, sum(TotalAmount) as Total_Revenue
from sales_data
group by Country
order by Total_Revenue desc;

-- ------------------------------------------------------------
-- Query 2 : Revenue by State
-- Business Question: How much revenue has each state generated?
-- ------------------------------------------------------------
select State, sum(TotalAmount) as Total_Revenue
from sales_data 
group by State  
order by Total_Revenue desc;

-- ------------------------------------------------------------
-- Query 3 : Revenue by City
-- Business Question: How much revenue has each city generated?
-- ------------------------------------------------------------
select City, sum(TotalAmount) as Total_Revenue
from sales_data 
group by City  
order by Total_Revenue desc;

-- ------------------------------------------------------------
-- Query 4 : Top 10 Cities by Revenue
-- Business Question: Which cities have generated the highest total revenue?
-- ------------------------------------------------------------
select City, sum(TotalAmount) as Total_Revenue
from sales_data 
group by City  
order by Total_Revenue desc limit 10;

-- ------------------------------------------------------------
-- Query 5 : Average Revenue by Country
-- Business Question:What is the average revenue generated per order in each country?
-- ------------------------------------------------------------
select Country, round(avg(TotalAmount),2) as Average_Revenue
from sales_data
group by Country
order by Average_Revenue desc;

