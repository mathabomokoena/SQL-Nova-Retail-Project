SELECT
c.CustomerID,
CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
c.Region,
c.Channel AS PrimaryChannel,
COUNT(s.OrderID) AS NumberOfOrders,
SUM(s.TotalSales) AS TotalPurchases,
ROUND(AVG(s.TotalSales), 2) AS AverageOrderValue
FROM Customers c
INNER JOIN Sales s
ON c.CustomerID = s.CustomerID
GROUP BY
c.CustomerID,
c.FirstName,
c.LastName,
c.Region,
c.Channel
HAVING COUNT(s.OrderID) > 3
ORDER BY TotalPurchases DESC;
