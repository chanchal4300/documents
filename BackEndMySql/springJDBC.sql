create database if not exists springJDBC;

use springJDBC;

CREATE TABLE IF NOT EXISTS Employee(
id int(11) NOT NULL AUTO_INCREMENT,
name varchar(45) NOT NULL,
email varchar(45) NOT NULL,
address varchar(45) NOT NULL,
phoneNo varchar(45) NOT NULL,
PRIMARY KEY(id)
);

SELECT * FROM Employee;
drop table employee;