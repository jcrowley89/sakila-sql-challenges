/*
CHALLENGE 4
Venezuela is in hard times and need some video rental donations from
Australia and New Zealand. List managers, location and store information 
for these 3 countries.
*/

SELECT a.address, a.address2, city.city city, c.country, CONCAT(staff.first_name, ' ', staff.last_name) manager FROM store s
INNER JOIN address a ON s.address_id = a.address_id
INNER JOIN city ON a.city_id = city.city_id
INNER JOIN country c ON city.country_id = c.country_id
INNER JOIN staff ON s.manager_staff_id = staff.staff_id
WHERE c.country_id = 8 OR c.country_id = 68 OR c.country_id = 104