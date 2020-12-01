import subprocess as sp
import pymysql
import pymysql.cursors
import getpass
import sys
import datetime
from datetime import date
def package_update():

    cid = int(input("please provide your aadhar number:"))
    dig = str(cid);
    while len(dig)!=12:
        print("please enter correct aadhar number")
        cid = int(input("Enter 12 digit aadhar number without spaces: "))
        dig = str(cid);
    print("1.add package")
    print("2.update package")
    print("3.delete package")
    y = int(input("plese provide option:"))
    if(y == 1):
        try:
            print("the available options are:")
            query="SELECT city_name from city;"
            cur.execute(query)
            result=cur.fetchall();
            print("you shouldn't book same type of package(same city and no of days) if you have aldready booked")
            for ans in result:
                print(ans)
                print("TYPE 1 : 1 day cost: 1000 Rs")
                print("TYPE 3 : 3 day cost: 2500 Rs")
                print("TYPE 5 : 5 day cost: 4500 Rs")            
            con.commit()   
            cityn =input("please enter city first letter in caps")
            typeno = input("please give the type number")
            t = int(typeno)
            if( t == 1):
                cost = float(1000)
            elif ( t == 3 ):
                cost = float(2500)
            else :
                cost = float(4500)
            
            typep =typeno+cityn
            start = input("enter start date")
            year,month,date = start.split('-')
            isValidDate = True
            try :
                datetime.datetime(int(year),int(month),int(date))
            except ValueError :
                isValidDate = False
            while isValidDate == False:
                print("entered date is wrong")
                start = input("start date : ")
                year,month,date = start.split('-')
                isValidDate = True
                try :
                    datetime.datetime(int(year),int(month),int(date))
                except ValueError :
                    isValidDate = False

            end = input("end date?")
            year,month,date = end.split('-')
            isValidDate = True
            try :
                datetime.datetime(int(year),int(month),int(date))
            except ValueError :
                isValidDate = False
            while isValidDate == False:
                print("entered date is wrong")
                end = input("end date : ")
                year,month,date = end.split('-')
                isValidDate = True
                try :
                    datetime.datetime(int(year),int(month),int(date))
                except ValueError :
                    isValidDate = False

            query = "INSERT INTO date VALUES ('%s','%s')" % (start,end)
            cur.execute(query)
            con.commit()
        
            transact = "enrolled"
            query = "INSERT INTO Package (cust_id,type,cost,start_date,transaction_status) VALUES ('%d','%s',%f,'%s','%s')"% (cid,typep,cost,start,transact)
            cur.execute(query)
            con.commit()
    
        except Exception as e:
            con.rollback()
            print("Failed ")
            print(">>>>>>>>>>>>>", e)

    if(y == 2):
        try:
            typep = str(input("please enter the package type(no of days and first name of city without spaces) you want to update?"))
            query="SELECT city_name from city;"
            cur.execute(query)
            result=cur.fetchall();
            for ans in result:
                print(ans)
                print("TYPE 1 : 1 day cost: 1000 Rs")
                print("TYPE 3 : 3 day cost: 2500 Rs")
                print("TYPE 5 : 5 day cost: 4500 Rs")            
            con.commit()   
            cityn =input("please enter city first letter in caps")
            typeno = input("please give the type number")
            typef = typeno+cityn
            t = int(typeno)
            if( t == 1):
                cost = float(1000)
            elif ( t == 3 ):
                cost = float(2500)
            else :
                cost = float(4500)
           #start date can not be changed as if you want to change please delete and insert package
           # if(typep == '1C'):
            query = "UPDATE Package set type ='%s' , cost = %f where cust_id = %d and type = '%s';" % (typef,cost,cid,typep)
            cur.execute(query)
            con.commit()
        except Exception as e:
            con.rollback()
            print("Failed ")
            print(">>>>>>>>>>>>>", e)
    if(y == 3):
        try:
            typep = str(input("please enter the package type(no of days and first name of city without spaces) you want to delete?"))
            query = "DELETE from Package where cust_id= %d and type = '%s';" % (cid,typep)
          #  print(query)
            cur.execute(query)
            con.commit()
        except Exception as e:
            con.rollback()
            print("Failed ")
            print(">>>>>>>>>>>>>", e)  
    return;


