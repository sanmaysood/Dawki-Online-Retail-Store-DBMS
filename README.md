# Dawki-Online-Retail-Store-DBMS

Dawki Store CLI
This is a command-line interface (CLI) application for Dawki Store, an online store that allows customers to create accounts, browse and purchase products, manage their orders, and perform various administrative tasks. The application is built using Python and MySQL.
Prerequisites
Python 3.x
MySQL database
Installation
Clone or download the repository to your local machine.
Install the required dependencies using the following command:
pip install mysql-connector-python
Update the MySQL database connection details in the code:
Host: localhost
User: root
Password: [your_mysql_password]
Database: dawki
Usage
Open a command-line interface or terminal.
Navigate to the directory where the code is located.
Run the following command to start the application:
python cli_app.py
Follow the prompts to interact with the Dawki Store application.

Features
Admin
Create a new customer account
Enter a new product
Display all customers
Display all products
Test the triggers
Display all orders made through cash on delivery
Show the number of customers having a particular membership status
Print all the customer details along with the delivery agent assigned to their order
Run OLAP queries
Change the price of a product
Change the order assigned to a delivery agent

Customer
Change delivery address
Change mobile number
Change password
Change email address
Change username
Change membership status
Display cart
Add product to cart
Add money to wallet
Show the delivery agent details
Checkout
Remove product from cart
View order history
Check wallet balance
Search a product
Empty cart


Database Schema 
This is a brief overview of the database schema implemented using the given SQL statements. The schema consists of multiple tables with their respective columns, constraints, and relationships.
price_change: This table stores information about price changes for products. It includes the product_id, old_price, and new_price.
customers: The customers table holds customer information such as customer_id, username, delivery_address, pass, membership_status, email_id, and mobile_number.
delivery_agent: This table represents delivery agents and their details. It includes agent_id, customer_id, order_id, rating, mobile_number, fname, mname, and lname.
Admins: The Admins table contains information about administrators, including admin_id, order_id, product_id, username, and pass.
orders: This table tracks customer orders with order_id, product_id, order_total, mode_of_payment, and no_of_days_to_deliver.
product: The product table stores product information, including product_id, product_name, product_price, product_stock, and product_rating.
cart: This table represents the shopping cart and includes product_id, customer_id, product_quantity, cart_total, and coupon.
wallet: The wallet table manages customer transactions and their balances. It includes customer_id, transaction_amount, and balance.
delivery_system: This table handles the delivery process, connecting orders, delivery agents, and administrators. It includes order_id, agent_id, and admin_id.


