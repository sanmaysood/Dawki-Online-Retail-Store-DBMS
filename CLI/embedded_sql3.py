import mysql.connector

# Printing the customer details along with delivery agent assigned for their order (for 50 customers):

connection = mysql.connector.connect(user='root', password='Sanmaysud1012', host='localhost', database='dawki')

my_cursor = connection.cursor()

def membership_status():

    sql_query = """ 
            SELECT c.username as customer_name,c.customer_id,c.delivery_address,c.email_id,a.fname as agent_name, a.agent_id ,a.rating as agent_rating FROM customers as c JOIN delivery_agent as a ON c.customer_id = a.customer_id ORDER BY c.customer_id LIMIT 50; 

            """
    try:
        my_cursor.execute(sql_query)
        result = my_cursor.fetchall()
        return result

    except Exception as err:
        print("Error", err)
        return

    

result = membership_status()

print("Cust_name || Cust_id || Residential_Address||Email_id || Agent_name || Agent_id")
print()
for (cust_name,cust_id,address,email,agent_name,agent_id,rating) in result:
        print(f"{cust_name} || {cust_id} || {address} || {email} || {agent_name} || {agent_id} {rating}")
        print()

my_cursor.close()
connection.close()
