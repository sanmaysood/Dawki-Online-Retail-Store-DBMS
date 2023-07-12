import mysql.connector

#How many customers have a membership status of 'PRIME', 'BASIC' or 'ELITE':

connection = mysql.connector.connect(user='root', password='Sanmaysud1012', host='localhost', database='dawki')

my_cursor = connection.cursor()

def membership_status():

    sql_query = """ 
            SELECT membership_status,COUNT(*) FROM customers GROUP BY membership_status; 

            """
    try:
        my_cursor.execute(sql_query)
        result = my_cursor.fetchall()
        return result

    except Exception as err:
        print("Error", err)
        return

    

result = membership_status()

print("Member  No_of_people")
print()
for (status,count) in result:
        print(f"{status}    {count}")
        print()

my_cursor.close()
connection.close()
