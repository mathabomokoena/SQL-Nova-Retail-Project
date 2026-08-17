select ProductCategory,
AVG(Rating) AS AverageRating,
count(*) AS NumberOfReviews
from customer_feedback
group by ProductCategory
Having count(*) >= 50
order by AverageRating DESC;