def Addnewemployee():
    """
    This function is for adding new employees:
    """
    print(" type of employee :\n press 1 for normal employee \n press 2 for travel guide")
    choose=int(input("enter : "))
   
    if choose==1:                 #selected option is normal employee
        try:
            print("Enter new employee details: ")
            id = int(input("aadhar number: "))
            dig = str(id);
            while len(dig)!=12:
                print("please enter correct aadhar number")
                id = int(input("Enter 12 digit aadhar number without spaces: "))
                dig = str(id);
            salary=float(input("salary: "))
            name=input("name: ")
            designation=input("designation: ")
            gender=input("gender: ")
            email=input("email_id: ")
            x = "@" in email and "." in email
            while x == False :
                print("please enter correct email id eg : abc@gmail.com")
                email = input("email id: ")
                x = "@" in email and "." in email
            contact = int(input("contact number: "))
            dig = str(contact)
            while len(dig)!=10:
                print("please enter correct contact number (only 10 digits)")
                contact = int(input("contact number: "))
                dig = str(contact);
            username=input("username: ")
            password=input("password: ")
            dob=input("date_of_birth(YYYY-MM-DD): ")
            year,month,date = dob.split('-')
            isValidDate = True
            try :
                datetime.datetime(int(year),int(month),int(date))
            except ValueError :
                isValidDate = False
            while isValidDate == False:
                print("entered date is wrong")
                dob = input("Birth Date (YYYY-MM-DD): ")
                year,month,date = dob.split('-')
                isValidDate = True
                try :
                    datetime.datetime(int(year),int(month),int(date))
                except ValueError :
                    isValidDate = False

            today=2020
            Age=int(2020)-int(date)

            query = "INSERT INTO Emp_age VALUES ('%s','%d')" % (dob,Age)
            cur.execute(query)
            con.commit()

            query= "INSERT INTO Employee   VALUES (%d , %f , '%s', '%s', '%s', '%s', '%s', '%s','%s' )" % (id,salary,name,designation, gender,email,username,password,dob)
        
            cur.execute(query)
            con.commit()

            query = "INSERT INTO emp_contact VALUES ('%d','%d')" % (id,contact)
            cur.execute(query)
            con.commit()

        
        except Exception as e:
            con.rollback()
            print("Failed to insert into database")
            print(">>>>>>>>>>>>>", e)
        return
    elif choose==2:
        try:
            print("Enter travel guide details: ")
            id = int(input("aadhaar number: "))
            dig = str(id);
            while len(dig)!=12:
                print("please enter correct aadhar number")
                id = int(input("Enter 12 digit aadhar number without spaces: "))
                dig = str(id);
            
            contact = int(input("contact number: "))
            dig = str(contact)
            while len(dig)!=10:
                print("please enter correct contact number (only 10 digits)")
                contact = int(input("contact number: "))
                dig = str(contact);
           
            print("chose citycode from below options ")
            query="SELECT * from city;"
            cur.execute(query)
            result=cur.fetchall();
            for ans in result:
                print(ans)            
            con.commit()
            citycode=input("citycode :")
            door_no=input("door_no: ")
            streetno=input("streetno: ")
            locality=input("locality: ")
            service_cost=float(input("service_cost: "))
            u=input("username: ")
            p=input("password: ")   
            
            query="INSERT INTO travel_guide VALUES (%d ,'%s','%s','%s','%s',%f,'%s','%s')" %(id,citycode,door_no,streetno,locality,service_cost,u,p)
            cur.execute(query)
            con.commit()    
            query = "INSERT INTO guide_contact VALUES ('%d','%d')" % (id,contact)
            cur.execute(query)
            con.commit()
            #multi valued attribute
            i = 0
            langin = int(input("number of languages known: "))
            while (i <  langin) :
                lang = input("enter the languuage: ")
                query = "INSERT INTO languages_known VALUES ('%d','%s')" % (id,lang)
                cur.execute(query)
                con.commit()
                i = i+1
            
        
        except Exception as e:
            con.rollback()
            print("Failed to insert into database")
            print(">>>>>>>>>>>>>", e)
        return 
    else:
        print("invalid selection")
        Addnewemployee()    


def selection():
    """
    Function implements selection query
    """
    print("Displays all customers travelled in Hyderabad ")
    query="SELECT distinct cust_id,fname,mname,lname from Customer natural join Package where type='1H' or type='3H' or type='5H';"
    cur.execute(query)
    result=cur.fetchall();
    for ans in result:
        print(ans)                 
    con.commit()
    return


def projection():
    """
    Function to implement projection query
    """
    print("selects all travel packages with type >=3 days")
    query="SELECT * from Package_type natural join package;"
    cur.execute(query)
    result=cur.fetchall();
    for ans in result:
        if(int(ans["type"][0])>=3):
            print(ans)

    con.commit()
    return

