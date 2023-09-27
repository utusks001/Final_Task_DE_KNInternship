# import library mysql connector
import mysql.connector

# Connection setup configuration and testing
con = mysql.connector.connect(user='root',password='12345',port='3306',host='localhost',database='kalbe')
if con.is_connected():
    print('Connected')
# Create Object cursor
cursor = con.cursor()

# Add Value to Inventory Table of KALBE Database
insert_sql = ("INSERT INTO inventory(item_code,item_name,item_price,item_total) VALUES ('2346','Fitbar',15000,200)")
#values = ('2346','Fitbar',15000,200)

try:
    #Execute to insert
    cursor.execute(insert_sql)
    con.commit()
    print('Insert into Inventory Table has succeeded.....!!!')

except:
    #Rollback if  any issues
    con.rollback()
    raise

finally:
    #Close connection
    con.close()