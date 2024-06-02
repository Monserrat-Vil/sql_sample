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
	INNER JOIN inventory
	ON inventory.inventory_id = rental.inventory_id
	INNER JOIN film
	ON film.film_id = inventory.film_id
	LEFT JOIN payment
-- It is crucual add rental to the payment to avoid duplicate records.
	ON payment.rental_id = rental.rental_id
	AND payment.customer_id = customer.customer_id
WHERE payment.rental_id is null
-- Now you use ANTI JOIN by adding a null condition. 
-- Only return those records where data does not exist. 
ORDER BY rental.rental_date