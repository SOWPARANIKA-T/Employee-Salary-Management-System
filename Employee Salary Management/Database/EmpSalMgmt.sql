Create Table tblEmployee (Empid int Identity(101,1) primary key,EmpName varchar(100),EmpDept varchar(100),EmpSex varchar(10),EmpMaritalStatus varchar(10),EmpAddress varchar(100));
create table tblSalary (EmpID int identity(101,1)unique,EmpSalary int);


CREATE PROCEDURE sp_Emp
@empname varchar(100),@empdept varchar(100),@empsex varchar(10),@empmaritalstatus varchar(10),@empaddress varchar(100)
as 
begin
insert into tblEmployee (Empname,Empdept,Empsex,EmpMaritalStatus,EmpAddress) values(@empname,@empdept,@empsex,@empmaritalstatus,@empaddress);
end


CREATE PROCEDURE sp_EmpSal
@empsalary int
as
begin
insert into tblSalary (EmpSalary) values(@empsalary);
end


select * from tblEmployee
inner join tblSalary
on
tblEmployee.Empid=tblSalary.EmpID;