def aggregate():
    #func to implement aggregate 
    print("1) AVG : avg cost to visit and view each city (excluding package)\n")
    query="SELECT avg(avgcost_person),city_code,city_name,state from Are_there_in natural join Places_of_visit natural join City group by city_code ;"
    cur.execute(query)
    result=cur.fetchall();
    for ans in result:
        print(ans)                 
    con.commit()
    
    print('\n \n')
    print(" 2) SUM : No. of customers who travelled alone\n") 
    query="SELECT count(cust_id) AS NO_OF_CUSTOMERS_TRAVELLED_ALONE from family natural join customer where total_no_of_family_members=1; "
    cur.execute(query)
    result=cur.fetchall();
    for ans in result:
        print(ans)                 
    con.commit()
    print('\n \n')
    print("3)MIN: minimum package cost for a customer on a oneday trip to hyderabad.\n")
    query="SELECT min(cost) as min_cost from Package_type where type='1H' or type='3H' or type='5H';"
    cur.execute(query)
    result=cur.fetchall();
    for ans in result:
        print(ans)                 
    con.commit()
    print('\n \n')
    print(" 4)MAX:which city and package costs the maximum\n")
    query="SELECT max(cost) AS max_cost,type from Package_type;"
    cur.execute(query)
    result=cur.fetchall();
    for ans in result:
        print(ans)                 
    con.commit()
    print('\n \n')
    return    

def search():
    city=input("enter first few characters of city to search : ")
    if(city[0]=='H' or city[0]=='h'):
        query="SELECT  * from Are_there_in natural join restaurants where city_code='HYD';"
    elif(city[0]=='C' or city[0]=='c'):
        query="SELECT  * from Are_there_in natural join restaurants where city_code='CHE';"
    elif(city[0]=='V' or city[0]=='v'):
        query="SELECT  * from Are_there_in natural join restaurants where city_code='VIJ';"
    else:
        print("invalid ,choose any other city")
        search()            
    cur.execute(query)
    result=cur.fetchall();
    print("RESTAURANTS : ")
    print("------------------------------------------------------------------------------")
    print("|restaurant_name | avgrate_person | restaurant_type | rating | streetaddress |")
    print("------------------------------------------------------------------------------")
    for ans in result:
        print("|",end=" ") 
        print(ans['restaurant_name'],end=" ")
        print("|",end=" ")
        print(ans['avgrate_person'],end=" ")
        print("|",end=" ")
        print(ans['restaurant_type'],end=" ")
        print("|",end=" ")
        print(ans['rating'],end=" ")
        print("|",end=" ")
        print(ans['streetaddress'],end=" ")
        print("|")  
    print("------------------------------------------------------------------------------")      
    print("\n")                 
    con.commit()
        
    query="SELECT  * from Are_there_in natural join Places_of_visit where city_code='HYD';"
    cur.execute(query)
    result=cur.fetchall();
    print("PLACES TO VISIT : ")
    print("--------------------------------------------------------------- ")
    print("| streetname | locality | pause_time | rating | avgcost_person |")
    print("--------------------------------------------------------------")
    for ans in result:
        print("|",end=" ")
        print(ans['streetname'],end=" ")
        print("|",end=" ")
        print(ans['locality'],end=" ")
        print("|",end=" ")
        print(ans['pause_time'],end=" ")
        print("|",end=" ")
        print(ans['rating'],end=" ")
        print("|",end=" ")
        print(ans['avgcost_person'],end=" ")
        print("|") 
    print("--------------------------------------------------------------- ")      
    print("\n")                 
    con.commit()
    return


def analysis():
    print("1)Number of buses that ran in hyderbad in year 2020\n") 
    query="SELECT departure_date,count(service_no)as no_of_buses from Bus_reservation where source='Gachibowli' or destination='Birla mandir';" #date?
    cur.execute(query)
    result=cur.fetchall();
    print('no.of buses are : ',end=" ")
    for ans in result:
        Ages_arr=ans['departure_date'].split('-')
        Age=2020-int(Ages_arr[0])
        if(Age == 0 ):
            print(ans['no_of_buses'])                 
    con.commit()  
    print('\n\n') 

    print("2)cities which have at least 3 places_to _visit with a popularity rating >4\n")
    query="SELECT city_code, count(city_code) as count  from Places_of_visit natural join are_there_in  where rating >= 4 group by city_code ;"
    cur.execute(query)
    result=cur.fetchall();
    for ans in result:
        if(int(ans['count'])>=3):
            if(ans['city_code']=="HYD"):
                print("Hyderabad")
            elif(ans['city_code']=="CHE"):
                print("Chennai")
            elif(ans['city_code']=="VIJ"):
                print("Vijaywada")        

    con.commit() 
    print('\n\n')
    print("3) cities which are most visited\n")
    query="SELECT type from Package;"
    cur.execute(query)
    result=cur.fetchall();
    h=0
    c=0
    v=0
    for ans in result:
        if ans['type'][1]=='H' :
            h+=1
        elif ans['type'][1]=='C' :
            c+=1
        elif ans['type'][1]=='V' :
            v+=1
    x=max(h,c,v)
    if(x==h):
        print("Hyderabad") 
    if(x==c):
        print("Chennai")
    if(x==v):
        print("Vijaywada") 
    print('\n\n')                     
    return

