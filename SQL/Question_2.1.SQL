select category, 
sum(TotalSales) as total_revenue,
sum(Profit) as total_profit
from sales 
inner join products on sales.ProductID = products.ProductID
group by category
order by total_revenue desc 
