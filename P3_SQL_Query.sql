-- create database
create database amazon_sales;
use amazon_sales;

-- create table
create table sales (
	id int primary key,
    order_date date,
    customer_name varchar(15),
    state varchar(20),
    category varchar(20),
    sub_category varchar(15),
    product_name varchar(150),
    sales float,
    quantity int,
    profit float);

-- -------------------------------------------------------------------------------------
-- Exploratory Data Analysis and Pre Processing
-- -------------------------------------------------------------------------------------
-- checkin total rows count
select count(*) from sales;

-- checking if there any missing values
select count(*) from sales
where id is null
	or order_date is null
    or customer_name is null
    or state is null
    or category is null
    or sub_category is null
    or product_name is null
    or sales is null
    or quantity is null
    or profit is null;

-- checking for duplicate entry
select *
from (
	select *,
		row_number() over(partition by id) as rn
    from sales) X
where rn > 1;

-- -------------------------------------------------------------------------------------
-- Feature Engineering 
-- -------------------------------------------------------------------------------------
-- creating a year column
alter table sales
add column year varchar(4);
update sales
set year = year(order_Date);

-- creating a month column
alter table sales
add column month varchar(15);
update sales
set month = date_format(order_date,'%b');

-- create a day_name column
alter table sales
add column day_name varchar(15);
update sales
set day_name = date_format(order_date,'%a');

-- -------------------------------------------------------------------------------------
-- Solving Business Problems 
-- -------------------------------------------------------------------------------------

-- Q.1 Find total sales for each category?
select category, round(sum(sales),2) as ttl_Sale
from sales
group by 1
order by 2 desc;

-- Q.2 Find out top 5 customers who made the highest profits?
select
	customer_name, sum(profit) as ttl_profit
from sales
group by 1
order by 2
limit 5;

-- Q.3 Find out average qty ordered per category 
select
	category, round(avg(quantity),2) as avg_qty_ordered
from sales
group by 1
order by 2 desc;

-- Q.4 Top 5 products that has generated highest revenue
select
	product_name, round(sum(sales),2) as ttl_Sale
from sales
group by 1
order by 2 desc
limit 5;

-- Q.5 Top 5 products whose revenue has decreased in comparison to previous year?
select
	product_name,
    round(sum(case when year= '2023' and sales is not null then sales end),2) as ttl_2023_Sale,
    round(sum(case when year= '2022' and sales is not null then sales end),2) as ttl_2022_Sale,
    round(sum(case when year= '2023' and sales is not null then sales end)/
    sum(case when year= '2022' and sales is not null then sales end),2) as decreased_ration
from sales
group by product_name
HAVING sum(case when year= '2023' and sales is not null then sales end) <
	  sum(case when year= '2022' and sales is not null then sales end)

order by 2 desc
limit 5;

-- Q.6 Highest profitable sub category ?
select
	sub_category,
    round(sum(profit),2) as ttl_profit
from sales
group by sub_category
order by 2 desc
limit 1;

-- Q.7 Find out states with highest total orders?
select
	state,
    count(*) as ttl_order_state_wise
from sales
group by 1
order by 2 desc;

-- Q.8 Determine the month with the highest number of orders.
select
	concat(month," - ",year) as mon_yyyy,
    count(*) as ttl_order_mon_wise
from sales
group by 1
order by 2 desc;

-- Q.9 Calculate the profit margin percentage for each sale (Profit divided by Sales).
select
	id as sale_id,
    round((profit/sales),2) as profit_margin
from sales
order by 2 desc;

-- 10 Calculate the percentage contribution of each sub-category to 
-- the total sales amount for the year 2023.
with sub_Cat_wise_revenue as (
	select
		sub_Category,
        round(sum(sales),2) as ttl_sub_cat_wise_2023_sale
	from sales
    where year = '2023'
    group by sub_category),
ttl_2023_sale as (
	select
		round(sum(sales),2) as ttl_2023_Sale
	from sales)
select
	sub_category,
    ttl_sub_cat_wise_2023_Sale,
    ttl_2023_sale,
    round(ttl_sub_cat_wise_2023_sale/ttl_2023_Sale*100,2) as revenue_per_2023
from sub_cat_wise_revenue scr
cross join ttl_2023_Sale t23s
Order by 4 desc;

-- 10 Calculate the percentage contribution of each sub-category to 
-- the total sales amount for the year 2023.
	WITH CTE AS (SELECT
			sub_category,
			SUM(sales) as revenue_per_category
		FROM sales
		WHERE year = '2023'
		GROUP BY 1)
SELECT	
	sub_category,
	round((revenue_per_category / total_sales * 100),2) as sub_cat_wise_revenue_per
FROM cte
CROSS JOIN
(SELECT SUM(sales) AS total_sales FROM sales WHERE year = '2023') AS cte1
order by 2 desc;
