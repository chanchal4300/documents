SELECT * FROM empdatabaseapi.employee;
Drop database empdatabaseapi;
create database empdatabaseapi;
use empdatabaseapi;

insert into employee(id,email,first_name,last_name)
 values(1,'nishant@gl.com','Nishant','Sexena'),
	   (2,'ujjawal@gl.com','Ujjawal','Sharma'),
       (3,'guriya@gl.com','Guriya','Das'),
       (4,'ishika@gl.com','Ishika','Jaiswal'),
       (5,'aadi@gl.com','Aaditya','Singh');
insert into roles(role_id,name)
values(1,'ADMIN'),
	  (2,'USER'); 
insert into users(user_id,password,username)
values(1,'$2a$12$syDU8860hjsP.VwHC.kKtesC8sHVAA8hwq8c2FjQFMTWHEVz0t0HC','great'),
	  (2,'$12$F78gCW2cKI2M9vP0HnTaVevUq0wxkYMA1c8HtnScQ/YYPNk5clpl.','learning');
      
insert into users_roles(user_id,role_id)
values(1,1),
	  (2,2);