def customerinput():

    try:
        print("ENTER THE FOLLOWING DETAILS:")
        cid = int(input("Enter 12 digit aadhar number without spaces: "))
        dig = str(cid);
        while len(dig)!=12:
            print("please enter correct aadhar number")
            cid = int(input("Enter 12 digit aadhar number without spaces: "))
            dig = str(cid);

        #this goes into the cust_age and Customer table
        dob = input("Birth Date (YYYY-MM-DD): ")
        year,month,date = dob.split('-')
        isValidDate = True
        try :
            datetime.datetime(int(year),int(month),int(date))
        except ValueError :
            isValidDate = False
        while isValidDate == False:
            print("entered date is wrong")
            dob = input("Birth Date (YYYY-MM-DD): ")
            year,month,date = dob.split('-')
            isValidDate = True
            try :
                datetime.datetime(int(year),int(month),int(date))
            except ValueError :
                isValidDate = False

        home = input("home city: ")
        email = input("email id: ")
        x = "@" in email and "." in email
        while x == False :
            print("please enter correct email id eg : abc@gmail.com")
            email = input("email id: ")
            x = "@" in email and "." in email
        
        contact = int(input("contact number: "))
        dig = str(contact)
        while len(dig)!=10:
            print("please enter correct contact number (only 10 digits)")
            contact = int(input("contact number: "))
            dig = str(contact);
        gender = input("gender: ")
        travel = 1
        pinc = int(input("pincode: "))
        dig = str(pinc)
        while len(dig)!=6:
            print("please enter correct pincode")
            pinc= int(input("pincode: "))
            dig = str(pinc);
        name = (input("Name (Fname Minit Lname): ")).split(' ')
        namef = name[0]
        namem = name[1]
        namel = name[2]
        u = input("username: ")
        p = input("password: ")
        today=int(2020)
        Age=today-int(year)
        print("ENTER THE FAMILY DETAILS:")
        old = int(input("number of old people: "))
        total = int(input("total number of family members: "))
        fem = int(input("number of females: "))
        child = int(input("number of children: "))

        query = "INSERT INTO cust_age VALUES ('%s','%d')" % (dob,Age)
        cur.execute(query)
        con.commit()

        query = "INSERT INTO Customer(cust_id,date_of_birth,home_city,email_id,gender,travel_no,pincode,fname,mname,lname,username,password) VALUES(%d,'%s', '%s', '%s', '%s', %d, %d, '%s', '%s','%s','%s','%s')" % (cid,dob,home,email,gender,travel,pinc,namef,namem,namel,u,p)
        cur.execute(query)
        con.commit()

        query = "INSERT INTO Customer_contact VALUES ('%d','%d')" % (cid,contact)
        cur.execute(query)
        con.commit()

        query = "INSERT INTO Family VALUES ('%d','%d','%d','%d','%d')" % (cid,old,total,fem,child)
        cur.execute(query)
        con.commit()

        x=int(input("do you want to order package? if yes enter 1 else 0:"))
        if(x):
            package_update()
        else:
            return

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return


def dispatch(ch):
    """
    Function that maps helper functions to option entered
    """

    if(ch == 1):
        customerinput()
    elif(ch == 2):
        package_update()
    elif(ch == 3):
        Addnewemployee()
    elif(ch == 4):
        selection()
    elif(ch == 5):
        projection()
    elif(ch==6):
        aggregate()
    elif(ch==7):
        search()
    elif(ch==8):
        analysis()
    else:
        print("Error: Invalid Option")


# Global
while(1):
    
    
    
    # Can be skipped if you want to hard core username and password
    
    username = input("Username: ")
    password = input("Password: ")
    

    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server 
        con = pymysql.connect(host='localhost',
                              user=username,
                              password=password,
                              db='TOURISM',
                              cursorclass=pymysql.cursors.DictCursor)

        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")
    
        with con.cursor() as cur:
            while(1):
            
                # Here taking example of Employee Mini-world
                print("1. Option 1:new customer input")  # Hire an Employee
                print("2. Option 2:package update/delete/insert")  # Fire an Employee
                print("3. Option 3:add new employee")  # Promote Employee
                print("4. Option 4:selection")  # Employee Statistics
                print("5. Option 5:projection")
                print("6. Option 6:aggregate")
                print("7. Option 7:search")
                print("8. Option 8:analysis")
                print("9. Press ctrl+c to exit")
                ch = int(input("Enter choice> "))
                if (ch == 9):
                    break;
                else:
                    dispatch(ch)
       

    except:
    
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        x= int(input("do you want to exit? give 1\n"))
    
        if(x==1):
            break;
