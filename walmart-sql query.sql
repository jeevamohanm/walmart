create database walmart_db;
use walmart_db;

select * from walmart;

# Business Problems

# Q1 -  Find different payment methods, number of transactions, and quantity sold by payment method

select payment_method,
count(payment_method) as no_of_transaction,
sum(quantity) as quantity_sold
from walmart
group by payment_method
order by quantity_sold desc;

# Q2 - Identify the highest-rated category in each branch * Display the branch, category, and avg rating
 
 select *
 from
 (
 select branch,
 category,
 round(avg(rating),2) as avg_rating,
 rank() over (partition by branch order by avg(rating) desc) as ranks
 from walmart
 group by branch,category
)
as ranked_data
where ranks = 1;  
 
 # Q3 - Identify the busiest day for each branch based on the number of transactions
 
 select * 
 from
 (select
 branch,
 dayname(str_to_date(date, '%d/%m/%y')) as day_name,
 count(*) as transactions,
 rank() over(partition by branch order by count(*) desc) as ranks
 
 from walmart
 group by branch,day_name
)
as ranked
where ranks = 1;
 
# Q4 - Calculate the total quantity of items sold per payment method

select 
payment_method,
sum(quantity) as total_quantity
from walmart
group by payment_method
order by total_quantity;

# Q5 - Determine the average, minimum, and maximum rating of categories for each city

select city,
category,
round(avg(rating),2) as avg_rating,
min(rating) as min_rating,
max(rating) as max_rating
from walmart
group by city,category;

#Q6 - Calculate the total profit for each category

select category,
round(sum(unit_price * quantity * profit_margin),3) as total_profit
from walmart
group by category
order by total_profit desc;

#Q7 - Determine the most common payment method for each branch

with ctr as
(select branch,
payment_method,
count(*),
rank() over(partition by branch order by count(*) desc) as ranks 
from walmart
group by branch,payment_method
)
 select branch,
 payment_method as common_payment_method
 from ctr
 where ranks = 1;

#Q8 - Categorize sales into Morning, Afternoon, and Evening shifts

select branch,
case
when hour(time(time)) < 12  then 'morning'
when hour(time(time)) between 12 and 17 then 'afternoon'
else 'evening'
end as shift,
count(*) as sales_done
from walmart
group by branch, shift
order by branch,sales_done desc;


#Q9 - Identify the 5 branches with the highest revenue decrease ratio from last year to current year (e.g., 2022 to 2023)
 
 with revenue_2022 as
( select branch,
 sum(total) as revenue
 from walmart
 where year(str_to_date(date,'%d/%m/%y')) = 2022
 group by branch
 ),
  revenue_2023 as
  (select branch,
  sum(total) as revenue
  from walmart
  where year(str_to_date(date,'%d/%m/%y'))  = 2023
  group by branch
 )
 select r_22.branch,
 r_22.revenue as last_year_revenue,
 r_23.branch,
 r_23.revenue as current_year_revenue,
 round(((r_22.revenue - r_23.revenue) / r_22.revenue * 100),2) as revenue_decrese_ratio
 from revenue_2023 as r_23
 join revenue_2022 as r_22
 on r_23. branch = r_22.branch
 where r_22.revenue > r_23.revenue
 order by revenue_decrese_ratio desc
 limit 5;
 
 
 
 