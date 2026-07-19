-- Nova Retail Sales SQL Project 
-- Data Analysis using MySQL
-- Author: Indresh Kuamr


select * from nova_retail_sales;

select count(*) from nova_retail_sales;
describe nova_retail_sales;

select distinct category from nova_retail_sales;

select count(*) from nova_retail_sales; 

select sum(sales) from nova_retail_sales;

select sum(profit) from nova_retail_sales;

select avg(sales) from nova_retail_sales;

select max(sales) from nova_retail_sales;

select min(sales) from nova_retail_sales;

select avg(profit) from nova_retail_sales;

select min(profit) from nova_retail_sales;

select category, sum(sales) from nova_retail_sales
group by Category;

select region, sum(profit) from nova_retail_sales 
group by region;

select category , count(*) from nova_retail_sales
group by Category;

select region, sum(sales) from nova_retail_sales
group by Region;

select category, avg(sales) from nova_retail_sales
group by Category;

select region, sum(quantity) from nova_retail_sales
group by region;

select category, sum(sales) as H_C_S from nova_retail_sales 
group by category order by H_C_S desc limit 1 ;

select region, Sum(profit) as H_R_P from nova_retail_sales
group by Region order by H_R_P desc limit 1 ;

select region, sum(quantity) as H_S_R from nova_retail_sales
group by Region order by H_S_R desc limit 1;


select sub_category, sum(sales) as H_SC_S from nova_retail_sales
group by Sub_Category order by H_SC_S desc limit 1 ;

select Brand, sum(profit) as H_P_B from nova_retail_sales
group by brand order by H_P_B desc limit 1;

select state, count(*) as H_O_C from nova_retail_sales
group by state order by H_O_C desc limit 1;

select Region, sum(sales) from nova_retail_sales
where Region ="East" group by region;

select category, sum(profit) from nova_retail_sales
where category="Electronics" group by category;

select category, count(*) from nova_retail_sales
where category= "Furniture" group by category;

select region, category, sum(sales) from nova_retail_sales
where region="East" and Category="Electronics";

select region, category, sum(profit) from nova_retail_sales
where region="North" and category ="Furniture";

select region, category, count(*) from nova_retail_sales
where region="South" and category ="Office supplies";

select region , sum(sales) from nova_retail_sales
where region in ("East", "West") group by region;

select category, sum(profit) from nova_retail_sales
where category = "Electronics" or category = "Furniture" group by category;

select region , count(*) from nova_retail_sales
where region in ("East", "Sount") group by region;

select Customer_ID, Customer_Name, count(*) from nova_retail_sales
group by Customer_ID, Customer_Name having Count(*) >10;

select count(*) from nova_retail_sales
 where extract(year from Order_Date)= 2025;

select Customer_Segment, sum(profit) as total_profit from nova_retail_sales
group by Customer_Segment order by total_profit desc limit 1;

select state, avg(sales) as avg_sales from nova_retail_sales
group by state order by avg_sales desc limit 1;

select Product_Name, sum(Quantity) as total_quantity from nova_retail_sales
group by product_name order by total_quantity desc limit 5 ;

select Brand, avg(profit) as avg_profit from nova_retail_sales
group by Brand order by avg_profit desc limit 1;

select extract(month from order_date) as month,
sum(sales) as total_sales
from nova_retail_sales
where extract(year from order_date) = 2025 
group by extract(month from order_date)
order by total_sales desc limit 1;

select extract(year from order_date)=2025 as order_year,  
state, sum(sales) from nova_retail_sales
where extract(year from order_date)=2025 
group by state,Order_year order by sum(sales) desc limit 1;

select salesperson , sum(profit) as Total_profit from nova_retail_sales
group by Salesperson order by Total_profit desc limit 3;

select Warehouse, count(*) from nova_retail_sales
group by Warehouse having count(*) >1000;

select city, sum(Sales) as total_sales from nova_retail_sales
group by city order by total_sales desc limit 1;

select Customer_ID, Customer_Name , sum(sales) as 
total_sales from nova_retail_sales
group by Customer_ID, Customer_Name order by total_sales desc limit 5;

select state, avg(profit) as avg_profit from nova_retail_sales
group by state order by avg_profit asc limit 1;

select Brand, sum(sales) as sum_sales 
from nova_retail_sales
where extract(year from Order_Date)=2025 
group by Brand order by sum_sales desc limit 1;

