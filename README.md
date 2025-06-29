# SQL_P3--Amazon_sales_analysis

# SQL_Project_1---Retail_sales_analysis
**Author - Ujjwal Babu**

# 🛍️ Retail Sales Analysis SQL Project

Welcome to the **Retail Sales Analysis** project — a beginner-friendly SQL portfolio project designed to demonstrate SQL skills required for data analysis roles. This project showcases how to clean, explore, and analyze retail sales data using SQL.

---

## Project Overview

- **Level:** Beginner
- **Database:** `p1_retail`
- **Skills Covered:** SQL, Data Cleaning, Aggregation, Window Functions, EDA

---


## Objectives
1. **Retail Sales Database Setup**  
   Initialize and populate a structured database (`p1_retail_db`) using the provided retail sales dataset.
2. **Data Cleaning**  
   Detect and remove records containing missing or null values to ensure data integrity and accuracy.
3. **Exploratory Data Analysis (EDA)**  
   Conduct preliminary data exploration to understand key metrics, distributions, and patterns within the dataset.
4. **Business Analysis Using SQL**  
   Execute SQL queries to answer specific business questions and extract actionable insights from the sales data.

---

##  Project Structure

### 1. database_setup
- **Database Creation;**
The project begins by creating a database named 'p1_retail_db' to store all retail sales-related data.

- **Table Creation:**
A table called `retail_sales` is created within the database to capture detailed sales transactions. The table includes the following fields:

- `transaction_id`: Unique identifier for each transaction  
- `sale_date`: Date of the sale  
- `sale_time`: Time the transaction occurred  
- `customer_id`: Unique identifier for each customer  
- `gender`: Gender of the customer  
- `age`: Age of the customer  
- `product_category`: Category of the product sold  
- `quantity_sold`: Number of units sold  
- `price_per_unit`: Selling price per unit  
- `cogs`: Cost of Goods Sold for the transaction  
- `total_sale`: Total amount of the sale

### 2. cleaning_queries
- Check for NULLs
- Delete invalid rows
- Explore distinct values

### 3. analysis_queries
- Total sales by category
- Top customers
- Sales trends by month and shift

### 4. reports/sales_summary
Contains findings and observations based on the SQL analysis.

---

## Key Business Questions

- Q.1 Retrieve all columns for sales made on '2022-11-05'
- Q.2 Retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of November 2022
- Q.3 Calculate the total sales (total_sale) for each category
- Q.4 Find the average age of customers who purchased items from the 'Beauty' category
- Q.5 Find all transactions where the total sale is greater than 1000
- Q.6 Find the total number of transactions (transaction_id) made by each gender in each category
- Q.7 Calculate the average sale for each month. Find out the best-selling month in each year
- Q.8 Find the top 5 customers based on the highest total sales
- Q.9 Find the number of unique customers who purchased items from each category
- Q.10 Create each shift and the corresponding number of orders (Example: Morning <=12, Afternoon Between 12 & 17, Evening >17)


### The Repository

```bash
https://github.com/najirh/Amazon.in_Sales_Data_Analysis.git
