/* Author: Mon
About: This SQL selects a list of actors and actresses, 
grouped by fisrt and last name.
CHANGE LOG 
mm/dd/yyyy: Mon added comments
*/
SELECT 
	first_name
	, last_name
	--, actor_id
	, COUNT (1) 
FROM actor
WHERE last_name IN (
		'Allen'
		, 'Ball'
		/*, 'Cruise'
		, 'Jackman'*/
)
GROUP BY first_name
	, last_name
	--, actor_id
ORDER BY 2 DESC
	, 1 DESC;

