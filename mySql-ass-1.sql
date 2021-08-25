create database kamesh;
use kamesh;

create table salesPeople( snum integer ,
 primary key(snum),
 sname varchar(225),
 unique(sname),
 city  varchar(225),
 comm integer not null );
 
insert into salesPeople(snum,sname,city,comm)values(1001, 'Peel.', 'London' , 12);

insert into salesPeople(snum,sname,city,comm)values(1002,  'Serres', 'Sanjose', 13);
 
insert into salesPeople(snum,sname,city,comm)values(1004, 'Motika', 'London', 11);

insert into salesPeople(snum,sname,city,comm)values(1007, 'Rifkin', 'Barcelona', 15);

insert into salesPeople(snum,sname,city,comm)values(1003, 'Axelrod', 'Newyork', 10);

SELECT * FROM kamesh.salespeople;

select sname as name,snum as sid ,city as place ,comm as id from kamesh.salespeople where snum = 1003;

create table customers( Cnum int ,
 primary key(Cnum),
 cname varchar(225) not null,
 city  varchar(225) not null  ,
 snum int not null,
 foreign key (snum)
 references salespeople(snum)
 );
 
insert into customers(cNum,cName,city,snum)values(2001, 'Hoffman', 'London', 1001);

insert into customers(cNum,cName,city,snum)values(2002, ' Giovanni', 'Rome', 1003);

insert into customers(cNum,cName,city,snum)values(2003,  'Liu', 'Sanjose', 1002);

insert into customers(cNum,cName,city,snum)values(2004, 'Grass', 'Berlin', 1002);

insert into customers(cNum,cName,city,snum)values(2006, 'Clemens', 'London', 1001);

insert into customers(cNum,cName,city,snum)values(2008, 'Cisneros', 'Sanjose', 1007);

insert into customers(cNum,cName,city,snum)values(2007, 'Pereira', 'Rome', 1004);

SELECT * FROM kamesh.customers;

create table orderD(
oNum int not null,
 primary key (oNum) ,
 amt int not null,
 oDate varchar(225)  not null,
 cNum int  ,
 snum int,
 foreign key(cNum)
 references customers(cNum)
 );

insert into orderD(oNum,amt,oDate,cNum,snum)values(3001, 18.69, '3-10-1990', 2008 ,1007);

insert into orderD(oNum,amt,oDate,cNum,snum)values(3003, 767.19, '3-10-1990', 2001, 1001);

insert into orderD(oNum,amt,oDate,cNum,snum)values(3002, 1900.10, '3-10-1990', 2007, 1004);

insert into orderD(oNum,amt,oDate,cNum,snum)values(3005,  5160.45, '3-10-1990', 2003, 1002);

insert into orderD(oNum,amt,oDate,cNum,snum)values(3006,  1098.16, '3-10-1990', 2008, 1007);

insert into orderD(oNum,amt,oDate,cNum,snum)values(3009, 1713.23, '4-10-1990', 2002, 1003);

insert into orderD(oNum,amt,oDate,cNum,snum)values(3007,  75.75, '4-10-1990', 2004, 1002);

insert into orderD(oNum,amt,oDate,cNum,snum)values(3008,  4273.00, '5-10-1990', 2006, 1001);

insert into orderD(oNum,amt,oDate,cNum,snum)values(3010,  1309.95, '6-10-1990', 2004, 1002);

insert into orderD(oNum,amt,oDate,cNum,snum)values(3011,  9891.88, '6-10-1990', 2006, 1001);

select * from kamesh.orderD;
SELECT * FROM kamesh.salespeople;
SELECT * FROM kamesh.customers;

select count(sname) as count ,sname from salespeople where sname like  'a%' or sname like 'A%' ;
select  t1.sname , t2.amt from salespeople as t1 inner join orderd as t2 on t1.snum=t2.snum where amt >2000;
select count(sname)as count, sname,city from salespeople where city='Newyork';
select count(sname)as count, city from salespeople where city='London' or city='paris';
select oDate,oNum,snum from orderD group by snum;

