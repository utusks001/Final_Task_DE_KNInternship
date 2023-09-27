# Choose Database

USE kalbe;

# create table customer orders

CREATE TABLE customer_orders(
	order_no varchar(10) NOT NULL,
	purchase_amount int NOT NULL DEFAULT 0,
	order_date date NOT NULL,
	customer_id varchar(10) NOT NULL,
	salesman_id varchar(10) NOT NULL,
	PRIMARY KEY (order_no),
	UNIQUE KEY order_unique (order_no)
)ENGINE = InnoDB;

# Insert Records

INSERT INTO customer_orders(order_no, purchase_amount, order_date, customer_id, salesman_id)
values ('10001',150,'2022-10-05','2005','3002'),
	   ('10009',270,'2022-09-10','2001','3005'),
	   ('10002',65,'2022-10-05','2002','3001'),
	   ('10004',110,'2022-08-17','2009','3003'),
	   ('10007',948,'2022-09-10','2005','3002'),
	   ('10005',2400,'2022-07-27','2007','3001');

# show and cross check all inserted data on customer_orders table
SELECT *
FROM customer_orders

# Query to display all customer orders where purchase amount is less than 100 or exclude
# those orders which order date is on or greater than 25 Aug 2022 and customer id is above 2001.
	  
SELECT *
FROM customer_orders as co
WHERE (purchase_amount < 100) OR ((order_date < '2022-08-25')
	AND (customer_id <= '2001'));
	
