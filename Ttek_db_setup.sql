### CREATE TRAKTORTEK DATABASE AND LOAD HISTORIC  DATA INTO IT ####

# CREATE THE SCHEMA IF IT DOESN'T EXIST AND ACTIVATE IT

CREATE SCHEMA IF NOT EXISTS traktor_tek_db;
USE traktor_tek_db;


# CREATE THE TABLES AND SET THE PRIMARY AND FOREIGN KEY RELATIONSHIPS BASED ON THE EER DIAGRAM

CREATE TABLE IF NOT EXISTS sales_team (
emp_id	VARCHAR(6) NOT NULL,
team_lead VARCHAR(100),
paygrade VARCHAR(10),
region	VARCHAR(10),
PRIMARY KEY (emp_id)
);

CREATE TABLE IF NOT EXISTS product (
prod_id INT AUTO_INCREMENT PRIMARY KEY,
prod_name VARCHAR(50),
manufacturer VARCHAR(100),
url VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS unit_price (
item_code_year_quarter VARCHAR(20) NOT NULL, 
item_code VARCHAR (10),
price INT, 
sales_year YEAR NOT NULL, 
sales_quarter INT NOT NULL,
prod_id INT,
PRIMARY KEY (item_code_year_quarter)
);

CREATE TABLE IF NOT EXISTS sales_period (
sales_period_id INT AUTO_INCREMENT PRIMARY KEY,
sales_period INT,
sales_year YEAR,
sales_quarter INT, 
sunday_date DATE,
week_0 INT, 
week_1 INT
);

CREATE TABLE IF NOT EXISTS sales (
sales_id INT AUTO_INCREMENT PRIMARY KEY, 
emp_id VARCHAR(6) NOT NULL,
item_code VARCHAR(10) NOT NULL,
quantity INT NOT NULL,
sales_year YEAR NOT NULL,
sales_week INT NOT NULL, 
item_code_year_quarter VARCHAR(20),
sales_period_id INT NOT NULL,
FOREIGN KEY (emp_id) REFERENCES sales_team(emp_id), 
FOREIGN KEY (item_code_year_quarter) REFERENCES unit_price(item_code_year_quarter),
FOREIGN KEY (sales_period_id) REFERENCES sales_period(sales_period_id) 
);

# CREATE TRIGGERS TO UPDATE SALES TABLE WHEN DATA IS ENTERED INTO APP_SALES THROUGH THE UI




# CREATE A TABLE FOR UI DATA
DROP TABLE app_sales;

CREATE TABLE IF NOT EXISTS app_sales(
sales_id INT AUTO_INCREMENT PRIMARY KEY,
emp_id VARCHAR(6) NOT NULL,
item_code VARCHAR(10) NOT NULL,
quantity INT NOT NULL,
sales_year YEAR NOT NULL,
sales_week INT NOT NULL 
);


# CREATE A SALES DUPLICATE TABLE TO TEST TRIGGERS ON

SELECT * FROM app_sales;
SELECT * FROM sales_test;

DROP TABLE sales_test;

CREATE TABLE IF NOT EXISTS sales_test (
sales_id INT AUTO_INCREMENT PRIMARY KEY, 
emp_id VARCHAR(6) NOT NULL,
item_code VARCHAR(10) NOT NULL,
quantity INT NOT NULL,
sales_year YEAR NOT NULL,
sales_week INT NOT NULL); 

DELIMITER //

CREATE TRIGER insert_sales
AFTER INSERT ON app_sales FOR EACH ROW BEGIN
	INSERT INTO sales_test(
		emp_id,
		item_code,
		quantity,
		sales_year,
		sales_week)
		VALUES 
		(new.emp_id,
		new-item_code,
		new.quantity, 
		new.sales_year);
END;
DELIMITER ;	


SELECT * FROM sales;
SELECT * FROM sales_team;
SELECT * FROM product;
SELECT * FROM unit_price;
SELECT * FROM sales_period;
