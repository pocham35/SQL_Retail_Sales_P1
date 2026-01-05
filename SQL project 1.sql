-- SQL Retail sales analysis Project_1 --

Create DataBase SQL_Project_2;
use SQL_Project_2;
-- Create TABLE--
Drop Table If Exists retail_sales;
Create Table retail_sales 
		(
             transactions_id Int PRIMARY KEY,	
             sale_date	Date,
             sale_time	Time,
             customer_id	Int,
             gender	Varchar(15),
             age	Int,
             category	Varchar (25),
             quantiy	Int,
             price_per_unit	Float,
             cogs	Float,
             total_sale Float
		      
              );

Select * from retail_sales;
-- DATA CLEANING--
select * from retail_sales
where 
	transactions_id IS NULL
    OR
    sale_date IS NULL
    OR
    sale_time IS NULL
    OR
    customer_id IS NULL
    OR
    gender IS NULL
    OR 
    age IS NULL
    OR
    category IS NULL
    OR 
    quantiy IS NULL
    OR
    price_per_unit IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;
  

Select count(*) from retail_sales;

Delete from retail_sales
where 
	transactions_id IS NULL
    OR
    sale_date IS NULL
    OR
    sale_time IS NULL
    OR
    customer_id IS NULL
    OR
    gender IS NULL
    OR 
    age IS NULL
    OR
    category IS NULL
    OR 
    quantiy IS NULL
    OR
    price_per_unit IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;
    
    select * from retail_sales;
    
    -- How many sales we have?
    
    select count(*) as total_sale From retail_sales;
    
    -- How many customers we have?
    
	select count(customer_id) as total_sale from retail_sales;
    
    select count(Distinct customer_id) as total_sale from retail_sales;
    
    select distinct category from retail_sales;
    
    -- data analysis & business key problems & answers
    
    -- Q.1 write a sql query to retrive all coloumns for sales made on 2022-11-05?
	
  
  select * from retail_sales 
  where 
	sale_date = "2022-11-05";
    
    -- Q.2. write a sql query to retrive all transactions where the category is clothing and the quantity sold is more than 4 in the month of nov-2022?
 
 select * from retail_sales
 where 
	category = 'Clothing'
    and
    date_format(sale_date, '%Y-%m') = '2022-11'
    AND
    quantiy >= 4
    Limit 2000;
    
    select * from retail_sales
    where
		category="Clothing"
        AND
        sale_date between '2022-11-01' AND '2022-11-30'
        And 
        quantiy >= 4
        limit 2000;
        
        -- Q.3 write a sql query to calculate the total sales( total_sale ) of each category ?
        
        select * from retail_sales;
        
        select category,
        SUM(total_sale) as net_sale,
        count(*) as total_orders
        from retail_sales
        group by 1;
        
	-- Q>4 Write a sql query to find the average age of customers who purchased the items  from the beauty category?
    
    select Round(avg(age),2) as average_age
    from retail_sales
    where 
    category = 'Beauty';
    
-- Q.5 Write a sql query to find all transactions where the total sales is greater than 1000?

select * from retail_sales 
where 
total_sale > 1000;

-- Q.6. write a sql query to find the total number of transactions made by each gender  in each category ?

select 
  category,
  gender,
  count(*) as total_trans
  from retail_sales
  group by category, gender 
  order by 1;
  
  -- Q.7. write a sql query to calculate the average sale for each month . Find out best selling month in each year? 

select 
	YEAR(sale_date) as year,
    MONTH(sale_date) as month,
    AVG(total_sale) as avg_sale 
    from retail_sales
    group by 1, 2
    order by 1, 3 Desc;
    
    select 
    year,
    month,
    avg_sale
    from
    (
    select
	YEAR(sale_date) as year,
    MONTH(sale_date) as month,
    AVG(total_sale) as avg_sale 
    from retail_sales
    group by 1, 2
    order by 1, 3 Desc
    ) as t1;
   
   -- Q.8. write a Sql query to find the  top 5 customers  based on the highest total sales?
   
   select 
   customer_id,
   sum(total_sale) as total_sales
   from retail_sales
   group by 1
   order by 2 desc
   limit 5;

-- Q.9. write a Sql query to find the number of unique customers who purchased items for each category ?

select 
category,
count(distinct customer_id) as cnt_unique_customer
from retail_sales
   group by category;
   
-- Q.10. write a sql query to create the shift and number of orders ( Example morning <=12, afternoon between 12 & 17 and evening >17?

with hourly_sale
as
(
        select *,
        case 
        when extract(hour from sale_time) < 12 then 'morning'
        when extract(hour from sale_time) between 12 and 17 then 'afternoon'
        else 'evening'
        end as shift 
        from retail_sales
)
select shift,
count(*) as total_orders
from hourly_sale 
group by 1 
        
        
    
    