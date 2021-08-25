/*
CHALLENGE 7
Calculate late fees on the following schedule for late rental returns: 
	- the first and second late day is charged at $1.50 per day
	- 3-5 days late is a flat $8.50 fee
	- 6 or more days late is $12
*/

SELECT * FROM rental 
WHERE return_date IS NULL

--instructions unclear, saving this challenge for later