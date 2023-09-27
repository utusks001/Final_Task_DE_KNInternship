# Create a database with ‘KALBE’ as the name. 

CREATE DATABASE KALBE;

USE KALBE;

# Create table inventory

CREATE TABLE Inventory(
	item_code varchar(5) NOT NULL,
	item_name varchar(50) NOT NULL,
	item_price int NOT NULL DEFAULT 0,
	item_total int NOT NULL DEFAULT 0,
	PRIMARY KEY (item_code),
	UNIQUE KEY item_unique (item_code)
)ENGINE = InnoDB;

SHOW tables;

# Insert Records

INSERT INTO Inventory (item_code, item_name, item_price, item_total)
values ('2341','Promag Tablet',3000,100),
	   ('2342','Hydro Coco 250ML',7000,20),
	   ('2343','Nutrive Benecol 100ML',20000,30),
	   ('2344','Blackmores Vit C 500Mg',95000,45),
	   ('2345','Entrasol Gold 370G',90000,120);


# show and cross check all inserted data on Inventory table
SELECT *
FROM Inventory;


# Show item_name Show Item_name that has the highest number in Item_total.

SELECT item_name, item_total
FROM Inventory
WHERE item_total = (SELECT max_total_item FROM
				   (SELECT max(item_total) as max_total_item FROM inventory)
				   as max);

# Update the Item_price of the output of question bullet

WITH item_total_max AS (
    SELECT MAX(item_total) as max_total
    FROM Inventory
)
UPDATE Inventory
JOIN item_total_max
ON Inventory.item_total = item_total_max.max_total
set Inventory.item_price = '100000';

/*What will happen if we insert another Item_name
with Item_code of 2343 into the table? */

INSERT INTO Inventory (item_code, item_name, item_price, item_total)
values ('2343','Fitbar',3000,100);

-- >>> SQL Error [1062] [23000]: Duplicate entry '2343' for key 'inventory.PRIMARY'

# Delete the Item_name that has the lowest number of Item_total.

DELETE FROM Inventory
WHERE item_total = (SELECT min_item_total FROM (SELECT min(item_total)
					as min_item_total FROM inventory) as subquery);
				
DELETE FROM Inventory
WHERE item_code = '2346';

# show after deleting data on Inventory table
SELECT *
FROM Inventory;				