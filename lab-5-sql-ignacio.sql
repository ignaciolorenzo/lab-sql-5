use sakila;

-- 1. Drop column `picture` from `staff`.
alter table staff
drop picture;

-- 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
select * 
from customer
where first_name="TAMMY" and last_name="SANDERS";

insert into staff(first_name, last_name, email, address_id, store_id, username)
values("TAMMY", "SANDERS", "TAMMY.SANDERS@sakilacustomer.org", 79, 2, "Tammy");

-- code shows the following error. I do not know how to solve it
-- Cannot add or update a child row: a foreign key constraint fails (`sakila`.`staff`, CONSTRAINT `fk_staff_store` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE RESTRICT ON UPDATE CASCADE)

-- 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the `rental_date` column in the `rental` table.
select *
from rental;

select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER'; -- output, 3

select staff_id from staff
where first_name = 'MIKE'; -- MO OUTPUT, USE 6 RANDOMLY	

select film_id from film
where title = 'Academy Dinosaur'; -- output, 1

select inventory_id 
from `inventory`
where film_id=1 and `store_id`=1; -- output: 1,2,3,4 --> will use 4

insert into rental(rental_date, inventory_id, customer_id, staff_id)
values(now(), 4, 130, 6);

select *
from `customer`;

-- output shows error; Cannot add or update a child row: a foreign key constraint fails (`sakila`.`rental`, CONSTRAINT `fk_rental_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE RESTRICT ON UPDATE CASCADE)

-- 4. Delete non-active users, but first, create a _backup table_ `deleted_users` to store `customer_id`, `email`, and the `date` for the users that would be deleted. Follow these steps:

select *
from customer;

create table deleted_users as
select customer_id, email, create_date
from customer
where active=false;