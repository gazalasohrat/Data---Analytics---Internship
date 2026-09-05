
DROP TABLE IF EXISTS superstore;

CREATE TABLE superstore (
order_id VARCHAR(50),
order_date VARCHAR(30),
ship_mode VARCHAR(50),
customer_id VARCHAR(50),
customer_name VARCHAR(150),
segment VARCHAR(50),
country VARCHAR(100),
city VARCHAR(100),
state VARCHAR(100),
region VARCHAR(50),
product_id VARCHAR(50),
category VARCHAR(50),
sub_category VARCHAR(50),
product_name VARCHAR(255),
sales NUMERIC(12,2),
quantity INTEGER,
discount NUMERIC(5,2),
profit NUMERIC(12,2)
);

SELECT * FROM superstore;

SELECT * FROM superstore LIMIT 10;

#Query 1 — Top 5 Spending Customers

SELECT
    customer_id,
    customer_name,
    SUM(sales) AS total_spending
FROM superstore
GROUP BY customer_id, customer_name
ORDER BY total_spending DESC
LIMIT 5;


#Query 2 — Total Sales by Region

SELECT
    region,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;


#Query 3 — Average Order Size

SELECT
    ROUND(SUM(sales) / COUNT(DISTINCT order_id), 2) AS average_order_size
FROM superstore;


#Query 4 — Sales and Profit by Category

SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;



#Query 5 — Top 5 Products by Sales

SELECT
    product_name,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 5;



#Query 6 — Top 5 Products by Profit

SELECT
    product_name,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 5;



#Query 7 — Sales by Customer Segment

SELECT
    segment,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY segment
ORDER BY total_sales DESC;



Query 8 — Loss-Making Products

SELECT
    product_name,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY total_profit ASC
LIMIT 10;


#Query 9 — Total Quantity by Category

SELECT
    category,
    SUM(quantity) AS total_quantity
FROM superstore
GROUP BY category
ORDER BY total_quantity DESC;



#Query 10 — Sales by State

SELECT
    state,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY state
ORDER BY total_sales DESC;



















