/*
CHALLENGE 8
Find customers who have returned rentals late 10 times or more, so that
you can send them a mailer about your new loyalty program that will charge
no late fees as long as they're part of the program
*/

SELECT 	first_name, last_name, COUNT(*) AS late_returns
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
HAVING COUNT(*) >= 10