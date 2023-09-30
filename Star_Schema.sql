CREATE TABLE Suppliers 
(
	supplier_id int NOT NULL PRIMARY KEY,
	supplier_name varchar(50) NOT NULL,
	contact_name varchar(50),
	UNIQUE KEY supplier_unique (supplier_id)
);

CREATE TABLE Stores 
(
	store_id int NOT NULL PRIMARY KEY,
	store_name varchar(50) NOT NULL,
	contact_name varchar(50) NOT NULL,
	contact_number varchar(20) NOT NULL,
	address varchar(50) NOT null,
	UNIQUE KEY store_unique (store_id)
);

CREATE TABLE Customers 
(
	customer_id int NOT NULL PRIMARY KEY,
	customer_name varchar(50) NOT NULL,
	address varchar(50) NOT NULL,
	city varchar(50) NOT NULL,
	zip_code varchar(10) NOT null,
	UNIQUE KEY customer_unique (customer_id)
);

CREATE TABLE Sales 
(
	sales_id int NOT NULL PRIMARY KEY,
	store_id int NOT NULL,
	supplier_id int NOT NULL,
	customer_id int NOT NULL,
	item_id int NOT NULL,
	date_id int NOT NULL,
	discount float NOT NULL default 0.0,
	quantity_sold int NOT NULL default 0,
	revenue int NOT NULL default 0,
	UNIQUE KEY sales_unique (sales_id)
);

CREATE TABLE Items
(
	item_id int NOT NULL PRIMARY KEY,
	item_name varchar(50) NOT NULL,
	item_price int NOT NULL,
	item_code varchar(20) NOT NULL,
	item_description varchar(50) NOT NULL,
	UNIQUE KEY item_unique (item_id)
);

CREATE TABLE Dates 
(
	date_id int NOT NULL PRIMARY KEY,
	date datetime NOT NULL,
	year int NOT NULL,
	month int NOT NULL,
	day int NOT NULL,
	hour int NOT NULL,
	minute int NOT NULL,
	holiday varchar(50) NOT null,
	UNIQUE KEY date_unique (date_id)
);