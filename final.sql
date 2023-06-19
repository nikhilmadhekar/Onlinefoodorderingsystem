create table customers
(
 id int auto_increment,
 fname varchar(40) not null,
 lname varchar(40) not null,
 email varchar(40) not null,
 phone_no varchar(20) not null,
 address varchar(70) not null,
 constraint cid_pk primary key(id)
);

+----------+-------------+------+-----+---------+----------------+
| Field    | Type        | Null | Key | Default | Extra          |
+----------+-------------+------+-----+---------+----------------+
| id       | int         | NO   | PRI | NULL    | auto_increment |
| fname    | varchar(40) | NO   |     | NULL    |                |
| lname    | varchar(40) | NO   |     | NULL    |                |
| email    | varchar(40) | NO   |     | NULL    |                |
| phone_no | varchar(20) | NO   |     | NULL    |                |
| address  | varchar(70) | NO   |     | NULL    |                |
+----------+-------------+------+-----+---------+----------------+

insert into Customers
values(1,'mahesh','Bhabad','mahibha@gmail.com','9689372672','pipeline road,Ahmednagar');
insert into Customers(fname,lname, email,phone_no, address)
values('tarun','rathore','tarunr@gmail.com','8908080809','Bhopal');
insert into Customers(fname,lname, email,phone_no, address)
values('Mohsin','naqvi','mohsin@gmail.com','99887789998','Lucknow');
insert into Customers(fname,lname, email,phone_no, address)
values('Nikhil','Madhekar','nikhil@gmail.com','998945798','solapur');
-----------------------------------------------------------------------------------------------------------

create table restaurants
(
 id int auto_increment,
 rname varchar(40) not null,
 raddress varchar(70) not null,
 rphone varchar(40) not null,
 remail varchar(40) not null,

 constraint rest_id_pk primary key(id)
);

mysql> desc restaurants;
+----------+-------------+------+-----+---------+----------------+
| Field    | Type        | Null | Key | Default | Extra          |
+----------+-------------+------+-----+---------+----------------+
| id       | int         | NO   | PRI | NULL    | auto_increment |
| rname    | varchar(40) | NO   |     | NULL    |                |
| raddress | varchar(70) | NO   |     | NULL    |                |
| rphone   | varchar(40) | NO   |     | NULL    |                |
| remail   | varchar(40) | NO   |     | NULL    |                |
+----------+-------------+------+-----+---------+----------------+
insert into Restaurants
values(1,'StarBucks coffee','fc road','989898989','starbuckscoffee@gmail.com');
insert into Restaurants(rname,raddress,rphone,remail)
values('McDonalds','GM road','9089907090','mcdonalds@gmail.com');

insert into Restaurants(rname,raddress,rphone,remail)
values('KFC','ma.na.pa','8070807080','kfc@gmail.com');
insert into Restaurants(rname,raddress,rphone,remail)
values('Pizza Hut','kondhva','7090809090','pizzahut@gmail.com');
---------------------------------------------------------------------------------------------------------------------------------------

create table Menu
(
 id int auto_increment,
 fname varchar(40) not null,
 price decimal(7,2) not null,
 rest_id int not null,
rating decimal(2,1),
 constraint fid_pk primary key(id),
 constraint rid_fk foreign key(rest_id) references Restaurants(id) on delete cascade
);

mysql> desc menu;
+---------+--------------+------+-----+---------+----------------+
| Field   | Type         | Null | Key | Default | Extra          |
+---------+--------------+------+-----+---------+----------------+
| id      | int          | NO   | PRI | NULL    | auto_increment |
| fname   | varchar(40)  | NO   |     | NULL    |                |
| price   | decimal(7,2) | NO   |     | NULL    |                |
| rest_id | int          | NO   | MUL | NULL    |                |
| rating  | decimal(2,1) | YES  |     | NULL    |                |
+---------+--------------+------+-----+---------+----------------+



insert into menu
values(1,'Hazelnut Triangle',315,1,'4.5');
insert into menu(fname,price,rest_id,rating)
values('Chocolate Milkshake',195,1,'4');
insert into menu(fname,price,rest_id,rating)
values('Filter Coffee',240,1,'5');
insert into menu(fname,price,rest_id,rating)
values('Filter Coffee',240,1,'5');
insert into menu(fname,price,rest_id,rating)
values('Masala Chai',240,1,'3.8');
insert into menu(fname,price,rest_id,rating)
values('Strawberry Milkshake',315,1,'4');
insert into menu(fname,price,rest_id,rating)
values('Chatpata Paratha Wrap',325,3,'4.1');
insert into menu(fname,price,rest_id,rating)
values('Cold coffee',295,3,'4.5');
insert into menu(fname,price,rest_id,rating)
values('Caramel Cold Brew',410,3,'4.6');
insert into menu(fname,price,rest_id,rating)
values(1,'Hazelnut Triangle',315,1,'4.5');
insert into menu(fname,price,rest_id,rating)
values('Chocolate Milkshake',315,2,'3.8');
insert into menu(fname,price,rest_id,rating)
values('Filter Coffee',240,2,'4');
insert into menu(fname,price,rest_id,rating)
values('Masala Chai',240,2,'4');
insert into menu(fname,price,rest_id,rating)
values('Strawberry Milkshake',315,2,'5');
insert into menu(fname,price,rest_id,rating)
values('Chatpata Paratha Wrap',325,2,'3.5');
insert into menu(fname,price,rest_id,rating)
values('Cold coffee',295,2,'5');
insert into menu(fname,price,rest_id,rating)
values('White mocha caramel Cold Brew',410,2,'4.5');
insert into menu(fname,price,rest_id,rating)
values('Piri Piri McSpicy Paneer Burger',290,3,'5');
insert into menu(fname,price,rest_id,rating)
values('McVeggie Burger',145,3,'5');
insert into menu(fname,price,rest_id,rating)
values('McSaver McSpicy Chicken Meal',329,3,'5');
insert into menu(fname,price,rest_id,rating)
values('Soft Serve Hot Fudge',101,3,'5');
insert into menu(fname,price,rest_id,rating)
values('Schezwan Margherita',219,4,'5');
insert into menu(fname,price,rest_id,rating)
values('Cheezy Mushroom Magic',319,4,'5');
insert into menu(fname,price,rest_id,rating)
values('2 Double Chicken Rolls',328,4,'5');
insert into menu(fname,price,rest_id,rating)
values('Veg Patty -2 pc',115,4,'5');

