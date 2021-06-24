-- 1. Drop column `picture` from `staff`.
-- 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
-- 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the `rental_date` column in the `rental` table.
   -- **Hint**: Check the columns in the table rental and see what information you would need to add there. 
   -- You can query those pieces of information. 
   -- For eg., you would notice that you need `customer_id` information as well.
   -- To get that you can use the following query:


select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';


    -- Use similar method to get `inventory_id`, `film_id`, and `staff_id`.

-- 4. Delete non-active users, but first, create a _backup table_ `deleted_users` to store `customer_id`, `email`, and the `date` for the users that would be deleted. Follow these steps:

   -- 4.1 Check if there are any non-active users
   -- 4.2 Create a table _backup table_ as suggested
   -- 4.3 Insert the non active users in the table _backup table_
   -- 4.4 Delete the non active users from the table _customer_