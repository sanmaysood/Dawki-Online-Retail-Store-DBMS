import mysql.connector

# establish connection with the database
mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="Sanmaysud1012",
  database="dawki"
)

my_cursor = mydb.cursor()


# function to create a new customer account
def create_customer_account():
    customer_id=input("Enter customer id: ")
    username = input("Enter your username: ")
    delivery_address = input("Enter your delivery address: ")
    password = input("Enter your password: ")
    email = input("Enter your email: ")
    mobile_number = input("Enter your mobile number: ")
    cursor = mydb.cursor()
    sql = "INSERT INTO customers (customer_id,username, delivery_address, pass, email_id, mobile_number) VALUES (%s,%s, %s, %s, %s, %s)"
    val = (customer_id,username, delivery_address, password, email, mobile_number)
    cursor.execute(sql, val)
    mydb.commit()
    print(cursor.rowcount, "Record inserted successfully.")

# function to create a new product
def create_product():
    product_id=input("Enter the product id: ")
    product_name = input("Enter the product name: ")
    product_price = input("Enter the product price: ")
    product_stock = input("Enter the product stock: ")
    product_rating = input("Enter the product rating: ")
    cursor = mydb.cursor()
    sql = "INSERT INTO product (product_id,product_name, product_price, product_stock, product_rating) VALUES (%s,%s, %s, %s, %s)"
    val = (product_id,product_name, product_price, product_stock, product_rating)
    cursor.execute(sql, val)
    mydb.commit()
    print(cursor.rowcount, "Record inserted successfully.")

# function to display all customers
def display_customers():
    cursor = mydb.cursor()
    cursor.execute("SELECT * FROM customers")
    result = cursor.fetchall()
    print("ID || Username || Delivery_Address || Password || Membership || Email_id || Mobile_number")
    for id,name,add,password,status,email,mobile in result:
        print(f"{id} || {name} || {add} || {password} || {status} || {email} || {mobile}")
        

# function to display all products
def display_products():
    cursor = mydb.cursor()
    cursor.execute("SELECT * FROM product")
    result = cursor.fetchall()
    print("ID ||   Product_Name   || Price || Stock || Rating")
    for id,name,price,stock,rating in result:
        print(f"{id} || {name} || {price} || {stock} || {rating}")
        

def change_address(customer_id):
    new_address = input("Enter your new address: ")
    sql = "UPDATE customers SET delivery_address = %s WHERE customer_id = %s;"
    val = (new_address, customer_id)
    my_cursor.execute(sql, val)
    mydb.commit()
    print(my_cursor.rowcount, "Address updated successfully.")


def change_mobile(customer_id):
    new_mobile = input("Enter your new mobile number: ")
    sql = "UPDATE customers SET mobile_number = %s WHERE customer_id = %s;"
    val = (new_mobile, customer_id)
    my_cursor.execute(sql, val)
    mydb.commit()
    print(my_cursor.rowcount, "Mobile number updated successfully.")


def change_password(customer_id):

    old_password = input("Enter your old password: ")
    new_password = input("Enter your new password: ")
    sql = "SELECT pass FROM customers WHERE customer_id = %s;"
    my_cursor.execute(sql, (customer_id,))
    result = my_cursor.fetchall()
    if old_password == result[0][0]:
        query = "UPDATE customers SET pass = %s WHERE customer_id = %s;"
        my_cursor.execute(query, (new_password, customer_id))
        mydb.commit()
        print(my_cursor.rowcount, "Password updated successfully.")


def display_cart(customer_id):
    
    query = "SELECT * FROM cart WHERE customer_id = %s;"
    my_cursor.execute(query, (customer_id,))
    result = my_cursor.fetchall()
    print("Product_id || Customer_id || Quantity || Cart_Total || Coupon")
    for pid,cid,quantity,total,coupon in result:
        print(f"{pid} || {cid} || {quantity} || {total} || {coupon}")

def change_price():
    product_id = input("Enter the product id: ")
    new_price = input("Enter the new price of the product: ")
    sql = "UPDATE product SET product_price = %s WHERE product_id = %s;"
    val = (new_price, product_id)
    my_cursor.execute(sql, val)
    mydb.commit()
    print(my_cursor.rowcount, "Price updated successfully.")

def add_money(customer_id):
    
    amount = input("Enter the amount you want to add: ")
    sql = "UPDATE wallet SET balance = balance + %s WHERE customer_id = %s;"
    val = (amount, customer_id)
    my_cursor.execute(sql, val)
    mydb.commit()
    print(my_cursor.rowcount, "Money added successfully.")