select Product_Name, Avg(Profit) as Avg_profit from nova_retail_sales
group by Product_Name order by avg(Profit) desc limit 5;

select  Customer_Segment, count(*) 
from nova_retail_sales 
group by Customer_Segment
order by count(*) desc limit 1;

select Region , avg(sales) as Avg_sales from nova_retail_sales
where extract(year from order_date) = 2025
group by Region order by Avg_sales desc limit 1;

select state, count(*) as orders from nova_retail_sales
group by state order by orders desc limit 3;

select Brand, Sum(Profit) as Total_profit from nova_retail_sales
group by Brand order by total_profit asc limit 1;

select state, sum(profit)/sum(sales)*100 as margin  from nova_retail_sales
where extract(year from order_date)= 2025
group by state order by margin desc limit 1;

select city, avg(sales) order_value from nova_retail_sales
group by city order by order_value desc limit 5;

select category, Brand, Total_sales
from(
select category, Brand, Sum(sales) as Total_sales,
row_number() over( partition by category order by sum(sales) desc
) as rn
from nova_retail_sales
group by Category, Brand) as t
where rn =1;

select Salesperson, sum(sales) as Total_sales 
from nova_retail_sales
where extract(year from order_date) =2025
group by Salesperson order by Total_sales desc limit 1; 

select Region , Salesperson, total_Profit
from (
select Region, Salesperson, sum(Profit) as total_profit,
row_number() over(partition by region order by sum(profit) desc) as rn
from nova_retail_sales
group by Region, Salesperson) as t
where rn =1;

select customer_name,Customer_ID, sum(profit) as total_profit
from nova_retail_sales 
group by Customer_Name, Customer_ID order by total_profit desc limit 5;

select category, product_name, total_profit
from(
select category, product_name, sum(profit) as total_profit,
row_number() over(partition by category order by sum(profit) desc) as rn
from nova_retail_sales 
group by Category, Product_Name )as t
where rn=2 ;

select Brand, avg(sales) as avg_sales from nova_retail_sales
group by Brand order by avg_sales desc limit 3;

select extract(month from order_date)as month_order, 
count(*) as total_order
from nova_retail_sales
where extract(year from order_date) =2025
group by month_order
order by total_order desc limit 1;

select region, sum(sales) as total_sales,
sum(profit) as total_profit,
(sum(Profit)/sum(sales)*100) as profit_margin
from nova_retail_sales
where extract(year from order_date) =2025
group by Region
order by profit_margin desc limit 1;

select Region, Product_name, Total_sales
from(
select Region, Product_name, 
sum(sales) as Total_sales,
row_number() over(partition by Region order by sum(sales) desc) as rn
from nova_retail_sales
where extract(year from order_date)=2025
group by Region, Product_name) t
where rn =1;

select Salesperson , count(*) as orders
from nova_retail_sales
where extract(year from order_date) =2025
group by Salesperson order by orders desc limit 1;

select category, product_name, Total_profit
from (
select category, product_name,
sum(profit) as total_profit,
row_number() over(partition by category order by sum(profit)) as rn
from nova_retail_sales
group by category, product_name)t
where rn= 1;

select Customer_Segment, avg(sales) as Avg_order_value from nova_retail_sales
where extract(year from order_date) =2025
group by Customer_Segment
order by Avg_order_value desc limit 1;

select Region, Brand, total_sales, total_profit ,Margin_profit
from (
select Region, Brand, sum(sales) as total_sales, 
sum(profit) as total_profit, (sum(sales)/sum(profit))*100 as Margin_profit,
row_number() over(partition by Region order by (sum(sales)/sum(profit))*100 desc) as rn
from nova_retail_sales
group by Region, Brand)t
where rn = 1;

select Product_name, category ,sum(sales) as total_sales,
avg(sales) as avg_sales
from nova_retail_sales
group by Product_name,category
order by total_sales desc limit 5;

select state, sum(Profit) as Total_Profit, sum(sales) as Total_sales
from nova_retail_sales
where extract(year from order_date) =2025
group by State 
order by total_profit desc limit 1;

select Customer_Segment, Salesperson , total_sales
from(
select Customer_Segment, Salesperson , sum(sales) as total_sales,
row_number() over(partition by Customer_Segment order by sum(sales) desc ) as rn
from nova_retail_sales
group by customer_segment, salesperson) t
where rn =1;

