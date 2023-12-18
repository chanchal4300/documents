use fordmorn;

create table employee (
employeeId varchar(20),
employeeName varchar(50),
employeeAddress varchar(50),
employeePhone varchar(20),
employeeSalary float,
employeeTax int
);

insert into employee values(1, 'HARSHA','RTNagar',987462112,1000,'12');
insert into employee values(2, "Suman","JayaNagar",9874589615,1500,"13");
insert into employee values(3, "Kishan","KRNagar",3546921785,2000,"13");
insert into employee values(4, "Rajesh Kumar","RTNagar",8564712937,3500,"15");
insert into employee values(8, "Kiran Kumar","IndiraNagar",654789125,2500,"14");
insert into employee values(9, "Sumanath","Koramanglar",254967165,15000,"15");
insert into employee values(10, "Smrithi Kumar","KrishnaRajaPuram",6549893271,2600,"15");

delete from employee where id = 1;
drop table if exists employee ;

create table employee (
employeeId varchar(20),
employeeName varchar(50),
employeeAddress varchar(50),
employeePhone varchar(20),
employeeSalary float,
employeeTax int
);

insert into employee values('E001', 'HARSHA','RTNagar',987462112,1000,'12');
insert into employee values('E002', "Suman","JayaNagar",9874589615,1500,"13");
insert into employee values('E003', "Kishan","KRNagar",3546921785,2000,"13");
insert into employee values('E004', "Rajesh Kumar","RTNagar",8564712937,3500,"15");
insert into employee values('E008', "Kiran Kumar","IndiraNagar",654789125,2500,"14");
insert into employee values('E009', "Sumanath","Koramanglar",254967165,15000,"15");
insert into employee values('E010', "Smrithi Kumar","KrishnaRajaPuram",6549893271,2600,"15");

select * from fordmorn.employee;
describe fordmorn.employee;