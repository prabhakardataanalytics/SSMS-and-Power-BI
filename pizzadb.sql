
/* Calculate total Revenue*/
Select Sum(total_price) as Total_Revenue from pizza_sales 
/* Reveune is - 817860.05083847*/

Select * from pizza_sales

/* Calculate the order id and removing the duplicate*/

Select sum(total_price)/ Count(Distinct order_id) As Average_order_value from pizza_sales
/* Average order value - 38.3072623343546*/

/*3. Total Pizzas Sold*/

Select sum(quantity) As Total_Pizza_Sold from pizza_sales
/*Total_Pizza_Sold - 49574*/

Select Count(Distinct order_id) As Total_orders from pizza_sales
/* Total orders - 21350*/

/*5. Average Pizzas Per Order*/
Select CAST(CAST(sum(quantity) As decimal(10,2)) /
Cast(Count(Distinct order_id) As Decimal (10,2))As Decimal (10,2)) As Avg_pizza_per_order from pizza_sales


SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales


/*6-Daily Trend for Total Orders*/
Select DATENAME(DW,order_date) As order_day,Count(Distinct order_id) As total_orders
from pizza_sales
Group by DATENAME(DW,order_date)

/*7 Monthly Trend for Orders*/
Select DATENAME(Month,order_date) As order_day,Count(Distinct order_id) As total_orders
from pizza_sales
Group by DATENAME(Month,order_date)

/*8-% of Sales by Pizza Category*/
Select	pizza_category,sum(total_price) as Total_Sales,sum(total_price)*100/
(Select sum(total_price) from pizza_sales where Month(order_date) =1) As Pct
from pizza_sales
Group BY pizza_category

/*9-% of Sales by Pizza Size*/

Select pizza_size,Cast(sum(total_price) As Decimal (10,2))as Total_Sales,Cast(sum(total_price)*100/
(Select sum(total_price) from pizza_sales)AS Decimal(10,2))  As Pct
from pizza_sales
Where DATEPART(quarter,order_date) =1
Group BY pizza_size
order by Pct DESC

/*10 -Total Pizzas Sold by Pizza Category*/
Select * from pizza_sales
/* If you do any aggregate then you should always do group by it's thumb rules */
Select  pizza_name,sum(total_price) As Total_Revenue from pizza_sales
Group by pizza_name
Order by Total_Revenue

/*11-Top 5 Pizzas by Revenue*/
Select Top 5 pizza_name,sum(total_price) As Total_Revenue from pizza_sales
Group by pizza_name
Order by Total_Revenue Desc

/*12- Bottom 5 Pizzas by Revenue*/
Select Top 5 pizza_name,sum(total_price) As Total_Revenue from pizza_sales
Group by pizza_name
Order by Total_Revenue ASC

/*13-Top 5 Pizzas by Total Orders*/
Select Top 5 pizza_name,Count(Distinct order_id) As Total_Orders from pizza_sales
Group By pizza_name
Order By Total_Orders Desc

/* 14- Bottom 5 Pizzas by Total Orders*/
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC
