/*
CHALLENGE 3
Find your top 5 customers as measured by their highest average payment 
...as long as they have rented 3 or more times.
*/

SELECT TOP 5 CONCAT(c.first_name, ' ', c.last_name) customer_name, AVG(p.amount) [average_payment] 
FROM payment p
INNER JOIN customer c ON p.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY average_payment DESC