def show_delivery_agent_details(customer_id):
    
    query = "SELECT * FROM delivery_agent WHERE customer_id = %s;"
    my_cursor.execute(query, (customer_id,))
    result = my_cursor.fetchall()
    print("Agent_id || Customer_id || Order_id || Rating || Number || First_name || Middle_name || Last_name")
    for aid,cid,oid,rating,number,fname,mname,lname in result:
        print(f"{aid} || {cid} || {oid} || {rating} || {number} || {fname} || {mname} || {lname}")

def change_email(customer_id):
    new_email = input("Enter your new email: ")
    sql = "UPDATE customers SET email_id = %s WHERE customer_id = %s;"
    val = (new_email, customer_id)
    my_cursor.execute(sql, val)
    mydb.commit()
    print(my_cursor.rowcount, "Email updated successfully.")

def change_username(customer_id):
    new_username = input("Enter your new username: ")
    sql = "UPDATE customers SET username = %s WHERE customer_id = %s;"
    val = (new_username, customer_id)
    my_cursor.execute(sql, val)
    mydb.commit()
    print(my_cursor.rowcount, "Username updated successfully.")

def change_membership_status(customer_id):
    new_membership = input("Enter your new membership status: ")
    sql = "UPDATE customers SET membership_status = %s WHERE customer_id = %s;"
    val = (new_membership, customer_id)
    my_cursor.execute(sql, val)
    mydb.commit()
    print(my_cursor.rowcount, "Membership status updated successfully.")



def empty_cart(customer_id):

    query = "DELETE FROM cart WHERE customer_id = %s;"
    my_cursor.execute(query, (customer_id,))
    mydb.commit()
    print(my_cursor.rowcount, "Cart emptied successfully.")


def update_transaction_amount(customer_id):
    # initialize transaction amount to 0
    query = "UPDATE wallet SET transaction_amount = 0 WHERE customer_id = %s;"
    my_cursor.execute(query, (customer_id,))
    mydb.commit()
    query = "UPDATE wallet SET transaction_amount = transaction_amount + (SELECT cart_total FROM cart WHERE customer_id = %s) WHERE customer_id = %s;"
    my_cursor.execute(query, (customer_id, customer_id))
    mydb.commit()
    print(my_cursor.rowcount, "Transaction amount updated successfully.")

def checkout(customer_id):
    ans = input("Do you want to checkout? (y/n): ")
    if ans == 'y':

        update_transaction_amount(customer_id)
        query = "SELECT transaction_amount, balance FROM wallet WHERE customer_id = %s;"
        my_cursor.execute(query, (customer_id,))
        result = my_cursor.fetchall()
        transaction_amount =  result[0][0]
        balance = result[0][1]
        print("Transaction amount: ", transaction_amount)
        print("Wallet balance: ", balance)
        if transaction_amount > balance:
            print("Insufficient balance in wallet. Please add money to your wallet.")
            return
        
        sql = "UPDATE wallet SET balance = balance - transaction_amount WHERE customer_id = %s;"
        my_cursor.execute(sql, (customer_id,))
        mydb.commit()
        print("Transaction successful")
        query = "UPDATE wallet SET transaction_amount = 0 WHERE customer_id = %s;"
        my_cursor.execute(query, (customer_id,))
        mydb.commit()
        print("Transaction amount reset to 0 and wallet balance updated.")
        print("Updated Wallet balance: ", balance - transaction_amount)
        empty_cart(customer_id)
        print("Thank you for shopping with us.")

    else:
        print("Transaction cancelled.")
        
        

def execute_trigger1():

    sql = """  CREATE TRIGGER membership_status AFTER UPDATE ON customers
FOR EACH ROW
BEGIN
  IF NEW.membership_status != OLD.membership_status THEN
    UPDATE cart
    SET coupon =
      CASE NEW.membership_status
        WHEN 'ELITE' THEN 9.8
        WHEN 'PRIME' THEN 5.5
        ELSE 0
      END
    WHERE customer_id = NEW.customer_id;
  END IF;
END;    """
    
    my_cursor.execute(sql)
    mydb.commit()
    print("Trigger 1 created successfully.")

def execute_trigger2():

    sql = """  

    CREATE TRIGGER price_update AFTER UPDATE ON product 

    FOR EACH ROW 
    BEGIN
    IF NEW.product_price != OLD.product_price THEN
        INSERT INTO price_change (product_id, old_price, new_price)
        VALUES (NEW.product_id, OLD.product_price, NEW.product_price);
    END IF;
    END;
   """
    
    my_cursor.execute(sql)
    mydb.commit()
    print("Trigger 2 created successfully.")

