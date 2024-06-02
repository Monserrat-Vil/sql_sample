-- Find all films that have rental rate higher than the average rental rate.
/*SELECT film.title
	, film.rental_rate
FROM film
WHERE film.rental_rate > (
	-- Here is the subquery or inner query
	SELECT AVG(film.rental_rate)
	FROM film
)
*/
-- Find all customers who rented fimls between two specific dates
SELECT customer.customer_id 
	, customer.first_name
	, customer.last_name
FROM customer
	WHERE customer.customer_id IN (
		--Subquery
		SELECT rental.customer_id
		FROM rental
		WHERE rental.rental_date BETWEEN '2005-05-25' AND '2005-05-26'
	)