select Brand, count(*) as orders
from nova_retail_sales
where extract(year from order_date) =2025
group by Brand
order by orders desc limit 1;

select city, sum(sales) as Total_sales,
sum(Profit) as Total_profit,
(sum(profit)/sum(sales))*100 as profit_margin
from nova_retail_sales
where extract(year from order_date )= 2025
group by city
order by Profit_margin desc limit 1;

select Brand, Product_name, Total_profit
from (
select Brand, Product_name, sum(Profit) as total_profit,
row_number() over(partition by Brand order by sum(Profit) desc)as rn
from nova_retail_sales
group by Brand, product_name) t
where rn = 1;

select customer_name, customer_id, count(*) as orders
from nova_retail_sales
group by customer_name, custoemr_id
order by orders desc limit 5;

select State, Brand, total_sales
from(
select state, Brand, sum(sales) as total_sales,
row_number() over(partition by state order by sum(sales) desc) rn 
from nova_retail_sales
where extract(year from order_date) =2025
group by state, Brand ) t
where rn= 1;

select Customer_Segment, sum(sales) as total_sales,
sum(profit) as total_profit,
(sum(profit)/sum(sales))*100 as profit_margin
from nova_retail_sales
group by Customer_Segment;

select Product_name, count(*) as orders
from nova_retail_sales
where extract(year from order_date) 
group by product_name
order by orders desc limit 1;

select category, Salesperson, total_sales
from(
select category, Salesperson, sum(sales) as total_sales,
row_number() over(partition by category order by sum(sales) desc) as rn
from nova_retail_sales
where extract(year from order_date) =2025
group by category, Salesperson) t
where rn =1;

select state, count(distinct customer_id ) as uniqe_customer
from nova_retail_sales
group by state
order by uniqe_customer desc limit 1;

select Brand, avg(profit) as avg_profit,
count(*) as total_orders
from nova_retail_sales
group by Brand;

select city, sum(sales) as Tota_Sales, sum(profit) as Total_profit,
(sum(profit)/sum(sales))*100 as profit_Margin
from nova_retail_sales 
where extract(year from order_date) =2025
group by city
order by profit_margin desc limit 1;

select Region, customer_name, orders
from(
select Region, customer_name, count(*) as orders,
row_number() over(partition by Region order by count(*) desc) as rn
from nova_retail_sales
group by Region, customer_name )t
where rn =1;

select category, sum(sales) as total_sales, sum(profit) as total_profit,
avg(sales) as avg_order_value
from nova_retail_sales
group by Category;

select state, avg(sales) as Avg_sales_order
from nova_retail_sales
where extract(year from order_date) =2025
group by state
order by Avg_sales_order desc limit 1;

select Customer_Segment, Brand,total_profit
from(
select Customer_Segment, Brand, sum(profit) as total_profit,
row_number() over(partition by Customer_Segment order by sum(profit) desc) as rn
from nova_retail_sales
group by Customer_Segment, Brand) t
where rn= 1;

select extract(month from order_date) as months, 
sum(profit) as total_profit
from nova_retail_sales
where extract(year from order_date) =2025
group by Months
 order by total_profit desc limit 1;
 
 select Region, Avg(profit) as Avg_profit 
 from nova_retail_sales
 where extract(year from order_date) =2025
 group by Region
 order by Avg_profit desc limit 1;
 
 select state, Product_name ,total_profit
 from(
 select state, Product_name ,sum(profit) as total_profit,
row_number() over(partition by State order by sum(profit)  desc) as rn
from nova_retail_sales
 group by state, Product_name )t
 where rn =1;
 
 select Brand, avg(sales) as avg_order_value
 from nova_retail_sales
 where extract(year from order_date) =2025
 group by Brand
 order by avg_order_value desc limit 1;
 
 select count(distinct customer_id) ,  city 
 from nova_retail_sales
 where extract(year from order_date) =2025
 group by city;
 
 select Region,Brand, Total_sales,  total_profit
 from(
 select Region,Brand, sum(sales) as Total_sales,
 sum(profit) as total_profit,
 sum(profit)/sum(sales)*100 as profit_margin,
 row_number() over(partition by Region order by 
 sum(profit)/sum(sales)*100 desc) as rn
 from nova_retail_sales
 group by Region,Brand)t
 where rn =1;
 