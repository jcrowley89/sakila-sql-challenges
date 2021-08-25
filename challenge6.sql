/*
CHALLENGE 6
Those wacky Australians have outlawed horror movies - find the inventory
unique identifiers and associated film names so that you can pull the
titles and put them in storage until the Australian legislature comes 
to their senses.
*/

SELECT i.inventory_id, f.title, c.name category FROM inventory i
LEFT JOIN film f ON i.film_id = f.film_id
LEFT JOIN film_category fc ON fc.film_id = f.film_id
LEFT JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Horror'