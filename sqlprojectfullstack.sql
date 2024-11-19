use amazonsales;
show tables;
select*from sales limit 10;
-- 1.	City and Branch Analysis:
-- ○	Identify the number of unique cities represented in the data.
select distinct city from sales;-- 3 unique cities
-- ○	 Determine the city associated with each branch.
select distinct city,branch from sales;-- Yangon Branch A,Mandalay branch B,Naypytaq branch cache index
-- 3.	Product Line Insights:
-- ○	Find the number of unique product lines.
select distinct product_line from sales;-- 6 unique product lines
-- Food and beverages
-- Health and beauty
-- Sports and travel
-- Fashion accessories
-- Home and lifestyle
-- Electronic accessories
-- ○	Identify the most sold product line.
select product_line,sum(quantity) as total_quantitysold from sales group by product_line order by total_quantitysold desc;
-- Electronic accessories	961
-- ○	Calculate which product line generated the most revenue.
select  product_line,sum(total) as total_revenue from sales group by product_line order by total_revenue desc;
-- Food and beverages	56144.8440
-- 4.	Revenue and Cost of Goods Sold (COGS) Analysis:
-- ○	Calculate the total revenue for each month.
select monthname(date),sum(total) as total_revenue from sales group by monthname(date) order by total_revenue desc;
-- January	116291.8680
-- March	108867.1500
-- February	95727.3765
-- ○	Determine which month had the largest COGS.
select monthname(date),sum(cogs) as total_cogs from sales group by monthname(date) order by total_cogs desc limit 1;
-- January	110754.16
-- ○	Identify the city with the largest revenue.
select city,sum(total) as total_revenue from sales group by city order by total_revenue desc limit 1;
-- Naypyitaw 110490.7755
-- 5.	Sales Performance:
-- ○	Identify which branch sold more products than the average quantity sold.
select avg(quantity) as average_quantity from sales;-- avg=5.4995
select branch,avg(quantity) as average_quantity from sales group by branch order by average_quantity desc limit 1;
-- C branch	5.5902
-- ○	Find the average rating for each product line.
select product_line,avg(rating) as average_rating from sales group by product_line order by average_rating desc;
-- Food and beverages	7.11322
-- Fashion accessories	7.02921
-- Health and beauty	6.98344
-- Electronic accessories	6.90651
-- Sports and travel	6.85951
-- Home and lifestyle	6.83750
-- ○	Identify the customer type that brings the most revenue.
select customer_type,sum(total) as total_Revenue from sales group by customer_type order by total_Revenue desc limit 1;
-- Member	163625.1015
-- 6.	Customer Behavior Insights:
-- ○	Explore the gender distribution per branch.
select branch,gender,count(*) as customer_count from sales group by gender,branch order by customer_count desc;
-- A	Male	179
-- C	Female	177
-- B	Male	169
-- B	Female	160
-- A	Female	160
-- C	Male	150
-- ○	Identify which gender represents most customers.
select gender,count(*) as customer_count from sales group by gender order by customer_count desc limit 1;
-- Male	498
-- ○	Find which customer type buys the most.
select customer_type,sum(quantity) as total_quantitypurchased from sales group by customer_type order by total_quantitypurchased desc limit 1;
-- Member	2773 
-- ○	Calculate the most common customer type.
select customer_type,count(*) as customerType_count from sales group by customer_type order by customerType_count desc limit 1;
-- Member	499
-- 7.	Payment and VAT Insights:
-- ○	Identify the number of unique customer types.
select distinct customer_type from sales;-- 2 unique customer types
-- Normal
-- Member
-- ○	Calculate the number of unique payment methods.
select distinct payment from sales;-- 3 unique payment methods
-- Credit card
-- Ewallet
-- Cash
-- ○	Find the customer type that pays the most in VAT.
select customer_type,round(avg(tax_pct),2) as VAT from sales group by customer_type order by VAT desc limit 1;
-- Member	15.61
-- ○	Identify the city with the largest VAT percentage.
select city,round(sum(tax_pct),2) as VAT from sales group by city order by VAT desc limit 1;
-- Naypyitaw	5261.47
-- 8.	Time-Based Analysis:
-- ○	Analyze which time of day customers give the most ratings.
select * from sales limit 10;
select time as hour_of_Day,count(*) as rating_count from sales group by hour_of_Day order by rating_count desc limit 1;
-- 19:48:00	7
-- ○	Identify the time of day customers give the most ratings per branch.
select branch,time as hour_of_day,count(*) as rating_count from sales group by branch,hour_of_day order by branch,rating_count desc;
-- ○	Determine which day of the week has the highest average rating per branch and explore why this is the case (correlating sales volume with ratings).
select dayname(date) as day_name,branch,avg(rating) as average_rating, sum(total) as total_revenue from sales group by day_name,branch order by average_rating desc;
-- Friday	A	7.31200	274
-- Monday	B	7.26579	184
-- Saturday	C	7.22963	281
-- ○	Analyze the number of sales made in different parts of the day per weekday.
select dayname(date) as day_name,sum(quantity) as total_quantity from sales group by day_name order by total_quantity desc;
-- Saturday	919
-- Tuesday	862
-- Wednesday 784
-- Sunday	769
-- Thursday	755
-- Friday	755
-- Monday	628





