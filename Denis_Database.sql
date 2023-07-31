-- Extract the following information from Denis_DB:

-- Show all details about properties, orders and products
select * from orders;
select * from products;
select * from propertyinfo;

-- Select the city and state column in propertyinfo table.
select "PropertyCity", "PropertyState" -- They are enclosed in a double quotation mark because there is a capital letter in the words
from propertyinfo;

-- Find the dates orders were made and the quantity of orders made.
select "OrderDate", "Quantity"
from orders;

-- Find unique dates orders were made
select distinct ("OrderDate")
from orders;

-- The different product category Denis has in his store
select distinct ("ProductCategory")
from products;

-- The data from order table and sort in ascending order of quantity
select * from orders
Order by "Quantity" asc;

-- All products and their details and sort in descending order of price
select * from products
order by "Price" desc;

-- Find the five most expensive products
select "ProductName"
from products
order by "Price" desc
limit 5;

-- The name of product whose id is 50
select "ProductName", "ProductID"
from products
where "ProductID" = 50;

-- The name and category of product whose id is 94
select "ProductName", "ProductCategory"
from products
where "ProductID" = 94;

-- The name and category of product whose prices are above $200
select "ProductName", "ProductCategory", "Price"
from products
where "Price" > 200;

-- The name of product whose prices are between $50 and $200
select "ProductName", "Price"
from products
where "Price" between 50 and 200;

-- The productid of products sold between 07-01-2015 and 10-01-2015
select "ProductID", "OrderDate"
from orders
where "OrderDate" between '2015-01-07' and '2015-01-10';

-- Orders by property 14, 16, and 10
select * from orders
where "PropertyID" in (14,16,10);

-- Total amount all products will be worth if there were just 2 of it in the store
select "ProductID", "Price", 2*"Price" as "Price_of_2"
from products;

-- aggregates e.g are count, sum, min, max,average
select sum (2*"Price") as "Total_Amount"
from products;

-- The most expensive product
select "ProductName", "Price"
from products
where "Price" = (select max("Price")
				 from products);

-- The least expensive product
select "ProductName", "Price"
from products
where "Price" = (select min("Price")
				 from products);

-- What is the average price of products?
select round(avg("Price"),2) as "Average_Price"
from products;

-- What products have names starting with “T”?
select "ProductName"
from products
where "ProductName" like 'T%';

-- Find the different properties that have made orders.
select distinct("PropertyID")
from orders;

-- Find the five least expensive products
select "ProductName", "Price"
from products
order by "Price"
limit 5;

-- All properties in alphabetical order of their city names.
select *
from propertyinfo
order by "PropertyCity";

-- The name and category of the most expensive product
select "ProductName", "ProductCategory", "Price"
from products
order by "Price" desc
limit 1;

-- The name and category of product whose price is $300
select "ProductName", "ProductCategory", "Price"
from products
where "Price" = 300;

-- Orders by properties that are not 14, 16, and 10
select "OrderID", "PropertyID"
from orders
where not "PropertyID" in (14,16,10);

----------OR-----------

select "OrderID", "PropertyID"
from orders
where "PropertyID" not in (14,16,10);

-- Total amount all products will be worth if there were just 5 of it in the store
select "ProductName", "Price", 5* "Price" as "PriceOf5"
from products;

Select sum(5*"Price") as "TotalAmount"
from products;

-- What is the most purchased product?
select "ProductID", sum("Quantity") as "TotalQuantity"
from orders
group by "ProductID"
order by "TotalQuantity" desc
limit 1;

-- What is the least purchased product?
select "ProductID", sum("Quantity") as "TotalQuantity"
from orders
group by "ProductID"
order by "TotalQuantity" asc
limit 1;

-- What is the average price of products for each product category?
select "ProductCategory", round(avg("Price"),2) as "AveragePrice"
from products
group by "ProductCategory";

-- How many products are soaps?
select count("ProductName")
from products
where "ProductName" ilike '%Soap%';

-- What is the average price of envelopes?
select "ProductName", round(avg("Price")) as "AveragePrice"
from products
group by "ProductName"
having "ProductName" ilike '%Envelopes%';

-- What is the cheapest envelope?
select "ProductName", "Price"
from products
where "ProductName" ilike '%Envelope%'
order by "Price"
limit 1;

-- We want to find the the average price of housekeeping products.
select "ProductCategory", round(avg("Price"),2) as "AveragePrice"
from products
group by "ProductCategory"
having "ProductCategory" = 'Housekeeping';