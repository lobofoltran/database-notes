create database Db_Lobo1	-- cria um banco de dados
use Db_Lobo1				-- seleciona banco de dados para uso

-- criação das tabelas

CREATE TABLE aluno (
 id_alu int PRIMARY KEY,
 nome_alu varchar(50),
 sexo_alu char(1),
 bairro_alu varchar(40),
 data_nasc_alu date
);
CREATE TABLE disciplina (
 id_dis int PRIMARY KEY,
 nome_dis varchar(50),
 carga_hor_dis int,
 prof_dis varchar(50),
 curso_dis varchar(50)
);
CREATE TABLE tem (
 fk_aluno_id_alu int FOREIGN KEY REFERENCES aluno (id_alu),
 fk_disciplina_id_dis int FOREIGN KEY REFERENCES disciplina (id_dis)
);

CREATE TABLE professor (
 id_prof int PRIMARY KEY,
 nome_prof varchar(50),
 sexo_prof char(1),
 bairro_prof varchar(40),
 data_nasc_prof date,
 fk_disciplina_id_dis int FOREIGN KEY REFERENCES disciplina (id_dis)
);

-- adicionando dados a tabela

insert into aluno values(1, 'RAYANY LOPES','F','CENTRO','20021229')
insert into aluno values(2,'VITOR CANELLI','M','VILA VERDE','20000412')
insert into aluno values(3,'GUSTAVO LOBO','M','CAUIÁ','20030411')
insert into aluno values(4, 'ADÉLIO BATISTA','M','CENTRO','20041006')
insert into aluno values(5, 'MICHAEL JAMES','M','CIC','20030330')
insert into aluno values(6, 'JAMES MCGILL','M','CAJURU','20020517')
insert into aluno values(7, 'HEISENBERG','M','HAUER','20041025')
insert into aluno values(8, 'DARIUS','M','FAZENDINHA','20040407')
insert into aluno values(9, 'FERNANDA LIMA','F','PILARZINHO','20020615')
insert into aluno values(10, 'EDNA FLORES','F','CENTRO','20030710')

select * from aluno --mostra o conteudo da tabela

insert into disciplina values(1,'BANCO DE DADOS',200,'RUI SOUZA','ADS')
insert into disciplina values(2,'DESENVOLVIMENTO DE APLICAÇÕES',200,'JAIR COELHO','ADS')
insert into disciplina values(3,'ENGENHARIA DE SOFTWARE',200,'CLÁUDIO FONTES','ADS')
insert into disciplina values (4, 'CÁLCULO',100,'ALEXANDRE BENTO','ENGENHARIA CIVIL')
insert into disciplina values (5, 'FÍSICA GERAL E EXPERIMENTAL',120,'MAYCON DOUGLAS','ENGENHARIA CIVIL')
insert into disciplina values (6, 'DESENHO TECNICO PRODUTIVO',100,'PEDRO FONTES','ENGENHARIA CIVIL')

select * from disciplina --mostra o conteudo da tabela

insert into tem values(1,1)
insert into tem values(1,2)
insert into tem values(1,3)
insert into tem values(2,1)
insert into tem values(2,2)
insert into tem values(2,3)
insert into tem values(3,1)
insert into tem values(3,2)
insert into tem values(3,3)
insert into tem values(4,1)
insert into tem values(4,2)
insert into tem values(4,3)
insert into tem values(5,1)
insert into tem values(5,2)
insert into tem values(5,3)
insert into tem values(6,4)
insert into tem values(6,5)
insert into tem values(6,6)
insert into tem values(7,4)
insert into tem values(7,5)
insert into tem values(7,6)
insert into tem values(8,4)
insert into tem values(8,5)
insert into tem values(8,6)
insert into tem values(9,4)
insert into tem values(9,5)
insert into tem values(9,6)
insert into tem values(10,4)
insert into tem values(10,5)
insert into tem values(10,6)

select * from tem --mostra o conteudo da tabela

insert into professor values(1,'RUI SOUZA','M','ATUBA','19890518',1)
insert into professor values(2,'JAIR COELHO','M','SANTA CÂNDIDA','19751013', 2)
insert into professor values(3,'CLÁUDIO FONTES','M','PINHEIRINHO','19910421', 3)
insert into professor values(4,'ALEXANDRE BENTO','M','BOQUEIRÃO','19950205',4)
insert into professor values(5,'MAYCON DOUGLAS','M','CENTRO','19880924', 5)
insert into professor values(6,'PEDRO FONTES','M','AHU','19791010', 6)

select * from professor --mostra o conteudo da tabela

select * from aluno
select * from tem
select * from professor
select * from disciplina

-- Relacionamento entre as tabelas professor e disciplina

SELECT pro.nome_prof,dis.nome_dis FROM professor pro
inner join disciplina dis
on pro.fk_disciplina_id_dis = dis.id_dis

SELECT alu.nome_alu
SELECT tem.fk_aluno_id_alu
SELECT tem.fk_disciplina_id_dis
SELECT pro.nome_prof
SELECT dis.nome_dis

SELECT tem.fk_aluno_id_alu,dis.nome_dis FROM tem
inner join disciplina dis
on tem.fk_aluno_id_alu = tem.fk_disciplina_id_dis

SELECT tem.fk_disciplina_id_dis,alu.nome_alu FROM tem
inner join aluno alu
on tem.fk_aluno_id_alu = tem.fk_disciplina_id_dis

SELECT pro.nome_prof,dis.nome_dis FROM professor pro
inner join disciplina dis
on pro.fk_disciplina_id_dis = dis.id_dis

SELECT pro.nome_prof, dis.nome_dis FROM professor pro
inner join disciplina dis
on pro.fk_disciplina_id_dis = dis.id_dis

SELECT alu.nome_alu, tem.fk_aluno_id_alu, tem.fk_disciplina_id_dis FROM tem
inner join aluno alu
on tem.fk_aluno_id_alu = alu.id_alu

SELECT * FROM professor pro
inner join disciplina dis
on dis.id_dis = pro.fk_disciplina_id_dis

SELECT * FROM tem
inner join disciplina dis
on tem.fk_disciplina_id_dis = tem.fk_aluno_id_alu

select * from aluno
select * from tem
select * from professor
select * from disciplina

SELECT *
FROM aluno
inner join disciplina
ON id_alu = id_alu

SELECT nome_alu, nome_dis
FROM aluno
left join disciplina
ON id_alu = id_alu

SELECT nome_alu, nome_dis
FROM aluno
right join disciplina
ON id_alu = id_alu

-- Relacionamento para ver disciplina e aluno. 

SELECT dis.nome_dis, alu.nome_alu, pro.nome_prof	-- Selecionando o nome das colunas.
FROM professor pro							-- Da tabela PROFESSOR (PRO)
inner join disciplina dis					-- 
ON dis.id_dis = pro.fk_disciplina_id_dis	-- 
and dis.id_dis = 3							-- SELEÇÃO APENAS DISCIPLINA 3.
inner join tem tem							-- 
ON tem.fk_disciplina_id_dis = dis.id_dis	-- NO (TB TEM) FK ID DISCIPLINA = (TB DIS) ID DISCIPLINA
inner join aluno alu						-- 
ON alu.id_alu = tem.fk_aluno_id_alu			-- NO (TB ALU) ID ALUNO = (TB TEM) FK ID ALUNO
WHERE alu.sexo_alu = 'F'					-- Condição SEXO ALUNO = 'F'
and alu.id_alu = 1							-- + E condição ID ALUNO = 1
