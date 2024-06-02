SELECT customer.customer_id
	, customer.first_name
	, customer.last_name
-- How many films has each customer rented?
	, COUNT (*) AS "Count of rentals"
-- How much money has each customer spent?
	, SUM(payment.amount) AS "Total Money Spent"
-- What is the average lenght each customer rented?
	, AVG(film.length) AS "Average Film Length"
-- We use ROUND AND TRUNC respectively	
	, ROUND(AVG(film.length),2) AS "Average Film Length (rounded)"
	, TRUNC(AVG(film.length),2) AS "Average Film Length (truncated)"
	, ROUND(AVG(film.length)) AS "Average Film Length (rounded whole)"
	, TRUNC(AVG(film.length)) AS "Average Film Length (truncated whole)"
-- When was each customer's earliest rental date? 
	, MIN(rental.rental_date) AS "Earliest rental date"
-- When was each customer's most recent rental date? 
	, MAX(rental.rental_date) AS "Latest rental date"
FROM film	
	INNER JOIN inventory
	ON inventory.film_id = film.film_id
	INNER JOIN rental
	ON rental.inventory_id = inventory.inventory_id
	INNER JOIN customer
	ON customer.customer_id = rental.customer_id
	LEFT JOIN payment
	ON payment.rental_id = rental.rental_id
	AND payment.customer_id = customer.customer_id
GROUP BY customer.customer_id
	, customer.first_name
	, customer.last_name
ORDER BY 4 DESC;

	