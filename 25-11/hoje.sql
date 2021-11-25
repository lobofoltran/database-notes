create database Db_Lobo1111
use Db_Lobo1111

CREATE TABLE solicitacao (
    id int PRIMARY KEY,
    codproduto int,
    nomeproduto varchar(50),
    valor numeric(12,2),
    dataemissao date
);

CREATE TABLE nota (
    id int PRIMARY KEY,
    codproduto int,
    qtde int,
    valorunit int,
    valortotal numeric(12,2)
);

CREATE TABLE pedido (
    id int PRIMARY KEY,
    data date,
    qtde int,
    valorunit numeric(12,2),
    valortotal numeric(12,2),
    fk_nota_id int FOREIGN KEY REFERENCES nota (id)
);


CREATE TABLE cotacao (
    id int PRIMARY KEY,
    data date,
    qtde int,
    valorunit int,
    valortotal numeric(12,2),
	fk_pedido_id int FOREIGN KEY REFERENCES pedido (id),
    fk_solicitacao_id int FOREIGN KEY REFERENCES solicitacao (id)
);
 
insert into solicitacao values (20, 100, 'NEW WORLD GAME STEAM', 75, '20210505')
insert into solicitacao values (40, 200, 'GTA V GAME STEAM', 130, '20200510')
insert into solicitacao values (60, 300, 'PLAYSTATION 5 PS5', 5200, '20200607')

insert into nota values (10, 100, 1, 75, 75)
insert into nota values (15, 200, 2, 130, 250)
insert into nota values (20, 300, 3, 5200, 15000)

insert into pedido values (100, '20190205', 1, 75, 75, 10)
insert into pedido values (200, '20211205', 2, 130, 250, 15)
insert into pedido values (300, '20200505', 3, 5200, 15000, 20)

insert into cotacao values (500, '20190205', 1, 75, 75, 100, 20)
insert into cotacao values (800, '20190205', 2, 130, 250, 200, 40)
insert into cotacao values (900, '20190205', 3, 5200, 15000, 300, 60)

SELECT * FROM pedido
SELECT * FROM cotacao
SELECT * FROM solicitacao
SELECT * FROM nota

1)
EXCLUSÃO: PRIMEIRO AS TABELAS COM FK.

2)
DELETE cotacao
FROM solicitacao sol
inner join cotacao cota
ON sol.id = cota.fk_solicitacao_id
and month(sol.dataemissao) > 2
and month(sol.dataemissao) < 11
inner join pedido ped
ON ped.id = cota.fk_pedido_id
and ped.id not in (1,3)
inner join nota n
ON n.id = ped.fk_nota_id
and n.qtde > 15
and n.qtde < 1684

3)
DELETE nota
FROM pedido ped
inner join nota n
ON n.id = ped.fk_nota_id
and ped.valortotal > 200

Deu erro, pq gera conflito, as tabelas com fk não podem ser excluidas primeiro.

4)
DELETE cotacao
FROM solicitacao sol
inner join cotacao cota
ON sol.id = cota.fk_solicitacao_id
and sol.dataemissao > '20210201'
inner join pedido ped
ON ped.id = cota.fk_pedido_id
inner join nota n
ON n.id = ped.fk_nota_id
and n.valorunit < 7850
and n.valortotal > 150


