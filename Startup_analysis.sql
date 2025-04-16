-- Project 1 
-- CREATE DATABASE Project; Already created this database so we wil use this database. 

USE Project; -- We will use Project database for this Project. 


-- Lets create user and password.------------------------

CREATE USER username WITH PASSWORD 'password'; -- Replace username and password with your desired username and password.
GRANT ALL PRIVILEGES ON DATABASE database_name TO username; -- here also use your database name and created user.


-- We will create data and Table via using python library(Pandas)
-- These code have to run in python environment. We will commented out python code. Because python code will occur erros.
/*import pandas as pd

# Define the data for each table
startups = pd.DataFrame({
    "startup_id": [101, 102, 103, 104, 105],
    "name": ["FinEdge", "AgroHive", "EduSpark", "BioNova Health", "RoboRetail"],
    "founded_year": [2017, 2019, 2016, 2020, 2018],
    "industry": ["FinTech", "AgriTech", "EdTech", "HealthTech", "E-commerce"],
    "city": ["Bangalore", "Pune", "Delhi", "Mumbai", "Hyderabad"],
    "country": ["India"] * 5
})

founders = pd.DataFrame({
    "founder_id": [1, 2, 3, 4, 5],
    "name": ["Aarav Mehta", "Kavya Reddy", "Rishi Malhotra", "Sanjana Nair", "Arjun Khanna"],
    "age": [34, 29, 41, 36, 38],
    "gender": ["M", "F", "M", "F", "M"],
    "startup_id": [101, 102, 103, 104, 105]
})

funding_rounds = pd.DataFrame({
    "funding_id": [201, 202, 203, 204, 205, 206, 207, 208],
    "startup_id": [101, 101, 102, 103, 104, 104, 105, 105],
    "round_type": ["Seed", "Series A", "Angel", "Series A", "Seed", "Series A", "Series A", "Series B"],
    "amount_million": [1.2, 5.0, 0.8, 3.5, 2.0, 6.5, 4.0, 10.0],
    "year": [2017, 2018, 2019, 2017, 2020, 2022, 2018, 2020]
})

revenue = pd.DataFrame({
    "rev_id": [301, 302, 303, 304, 305],
    "startup_id": [101, 102, 103, 104, 105],
    "year": [2021] * 5,
    "revenue_million": [8.2, 1.5, 4.9, 5.7, 9.1]
})

status = pd.DataFrame({
    "startup_id": [101, 102, 103, 104, 105],
    "status": ["Acquired", "Operating", "Shut Down", "Operating", "Profitable"],
    "acquired_by": ["RazorPay", None, None, None, None],
    "exit_year": [2022, None, 2020, None, None]
})

# Save all dataframes to CSV files
csv_paths = {}
for name, df in zip(["startups", "founders", "funding_rounds", "revenue", "status"],
                    [startups, founders, funding_rounds, revenue, status]):
    path = f"/file location where have to store data/{sql data}.csv"
    df.to_csv(path, index=False)
    csv_paths[name] = path

csv_paths

# We have to run all this multiline comment in python. Not in sql.
# We can also directly insert these data into sql table. But we are using csv file which will be used in future to insert data in sql. almost same.
*/

-- Now lets connect Python from sql server. 
/*
# Lets import important library.
import pandas as pd
import sqlalchemy

# lets connect.
conn = mysql.connector.connect(
    host="localhost", # it will be as it.
    user="your_username", # here you have to put you sql user name.
    password="your_password", # and here you have to write your own sql password. Means right user id and password.
    database="your_database" # here enter you database name.
)

# Now read csv or excel file.
df = pd.read_csv("file location or path.csv") # Suppose it is revenue csv file. 
print(df) # show we can see how many column are there.

# Now lets create sql table or insert table.
cursor.execute("""
	CREATE TABLE Status(			-- Here we created Status name table. All command is same. Only we write here in multiline python comment.
	startup_id INT PRIMARY KEY,
    	status VARCHAR(100),
    	acquired_by VARCHAR(100),
    	exit_year INT"
	)
""")
conn.commit()
print("Status Table created successfully.") # By doing same we will insert all left table.



# Now lets insert data into table. we already read our one file lets suppose this is revenue.

for i, row in df.iterrows():  # Assuming `df` is your DataFrame
    print(row)  # Print the row to verify its content

    
    # Execute the INSERT query
    cursor.execute("""
    INSERT INTO revenue ("startup_id", "status", "acquired_by", "exit_year")
    VALUES (%s, %s, %s, %s)
    """, (row[""startup_id""], row[""status""], row["column3"], row["exit_year"]))


# Commit the transaction
conn.commit()
print("Data successfullly inserted into revenue table. # by doing the same we will insert data in all left column


# Now lets see all data what data are inserted in table.

cursor = conn.cursor()

# Execute a query
cursor.execute("SELECT * FROM table_name")
rows = cursor.fetchall()

# Print the results
for row in rows:
	print(row)

# All these run into python environment.

*/

