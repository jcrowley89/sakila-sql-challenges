/*
CHALLENGE 9
Find the top 10 worst offending customers when it comes to late returns as
measured by # of late returns and total number of days late (multiply 
these 2 factors together for comparison)
*/

SELECT 	first_name, last_name, COUNT(*) * SUM(days_late) AS late_factor
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
ORDER BY COUNT(*) * SUM(days_late) DESC --can this be DRYed up a little??