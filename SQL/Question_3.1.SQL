WITH ProductRevenue AS (
SELECT
p.Category,
p.ProductName,
SUM(s.TotalSales) AS TotalRevenue,
RANK() OVER (
PARTITION BY p.Category
ORDER BY SUM(s.TotalSales) DESC) AS RevenueRank
FROM Sales s
INNER JOIN Products p
ON s.ProductID = p.ProductID
GROUP BY p.Category, p.ProductName)
SELECT Category,productName,totalRevenue
FROM ProductRevenue
WHERE RevenueRank = 1;
