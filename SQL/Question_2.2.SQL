select Region,
CONCAT(FirstName, ' ', LastName) AS CustomerName,
sum(UnitPrice * Quantity) as purchase_amount
from sales
inner join customers on sales.CustomerID = customers.CustomerID
group by Region, FirstName, LastName
order by Region, purchase_amount desc 
