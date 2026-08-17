SELECT
CASE
WHEN ((p.UnitPrice - s.UnitPrice) / p.UnitPrice) * 100 = 0
THEN '0%'
WHEN ((p.UnitPrice - s.UnitPrice) / p.UnitPrice) * 100 BETWEEN 1 AND 10
THEN '1-10%'
WHEN ((p.UnitPrice - s.UnitPrice) / p.UnitPrice) * 100 BETWEEN 11 AND 20
THEN '11-20%'
WHEN ((p.UnitPrice - s.UnitPrice) / p.UnitPrice) * 100 BETWEEN 21 AND 30
THEN '21-30%'
ELSE 'Above 30%'
END AS DiscountBand,
SUM(s.TotalSales) AS TotalSales,
SUM(s.Profit) AS TotalProfit,
ROUND(
(SUM(s.Profit) * 100.0) /
NULLIF(SUM(s.TotalSales), 0),
2
) AS ProfitMarginPercent
FROM Sales s
INNER JOIN Products p
ON s.ProductID = p.ProductID
GROUP BY
CASE
WHEN ((p.UnitPrice - s.UnitPrice) / p.UnitPrice) * 100 = 0
THEN '0%'
WHEN ((p.UnitPrice - s.UnitPrice) / p.UnitPrice) * 100 BETWEEN 1 AND 10
THEN '1-10%'
WHEN ((p.UnitPrice - s.UnitPrice) / p.UnitPrice) * 100 BETWEEN 11 AND 20
THEN '11-20%'
WHEN ((p.UnitPrice - s.UnitPrice) / p.UnitPrice) * 100 BETWEEN 21 AND 30
THEN '21-30%'
ELSE 'Above 30%'
END
ORDER BY DiscountBand;
