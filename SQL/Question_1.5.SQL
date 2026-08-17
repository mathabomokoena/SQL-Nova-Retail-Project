select satisfaction 
from customer_feedback 
group by satisfaction 
order by count(FeedbackID) 
