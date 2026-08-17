select year(OrderDate) AS SalesYear,
month(OrderDate) AS SalesMonth,
sum(TotalSales) AS TotalSales
from Sales
where YEAR(OrderDate) = 2024
group by YEAR(OrderDate), month (OrderDate)
order by SalesMonth 
