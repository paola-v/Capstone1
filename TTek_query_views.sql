### BASIC QUERIES AND TABLE JOINS ###

# SELECT THE DATABASE

USE traktor_tek_db;

# CHECK THE TABLES
SELECT * FROM sales;
SELECT * FROM sales_team;
SELECT * FROM product;
SELECT * FROM unit_price;
SELECT * FROM sales_period;


# JOIN PRODUCT AND UNIT PRICE
SELECT item_code,
prod_name,
price, 
sales_year,
sales_quarter
FROM unit_price up 
INNER JOIN product p
ON p.prod_id = up.prod_id;

# JOIN THE MAIN TABLES TO PERFORM ANALYSIS ON : SALES_TEAM, SALES, PRODUCT AND UNIT PRICE AND CREATE A TABLE TO USE IN EXCEL, ADD A REVENUE COLUMN 
DROP TABLE ttek_analysis;

#CREATE TABLE IF NOT EXISTS ttek_analysis AS 
SELECT st.emp_id,
st.team_lead,
s.item_code,
p.prod_name,
s.quantity,
up.price,
s.sales_year,
up.sales_quarter,
s.sales_week,
(s.quantity*up.price) AS revenue
FROM sales_team st
INNER JOIN sales s 
ON st.emp_id = s.emp_id
INNER JOIN unit_price up
ON s.item_code_year_quarter = up.item_code_year_quarter
INNER JOIN product p
ON up.prod_id = p.prod_id;











