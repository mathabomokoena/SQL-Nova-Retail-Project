WITH ProductPerformance AS (
SELECT
p.ProductID,
p.ProductName,
p.Category,
SUM(s.TotalSales) AS TotalRevenue,
SUM(s.Quantity) AS UnitsSold,
SUM(s.Profit) AS TotalProfit,
ROUND((SUM(s.Profit) * 100.0) /
NULLIF(SUM(s.TotalSales), 0), 2) AS ProfitMargin,
ROUND(AVG(cf.Rating), 2) AS AvgRating
FROM Products p
LEFT JOIN Sales s
ON p.ProductID = s.ProductID
LEFT JOIN customer_feedback cf
ON s.OrderID = cf.OrderID
GROUP BY
p.ProductID,
p.ProductName,
p.Category
)
SELECT
ProductID,
ProductName,
Category,
TotalRevenue,
UnitsSold,
TotalProfit,
ProfitMargin,
AvgRating
FROM ProductPerformance
ORDER BY TotalRevenue ASC
LIMIT 5;

Business Recommendations :
Discontinue products that consistently generate low revenue and contribute little to overall business performance. Increase promotions and marketing efforts for products with high customer ratings and strong revenue potential.
Focus inventory and resources on products that are profitable.
