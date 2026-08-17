select region , count(CustomerID) as customercount 
from customers
group by 1 
