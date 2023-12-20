drop database formativa;
create database formativa;
use formativa;

create table locais(
id bigint not null auto_increment,
nome_local varchar(50) not null,
max_capacidade int not null,
bloco_ocupado varchar(1),
primary key(id)
);

create table checklist_itens(
id bigint not null auto_increment,
item varchar(200),
primary key(id)
);

create table checklist(
id bigint not null auto_increment,
id_item bigint not null,
id_locais bigint not null,
itens_list bool not null,
primary key(id),
foreign key(id_item) references checklist_itens(id),
foreign key(id_locais) references locais(id)
);

create table usuarios(
id bigint not null auto_increment,
nome varchar(120) not null,
email varchar(150) not null,
data_aniversario date not null,
senha varchar(16) not null,
data_cadastro datetime default now(),
id_status bool not null,
id_ocupação bigint not null,
id_acesso bigint not null,
primary key(id),
foreign key(id_ocupação) references ocupações(id),
foreign key(id_acesso) references acesso(id)
);


create table check_in(
id bigint not null auto_increment,
id_usuarios bigint not null,
id_evento bigint not null,
primary key(id),
foreign key(id_evento) references eventos(id),
foreign key(id_usuarios) references usuarios(id)
);

create table eventos(
id bigint not null auto_increment,
nome_evento varchar(60) not null,
inicio_evento datetime not null,
duracao_evento time not null,
id_local bigint not null,
primary key(id),
foreign key(id_local) references locais(id)
);

create table ocupações(
id bigint not null auto_increment,
ocupação varchar(120) not null,
primary key(id)
);

create table acesso(
id bigint not null auto_increment,
acesso varchar(40) not null,
primary key(id)
);



