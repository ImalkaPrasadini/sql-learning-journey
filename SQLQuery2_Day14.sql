select * 
from [dbo].[train]

--drop table [dbo].[train]

-- tp update sales and profit column with random values
UPDATE [dbo].[train]
SET Sales = FLOOR(RAND(CHECKSUM(NEWID())) * 100) + 1;

UPDATE [dbo].[train]
SET Profit = FLOOR(RAND(CHECKSUM(NEWID())) * 100) + 1;

--1. Total Sales 

select sum(Sales), sum(profit)
from train;

--2. Sales by Region

select Region, SUM(Sales) as SalesByRegion
from train
group by Region
order by SalesByRegion ASC

--3. Top 5 Best Selling Products
SELECT TOP 5 Product_ID, SUM(Sales) as SalesPerProdcut 
from train
GROUP BY Product_ID
ORDER BY SalesPerProdcut DESC;

--4. Most Profitable Category
select TOP 1 Category, sum(Profit) as ProfitTotal
from train
group by Category
order by sum(Profit) DESC

--5. Monthly Sales Trend
SELECT DATETRUNC(MONTH, Order_Date) as monthReleated, SUM(Sales) as salesSum
from train
group by DATETRUNC(MONTH, Order_Date)
order by monthReleated

--6. Running Total of Sales (Window Function ?)
SELECT Product_ID, sum(sales) over (
PARTITION BY Product_ID
) as Running_Sales
from train

--7. Top Customer by Spending
select top 1 customer_Name, sum(sales) as salesSum
from train
group by customer_Name
order by salesSum

--8. Previous Day Sales (LAG)

--Compare today vs yesterday.

select Sales,LAG(sum(Sales)) over (order by order_Date) as PreviousDay
from train
Group by order_Date,Sales
order by order_Date

--9. Sales Change vs Previous Day

select Sales,
(Sales -
LAG(sum(Sales)) over (order by order_Date)) as PreviousDayCompaire
from train
Group by order_Date,Sales
order by order_Date

--10.Next Order Date per Customer (LEAD)

select Sales,
LEAD(Sales) over (
PARTITION BY order_date
order by order_date
)
as nxt_orderdate
from train
