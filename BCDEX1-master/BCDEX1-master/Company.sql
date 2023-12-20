create database company;
use company;
/*criação de tabelas*/

create table department(
departID bigint not null auto_increment,
departName varchar(60) not null,
primary key(departID)
);

create table cargos(
cargoID bigint not null auto_increment,
cargoName varchar(60) not null,
departID bigint not null,
primary key(cargoID),
foreign key(departID) references department(departID)
);

create table salario(
salarioID bigint not null auto_increment,
salarioRS varchar(20) not null,
dataSalario date not null,
primary key(salarioID)
);

create table funcionarios(
employeeID bigint not null auto_increment,
dataNasc date not null,
dataCont date not null,
cpf varchar(13) not null,
NameFun varchar(90) not null,
sex varchar(1) not null,
cargo bigint not null,
salario bigint not null,
gerenteID bigint null,
primary key(employeeID),
foreign key(cargo) references cargos(cargoID),
foreign key(salario) references salario(salarioID)
);

create table gerente(
gerenteID bigint not null auto_increment,
departID bigint not null,
employeeID bigint not null,
primary key(gerenteID),
foreign key(departID) references department(departID),
foreign key(employeeID) references funcionarios(employeeID)
);
/*inserção de dados*/

drop database company