def trigger_test():

    print("1. Update product price")
    print("2. Update membership status")

    choice = input("Enter your choice: ")

    if choice == "1":
        product_id = input("Enter the product id: ")
        new_price = input("Enter the new price of the product: ")
        print()
        sql = "UPDATE product SET product_price = %s WHERE product_id = %s;"
        val = (new_price, product_id)
        my_cursor.execute(sql, val)
        mydb.commit()
        query = "SELECT * FROM price_change WHERE product_id = %s;"
        my_cursor.execute(query,(product_id,))
        result = my_cursor.fetchall()
        print("price_change table")
        print()
        print("Product_id || Old_price || New_price")
        for pid,old,new in result:
            print(f"{pid} || {old} || {new}")

    elif choice == "2":

        customer_id = input("Enter the customer id: ")
        new_status = input("Enter the new status: ")
        q = "SELECT * FROM cart WHERE customer_id = %s;"
        my_cursor.execute(q,(customer_id,))
        result = my_cursor.fetchall()
        print("cart table before trigger") 
        print()
        print("Product_id || Customer_id || Quantity || Cart_Total || Coupon")
        for pid, cid, quantity,total,coupon in result:
            print(f"{pid} || {cid} || {quantity} || {total} || {coupon}")
        
        print()
        print()
        sql = "UPDATE customers SET membership_status = %s WHERE customer_id = %s;"
        val = (new_status, customer_id)
        my_cursor.execute(sql, val)
        mydb.commit()
        query = "SELECT * FROM cart WHERE customer_id = %s;"
        my_cursor.execute(query,(customer_id,))
        result = my_cursor.fetchall()
        print("cart table after trigger")
        print()
        print("Product_id || Customer_id || Quantity || Cart_Total || Coupon")
        for pid, cid, quantity,total,coupon in result:
            print(f"{pid} || {cid} || {quantity} || {total} || {coupon}")



def add_product_to_cart(customer_id):
    product_id = input("Enter the product id: ")
    quantity = input("Enter the quantity: ")
    sql = "SELECT product_stock FROM product WHERE product_id = %s;"
    my_cursor.execute(sql, (product_id,))
    result = my_cursor.fetchall()
    if int(quantity) <= int(result[0][0]):
        q = "SELECT product_price FROM product WHERE product_id = %s;"
        my_cursor.execute(q, (product_id,))
        result = my_cursor.fetchall()
        price = result[0][0]
        total = int(quantity) * int(price)
        if(total > 10000):
            coupon = 9.8
        elif(total > 5000):
            coupon = 5.5
        else:
            coupon = 2.2

        total = str(total)
        coupon = str(coupon)
        sql = "INSERT INTO cart (product_id, customer_id, product_quantity, cart_total, coupon) VALUES (%s, %s, %s, %s, %s);"
        val = (product_id, customer_id, quantity,total, coupon)
        my_cursor.execute(sql, val)
        mydb.commit()
        print("Product added to cart successfully.")
    else:
        print("Sorry, we don't have that much quantity in stock.")


def remove_product_from_cart(customer_id):
    product_id = input("Enter the product id: ")
    sql = "DELETE FROM cart WHERE product_id = %s AND customer_id = %s;"
    val = (product_id, customer_id)
    my_cursor.execute(sql, val)
    mydb.commit()
    print(my_cursor.rowcount, "Product removed from cart successfully.")


def view_order_history(customer_id):
    sql = "SELECT * FROM orders WHERE order_id IN (SELECT order_id FROM delivery_agent WHERE customer_id = %s);)"
    my_cursor.execute(sql, (customer_id,))
    result = my_cursor.fetchall()
    print("Order_id || Product_id || Order_total || mode_of_payment || delivery_date")
    for oid, pid, total, mode, date in result:
        print(f"{oid} || {pid} || {total} || {mode} || {date}")


def check_balance(customer_id):
    sql = "SELECT balance FROM wallet WHERE customer_id = %s;"
    my_cursor.execute(sql, (customer_id,))
    result = my_cursor.fetchall()
    print("Balance")
    for balance in result:
        print(f"{int(balance[0])}")


def change_order():

    agent_id = input("Enter the agent id: ")
    order_id = input("Enter the order id: ")
    sql = "UPDATE delivery_agent SET order_id = %s WHERE agent_id = %s;"
    val = (order_id, agent_id)
    my_cursor.execute(sql, val)
    mydb.commit()
    print("Order changed successfully.")


