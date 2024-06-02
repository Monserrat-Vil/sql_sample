SELECT customer.first_name
	, customer.last_name
	, film.title
	, rental.rental_date
	, rental.return_date
	, payment.amount
	, payment.payment_date
FROM customer
	INNER JOIN rental
	ON rental.customer_id = customer.customer_id
-- We're using INNER JOIN because we only want to return records where 
-- a customer definitely made a rental.
	INNER JOIN inventory
	ON inventory.inventory_id = rental.inventory_id
-- We use INNER JOIN cause we only want rentals that were in inventory.
	INNER JOIN film
	ON film.film_id = inventory.film_id
	LEFT JOIN payment
-- It is crucual add rental to the payment to avoid duplicate records.
	ON payment.rental_id = rental.rental_id
	AND payment.customer_id = customer.customer_id
WHERE customer.customer_id = 336
ORDER BY rental.rental_date