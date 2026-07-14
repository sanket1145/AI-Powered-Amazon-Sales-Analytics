-- ============================================================
-- SECTION 9 : ADVANCED SQL ANALYSIS
-- Description:
-- This section demonstrates advanced SQL concepts such as
-- Common Table Expressions (CTEs), Window Functions,
-- Ranking Functions, and Views for business analysis.
-- ============================================================

use amazon_ai_sales_analytics;

-- ------------------------------------------------------------
-- Query 1 : Top 5 Revenue Generating Products (CTE)
-- Business Question: Which are the top 5 products generating the highest revenue?
-- ------------------------------------------------------------
with product_revenue as
(
    select
        ProductName,
        sum(TotalAmount) as total_revenue
    from sales_data
    group by ProductName
)
select * from product_revenue
order by total_revenue desc limit 5;

-- ------------------------------------------------------------
-- Query 2 : Product Revenue Ranking
-- Business Question: Rank all products based on total revenue generated.
-- ------------------------------------------------------------
select
    ProductName,
    sum(TotalAmount) as total_revenue,
    rank() over(order by sum(TotalAmount) desc) as revenue_rank
from sales_data
group by ProductName;


-- ------------------------------------------------------------
-- Query 3 : Dense Ranking of Products
-- Business Question: Assign dense ranks to products based on total revenue.
-- ------------------------------------------------------------
select
ProductName,
    sum(TotalAmount) as total_revenue,
    dense_rank() over(order by sum(TotalAmount) desc) as dense_Product_rank
from sales_data
group by ProductName;

-- ------------------------------------------------------------
-- Query 4 : Row Number for Products
-- Business Question: Assign a unique row number to products ordered by revenue.
-- ------------------------------------------------------------
select
    ProductName,
    sum(TotalAmount) as total_revenue,
    row_number() over(order by sum(TotalAmount) desc) as row_num
from sales_data
group by ProductName;

-- ------------------------------------------------------------
-- Query 5 : Create Revenue Summary View
-- Business Question: Create a reusable view showing total revenue by category.
-- ------------------------------------------------------------
create view category_revenue as
select
    Category,
    sum(TotalAmount) as total_revenue
from sales_data
group by Category;

select * from category_revenue;

-- ------------------------------------------------------------
-- Query 6 : Top revenue generating product in each category
-- Business Question: Which product generates the highest revenue within each category?
-- ------------------------------------------------------------
with product_revenue as
(
    select
        Category,
        ProductName,
        sum(TotalAmount) as total_revenue,
        row_number() over(
            partition by Category
            order by sum(TotalAmount) desc
        ) as rn
    from sales_data
    group by Category, ProductName
)

select
    Category,
    ProductName,
    total_revenue
from product_revenue
where rn = 1
order by Category;