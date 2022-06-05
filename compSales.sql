SELECT * FROM dbo.computer;
--renaming column
exec sp_rename 'dbo.computer.sss', 'salesID', 'COLUMN'

SELECT sex FROM dbo.computer WHERE sex is null;
SELECT age FROM dbo.computer WHERE age is null;
SELECT Contact FROM dbo.computer WHERE Contact is null;

--Count distinct items
SELECT count(distinct F1) FROM dbo.computer;

--Find earliest and latest years in dataset
SELECT max(distinct Year) FROM dbo.computer;
SELECT min(distinct Year) FROM dbo.computer;


--Show product ype and saleprice for computer with word "top" at the end of ProductType
SELECT ProductType, salePrice 
FROM dbo.computer
WHERE ProductType like '%top';

SELECT * FROM dbo.computer;

--What are the states most products sold?
SELECT State, count(State) FROM dbo.computer 
GROUP BY State ORDER BY count(State) desc;

--Show ages and contact names between 30 and 40
SELECT Contact, Age FROM dbo.computer
WHERE Age between 30 and 40;

--Show contacts that dont have 'n' in their names
SELECT Contact FROM dbo.computer
WHERE Contact not like '%n%';

--Categorizing Records
--Show the total number of customers in each State
--This script also Showing how many times the each customer made puchases
SELECT State, Contact, count(State) as totalAppearNumInState 
FROM dbo.computer
GROUP BY Contact, State;


--Show the total of sales by year
SELECT Year, sum(salePrice) as totalSalesByYear 
FROM dbo.computer
GROUP BY Year;

--What is the cost of products
SELECT ProductType, (salePrice-Profit) as cost
FROM dbo.computer
ORDER BY cost desc;

--What is the %profit and Showing top 10
SELECT top 10 ProductType, (Profit/salePrice)*100 as percentageProfit
FROM dbo.computer
ORDER BY percentageProfit desc;

--Showing the most expensive product
SELECT ProductType, max(salePrice) 
FROM dbo.computer
GROUP BY ProductType