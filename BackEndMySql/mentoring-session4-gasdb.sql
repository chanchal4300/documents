create table customer(
cust_id int primary key auto_increment,
cname varchar(10),
gender varchar(1) check(gender in('m','f','o')),
address varchar(10),
mobile bigint,
connection decimal(3,1), 
noc int);

describe customer;

create table orders(
order_id int primary key auto_increment,
odate date,
qty int check(qty > 0),
payment_type varchar(6) check(payment_type in('cod','online')),
status varchar(1) check(status in('p','d','c')),
cust_id int,
foreign key(cust_id) references customer(cust_id));

create table cancelled_orders(
order_id int,
cdate date,
reason varchar(30),
foreign key(order_id) references orders(order_id));

create table bill(
bill_no int primary key auto_increment,
bdate date,
delivery_status varchar(1) check(delivery_status in('d','c')),
order_id  int,
foreign key(order_id) references orders(order_id));

create table cancelled_bills(
bill_no int,
cdate date,
reason varchar(30),
foreign key(bill_no) references bill(bill_no));

create table product_price(
connection decimal(3,1),
year int,
month varchar(10),
price int);

insert into customer(cname,gender,address,mobile,connection,noc) 
values('Alice','f','Pune',98754823612,14.2,2);

insert into customer(cname,gender,address,mobile,connection,noc) 
values('Ben','m','Pune',98754822222,14.2,2);

insert into customer(cname,gender,address,mobile,connection,noc) 
values('Charles','m','Delhi',987565712,19.0,2);

insert into customer(cname,gender,address,mobile,connection,noc) 
values('Dom','m','Mumbai',98751111112,19.0,2);

insert into customer(cname,gender,address,mobile,connection,noc) 
values('Elicd','f','Jaipur',987500000612,5.0,2);

insert into `gasdb`.`orders`(
`odate`,
`qty`,
`payment_type`,
`status`,
`cust_id`
)
values(
'2023-05-04','1','online','p','1');

insert into `gasdb`.`orders`(
`odate`,
`qty`,
`payment_type`,
`status`,
`cust_id`
)
values(
'2023-05-05','1','cod','p','2');

insert into `gasdb`.`orders`(
`odate`,
`qty`,
`payment_type`,
`status`,
`cust_id`
)
values(
'2023-05-06','1','online','p','1');

insert into `gasdb`.`orders`(
`odate`,
`qty`,
`payment_type`,
`status`,
`cust_id`
)
values(
'2023-05-07','1','cod','p','2');

select mobile, address
from customer
where gender = 'm';

select * from customer
where gender = 'm';

select cname
from customer
where connection = 19.0;

select cname from customer
where connection = 19.0
or
connection = 5.0;

select cname from customer
where connection in(19.0,5.0);

select cname
from customer,orders
where
customer.cust_id = orders.cust_id
and
payment_type = 'online';

select distinct cname
from customer c,orders o
where
c.cust_id = o.cust_id
and
payment_type = 'online';

select distinct cname
from customer as c
inner join
orders as o
on 
c.cust_id = o.cust_id
where
payment_type = 'online';

select cname from customer
where cname like 'A%';

select cname from customer
where cname like '%S';

select cname from customer
where cname like '%e%';

select * from customer
limit 3 offset 2;

