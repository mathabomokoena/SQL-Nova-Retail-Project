WITH RegionalSales AS (
SELECT
c.Region,
SUM(s.TotalSales) AS TotalSales,
COUNT(s.OrderID) AS TotalOrders
FROM Sales s
INNER JOIN Customers c
ON s.CustomerID = c.CustomerID
GROUP BY c.Region
)
SELECT
Region,
TotalSales,
TotalOrders,
RANK() OVER (
ORDER BY TotalSales DESC
) AS RegionRank
FROM RegionalSales
ORDER BY RegionRank;
