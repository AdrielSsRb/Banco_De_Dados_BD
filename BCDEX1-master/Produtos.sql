create database producao;
use producao;
/*Criação de tabelas*/
create table productlines(
	productLine bigint not null auto_increment,
    textDescription varchar(160) not null,
    htmlDescription text not null,
    image text not null,
    primary key(productLine)
    );
    
create table products(
	productCode bigint not null auto_increment,
    productName varchar(60) not null,
    productLine bigint not null,
    productScale varchar(60) not null,
    productVendor varchar(100) not null,
    productDescription varchar(160) not null,
    quantilyinStock varchar(12) not null,
    buyPrice varchar(12) not null,
    MSRP varchar(12) not null,
    primary key(productCode),
    foreign key(productLine) references productlines(productLine)
);

create table orders(

orderNumber bigint not null auto_increment,
orderDate datetime default now(),
requiredDate date not null,
shippedDate date not null,
status varchar(100) not null,
comments varchar(160) not null,
customerNumber bigint not null,
primary key(orderNumber),
foreign key(customerNumber) references customers(customerNumber)
);

create table orderdetails(
orderLineNumber bigint not null auto_increment,
orderNumber bigint not null,
productCode bigint not null,
quantilyOrdered varchar(30) not null,
priceEach varchar(30) not null,
primary key(orderLineNumber),
foreign key(productCode) references products(productCode),
foreign key(orderNumber) references orders(orderNumber)
);

create table offices(
officeCode bigint not null auto_increment,
city varchar(60) not null,
phone varchar(13) not null,
addresLine1 varchar(40) not null,
addresLine2 varchar(40) null,
state varchar(50) not null,
country varchar(50) not null,
postalCode varchar(30) not null,
territory varchar(30) not null,
primary key(officeCode)
);

create table employees(
employeeNumber bigint not null auto_increment,
lastName varchar(30) not null,
firstName varchar(30) not null,
email varchar(40) not null,
officeCode bigint not null,
reportsTo varchar(60) not null,
jobTitle varchar(30) not null,
primary key(employeeNumber),
foreign key(officeCode) references offices(officeCode)
);

create table customers(
customerNumber bigint not null auto_increment,
customerName varchar(60) not null,
contactLastName varchar(30) not null,
contactFirstName varchar(30) not null,
phone varchar(13) not null,
addresLine1 varchar(40) not null,
addresLine2 varchar(40) null,
city varchar(60) not null,
state varchar(50) not null,
country varchar(50) not null,
postalCode varchar(30) not null,
employeeNumber bigint not null,
creditLimit varchar(18) not null,
primary key(customerNumber),
foreign key(employeeNumber) references employees(employeeNumber)
); 

create table payments(
checkNumber bigint not null auto_increment,
customerNumber bigint not null,
paymentDate date not null,
amount varchar(18),
primary key(checkNumber),
foreign key(customerNumber) references customers(customerNumber)
);

/*inserindo dados*/

insert into productlines(textDescription, htmlDescription, image) values ("carnes", "https:www.algumtextoqualquerapenasparaexemplificar.com.br", "algumhardtextquerepresenteaimagemtlg");
insert into productlines(textDescription, htmlDescription, image) values ("higiene", "https:www.algumtextoqualquerapenasparaexemplificar.com.br", "algumhardtextquerepresenteaimagemtlg");

insert into products(productName, productLine, productScale, productVendor, productDescription, quantilyinStock, buyPrice, MSRP)
values ("Contrafile", '1', "uma escala ai", "sadia", "contrafile retirado de um boi de alta qualidade", "300", "R$35.90Kg", "R$36.90Kg");
insert into products(productName, productLine, productScale, productVendor, productDescription, quantilyinStock, buyPrice, MSRP)
values ("Fraudinha", '1', "uma escala ai", "seara", "Fraudinha", "200", "R$29.90Kg", "R$32.90Kg");
insert into products(productName, productLine, productScale, productVendor, productDescription, quantilyinStock, buyPrice, MSRP)
values ("Picanha", '1', "FAZ O L", "seara", "picanha apenas", "500", "R$79.90Kg", "R$96.90Kg");
insert into products(productName, productLine, productScale, productVendor, productDescription, quantilyinStock, buyPrice, MSRP)
values ("Papel higienico", '2', "uma escala ai", "Neve", "Papel higienico bala pra limpar o rabo", "1500", "R$20", "R$40");