def search_product():
    name = input("Enter the name of the product: ")
    sql = "SELECT * FROM product WHERE product_name LIKE %s;"
    my_cursor.execute(sql, (name,))
    result = my_cursor.fetchall()
    print("Product_id || Product_name || Product_price || Product_stock || Product_rating")
    for pid, name, price, stock, rating in result:
        print(f"{pid} || {name} || {price} || {stock} || {rating}")
    


# main menu
while True:

    print()
    print("Welcome to Dawki Store!")
    print()
    print("1. Enter as Admin")
    print("2. Enter as Customer")
    print("3. EXIT")
    print()
    choice = input("Enter your choice: ")
    if choice == "1":
        id = int(input("Enter the admin id: "))
        username = input("Enter the username: ")
        password = input("Enter the password: ")
        query = "SELECT username, pass FROM Admins WHERE admin_id = %s;"
        my_cursor.execute(query,(id,))
        result = my_cursor.fetchall()
   

        if username == result[0][0] and password == result[0][1]:
            print("Login successful!")
            print()
            while True:
                print()
                print("1. Create a new customer account")
                print("2. Enter a new product")
                print("3. Display all customers")
                print("4. Display all products")
                print("5. Test the triggers")
                print("6. Display all orders made through cash on delivery")
                print("7. Show the number of customers having a particular membership status")
                print("8. Print all the customer details along with delivery agent assigned for their order")
                print("9. Run OLAP queries")
                print("10. Change the price of a product")
                print("11. Change the order assigned to a delivery agent")
                print("12. Execute trigger 1")
                print("13. Execute trigger 2")
                print("14. EXIT")
                print()
                choice = input("Enter your choice: ")
                if choice == "1":
                    create_customer_account()
                elif choice == "2":
                    create_product()
                elif choice == "3":
                    display_customers()
                elif choice == "4":
                    display_products()
                elif choice == "5":
                    trigger_test()
                elif choice == "6":
                    import embedded_sql1
                elif choice == "7":
                    import embedded_sql2
                elif choice == "8":
                    import embedded_sql3
                elif choice == "9":
                    import olap
                elif choice == "10":
                    change_price()
                elif choice == "11":
                    change_order()
                elif choice == "12":
                    execute_trigger1()
                elif choice == "13":
                    execute_trigger2()
                elif choice == "14":
                    break
        else:
            print("Login failed!")
            break

    elif choice == "2":
        id = int(input("Enter the customer id: "))
        username = input("Enter the username: ")
        password = input("Enter the password: ")
        query = "SELECT username, pass FROM customers WHERE customer_id = %s;"
        my_cursor.execute(query,(id,))

        result = my_cursor.fetchall()
        
        if username == result[0][0] and password == result[0][1]:
            print("Login successful!")
            while True:
                print()
                print("1. Change delivery address")
                print("2. Change mobile number")
                print("3. Change password")
                print("4. Change email address")
                print("5. Change username")
                print("6. Change membership status")
                print("7. Display my cart")
                print("8. Add product to my cart")
                print("9. Add money to my wallet")
                print("10. Show the delivery agent details")
                print("11. Checkout")
                print("12. Remove product from my cart")
                print("13. View order history")
                print("14. Check wallet balance")
                print("15. Search a product")
                print("16. Empty cart")
                print("17. EXIT")
                print()
                choice = input("Enter your choice: ")

                if choice == "1":
                    change_address(id)
                elif choice == "2":
                    change_mobile(id)
                elif choice == "3":
                    change_password(id)
                elif choice == "4":
                    change_email(id)
                elif choice == "5":
                    change_username(id)
                elif choice == "6":
                    change_membership_status(id)
                elif choice == "7":
                    display_cart(id)
                elif choice == "8":
                    add_product_to_cart(id)
                elif choice == "9":
                    add_money(id)
                elif choice == "10":
                    show_delivery_agent_details(id)
                elif choice == "11":
                   checkout(id)
                elif choice == "12":
                    remove_product_from_cart(id)
                elif choice == "13":
                    view_order_history(id)
                elif choice == "14":
                    check_balance(id)
                elif choice == "15":
                    search_product()
                elif choice == "16":
                    empty_cart(id)
                elif choice == "17":
                    break
      
        else:
            print("Login failed!")
            break

    elif choice == "3":
        print("Thank you for visiting Dawki Store!")
        break


    