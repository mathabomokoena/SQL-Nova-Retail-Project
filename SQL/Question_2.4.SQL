select Channel
count(OrderID) AS NumberOfOrders,
AVG(TotalSales) AS AverageOrderValue,
sum (TotalSales) AS TotalRevenue
from Sales
group by Channel
