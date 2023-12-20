use formativaHogwarts;
-- adição de link das fotos e das sms --
alter table usuarios
add Link_Fotos text not null,
add sms varchar(15) not null;

create table progresso(
	id bigint not null auto_increment,
    nome_status varchar(50) not null,
    primary key(id)
);

insert into progresso(nome_status) values("Aberta"), ("Em andamento"), ("concluída"), ("Encerrada") ;

create table status( 
	id bigint not null auto_increment,
    feita enum("sim","não") not null,
    data_modificacao datetime not null,
    fk_progresso bigint not null,
    primary key(id),
    foreign key(fk_progresso) references progresso(id)
);
 select * from status;
 
 insert into status(feita, data_modificacao, fk_progresso)
 values ("sim", '2023-06-01 21:38:21', 1),("sim", '2023-05-23 20:09:41', 2),
 ("não", '2023-05-24 20:39:41', 3),("sim", '2023-05-25 19:09:41', 1),
 ("sim", '2023-06-01 21:38:21', 1),("não", '2023-03-01 21:40:21', 4);
 
create table foto_tarefas(
	id bigint not null auto_increment,
    descrivcao_imagem varchar(100) not null,
	link_foto text not null,
    primary key(id)
);

insert into foto_tarefas(link_foto, descrivcao_imagem) 
values ("https://www.bl.ink/", 'BL.INK'),("https://www.t2mio.com","T2M" ),("https://polrproject.org/","Polr"),(" https://short.io/","Short.io:");
;


create table tarefas(
	id bigint not null auto_increment,
    nome_tarefa varchar(100) not null,
    descricao varchar(200) not null,
    prazo datetime not null,
    data_abertura datetime not null,
    data_fechamento datetime not null,
    fk_solicitante bigint not null,
    fk_local bigint not null,
	fk_status bigint not null,
    fk_foto bigint null,
    primary key(id),
    foreign key(fk_foto) references foto_tarefas(id),
    foreign key(fk_local) references locais(id),
    foreign key(fk_solicitante) references usuarios(id),
    foreign key(fk_status) references status(id)
);
select * from tarefas;

insert into tarefas(nome_tarefa, descricao, prazo, data_abertura, data_fechamento, fk_solicitante, fk_local, fk_status, fk_foto)
 values ("primeira", 'a primeira só pra preencher', '2023-06-02 00:00:00', '2023-05-02 20:00:00', '2023-06-09 00:00:00', 2, 3, 1,2),
		("segunda", 'a segunda só pra preencher', '2023-07-05 00:00:00', '2023-05-02 22:00:00', '2023-07-19 12:00:00', 1, 2, 1, 3);


create table responsa(
	id bigint not null auto_increment,
    fk_responsavel bigint not null,
    fk_tarefas bigint not null,
    primary key(id),
	foreign key(fk_responsavel) references usuarios(id),
    foreign key(fk_tarefas) references tarefas(id)
);

insert into responsa(fk_responsavel, fk_tarefas) 
values (2,2), (1,2),(3,1),(1,1);



select * from status;

