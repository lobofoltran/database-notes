create database Db_Lobo
use Db_Lobo


CREATE TABLE fornecedor (
    id_forn int PRIMARY KEY,
    nome_forn varchar(50),
    data_forn date,
    cidade_forn varchar(50),
    bairro_forn varchar(50),
    fk_veiculo_id_veic int FOREIGN KEY REFERENCES veiculo (id_veic)
);

CREATE TABLE produto (
    id_prod int PRIMARY KEY,
    nome_prod varchar(50),
    grupo_prod varchar(20),
    data_prod date,
    valor_unit_prod numeric(12,2)
);

CREATE TABLE veiculo (
    id_veic int PRIMARY KEY,
    nome_veic varchar(50)
);

CREATE TABLE venda (
    id_vend int PRIMARY KEY,
    data_vend date,
    valor_unit_vend numeric(12,2),
    qtde_vend int,
	valor_total_vend numeric(12,2),
	fk_fornecedor_id_forn int FOREIGN KEY REFERENCES fornecedor (id_forn),
    fk_produto_id_prod int FOREIGN KEY REFERENCES produto (id_prod)
);
 
SELECT * FROM veiculo
SELECT * FROM produto
SELECT * FROM fornecedor
SELECT * FROM venda

insert into veiculo values (1, 'MONZA')
insert into veiculo values (2, 'GOL')
insert into veiculo values (3, 'MONTANA')

insert into produto values (100, 'MADEIRA', 'MATERIA PRIMA', '20201007', 480)
insert into produto values (200, 'ALUMINIO', 'MATERIA PRIMA', '20190920', 950)
insert into produto values (300, 'PLASTICO', 'PRODUTO ACABADO', '20211112', 150)

insert into fornecedor values (10, 'AUGUSTO BARBOSA', '20180621', 'CURITIBA', 'CIC', 2)
insert into fornecedor values (20, 'DANIEL DE SOUZA', '20150925', 'SÃO JOSÉ DOS PINHAIS', 'AFONSO PENA', 1)
insert into fornecedor values (30, 'ADRIAN AUGUSTO DEY ROMERO', '20120518', 'SÃO PAULO', 'DIADEMA', 3)

insert into venda values (150, '20160810', 950, 10, 9500, 30, 200)
insert into venda values (300, '20180920', 150, 30, 4500, 20, 300)
insert into venda values (450, '20181201', 480, 20, 9600, 10, 100)

SELECT * FROM veiculo
SELECT * FROM produto
SELECT * FROM fornecedor
SELECT * FROM venda

/* 
SELECT forn.nome_forn, veic.nome_veic, prod.nome_prod, prod.grupo_prod, prod.valor_unit_prod, ven.valor_unit_vend, ven.qtde_vend, ven.valor_total_vend FROM fornecedor forn
inner join veiculo veic
ON forn.fk_veiculo_id_veic = veic.id_veic
inner join venda ven
ON ven.fk_fornecedor_id_forn = forn.id_forn
inner join produto prod
ON ven.fk_produto_id_prod = prod.id_prod */

SELECT * FROM fornecedor forn
inner join veiculo veic
ON forn.fk_veiculo_id_veic = veic.id_veic
inner join venda ven
ON ven.fk_fornecedor_id_forn = forn.id_forn
inner join produto prod
ON ven.fk_produto_id_prod = prod.id_prod
/*count(*)*/
/*and ven.qtde_vend > 10*/

SELECT month(prod.data_prod) as 'Mês', sum(prod.valor_unit_prod) as 'Total' FROM produto prod
inner join venda ven
ON prod.id_prod = ven.fk_produto_id_prod
inner join fornecedor forn
ON forn.id_forn = ven.fk_fornecedor_id_forn
inner join veiculo vei
ON vei.id_veic = forn.fk_veiculo_id_veic
where year(prod.data_prod) in (2020,2021)
group by month(prod.data_prod)

order by prod.nome_prod
where (year(prod.data_prod) = 2020 or year(prod.data_prod) = 2021)
/* where year(prod.data_prod) in (2020, 2021)*/
and prod.nome_prod like '%A%'
