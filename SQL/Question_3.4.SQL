WITH YearlySales AS (
SELECT
YEAR(OrderDate) AS SalesYear,
SUM(TotalSales) AS TotalSales
FROM Sales
WHERE YEAR(OrderDate) IN (2023, 2024)
GROUP BY YEAR(OrderDate)
)
SELECT
y2023.TotalSales AS Sales2023,
y2024.TotalSales AS Sales2024,
ROUND(
((y2024.TotalSales - y2023.TotalSales) * 100.0)
/ NULLIF(y2023.TotalSales, 0), 2
) AS GrowthPercentage
FROM YearlySales y2023
CROSS JOIN YearlySales y2024
WHERE y2023.SalesYear = 2023
AND y2024.SalesYear = 2024;