insert into offices(country, state, city, territory, phone, postalCode, addresLine1, addresLine2)
values ("Brasil", "SP", "Hortolandia", "suldeste", "199870553", "13188002", "410", "-");

insert into  employees(firstName, lastName, email, officeCode, reportsTo, jobTitle)
values ("Andre", "Ribeiro", "pao.batata@60ficaduro.com", '1', "sadia", "vendedor");
insert into  employees(firstName, lastName, email, officeCode, reportsTo, jobTitle)
values ("Nycolas", "Sousa", "sujyrokimemame@70cmg.com", '1', "Neve", "vendedor");

insert into customers(customerName, contactFirstName, contactLastName, phone, addresLine1, addresLine2, country, state, city, postalCode, employeeNumber, creditLimit)
values ("Fernando", "Fernando", "Paiva", "119876561", "689", "B", "Brazil", "SP", "Baueri", "13157002", "1", "R$15000");
insert into customers(customerName, contactFirstName, contactLastName, phone, addresLine1, addresLine2, country, state, city, postalCode, employeeNumber, creditLimit)
values ("Adriel", "Adriel", "Felix", "199879661", "420", "-", "Brazil", "SP", "Campinas", "13188092", "1", "R$150000");
insert into customers(customerName, contactFirstName, contactLastName, phone, addresLine1, addresLine2, country, state, city, postalCode, employeeNumber, creditLimit)
values ("Beka", "Rebeca", "Paiva", "119885361", "113", "A", "Brazil", "SP", "Osasco", "13157002", "2", "R$18000");

insert into payments(customerNumber, paymentDate, amount) values ('1', '2023-01-10', "10");
insert into payments(customerNumber, paymentDate, amount) values ('2', '2023-02-02', "20");
insert into payments(customerNumber, paymentDate, amount) values ('3', '2023-01-15', "5");

insert into  orders(orderDate, requiredDate, shippedDate, status, comments, customerNumber) 
values ('2023-01-05', '2023-01-10', '2023-01-11', "entregue", "---", '1');
insert into  orders(orderDate, requiredDate, shippedDate, status, comments, customerNumber) 
values ('2023-01-31', '2023-02-02', '2023-02-03', "entregue", "---", '2');
insert into  orders(orderDate, requiredDate, shippedDate, status, comments, customerNumber) 
values ('2023-01-05', '2023-01-15', '2023-01-25', "enviado", "---", '3');

insert into orderdetails(orderNumber, productCode, quantilyOrdered, priceEach)
values('1', '1', '1', "R$431"); 
insert into orderdetails(orderNumber, productCode, quantilyOrdered, priceEach)
values('1', '2', '2', "R$113");
insert into orderdetails(orderNumber, productCode, quantilyOrdered, priceEach)
values('2', '4', '1', "R$113");
insert into orderdetails(orderNumber, productCode, quantilyOrdered, priceEach)
values('3', '1', '1', "R$517");
insert into orderdetails(orderNumber, productCode, quantilyOrdered, priceEach)
values('3', '3', '2', "R$1013");

/*join dados*/

select * from orderdetails
inner join orders on orders.orderNumber = orderdetails.orderNumber
inner join products on orderdetails.productCode = products.productCode
inner join productlines on productlines.productLine = products.productLine
inner join customers on customers.customerNumber = orders.customerNumber
inner join employees on customers.employeeNumber = employees.employeeNumber
inner join offices on offices.officeCode = employees.officeCode
inner join payments on payments.customerNumber = customers.customerNumber;


