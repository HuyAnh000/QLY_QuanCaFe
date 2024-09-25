create database QLQuanCafe
go

use QLQuanCafe
go
--Food
--Table
--FoodCategory
--Account
--Bill
-- BillInfo
create table TableFood
( 
	id int identity primary key,
	name nvarchar(100) not null,
	status nvarchar(100) not null default N'trống' -- Trong || Co nguoi
)
Go

Create table Account
(
	Username nvarchar(100) not null primary key,
	Displayname nvarchar(100) not null,
	Pass nvarchar(1000) not null,
	Type int not null default 0--1: admin && 0 : staff
)
go 
create table FoodCategory
(
	id int identity primary key,
	name nvarchar(100) not null default N'Chưa đặt tên ',
)
go
create table Food
(
	id int identity primary key,
	name nvarchar(100) not null default N'Chưa đặt tên ',
	idCategory int not null,
	price float not null default 0 ,
	foreign key (idCategory) references dbo.FoodCategory(id)
)
go
create table Bill
(
	id int identity primary key,
	DateCheckIn date not null default getdate(),
	DateCheckOut date,
	idTable int not null,
	status int not null default 0 --1: da thanh toan && 0 : chua thanh toan
	foreign key (idTable) references dbo.TableFood(id)
)
go

create table BillInfo
(
	id int identity primary key,
	idBill int not null,
	idFood int not null,
	count int not null default 0,
	foreign key (idFood) references dbo.Food(id),
	foreign key (idBill) references dbo.Bill(id)
)
go