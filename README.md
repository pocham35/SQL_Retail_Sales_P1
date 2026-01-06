# SQL_Retail_Sales_P1

# Project Overview

This project focuses on analyzing retail sales transaction data using SQL (MySQL) to extract meaningful business insights.
The analysis covers data cleaning, exploratory data analysis (EDA), and answering real-world business questions related to customer behavior, sales performance, and time-based trends.

The project is designed to demonstrate practical SQL skills required for a Data Analyst role, including:

# Database creation

# Table design

# Data cleaning

# Aggregation

# Filtering

# Grouping

# Time-based analysis

# Business-oriented query writing

🛠️ Tools & Technologies

Database: MySQL

Language: SQL

Concepts Used:

DDL & DML

Data Cleaning

Aggregate Functions

Subqueries & CTEs

Date & Time Functions

CASE Statements

📂 Database & Table Creation

**1️⃣ Database Creation**

''' sql
Create DataBase SQL_Project_2;
use SQL_Project_2;


**Explanation**:
A dedicated database is created to keep the project structured and isolated from other databases.

**2️⃣ Table Creation**

''' sql

Drop Table If Exists retail_sales;
Create Table retail_sales (
    transactions_id Int PRIMARY KEY,
    sale_date Date,
    sale_time Time,
    customer_id Int,
    gender Varchar(15),
    age Int,
    category Varchar (25),
    quantiy Int,
    price_per_unit Float,
    cogs Float,
    total_sale Float
);


Explanation:
The retail_sales table stores transactional-level retail data.

Column Name	Description

transactions_id	Unique ID for each transaction

sale_date	Date of purchase

sale_time	Time of purchase

customer_id	Unique customer identifier

gender	Gender of customer

age	Age of customer

category	Product category

quantiy	Quantity sold

price_per_unit	Price per unit

cogs	Cost of goods sold

total_sale	Total transaction value

🧹 Data Cleaning & Quality Checks

**3️⃣ Identifying NULL Values**

''' sql

select * from retail_sales
where 
    transactions_id IS NULL OR
    sale_date IS NULL OR
    sale_time IS NULL OR
    customer_id IS NULL OR
    gender IS NULL OR
    age IS NULL OR
    category IS NULL OR
    quantiy IS NULL OR
    price_per_unit IS NULL OR
    cogs IS NULL OR
    total_sale IS NULL;


**Explanation:**

This query checks for missing or incomplete records, which could negatively impact analysis accuracy.

**4️⃣ Removing Incomplete Records**

''' sql

Delete from retail_sales
where 
    transactions_id IS NULL OR
    sale_date IS NULL OR
    sale_time IS NULL OR
    customer_id IS NULL OR
    gender IS NULL OR
    age IS NULL OR
    category IS NULL OR
    quantiy IS NULL OR
    price_per_unit IS NULL OR
    cogs IS NULL OR
    total_sale IS NULL;


Explanation:
Rows containing NULL values are removed to ensure clean and reliable data for analysis.

📊 Exploratory Data Analysis (EDA)
5️⃣ Total Number of Sales
select count(*) as total_sale From retail_sales;


Insight:
Returns the total number of transactions in the dataset.

6️⃣ Customer Count
select count(distinct customer_id) as total_sale from retail_sales;


Insight:
Identifies the number of unique customers, helping measure customer reach.

7️⃣ Available Product Categories
select distinct category from retail_sales;


Insight:
Shows the different product categories sold.

📈 Business Questions & Solutions
Q1️⃣ Sales on a Specific Date
select * from retail_sales 
where sale_date = '2022-11-05';


Use Case:
Analyze sales performance for a particular day.

Q2️⃣ High-Quantity Clothing Sales in Nov 2022
select * from retail_sales
where
    category = 'Clothing'
    AND sale_date between '2022-11-01' AND '2022-11-30'
    And quantiy >= 4;


Use Case:
Identifies bulk clothing purchases during a specific month.

Q3️⃣ Total Sales & Orders per Category
select category,
       SUM(total_sale) as net_sale,
       count(*) as total_orders
from retail_sales
group by category;


Insight:
Helps compare revenue contribution and order volume by category.

Q4️⃣ Average Age of Beauty Category Customers
select Round(avg(age),2) as average_age
from retail_sales
where category = 'Beauty';


Use Case:
Useful for targeted marketing and customer profiling.

Q5️⃣ High-Value Transactions
select * from retail_sales 
where total_sale > 1000;


Insight:
Identifies premium purchases and high-spending customers.

Q6️⃣ Transactions by Gender & Category
select 
  category,
  gender,
  count(*) as total_trans
from retail_sales
group by category, gender
order by category;


Use Case:
Analyzes gender-based purchasing behavior across categories.

Q7️⃣ Monthly Average Sales & Best Months
select 
    YEAR(sale_date) as year,
    MONTH(sale_date) as month,
    AVG(total_sale) as avg_sale 
from retail_sales
group by year, month
order by year, avg_sale desc;


Insight:
Helps identify seasonality and best-performing months.

Q8️⃣ Top 5 Customers by Sales
select 
   customer_id,
   sum(total_sale) as total_sales
from retail_sales
group by customer_id
order by total_sales desc
limit 5;


Use Case:
Identifies high-value customers for loyalty programs.

Q9️⃣ Unique Customers per Category
select 
category,
count(distinct customer_id) as cnt_unique_customer
from retail_sales
group by category;


Insight:
Measures category popularity among customers.

Q🔟 Sales Shift Analysis (Time-Based)
with hourly_sale as (
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
group by shift;


Insight:
Identifies peak sales periods during the day, helping optimize staffing and promotions.

📌 Key Learnings & Outcomes

Hands-on experience with real-world SQL queries

Strong understanding of data cleaning techniques

Ability to convert business questions into SQL logic

Experience with time-based and customer-based analysis

Interview-ready SQL project for Data Analyst roles

🚀 How to Run This Project

Install MySQL

Create a new database

Run the SQL file step by step

Insert retail sales data

Execute analysis queries

📎 Conclusion

This project demonstrates how SQL can be used to clean, analyze, and derive insights from retail transaction data.
It reflects real business scenarios and is suitable for showcasing in GitHub portfolios, resumes, and interviews.

