DROP DATABASE IF EXISTS bamazon_db;
CREATE DATABASE bamazon_db;
USE bamazon_db;
CREATE TABLE products (
  item_id INT NOT NULL,
  product_name VARCHAR(100) NULL,
  department_name VARCHAR(100) NULL,
  price DECIMAL(10,2) NULL,
  stock_quantity INT NULL,
  PRIMARY KEY (position)
);

SELECT * FROM top5000;

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("AA Batteries", "Electronics", 3.99, 100);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Eye Drops", "Pharmacy", 2.99, 50);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Drinking Straws", "Paper Goods", .99, 5000);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Unsalted Popcorn", "Grocery", 2.99, 20);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("", "", .99, 100);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("", "", .99, 100);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("", "", .99, 100);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("", "", .99, 100);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("", "", .99, 100);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("", "", .99, 100);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("", "", .99, 100);

INSERT INTO products (name, has_pet, pet_name, pet_age)
VALUES ("Ahmed", TRUE, "Rockington", 100);

INSERT INTO products (name, has_pet, pet_name, pet_age)
VALUES ("Jacob", TRUE, "Misty", 10);

INSERT INTO products (name, has_pet)
VALUES ("Peter", false);

-- Updates the row where the column name is peter --
UPDATE products
SET has_pet = true, pet_name = "Franklin", pet_age = 2
WHERE name = "Peter";
