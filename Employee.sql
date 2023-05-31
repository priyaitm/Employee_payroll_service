
 ...................................................UC1..........................................................
mysql> create database payroll_service;
Query OK, 1 row affected (0.58 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| demo               |
| demo2              |
| demo_db            |
| information_schema |
| institution        |
| mysql              |
| payroll_service    |
| performance_schema |
| sys                |
+--------------------+
9 rows in set (0.21 sec)

mysql> use payroll_service;
Database changed
mysql>

...........................................................UC2.......................................................

mysql> create table employee_payroll(id int PRIMARY KEY AUTO_INCREMENT, name varchar(40),salary int ,start_date DATE );
Query OK, 0 rows affected (2.25 sec)

mysql> desc employee_payroll;
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| id         | int         | NO   | PRI | NULL    | auto_increment |
| name       | varchar(40) | YES  |     | NULL    |                |
| salary     | int         | YES  |     | NULL    |                |
| start_date | date        | YES  |     | NULL    |                |
+------------+-------------+------+-----+---------+----------------+
4 rows in set (0.44 sec)

mysql>

................................................UC3.........................................................


mysql> insert into employee_payroll (name,salary,start_date) values("Ankit",30000,'2020-11-24');
Query OK, 1 row affected (0.18 sec)

mysql> select * from employee_payroll;
+----+-------+--------+------------+
| id | name  | salary | start_date |
+----+-------+--------+------------+
|  1 | Ankit |  30000 | 2020-11-24 |
+----+-------+--------+------------+
1 row in set (0.00 sec)

mysql> insert into employee_payroll (name,salary,start_date) values("Atul",35000,'2021-11-24');
Query OK, 1 row affected (0.19 sec)

mysql> insert into employee_payroll (name,salary,start_date) values("Garima",39000,'2019-10-14');
Query OK, 1 row affected (0.10 sec)

mysql> insert into employee_payroll (name,salary,start_date) values("Garima",38000,'2018-10-14');
Query OK, 1 row affected (0.08 sec)

mysql> insert into employee_payroll (name,salary,start_date) values("Manisha",45000,'2017-10-14');
Query OK, 1 row affected (0.09 sec)

mysql> insert into employee_payroll (name,salary,start_date) values("Rakesh",49000,'2021-10-14');
Query OK, 1 row affected (0.08 sec)

mysql> insert into employee_payroll (name,salary,start_date) values("Rishab",59000,'2021-09-14');
Query OK, 1 row affected (0.10 sec)

..................................................UC4..................................................


mysql> select * from employee_payroll;
+----+---------+--------+------------+
| id | name    | salary | start_date |
+----+---------+--------+------------+
|  1 | Ankit   |  30000 | 2020-11-24 |
|  2 | Atul    |  35000 | 2021-11-24 |
|  3 | Garima  |  39000 | 2019-10-14 |
|  4 | Garima  |  38000 | 2018-10-14 |
|  5 | Manisha |  45000 | 2017-10-14 |
|  6 | Rakesh  |  49000 | 2021-10-14 |
|  7 | Rishab  |  59000 | 2021-09-14 |
+----+---------+--------+------------+
7 rows in set (0.00 sec)

mysql>
.......................................................UC5................................................
mysql> select salary from employee_payroll where name ="Manisha";
+--------+
| salary |
+--------+
|  45000 |
+--------+
1 row in set (0.01 sec)

mysql> select salary from employee_payroll where start_date between cast('2019-01-01' as date) and date(now());
+--------+
| salary |
+--------+
|  30000 |
|  35000 |
|  39000 |
|  49000 |
|  59000 |
+--------+
5 rows in set (0.12 sec)

........................................................UC6..........................................................................

mysql> alter table employee_payroll add Gender varchar(20);
Query OK, 0 rows affected (2.30 sec)
Records: 0  Duplicates: 0  Warnings: 0
mysql> update employee_payroll set Gender ="M" where name ="Ankit" ;
Query OK, 1 row affected (0.08 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set Gender ="M" where name ="Ankit" or name ="ATUL" or name = "Rakesh" or name ="Rishab";
Query OK, 3 rows affected (0.06 sec)
Rows matched: 4  Changed: 3  Warnings: 0
mysql> update employee_payroll set Gender ="F" where name ="Garima" or name ="Manisha";
Query OK, 3 rows affected (0.09 sec)
Rows matched: 3  Changed: 3  Warnings: 0

.................................................UC7.............................................................................

mysql> select sum(salary) from employee_payroll where Gender ="F" GROUP BY Gender;
+-------------+
| sum(salary) |
+-------------+
|      122000 |
+-------------+
1 row in set (0.14 sec)

mysql>
mysql> select sum(salary) from employee_payroll where Gender ="M" GROUP BY Gender;
+-------------+
| sum(salary) |
+-------------+
|      173000 |
+-------------+
1 row in set (0.00 sec)

mysql>
mysql> select avg(salary) from employee_payroll where Gender ="F" GROUP BY Gender;
+-------------+
| avg(salary) |
+-------------+
|  40666.6667 |
+-------------+
1 row in set (0.00 sec)

mysql>
mysql> select avg(salary) from employee_payroll where Gender ="M" GROUP BY Gender;
+-------------+
| avg(salary) |
+-------------+
|  43250.0000 |
+-------------+
1 row in set (0.00 sec)

mysql>
mysql> select min(salary) from employee_payroll where Gender ="F" GROUP BY Gender;
+-------------+
| min(salary) |
+-------------+
|       38000 |
+-------------+
1 row in set (0.09 sec)

mysql> select min(salary) from employee_payroll where Gender ="M" GROUP BY Gender;
+-------------+
| min(salary) |
+-------------+
|       30000 |
+-------------+
1 row in set (0.00 sec)

mysql>
mysql> select max(salary) from employee_payroll where Gender ="F" GROUP BY Gender;
+-------------+
| max(salary) |
+-------------+
|       45000 |
+-------------+
1 row in set (0.00 sec)

mysql>
mysql> select max(salary) from employee_payroll where Gender ="M" GROUP BY Gender;
+-------------+
| max(salary) |
+-------------+
|       59000 |
+-------------+
1 row in set (0.00 sec)

mysql>
mysql> select count(salary) from employee_payroll where Gender ="F" GROUP BY Gender;
+---------------+
| count(salary) |
+---------------+
|             3 |
+---------------+
1 row in set (0.00 sec)

mysql>
mysql> select count(salary) from employee_payroll where Gender ="M" GROUP BY Gender;
+---------------+
| count(salary) |
+---------------+
|             4 |
+---------------+
1 row in set (0.00 sec)

mysql>

................................UC8.....................................................................................

mysql> alter table employee_payroll add department varchar(15) not null,add city_name varchar(13), add phone_number bigint(12);
Query OK, 0 rows affected, 1 warning (2.33 sec)
Records: 0  Duplicates: 0  Warnings: 1

mysql> desc employee_payroll;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| id           | int         | NO   | PRI | NULL    | auto_increment |
| name         | varchar(40) | YES  |     | NULL    |                |
| salary       | int         | YES  |     | NULL    |                |
| start_date   | date        | YES  |     | NULL    |                |
| Gender       | varchar(20) | YES  |     | NULL    |                |
| department   | varchar(15) | NO   |     | NULL    |                |
| city_name    | varchar(13) | YES  |     | NULL    |                |
| phone_number | bigint      | YES  |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+
8 rows in set (0.18 sec)

mysql> select * from employee_payroll;
+----+---------+--------+------------+--------+------------+-----------+--------------+
| id | name    | salary | start_date | Gender | department | city_name | phone_number |
+----+---------+--------+------------+--------+------------+-----------+--------------+
|  1 | Ankit   |  30000 | 2020-11-24 | M      |            | NULL      |         NULL |
|  2 | Atul    |  35000 | 2021-11-24 | M      |            | NULL      |         NULL |
|  3 | Garima  |  39000 | 2019-10-14 | F      |            | NULL      |         NULL |
|  4 | Garima  |  38000 | 2018-10-14 | F      |            | NULL      |         NULL |
|  5 | Manisha |  45000 | 2017-10-14 | F      |            | NULL      |         NULL |
|  6 | Rakesh  |  49000 | 2021-10-14 | M      |            | NULL      |         NULL |
|  7 | Rishab  |  59000 | 2021-09-14 | M      |            | NULL      |         NULL |
+----+---------+--------+------------+--------+------------+-----------+--------------+
7 rows in set (0.00 sec)

....................................................UC9..........................................................

mysql> alter table employee_payroll add deductions int, add taxable_pay int , add income_tax int, add net_pay int ;
Query OK, 0 rows affected (0.73 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> decs employee_payroll;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'decs employee_payroll' at line 1
mysql> desc employee_payroll;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| id           | int         | NO   | PRI | NULL    | auto_increment |
| name         | varchar(40) | YES  |     | NULL    |                |
| salary       | int         | YES  |     | NULL    |                |
| start_date   | date        | YES  |     | NULL    |                |
| Gender       | varchar(20) | YES  |     | NULL    |                |
| department   | varchar(15) | NO   |     | NULL    |                |
| city_name    | varchar(13) | YES  |     | NULL    |                |
| phone_number | bigint      | YES  |     | NULL    |                |
| deductions   | int         | YES  |     | NULL    |                |
| taxable_pay  | int         | YES  |     | NULL    |                |
| income_tax   | int         | YES  |     | NULL    |                |
| net_pay      | int         | YES  |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+
12 rows in set (0.04 sec)

mysql> select * from employee_payroll;
+----+---------+--------+------------+--------+------------+-----------+--------------+------------+-------------+------------+---------+
| id | name    | salary | start_date | Gender | department | city_name | phone_number | deductions | taxable_pay | income_tax | net_pay |
+----+---------+--------+------------+--------+------------+-----------+--------------+------------+-------------+------------+---------+
|  1 | Ankit   |  30000 | 2020-11-24 | M      |            | NULL      |         NULL |       NULL |        NULL |       NULL |    NULL |
|  2 | Atul    |  35000 | 2021-11-24 | M      |            | NULL      |         NULL |       NULL |        NULL |       NULL |    NULL |
|  3 | Garima  |  39000 | 2019-10-14 | F      |            | NULL      |         NULL |       NULL |        NULL |       NULL |    NULL |
|  4 | Garima  |  38000 | 2018-10-14 | F      |            | NULL      |         NULL |       NULL |        NULL |       NULL |    NULL |
|  5 | Manisha |  45000 | 2017-10-14 | F      |            | NULL      |         NULL |       NULL |        NULL |       NULL |    NULL |
|  6 | Rakesh  |  49000 | 2021-10-14 | M      |            | NULL      |         NULL |       NULL |        NULL |       NULL |    NULL |
|  7 | Rishab  |  59000 | 2021-09-14 | M      |            | NULL      |         NULL |       NULL |        NULL |       NULL |    NULL |
+----+---------+--------+------------+--------+------------+-----------+--------------+------------+-------------+------------+---------+
7 rows in set (0.07 sec)

mysql> alter table employee_payroll rename column salary to Basic_pay;
Query OK, 0 rows affected (0.34 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from employee_payroll;
+----+---------+-----------+------------+--------+------------+-----------+--------------+------------+-------------+------------+---------+
| id | name    | Basic_pay | start_date | Gender | department | city_name | phone_number | deductions | taxable_pay | income_tax | net_pay |
+----+---------+-----------+------------+--------+------------+-----------+--------------+------------+-------------+------------+---------+
|  1 | Ankit   |     30000 | 2020-11-24 | M      |            | NULL      |         NULL |       NULL |        NULL |       NULL |    NULL |
|  2 | Atul    |     35000 | 2021-11-24 | M      |            | NULL      |         NULL |       NULL |        NULL |       NULL |    NULL |
|  3 | Garima  |     39000 | 2019-10-14 | F      |            | NULL      |         NULL |       NULL |        NULL |       NULL |    NULL |
|  4 | Garima  |     38000 | 2018-10-14 | F      |            | NULL      |         NULL |       NULL |        NULL |       NULL |    NULL |
|  5 | Manisha |     45000 | 2017-10-14 | F      |            | NULL      |         NULL |       NULL |        NULL |       NULL |    NULL |
|  6 | Rakesh  |     49000 | 2021-10-14 | M      |            | NULL      |         NULL |       NULL |        NULL |       NULL |    NULL |
|  7 | Rishab  |     59000 | 2021-09-14 | M      |            | NULL      |         NULL |       NULL |        NULL |       NULL |    NULL |
+----+---------+-----------+------------+--------+------------+-----------+--------------+------------+-------------+------------+---------+
7 rows in set (0.00 sec)

.......................................................UC10..................................................................................


mysql> update employee_payroll set deductions = 23600,taxable_pay=12343, income_tax=45000, net_pay=98798 , city_name ="Chennai" where id =1;
Query OK, 1 row affected (0.09 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set deductions = 22000,taxable_pay=52320, income_tax=65000, net_pay=32900 , city_name ="Gujarat" where id =2;
Query OK, 1 row affected (0.08 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set deductions = 22000,taxable_pay=55920, income_tax=75000, net_pay=34440 , city_name ="Gujarat" where id =3;
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set deductions = 21000,taxable_pay=57800, income_tax=75600, net_pay=33440 , city_name ="Mumbai" where id =4;
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set deductions = 21000,taxable_pay=57600, income_tax=75640, net_pay=33340 , city_name ="Lucknow" where id =5;
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set deductions = 26000,taxable_pay=54600, income_tax=675640, net_pay=33344 , city_name ="Lucknow" where id =6;
Query OK, 1 row affected (0.08 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set deductions = 27000,taxable_pay=54690, income_tax=679640, net_pay=33844 , city_name ="Gujarat" where id =7;
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> select * from employee_payroll;
+----+---------+-----------+------------+--------+------------+-----------+--------------+------------+-------------+------------+---------+
| id | name    | Basic_pay | start_date | Gender | department | city_name | phone_number | deductions | taxable_pay | income_tax | net_pay |
+----+---------+-----------+------------+--------+------------+-----------+--------------+------------+-------------+------------+---------+
|  1 | Ankit   |     30000 | 2020-11-24 | M      |            | Chennai   |         NULL |      23600 |       12343 |      45000 |   98798 |
|  2 | Atul    |     35000 | 2021-11-24 | M      |            | Gujarat    |         NULL |      22000 |       52320 |      65000 |   32900 |
|  3 | Garima  |     39000 | 2019-10-14 | F      |            | Gujarat    |         NULL |      22000 |       55920 |      75000 |   34440 |
|  4 | Garima  |     38000 | 2018-10-14 | F      |            | Mumbai    |         NULL |      21000 |       57800 |      75600 |   33440 |
|  5 | Manisha |     45000 | 2017-10-14 | F      |            | Lucknow   |         NULL |      21000 |       57600 |      75640 |   33340 |
|  6 | Rakesh  |     49000 | 2021-10-14 | M      |            | Lucknow   |         NULL |      26000 |       54600 |     675640 |   33344 |
|  7 | Rishab  |     59000 | 2021-09-14 | M      |            | Gujarat    |         NULL |      27000 |       54690 |     679640 |   33844 |
+----+---------+-----------+------------+--------+------------+-----------+--------------+------------+-------------+------------+---------+
7 rows in set (0.00 sec)

mysql>
......................................

mysql> alter table employee_payroll rename column id to emp_id;
Query OK, 0 rows affected (0.42 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc employee_payroll;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| emp_id       | int         | NO   | PRI | NULL    | auto_increment |
| name         | varchar(40) | YES  |     | NULL    |                |
| Basic_pay    | int         | YES  |     | NULL    |                |
| start_date   | date        | YES  |     | NULL    |                |
| Gender       | varchar(20) | YES  |     | NULL    |                |
| city_name    | varchar(13) | YES  |     | NULL    |                |
| phone_number | bigint      | YES  |     | NULL    |                |
| deductions   | int         | YES  |     | NULL    |                |
| taxable_pay  | int         | YES  |     | NULL    |                |
| income_tax   | int         | YES  |     | NULL    |                |
| net_pay      | int         | YES  |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+

mysql> create table employee_department(dept_id int not null,department varchar(50),emp_id int,primary key(dept_id ),foreign key(emp_id)references employee_payroll(emp_id) );
Query OK, 0 rows affected (0.87 sec)

mysql> show table;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> show tables;
+---------------------------+
| Tables_in_payroll_service |
+---------------------------+
| employee_department       |
| employee_payroll          |
+---------------------------+
2 rows in set (0.00 sec)

mysql> desc employee_department;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| dept_id    | int         | NO   | PRI | NULL    |       |
| department | varchar(50) | YES  |     | NULL    |       |
| emp_id     | int         | YES  | MUL | NULL    |       |
+------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)


mysql> insert into employee_department(dept_id,department,emp_id) values(1,"Marketing",1);
Query OK, 1 row affected (0.30 sec)

mysql> insert into employee_department(dept_id,department,emp_id) values(1,"IT",2);
ERROR 1062 (23000): Duplicate entry '1' for key 'employee_department.PRIMARY'
mysql> insert into employee_department(dept_id,department,emp_id) values(2,"IT",2);
Query OK, 1 row affected (0.14 sec)

mysql>

mysql> select * from employee_department;
+---------+------------+--------+
| dept_id | department | emp_id |
+---------+------------+--------+
|       1 | Marketing  |      1 |
|       2 | IT         |      2 |
+---------+------------+--------+
2 rows in set (0.00 sec)
