USE superstore_db;

-- Q1: Overall performance KPIs
SELECT 
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_pct,
    COUNT(DISTINCT order_id) AS total_orders
FROM order_items;

-- Q2: Sales and profit performance by year
SELECT 
    YEAR(o.order_date) AS order_year,
    ROUND(SUM(oi.sales), 2) AS total_sales,
    ROUND(SUM(oi.profit), 2) AS total_profit,
    ROUND((SUM(oi.profit) / SUM(oi.sales)) * 100, 2) AS profit_margin_pct
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY YEAR(o.order_date)
ORDER BY order_year;

-- Q3: Category profitability (identifies margin drag)
SELECT 
    p.category,
    ROUND(SUM(oi.sales), 2) AS total_sales,
    ROUND(SUM(oi.profit), 2) AS total_profit,
    ROUND((SUM(oi.profit) / SUM(oi.sales)) * 100, 2) AS profit_margin_pct
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY total_profit DESC;

-- Q4: Regional performance breakdown
SELECT 
    o.region,
    ROUND(SUM(oi.sales), 2) AS total_sales,
    ROUND(SUM(oi.profit), 2) AS total_profit,
    ROUND((SUM(oi.profit) / SUM(oi.sales)) * 100, 2) AS profit_margin_pct
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.region
ORDER BY total_sales DESC;

-- Q5: Top 10 customers by revenue
SELECT 
    c.customer_id,
    c.customer_name,
    c.segment,
    ROUND(SUM(oi.sales), 2) AS total_revenue,
    COUNT(DISTINCT oi.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name, c.segment
ORDER BY total_revenue DESC
LIMIT 10;

-- Q6: Discount bracket impact on profit margin
SELECT 
    CASE 
        WHEN discount = 0 THEN '0% (No Discount)'
        WHEN discount <= 0.2 THEN '1% - 20%'
        WHEN discount <= 0.5 THEN '21% - 50%'
        ELSE 'Over 50%'
    END AS discount_tier,
    COUNT(*) AS item_count,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_pct
FROM order_items
GROUP BY discount_tier
ORDER BY profit_margin_pct DESC;

-- Q7: Monthly sales and profit trend
SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS order_month,
    ROUND(SUM(oi.sales), 2) AS monthly_sales,
    ROUND(SUM(oi.profit), 2) AS monthly_profit
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY order_month;

-- Q8: Worst-performing sub-categories by net profit
-- Q8: Worst-performing sub-categories by net profit
SELECT 
    p.category,
    p.sub_category,
    ROUND(SUM(oi.sales), 2) AS total_sales,
    ROUND(SUM(oi.profit), 2) AS total_profit
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.category, p.sub_category
ORDER BY total_profit ASC
LIMIT 5;