--  we have inserted csv file via using python (Pandas Library). 
-- Now below all run is sql server this is sql server querry.

-- Lets check  all data.
-- we inserted 5 table by using python. 
SELECT * FROM Founder;
SELECT * FROM Status;
SELECT * FROM Funding_round;
SELECT * FROM Revenue;
SELECT * FROM Startups;

-- Now, we have total 5 table. Now lets performs task. --------------------------------------------
-- Let's count how many founders are there in founder table. 
SELECT COUNT(name) 
FROM founder;

-- Lets check their average age. -----------------------------

SELECT AVG(age)
FROM founder;

-- Let's count how many male in founder table. -------------------------------------
SELECT COUNT(gender)
FROM founder
WHERE gender = "M";

-- Now, count how many founder are female in founder table. --------------------
SELECT COUNT(gender)
FROM founder
WHERE gender = "F";

-- Find out details of founder by using founder id. --------------------------------
SELECT * 
FROM founder
WHERE founder_id = 1; -- we can change founder_id and check different different founder and we can do same with any unique column. in our case 2 column store unique value. 


-- Lets all data of table funding_round. ---------
SELECT * FROM funding_round;

-- here lets check in 2017 how many times fund raised. and how much amount was raised. -----------------
SELECT COUNT(year)
FROM funding_round
WHERE year = 2017;

-- how much amount was raised in 2017. --
SELECT SUM(amount_million)
FROM funding_round
WHERE year = 2017;

-- What was maximum funding amount.--------------------
SELECT MAX(amount_million)
FROM funding_round;

-- What was lowest funding amount in each year.-----------------

SELECT MIN(amount_million), year
FROM funding_round
GROUP BY year; 

-- Now put all in descending order according to amount_million column (descending order means decreasing order. )----

SELECT MIN(amount_million), year
FROM funding_round
GROUP BY year
ORDER BY year DESC;  -- using order to set order. 

-- Now put all in ascending order by using amount_million column.-- means put in increasing.-----------
SELECT MIN(amount_million), year
FROM funding_round
GROUP BY year
ORDER BY year ASC LIMIT 3;

SELECT SUM(amount_million), year
FROM funding_round
GROUP BY year
HAVING AVG(amount_million) > (
	SELECT MIN(amount_million)
    FROM funding_round);

-- Select all amount_million value which is greater than average value-- condition is that if we change. values so it will return updated value. ---
-- here we will not use hardcode or static code. her required dynamic values. 
-- So here i will use dynamic formula like sub-queries or nested. 
SELECT * 
FROM funding_round
WHERE amount_million > (
	SELECT AVG(amount_million) 
    FROM funding_round);
    
-- lets update amount million values and lets check what happen

UPDATE funding_round
SET amount_million= 15
WHERE amount_million = 5; -- We are using in safe mode so we will get error. off safe mode. 

SET SQL_SAFE_UPDATES = 0;

-- after value update we will se average value will change and also and many more.--------
SELECT * 
FROM funding_round
WHERE amount_million > (
	SELECT AVG(amount_million) 
    FROM funding_round);
    
-- ok so lets return update same value to our table- we show you that can be happen. 
UPDATE funding_round
SET amount_million = 5
WHERE amount_million = 15;

-- and also on safe mode. --------------
SET SQL_SAFE_UPDATES = 1; -- 1 means on and 0 means off. 
-- Safe mode prevent unwanted change or by mistakes changes or delete. 

SELECT * FROM Funding_round;
-- We have to define business condition according to fund raised.-- We assume who raised more who survive for longer or earn more profit. 

SELECT startup_id, amount_million, year,
CASE
	WHEN amount_million >5 THEN "Very good for survial and earn more profit and also aquire other small company"
    WHEN amount_million >=4 THEN "In Good condition but need more attention"
    WHEN amount_million <4 THEN "If you have no money you are in trouble, raised fund for you survial"
    ELSE "If you have idea you should work on it"
END AS my_statement
FROM funding_round;

-- Now let's Move to our next table ---
SELECT * FROM revenue;

