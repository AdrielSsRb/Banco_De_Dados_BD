-- Crie uma consulta que mostre todas as tarefas ainda não iniciadas com as informações de seus respectivos envolvidos no processo--

select * from tarefas as tf
inner join status as st on st.id = tf.fk_status
inner join usuarios as us on us.id = tf.fk_solicitante
where st.feita = 'não' ;


/*• Crie uma consulta que mostre todos os usuários que tiveram associação a duas tarefas no mínimo*/

select lc.nome, count(tf.id) as total_tarefa from tarefas as tf
inner join locais as lc on lc.id = tf.fk_local
group by lc.nome
having total_tarefa > 2;

/*Crie uma consulta que mostre todos eventos que ainda acontecerão e as tarefas que ainda não
foram executadas nos locais destes eventos (essa consulta ajudará a gestão visualizar se há algum
problema que pode impactar os eventos)*/

select * from tarefas as tf
inner join status as st on st.id = tf.fk_status
inner join locais as lc on lc.id = tf.fk_local
inner join eventos as ev on lc.id = ev.localFk
where st.feita = 'não' ;

/*Crie uma consulta que mostre os locais e a quantidade de tarefas existentes (independente do status)*/

select lc.nome, count(tf.id) as total_tarefas from tarefas as tf
inner join locais as lc on lc.id = tf.fk_local
group by lc.nome;

/*Crie uma consulta que mostre os locais e a quantidade de tarefas concluídas*/

select lc.nome, count(tf.id) total_tarefas_completas from tarefas as tf
inner join status as st on st.id = tf.fk_status
inner join locais as lc on lc.id = tf.fk_local
inner join eventos as ev on lc.id = ev.localFk
where st.feita = 'sim' and fk_progresso = '4' 
group by lc.nome;

select * from usuarios;
/* Crie uma consulta que mostre os usuários e quantas tarefas possuem atribuídas (independente do status)*/

select us.nome, count(tf.id) total_tarefas  from responsa as rp
inner join usuarios as us on us.id = rp.fk_responsavel
inner join tarefas as tf on tf.id = rp.fk_tarefas
group by us.nome;

/* Crie uma consulta que mostre os usuários e quantas tarefas possuem atribuídas concluídas */

select us.nome, count(tf.id) tarefas_concluidas  from responsa as rp
inner join usuarios as us on us.id = rp.fk_responsavel
inner join tarefas as tf on tf.id = rp.fk_tarefas
inner join status as st on st.id = tf.fk_status
where st.feita = 'sim' and fk_progresso = '4' 
group by us.nome;

/*Crie uma consulta que mostre a média por mês de quantas tarefas são criadas por local */


select avg(mes) as mes, local from (
select count(month(tf.data_abertura)) as mes , year(tf.data_abertura) as ano, tf.fk_local as local from tarefas as tf
inner join locais as lc on lc.id = tf.fk_local 
group by local, ano ) a  group by local;
