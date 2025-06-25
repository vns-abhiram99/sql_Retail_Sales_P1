--SQL Retail Sales Analysis
CREATE DATABASE retail_sales_db;

--Create Table
CREATE TABLE retail_sales_tb(
                transactions_id	INT PRIMARY KEY,
                sale_date DATE,
                sale_time TIME,	
                customer_id	INT,
                gender	VARCHAR(15),
                age	INT,
                category VARCHAR(20),	
                quantiy	INT,
                price_per_unit FLOAT,	
                cogs	FLOAT,
                total_sale FLOAT
)
SELECT * from retail_sales_tb;
SELECT count(*) from retail_sales_tb;

SELECT * FROM retail_sales_tb where
       transactions_id is null
	   or
	   sale_date is null 
	   or
	   sale_time is null
	   or
	   customer_id is null
	   or 
	   gender is null 
	   or
	   age is null
	   or
	   category is null
	   or
	   quantiy is null
	   or
	   cogs is null
	   or
	   total_sale is null

DELETE FROM retail_sales_tb where 
transactions_id is null 
or
sale_date is null
or sale_time is null
or
customer_id is null
or
gender is null
or
age is null
or
category is null
or
quantiy is null 
or
cogs is null
or
total_sale is null

--How many sales we had
select count(*) as total_sale from retail_sales_tb;

--How many unique customers we have
select count( distinct customer_id) as total_sale from retail_sales_tb;

--How many unique categories we have
select count(distinct category) as total_sale from retail_sales_tb;

select distinct category from retail_sales_tb;

--Data Analysis-Business Key problems and answers

--SQL query to retrieve all columns for sales made on '2022-11-05'
select * from retail_sales_tb 
where 
sale_date='2022-11-05';

--SQL query to retrieve all the transactions where the category is 'clothing' and the quantity sold is more than 10 in the month of Nov-2022
select category 
from retail_sales_tb
where category='Clothing'
and TO_CHAR(sale_date,'YYYY-MM')='2022-11'
AND QUANTIY>=4;

--SQL query to calculate the total sales for each category
select category,
sum(total_sale) as net_sale
from retail_sales_tb
group by 1;

select category, sum(total_sale) as net_sale,
count(*) as total_orders
from retail_sales_tb
group by 1;

--SQL query to find the average age of the customers who purchased items from 'beauty' category
select round(avg(age),2) from retail_sales_tb
where category='Beauty';

--SQL query to find all the transactions where the total_sale is greater than 1000
select * from retail_sales_tb where total_sale>1000;

--SQL query to find the total number of transactions made by each gender in each category.
select category,
       gender,
	   count(*) as total_trans
	   from retail_sales_tb
	   group by
	   category, gender
	   order by 1;
	   
--SQL query to calculate the average sale for each month. Find out the best selling month in each year.
select year, month from
(select extract(year from sale_date) as year,
       extract(month from sale_date) as month,
	   avg(total_sale) as total_sale,
	   rank() over(partition by extract(year from sale_date) order by avg(total_sale) desc)
from retail_sales_tb
group by 1,2) as t1 where rank=1;

--SQL query to find the top 5 customers based on the highest total sales
select customer_id, sum(total_sale) as total_sales
from retail_sales_tb
group by 1
order by 2 desc
limit 5

--SQL query to find the number of unique customers who purchased items from each category.
select category,
count(distinct customer_id) as unique_cs
from retail_sales_tb
group by category;

--SQL query to create each shift and number of orders(example morning<=12 and afternoon between 12 and 17 and evening >17)
select 
case 
when extract(hour from sale_time) <12 then 'Morning'
when extract(hour from sale_time) between 12 and 17 then 'Afternoon' 
else 'Evening'
end as shift
from retail_sales_tb;

--End of the project.























	   






























































