-------------------------------------------------------------------------------------------------------------------------------


create table orders
(
id int,
cust_id int ,
rest_id int ,
order_date date,
delivery_add varchar(80) not null,
total_amount decimal(7,2) not null,
order_status varchar(20) not null,
 constraint oid_pk primary key(id),
constraint orid_fk foreign key(cust_id) references Customer(id) on delete cascade
constraint orid_fk foreign key(rest_id) references Restaurants(id) on delete cascade

);

mysql> desc orders;
+--------------+--------------+------+-----+---------+-------+
| Field        | Type         | Null | Key | Default | Extra |
+--------------+--------------+------+-----+---------+-------+
| id           | int          | NO   | PRI | NULL    |       |
| cust_id      | int          | YES  | MUL | NULL    |       |
| rest_id      | int          | YES  | MUL | NULL    |       |
| order_date   | date         | YES  |     | NULL    |       |
| delivery_add | varchar(80)  | NO   |     | NULL    |       |
| total_amount | decimal(7,2) | NO   |     | NULL    |       |
| order_status | varchar(20)  | NO   |     | NULL    |       |
+--------------+--------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

------------------------------------------------------------------------------------------------------------------


create table order_info
(
id int auto_increment,
order_id int, 
menu_id int,
quantity int not null,
item_price decimal(7,2) not null,
 constraint O_item_id_pk primary key(id),
constraint oid_fk foreign key(order_id) references orders(id) on delete cascade,
constraint mid_fk foreign key(menu_id) references menu(id) on delete cascade
);


mysql> desc order_info;
+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| id         | int          | NO   | PRI | NULL    | auto_increment |
| order_id   | int          | YES  | MUL | NULL    |                |
| menu_id    | int          | YES  | MUL | NULL    |                |
| quantity   | int          | NO   |     | NULL    |                |
| item_price | decimal(7,2) | NO   |     | NULL    |                |
+------------+--------------+------+-----+---------+----------------+

---------------------------------------------------------------------------------------------------------------


create table payment
(
id int auto_increment,
cust_id int,
order_id int,
pay_method varchar(20) not null,
pay_date date,
total_amount decimal(7,2) not null,
constraint payid_pk primary key(id),
constraint payoid_fk foreign key(order_id) references orders(id) on delete cascade,
constraint fk_pcid foreign key(cust_id) references Customers(id) on delete cascade 
);


mysql> desc payment;
+--------------+--------------+------+-----+---------+----------------+
| Field        | Type         | Null | Key | Default | Extra          |
+--------------+--------------+------+-----+---------+----------------+
| id           | int          | NO   | PRI | NULL    | auto_increment |
| cust_id      | int          | YES  | MUL | NULL    |                |
| order_id     | int          | YES  | MUL | NULL    |                |
| pay_method   | varchar(20)  | NO   |     | NULL    |                |
| pay_date     | date         | YES  |     | NULL    |                |
| total_amount | decimal(7,2) | NO   |     | NULL    |                |
+--------------+--------------+------+-----+---------+----------------+

----------------------------------------------------------------------------------------------------------------

create table delivery
(
id int auto_increment,
order_id int ,
delivery_date date,
delivery_status varchar(20) not null,
delivery_person_name varchar(40) not null,
delivery_person_phone varchar(40) not null,
constraint delivery_pk primary key(id),
constraint orderid_fk foreign key(order_id) references orders(id) on delete cascade
);



mysql> desc delivery;
+-----------------------+-------------+------+-----+---------+----------------+
| Field                 | Type        | Null | Key | Default | Extra          |
+-----------------------+-------------+------+-----+---------+----------------+
| id                    | int         | NO   | PRI | NULL    | auto_increment |
| order_id              | int         | YES  | MUL | NULL    |                |
| delivery_date         | date        | YES  |     | NULL    |                |
| delivery_status       | varchar(20) | NO   |     | NULL    |                |
| delivery_person_name  | varchar(40) | NO   |     | NULL    |                |
| delivery_person_phone | varchar(40) | NO   |     | NULL    |                |
+-----------------------+-------------+------+-----+---------+----------------+


------------------------------------------------------------------------------------------------------------

