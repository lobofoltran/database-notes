create database Db_Lobo4
use Db_Lobo4

CREATE TABLE pedido (
    id_ped int PRIMARY KEY,
    data_ped date,
    qtde_ped int,
    valor_ped numeric(12,2)
);

CREATE TABLE nota (
    id_not int PRIMARY KEY,
    data_not date,
    qtde_not int,
    valor_not numeric(10,2)
);

CREATE TABLE gera (
    id int PRIMARY KEY,
	fk_nota_id_not int FOREIGN KEY REFERENCES nota(id_not),
    fk_pedido_id_ped int FOREIGN KEY REFERENCES pedido(id_ped)
);

SELECT * FROM pedido
SELECT * FROM nota
SELECT * FROM gera

insert into pedido values (1, '20210902', 1, 119)
insert into pedido values (2, '20210902', 2, 89.90)
insert into pedido values (3, '20210902', 5, 429.90)

insert into nota values (20, '20210902', 1, 119)
insert into nota values (30, '20210902', 2, 89.90)
insert into nota values (40, '20210902', 5, 429.90)

insert into gera values (800, 20, 1)
insert into gera values (900, 30, 2)
insert into gera values (950, 40, 3)

SELECT p.data_ped, p.qtde_ped, p.valor_ped, p.qtde_ped*p.valor_ped as 'Total do Pedido',
 n.data_not, n.qtde_not, n.valor_not, n.qtde_not*n.valor_not as 'Total da Nota' FROM pedido p
inner join gera g
ON p.id_ped = g.fk_pedido_id_ped
inner join nota n
ON n.id_not = g.fk_nota_id_not

WHERE p.data_ped = '20210902' -- condição
and p.valor_ped = 119
