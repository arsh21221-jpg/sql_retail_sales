-- SQL Retail Sales Analysis
create database retail_sales;
Show databases;
use retail_sales;
# create table
Create Table  retail_sales(
    transactions_id int Primary Key,
	sale_date Date,
	sale_time Time,
	customer_id Int,
	gender Varchar(15),
	age int,
	category varchar(15),
	quantity int,
	price_per_unit Float,
	cogs Float,
	total_sale Float
    );
    
    Select*from retail_sales
    Limit 10;
    Select count(*) from retail_sales;
    ##Data Cleaning
    select count(*)from retail_sales 
    where Transactions_id is null
    or sale_date is null
    or sale_time is null
    or customer_id is null
    or gender is null
    or age is null
    or category is null
    or quantiy is null
    or price_per_unit is null
    or cogs is null
     or total_sale is null;
Delete from retail_sales
  where Transactions_id is null
    or sale_date is null
    or sale_time is null
    or customer_id is null
    or gender is null
    or age is null
    or category is null
    or quantiy is null
    or price_per_unit is null
    or cogs is null
     or total_sale is null;
## Data Exploration
# How many sales we have?
select count(*)as total_sale from retail_sales;
# How many unique customers we have?
select count( Distinct customer_id)as total_sale from retail_sales;
#How many  unique category we have?
select count( Distinct category)as total_sale from retail_sales;
select distinct category from retail_sales;
## Data Analysis & Business Key Problems & Answers
## My Analysis & Finding
 # Q-1  Write a SQL query to retrieve all columns for sales made on '2022-11-05'
 # Q-2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the and  the quantity sold  is more than 4 in  the month of Nov-2022
 # Q-3 Write a SQL query to calculate the total sales(total_sale) for each category. 
 #Q-4  Write a SQL query to find the average age of customers who purchased items from 'Beauty'
 #Q-5 Write a SQL query to find all transactions  where the total_sale is greater than 1000'
 #Q-6 Write a SQL query to find the total number of transactions(transactions_id) made by  each gender in each  category.
 #Q-7 Write a SQL query to find the top 5 customers based on the highest total sales
 #Q-8 Write a SQL query to find the number of unique customers who purchase items from each category.
 
 
# Q-1  Write a SQL query to retrieve all columns for sales made on '2022-11-05'
select * from retail_sales where  sale_date='2022-11-05';

 # Q-2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and  the quantity sold  is more than 4 in  the month of Nov-2022
 select * from retail_sales where category='Clothing' and  DATE_FORMAT(sale_date,'%Y-%m')= '2022-11'
 and  quantity>=4;

# Q-3 Write a SQL query to calculate the total sales(total_sale) for each category.
select category, sum(total_sale) as net_sale, count(*) as total_orders from retail_sales group by 1;

 #Q-4  Write a SQL query to find the average age of customers who purchased items from 'Beauty'
 select round( avg(age),2) as avg_age from retail_sales where  category='Beauty';
 
 #Q-5 Write a SQL query to find all transactions  where the total_sale is greater than 1000'
 select * from retail_sales where total_sale> 1000;

 #Q-6 Write a SQL query to find the total number of transactions(transactions_id) made by  each gender in each  category.
select category,gender,count(*) as total_trans from retail_sales group by 1,2 order by 1;
    

 #Q-7 Write a SQL query to find the top 5 customers based on the highest total sales
select customer_id, sum(total_sale) as total_sale from retail_sales group by 1 order by 2 desc Limit 5;
    
 #Q-8 Write a SQL query to find the number of unique customers who purchase items from each category.
select category,count( distinct customer_id) as_unique__cust from retail_sales group by category;

# End of project











