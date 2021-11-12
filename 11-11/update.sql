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

-- (1) Atualizar o campo valor total da tabela pedido com a multiplicação dos campos qtde e valorunit 
-- da tabela cotação onde o ano da data da solicitação seja 2021.

UPDATE pedido
SET valortotal = cota.qtde*cota.valorunit
FROM pedido ped
inner join cotacao cota
ON cota.fk_pedido_id = ped.id
inner join solicitacao sol
ON sol.id = cota.fk_solicitacao_id
where year(sol.dataemissao) = 2021

SELECT * FROM pedido
SELECT * FROM cotacao

-- (2) Alterar o valor total da tabela cotação com a multiplicação da qtde pelo valor unitário.

UPDATE cotacao
SET valortotal = qtde*valorunit

-- (3) O valor da tabela solicitação sofreu um aumento de 20% aplicado a partir do valor unitário 
-- do pedido, onde o ID da cotação seja maior igual a 1.

UPDATE solicitacao
SET valor += ped.valorunit + ped.valorunit*0.2
FROM solicitacao sol
inner join cotacao cota
ON sol.id = cota.fk_solicitacao_id
inner join pedido ped
ON ped.id = cota.fk_pedido_id
where cota.id >= 1

SELECT * FROM solicitacao

-- (4) Os valores unitários das tabelas cotação, pedido e nota tiveram um desconto de 10% somente no ID diferente de 3 da tabela solicitação.

SELECT * FROM cotacao

UPDATE cotacao
SET valorunit -= cota.valorunit*0.1
FROM cotacao cota
inner join solicitacao sol
ON sol.id = cota.fk_solicitacao_id
where sol.id <> 3

UPDATE pedido
SET valorunit -= ped.valorunit*0.1
FROM pedido ped
inner join cotacao cota
ON ped.id = cota.fk_pedido_id
inner join solicitacao sol
ON sol.id = cota.fk_solicitacao_id
where sol.id <> 3
 
UPDATE nota
SET valorunit -= n.valorunit*0.1
FROM nota n
inner join pedido ped
ON n.id = ped.fk_nota_id
inner join cotacao cota
ON ped.id = cota.fk_pedido_id
inner join solicitacao sol
ON sol.id = cota.fk_solicitacao_id
where sol.id <> 3

-- 

UPDATE cotacao
SET valorunit -= cota.valorunit*0.1
FROM cotacao cota
UPDATE pedido
SET valorunit -= ped.valorunit*0.1
FROM pedido ped
UPDATE nota
SET valorunit -= n.valorunit*0.1
FROM nota n
inner join pedido ped
ON n.id = ped.fk_nota_id
inner join cotacao cota
ON ped.id = cota.fk_pedido_id
inner join solicitacao sol
ON sol.id = cota.fk_solicitacao_id
where sol.id <> 3

-- (5) O pedido teve um reajuste no valor total que deve ser calculado com a seguinte regra o mês atual 
-- multiplicado pelo ID da cotação subtraído pelo dia atual somado ao ano atual onde o ano da data de emissão 
-- da solicitação seja maior que 2019.

UPDATE pedido
SET valortotal = (month(ped.data)*cota.id) - day(ped.data) + year(ped.data)
FROM pedido ped
inner join cotacao cota
ON ped.id = cota.fk_pedido_id
inner join solicitacao sol
ON sol.id = cota.fk_solicitacao_id
where year(sol.dataemissao) > 2019

-- (6) Os campos qtde, valor unitário e valor total da cotação receberam os valores dos 
-- respectivos campos da tabela nota, somente do ID 1 e 3 da nota.

UPDATE cotacao
SET qtde = n.qtde, valorunit = n.valorunit, valortotal = n.valortotal
FROM cotacao cota
inner join pedido ped
ON ped.id = cota.fk_pedido_id
inner join nota n
ON n.id = ped.fk_nota_id
where n.id in (1, 3)
