create table Book
(
Book_Id int primary key,
Book_Name varchar(50),
Category varchar(35),
Total_Quantity int not null
);
create table Customer
(
id int primary key,
Customer_Name varchar(50) not null,
Gender char not null,
Issued_Date date,
Return_Date date,
Book_Id int,
FOREIGN KEY(Book_Id) REFERENCES Book(Book_Id)
);
insert into book values(1, "think and grow rich","self_Help",10);
insert into book values(2, "Richie rich","Cartoon",5);
insert into book values(3, "Spiderman","comics",8);
insert into book values(4, "One punch man","Anime",4);
insert into book values(5, "Java","Computer",9);

insert into Customer values(1,"Aman",'M',"2021-10-16","2021-11-16",2);
insert into Customer values(2,"Zaman",'M',"2021-10-18","2021-11-10",1);
insert into Customer values(3,"Anjali",'F',"2021-10-10","2021-11-05",1);
insert into Customer values(4,"Prachi",'F',"2021-10-09","2021-11-09",3);
insert into Customer values(5,"Ravi",'M',"2021-10-05","2021-11-05",5);
insert into Customer values(6,"Simran",'F',"2021-10-15","2021-11-15",4);
insert into Customer values(7,"Raj",'M',"2021-10-20","2021-11-20",3);

select Gender, count(Gender) FROM Customer,Book where Book_Name = "think and grow rich" and Customer.Book_Id = Book.Book_Id group by gender;
select Book_name,total_quantity as Quantity from book where total_quantity = (select min(total_quantity) from book);

update Book set Total_Quantity= (Total_Quantity-1);

select * from book;

select Customer_Name, count(Customer_Name) as Books_Borrowed from Customer group by Customer_name order by Customer_Name asc;

select Customer_Name ,Gender from Customer where Customer_Name like "A%" order by Customer_Name;

select * from Customer;

select Id,Customer_Name,Gender, Issued_Date from customer where Issued_Date > "2021-10-10";

select C.Customer_Name, B.Book_Name, B.Category from 
Customer as C,Book as B where B.Book_Id = C.Book_id;

select C.Customer_Name , B.Book_Name, B.Category from 
Customer as C inner join
 Book as B 
 on C.Book_Id = B.Book_Id where B.Category = "self_Help" or B.Category = "comics";
 
 
 select book.Book_Name, book.Category, Customer.Id as CustomerId, Customer.Customer_Name from book left outer join Customer on book.Book_Id = Customer.Book_Id;