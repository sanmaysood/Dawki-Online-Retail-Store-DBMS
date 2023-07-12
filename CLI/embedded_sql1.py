import mysql.connector
# import keras

# Showing only the orders that have been made using Cash on Delivery:

connection = mysql.connector.connect(user='root', password='Sanmaysud1012', host='localhost', database='dawki')

my_cursor = connection.cursor()

def COD_orders():

    sql_query = """ SELECT delivery_agent.agent_ID, orders.order_total,orders.mode_of_payment,orders.no_of_days_to_deliver from orders inner join delivery_agent on delivery_agent.order_id = orders.order_id where delivery_agent.Order_ID in 
                (SELECT Order_ID from Orders where Mode_of_Payment = 'Cash on Delivery'); 
            """
    try:
        my_cursor.execute(sql_query)
        result = my_cursor.fetchall()
        return result

    except Exception as err:
        print("Error", err)
        return 

    

result = COD_orders()

print("ID  Order_Total Mode_of_Payment  Delivery")
print()
for (id, total, mode_of_payment, no_of_days) in result:
        print(f"{id}    {total}     {mode_of_payment}     {no_of_days}")
        print()

my_cursor.close()
connection.close()
