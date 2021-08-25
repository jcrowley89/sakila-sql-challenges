/*
CHALLENGE 7
Calculate late fees on the following schedule for late rental returns: 
	- the first and second late day is charged at $1.50 per day
	- 3-5 days late is a flat $8.50 fee
	- 6 or more days late is $12
*/

SELECT 	first_name, last_name,
	CONCAT( '$', SUM(
		CASE
			WHEN days_late = 1 THEN 150
			WHEN days_late = 2 THEN 300
			WHEN days_late BETWEEN 3 AND 5 THEN 850
			ELSE 1200 
		END)/100) AS late_fees
FROM (
	SELECT p.payment_id, c.first_name, c.last_name, r.rental_date, 
		r.return_date, f.rental_duration,
		DATEDIFF(day, r.rental_date, r.return_date) - f.rental_duration AS days_late
	FROM payment p
	LEFT JOIN customer c
	ON p.customer_id = c.customer_id
	LEFT JOIN rental r
	ON p.rental_id = r.rental_id
	LEFT JOIN inventory i
	ON r.inventory_id = i.inventory_id
	LEFT JOIN film f
	ON i.film_id = f.film_id
	WHERE DATEDIFF(day, r.rental_date, r.return_date) > f.rental_duration
	) as dt
GROUP BY first_name, last_name