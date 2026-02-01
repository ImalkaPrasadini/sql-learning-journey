CREATE TABLE sales(
    order_id INT,
    order_date DATE,
    product_name VARCHAR(50),
    category VARCHAR(30),
    region VARCHAR(30),
    quantity INT,
    unit_price DECIMAL(10,2)
);

INSERT INTO sales VALUES
(1, '2024-01-01', 'Laptop', 'Electronics', 'Asia', 2, 800),
(2, '2024-01-02', 'Phone', 'Electronics', 'Europe', 5, 500),
(3, '2024-01-03', 'Chair', 'Furniture', 'Asia', 10, 50),
(4, '2024-01-04', 'Desk', 'Furniture', 'Europe', 3, 200),
(5, '2024-01-05', 'Headphones', 'Electronics', 'Asia', 8, 100),
(6, '2024-01-06', 'Monitor', 'Electronics', 'US', 4, 300),
(7, '2024-01-07', 'Tablet', 'Electronics', 'Asia', 6, 400),
(8, '2024-01-08', 'Sofa', 'Furniture', 'US', 1, 1200),
(9, '2024-01-09', 'Mouse', 'Electronics', 'Europe', 15, 40),
(10,'2024-01-10', 'Keyboard', 'Electronics', 'Asia', 12, 60);


/*Q1. Total sales per category*/
SELECT category, SUM(quantity * unit_price) 
FROM sales
GROUP BY category;

/*Q2. Total sales per region*/
SELECT region, SUM(quantity * unit_price) 
FROM sales
GROUP BY region;

/*Q3. Top-selling product by revenue*/
SELECT top 1 product_name, SUM(quantity * unit_price) AS REVENUE
FROM sales
GROUP BY product_name
order by REVENUE desc;

/*Q4. Products with sales above average revenue*/
select product_name 
from sales
group by product_name 
having SUM(quantity * unit_price)  > (SELECT avg(quantity * unit_price)
FROM sales);

/*Q5. Categories generating more than 5,000 in sales*/
SELECT category
FROM sales
group by category
having SUM(quantity * unit_price) > 5000; 