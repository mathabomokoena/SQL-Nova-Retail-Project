SELECT
p.ProductName,
p.Category,
SUM(s.TotalSales) AS TotalSales,
SUM(s.Profit) AS TotalProfit,
ROUND(
(SUM(s.Profit) * 100.0) /
NULLIF(SUM(s.TotalSales), 0), 2
) AS ProfitMarginPercent
FROM Sales s
INNER JOIN Products p
ON s.ProductID = p.ProductID
GROUP BY
p.ProductName,
p.Category
ORDER BY ProfitMarginPercent DESC;
