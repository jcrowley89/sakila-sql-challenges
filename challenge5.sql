/*
CHALLENGE 5
List actors and the number of films by rating (R, PG, etc.)
*/

SELECT CONCAT(a.first_name, ' ', a.last_name) actor_name, f.title film_title, f.rating 
FROM actor a
LEFT JOIN film_actor fa ON fa.actor_id = a.actor_id
LEFT JOIN film f ON fa.film_id = f.film_id
ORDER BY  f.rating, a.last_name, a.first_name

--I have spent hours on this and this is the best I can do.





-- Halie's awesome solution:

select a.first_name, a.last_name, f.rating, COUNT(f.title) NumFilms
from actor a
inner join film_actor fa on fa.actor_id = a.actor_id
inner join film f on f.film_id = fa.film_id
group by a.actor_id, a.first_name, a.last_name, f.rating
order by a.actor_id, f.rating