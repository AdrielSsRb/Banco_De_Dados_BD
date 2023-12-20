/* criando o banco de dados*/
create database netfilx;
use netfilx;

/*criando as tabelas, filmes e categorias*/
create table category(
	catID bigint not null auto_increment,
    Name varchar(90) not null,
    primary key(catID)
);

create table movies(
	movID bigint not null auto_increment,
    image varchar(300) not null, 
    title varchar(120) not null,
    synopsis varchar(300) not null,
    showtimes varchar(30) not null,
	dateinput date not null,
	catID bigint not null,
    
    primary key(movID),
    foreign key(catID) references category(catID)
);

/*assinaturas, pagamentos e usuario*/
create table plan(
	planID bigint not null auto_increment,
    plan varchar(90) not null,
    price varchar(20) not null,
    
    primary key(planID)
);

create table users(
	userID bigint not null auto_increment,
    username varchar(120) not null,
    brightday date not null,
	planID bigint not null,
    
    primary key(userID),
	foreign key(planID) references plan(planID)
);

create table payments(
	payID bigint not null auto_increment,
    planID bigint not null,
    userID bigint not null,
    dateinput datetime default now(),
    
    primary key(payID),
    foreign key(planID) references plan(planID),
    foreign key(userID) references users(userID)
);


/*inserção de dados*/
insert into category(Name) values ('suspense'), ('terror'), ('comedia'), ('ficção cientifica'), ('aventura'), ('romance'), ('nacional'); 

insert into  movies(title, synopsis, showtimes, dateinput, image, catID) values
('fuja','Após anos vivendo isolada do mundo e sendo cuidada por sua rígida mãe, Chloe começa a desconfiar que há algo extremamente errado em sua vida', '20369', '2022-03-27', 'https://shre.ink/ky9o', 1),
('megan', 'M3GAN é uma maravilha da inteligência artificial, uma boneca realista programada para ser a melhor amiga de uma criança.', '21498', '2022-11-19', 'https://shre.ink/psuyl', 2),
('Free Guy', 'Um caixa de banco preso a uma entediante rotina tem sua vida virada de cabeça para baixo quando descobre que é um personagem em um jogo interativo.','98492','2021-11-09','https://shre.ink/jidyl',3),
('Gato de Botas 2', 'Apenas a melhor animação de todos os tempos, uma aventura com gato de botas.', '65874', '2022-12-07', 'https://shre.ink/ecarkys',5);

insert into plan(plan, price) values ('plano basic', '20'),('premium', '35'),('gold', '50');

insert into users(username, brightday, planID) values
	('Ricardo Inacio da Silva', '2002-04-20','1'),
	('Brenda da Silva', '1998-02-10','1'),
	('Joao Henrique Pereira', '2001-08-20','2'),
	('Pedro Pereira Marints', '1999-05-02','2'),
	('Elaine Maria Jose da Silva', '1975-12-25','1'),
	('Vitor Martins', '2012-12-14','3'),
	('Gabriel Silva', '2001-12-25','1'),
	('Elaine Maria Jose da Silva', '1975-09-09','3'),
	('Kauan Reimond', '1980-07-19','3'),
    ('Matheus Moura', '1986-02-27','3');

insert into payments(planID, userID) values (1, 1),(1, 2),(2,3),(2,4),(1,5),(3,6),(1,7),(3,8),(3,9),(3,10);

select plan.plan, count(*) as qtd from 
plan join users on plan.planID=users.planID
group by plan.plan having count(plan.plan);




select * from movies order by showtimes desc;


/* select */
select * from movies;

drop database netfilx;