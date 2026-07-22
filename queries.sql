-- SELECT COUNT(*) FROM transactions;
-- use credit_card_analysis;
-- select count(*) from transaction;
USE credit_card_analysis;
SELECT COUNT(*) FROM credit_card_transactions;


# Q1: Total spend by category
use credit_card_analysis;
select category, sum(amount) as total_spend
from credit_card_transactions
group by category
order by total_spend desc;



# Q2: Top 10 customers by total spend
select customer_id, SUM(amount) as total_spend
from credit_card_transactions
group by customer_id
order by total_spend desc
limit 10;



#Q3: Monthly spending trend
select month(timestamp) as month, sum(amount) as total_spend
# time duration as monthwise transactions
from credit_card_transactions
group by month(timestamp)
order by month;



#Q4: Average transaction value by category
select category, round(avg(amount), 2) as avg_transaction_value
from credit_card_transactions
group by category
order by avg_transaction_value desc;




#Q5: Which merchant has the highest transaction count
select merchant,  count(*) as transaction_count
from credit_card_transactions
group by merchant
order by transaction_count desc
limit 10;



#Q6: Customers with spend above the overall average
select customer_id, sum(amount) as total_spend
from credit_card_transactions
group by customer_id
having sum(amount) > (
	select avg(amount) * (select count(*) from credit_card_transactions) / (select count(distinct customer_id)  from credit_card_transactions)
	from credit_card_transactions
)
order by total_spend desc;



#Q7: Spend by day of week (weekday vs weekend pattern)
select dayname(timestamp) as day_of_week, sum(amount) AS total_spend, count(*) AS transaction_count
from credit_card_transactions
group by dayname(timestamp)
order by total_spend desc;



#Q8: Frequent vs occasional customers (transaction count buckets)
select customer_id, count(*) as transaction_count,
	case
		when count(*) >= 20 then'Frequant'
        when count(*) >= 10 then 'Regular'
        ELSE 'Occasionl'
	END AS customer_type
from credit_card_transactions
group by customer_id
order by transaction_count desc;



#Q9: Highest single transaction per customer
select customer_id, max(amount) as highest_transaction
from credit_card_transactions
group by customer_id
order by highest_transaction desc
limit 10;




#Q10: Category-wise spend contribution (% of total)
select category,
    sum(amount) as total_spend,
    round(SUM(amount) * 100.0 / (SELECT sum(amount) FROM credit_card_transactions), 2) as pct_of_total
from credit_card_transactions
group by category
order by pct_of_total DESC;



#Q11: Spending trend for top 3 categories over months
select category, month(timestamp) as month, sum(amount) as total_spend
from credit_card_transactions
where category in (
	select category from(
		select category, sum(amount) as cat_total
        from credit_card_transactions
        group by category
        order by cat_total desc
        limit 3
	) as top3
)
group by category, month(timestamp)
order by category, month;
        


#Q12:City-wise spend comparison
select city, sum(amount) AS total_spend, count(*) as transaction_count, round(AVG(amount), 2) as avg_spend
from credit_card_transactions
group by city
order by total_spend DESC;








