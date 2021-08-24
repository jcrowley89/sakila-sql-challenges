/*
CHALLENGE 2
You're looking for a movie to watch with your nephew - find a unique list
of movies that are classified as Children or Comedy
*/

SELECT f.title, c.name FROM film_category fc
INNER JOIN film f ON fc.film_id = f.film_id
INNER JOIN category c ON fc.category_id = c.category_id
WHERE c.category_id = 3 OR c.category_id = 5