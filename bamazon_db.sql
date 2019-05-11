DROP DATABASE IF EXISTS bamazon_db;
CREATE DATABASE bamazon_db;
USE bamazon_db;
CREATE TABLE products (
  item_id INT NOT NULL AUTO_INCREMENT,
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
VALUES ("Guitar Strings", "Music", 14.99, 55);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("AAA Batteries", "Electronics", 5.99, 90);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("PV Amplifier", "Music", 199.99, 6);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Synthetic Cocaine", "Pharmacy", .17, 255);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Monkey Wrench", "Hardware", 17.99, 12);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Heavy Duty Paper Towels", "Paper Goods", 8.99, 60);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Avocados", "Grocery", .99, 88);
