-- 1) How many actors are there with the last name 'Wahlberg'?
select count(last_name) as num_of_wahlbergs
from actor
where last_name like 'Wahlberg';

-- 2) How many payments were made between $3.99 and $5.99?
select count(amount) as num_of_payments
from payment
where amount >= 3.99 and amount <= 5.99;

-- 3) What film does the store have the most of?
select film_id, count(film_id) as number_of_copies
from inventory
group by film_id
order by count(film_id) desc
limit 1;

-- 4) How many customers have the last name 'William'?
select count(last_name) as count_of_williams
from customer
where last_name like 'William';

-- 5) What store employee (get the ID) sold the most rentals?
select staff_id, count(rental_id) as total_rentals
from rental
group by staff_id
order by count(rental_id) desc
limit 1;

-- 6) How many different district names are there?
select count(distinct district) as num_of_unique_districts
from address;

-- 7) What film has the most actors in it? (use film_actor table and get film_id)
select film_id, count(distinct actor_id) as unique_actors
from film_actor
group by film_id
order by count(actor_id) desc
limit 1;

-- 8) From store_id 1, how many customer shave a last name ending with 'es'? (use customer table)
select count(last_name) as count_of_customers_ending_in_es
from customer
where store_id = 1 and last_name like '%es';

-- 9) How many payment amounts (4.99, 5.99, etc) had a number of rentals above 250
-- for customers with IDs between 380 and 430? (use group by and having > 250)
select amount as payment_amount, count(amount) as total_rentals
from payment
where customer_id >= 380 and customer_id <= 430
group by amount
having count(rental_id) > 250;

-- 10) Within the film table, how many rating categories are there and what rating has the most movies total?
select rating, count(rating)
from film
group by rating
order by count(rating) desc;
