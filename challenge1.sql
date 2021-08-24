/*
CHALLENGE 1
You're going to send out a going-out-of-business post card to all 
currently active customers and you need a unique identifier for each
customer to keep track of who has been contacted, their name and their
email address
*/

SELECT customer_id, CONCAT(first_name, last_name), email FROM customer
