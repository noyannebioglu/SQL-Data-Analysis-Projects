--Fetching the highest age by contact 
select c.*,
max(Age) over(partition by Contact) as salePrice
from dbo.computer c;

--Fetching the average prices by contact name and state
select c.Contact, c.State,
avg(salePrice) over(partition by c.Contact) as salePrice
from dbo.computer c;

select salePrice from dbo.computer;

--RANKING
--Ranking by ProductID
select * from (
select e.*,
rank() over(partition by ProductID order by salePrice desc) as rnk
from dbo.computer e) x
where x.rnk <3;

--FIRST_VALUE
--Return the ProductType that has lowest profit by ProductID
select *,
first_value(ProductType) over(partition by ProductID order by Profit desc) as lowestProfit
from dbo.computer;
----------------
select Contact, Sex, Age,
first_value(Sex) over(
partition by Contact pr
from 
order by Age asc) lowest
from dbo.computer;

--PERCENT RANK
--Comparing the sales price by the highest amount in percentage value
select *,
round(
percent_rank() over (
order by salePrice asc) , 2) pr
from dbo.computer;
--Mick had purchased  the cheapest laptop compare to has the most expensive laptop in the stock

--NTILE
select Contact, Age, State,
NTILE(2) over(order by State desc) state_grp
from dbo.computer;