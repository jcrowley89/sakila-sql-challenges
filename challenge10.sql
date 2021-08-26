/*
CHALLENGE 10
You're the franchise owner and you suspect that Mike may be cutting a 
discount too often to his friends that are customers. Find all unpaid or 
underpaid rentals processed by Mike.
*/

SELECT c.first_name AS customer_first_name, c.last_name AS customer_last_name, s.first_name AS staff_first_name, 
	s.last_name AS staff_last_name, p.amount AS payment_amount,
	f.rental_rate * f.rental_duration AS rental_cost 
FROM payment p
LEFT JOIN customer c
ON p.customer_id = c.customer_id
LEFT JOIN rental r
ON p.rental_id = r.rental_id
LEFT JOIN inventory i
ON r.inventory_id = i.inventory_id
LEFT JOIN film f
ON i.film_id = f.film_id
LEFT JOIN staff s ON r.staff_id = s.staff_id
WHERE p.payment_date IS NULL OR p.amount < f.rental_rate * f.rental_duration AND s.staff_id = 1

--SELECT * FROM staff