WITH CustomerOrders AS (
SELECT
cf.CustomerID,
CASE
WHEN cf.Rating >= 4 THEN 'Highly Satisfied (4-5)'
ELSE 'Less Satisfied (1-3)'
END AS SatisfactionGroup,
COUNT(DISTINCT s.OrderID) AS TotalOrders
FROM customer_feedback cf
INNER JOIN Sales s
ON cf.CustomerID = s.CustomerID
GROUP BY
cf.CustomerID,
CASE
WHEN cf.Rating >= 4 THEN 'Highly Satisfied (4-5)'
ELSE 'Less Satisfied (1-3)'
END
)
SELECT
SatisfactionGroup,
ROUND(AVG(TotalOrders), 2) AS AvgOrdersPerCustomer,
COUNT(CustomerID) AS TotalCustomers
FROM CustomerOrders
GROUP BY SatisfactionGroup;
