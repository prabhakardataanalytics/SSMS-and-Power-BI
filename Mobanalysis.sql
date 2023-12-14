

Select * from dbo.mobile;

/* Checking the mobile features and price list*/
Select Phone_name,price from dbo.mobile;

/* Find out the price of 5 most expensive phone*/
Select Top 5* from dbo.mobile order by price desc;

/* Find out the price of 5 most cheapest phones */

Select Top 5 * from dbo.mobile order by price asc ;

/* List of top 5 Samsung phones with price and all features */
Select Top 5* from dbo.mobile where Brands = 'Samsung'
order by price desc;

/* Must have android phone list then top 5 high price android phones*/
Select Top 5 * from dbo.mobile  where Operating_System_Type = 'Android'
order by Price desc;

/* Must have android phone list then top 5 lower price android phones */
Select Top 5 * from mobile where Operating_System_Type = 'Android' order by Price asc;

/* Must have IOS phone list then 5 top High price IOS phone*/
Select Top 5 * from mobile where Operating_System_Type  = 'iOS' order by Price desc ;

/* Must have IOS phone list then top 5 lower pirce Ios phone */
Select Top 5 * from mobile where Operating_System_Type  = 'ios' order by Price asc ;

/* Write a query  which phone support 5g and also top 5 phone with 5g support */
Select Top 5 * from mobile where [_5g_Availability] = 'Yes' order by Price desc ;

/* Total all price of all mobile is to be found with brand name */
Select Brands ,sum(Price)  from mobile group by Brands 