-- lets find total revenue.--
SELECT SUM(revenue_million)
FROM revenue;


-- lets check which startup generate most revenue. 
SELECT startup_id, revenue_million, year 
FROM revenue
WHERE revenue_million = (
	SELECT MAX(revenue_million)
    FROM revenue
    );
    
-- We have to show all revenue between 5 - 10.--
SELECT revenue_million
FROM revenue
WHERE revenue_million BETWEEN 5 AND 10;


-- Now let's check status table--
SELECT * FROM status;

-- This is very crucial information. --------- 
-- Let's check how many companies is shutdown.-- 
SELECT startup_id, status, exit_year
FROM status
WHERE status = "Shut Down"; -- same we can check acquired company and profitable company and operating company.------------------- 

-- Lets check our left dataset or table---
-- this table contain unique value (except country) so i put it on the last, but this table should be in first. --------------
SELECT * FROM startups;

-- Lets check which start from which city or where is headquarter. and also check funding amount. ----
SELECT f.startup_id,F.amount_million, startups.name, startups.city
FROM funding_round as F
INNER JOIN Startups
ON f.startup_id = startups.startup_id;  -- because startup_id is common in almost all table.


-- Find out which startup generated more revenue or most revenue also their name and city. -------------
SELECT R.startup_id, R.revenue_million, startups.name, startups.city
FROM revenue as R
INNER JOIN Startups
ON R.startup_id = startups.startup_id
WHERE revenue_million = (
	SELECT MAX(revenue_million) 
    FROM revenue
    );

-- How many comanies started in even year.--- 
SELECT * 
FROM startups 
WHERE Founded_year %2 = 0;

-- lets find out startup_id, founder, company name, industry type and company founded year. ------
-- lets first change column name because name is common column in both table founder and startups.--
-- First change in startup.
ALTER TABLE Startups
CHANGE name Company_name VARCHAR(100); 

-- lets get details which we have required. ------------
SELECT founder.startup_id, founder.name, startups.Company_name, startups.industry, startups.founded_year
FROM founder
RIGHT JOIN Startups
ON founder.startup_id = startups.startup_id
UNION
SELECT founder.startup_id, founder.name, startups.Company_name, startups.industry, startups.founded_year
FROM founder
LEFT JOIN startups
ON founder.startup_id = startups.startup_id;

-- check company rank--
SELECT funding_id, startup_id, round_type,
ROW_NUMBER() OVER(ORDER BY year) AS "Row Number",
RANK() OVER(ORDER BY year) AS "RANKr",
DENSE_RANK() OVER(ORDER BY year) AS "DENSE RANK",
PERCENT_RANK() OVER(ORDER BY year) AS "DENSE PERCENT"
FROM funding_round;

-- Doing aggregate work on group data. we did not group data manually but it did it automatically. --------------
select round_type, amount_million, year,
avg(amount_million) over(partition by round_type order by amount_million rows between unbounded preceding and unbounded following) as "average",
sum(amount_million) over(partition by round_type order by amount_million rows between unbounded preceding and unbounded following) as "sum",
min(amount_million) over(partition by round_type order by amount_million rows between unbounded preceding and unbounded following) as "min",
max(amount_million) over(partition by round_type order by amount_million rows between unbounded preceding and unbounded following) as "max",
count(amount_million) over(partition by round_type order by amount_million rows between unbounded preceding and unbounded following) as "count"
from funding_round;

-- see first and last value on give or selected column. 
SELECT startup_id, round_type, amount_million, year,
FIRST_VALUE(amount_million) OVER(ORDER BY amount_million) AS "FIRST VALUE",
LAST_VALUE(amount_million) OVER(ORDER BY amount_million) 	AS "LAST VALUE",
LEAD(amount_million) OVER(ORDER BY amount_million) AS "LEAD", -- by default it skip first row value because it is leading so offcourse it will take next value. 
LAG(amount_million) OVER(ORDER BY amount_million) AS "LAG" -- by default it will skip last row. lag means it will laging. -----------
FROM funding_round;

-- we can modify lead and lag skiping value. --------------
SELECT startup_id, round_type, amount_million, year,
LEAD(amount_million,2) OVER(ORDER BY amount_million) AS "LEAD", -- it will skip 2 rows and shwing from 3rd row from top.--------------- 
LAG(amount_million,3) OVER(ORDER BY amount_million) AS "LAG" -- it will skip 3 row from bottow and will start from 4th row.------
FROM funding_round;

