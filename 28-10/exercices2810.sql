create database Db_Lobo2810
use Db_Lobo2810

CREATE TABLE pedido (
    id int PRIMARY KEY,
    data date,
    qtde int,
    valorunit numeric(12,2),
    valortotal numeric(12,2),
    fk_nota_id int FOREIGN KEY REFERENCES nota (id)
);

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

CREATE TABLE cotacao (
    id int PRIMARY KEY,
    data date,
    qtde int,
    valorunit int,
    valortotal numeric(12,2),
	fk_pedido_id int FOREIGN KEY REFERENCES pedido (id),
    fk_solicitacao_id int FOREIGN KEY REFERENCES solicitacao (id)
);

SELECT * FROM pedido
SELECT * FROM cotacao
SELECT * FROM solicitacao
SELECT * FROM nota
 
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

-- QUESTÃO 1:

SELECT * FROM solicitacao sol
inner join cotacao cota
ON sol.id = cota.fk_solicitacao_id
inner join pedido ped
ON ped.id = cota.fk_pedido_id
inner join nota nota
ON nota.id = ped.fk_nota_id

-- QUESTÃO 2:

SELECT * FROM solicitacao sol
inner join cotacao cota
ON sol.id = cota.fk_solicitacao_id
inner join pedido ped
ON ped.id = cota.fk_pedido_id
inner join nota nota
ON nota.id = ped.fk_nota_id
where sol.valor > 245
and ped.qtde between 16 and 4587
-- and ped.qtde < 4587 
-- and ped.qtde > 16 
and ped.valortotal != 1500

-- QUESTÃO 3:

SELECT ped.id as 'ID Pedido', ped.valortotal as 'Valor Total', cota.id as 'ID Cotação', cota.qtde*cota.valorunit as 'Valor Total' FROM solicitacao sol
inner join cotacao cota
ON sol.id = cota.fk_solicitacao_id
inner join pedido ped
ON ped.id = cota.fk_pedido_id
inner join nota nota
ON nota.id = ped.fk_nota_id

-- QUESTÃO 4:

SELECT cota.* FROM solicitacao sol
inner join cotacao cota
ON sol.id = cota.fk_solicitacao_id
where month(sol.dataemissao) in (4, 5, 7, 8)
and year(sol.dataemissao) not in (2018)

-- Explicação alter table:

SELECT * FROM solicitacao

ALTER TABLE solicitacao ADD cidade varchar(30), estado varchar(02) -- Adiciona

ALTER TABLE solicitacao DROP COLUMN cidade, estado -- Remove

SELECT getdate()

-- QUESTÃO 05: Adicionar os campos data emissão (date), cidade (varchar (40)) e estado (varchar (02)) na nota fiscal.

ALTER TABLE nota ADD dataemissao date, cidade varchar (40), estado varchar (02)

SELECT * FROM nota

-- QUESTÃO 06: Inserir no pedido o campo data de emissão (date)

ALTER TABLE pedido ADD dataemissao date

UPDATE nota
SET dataemissao = '20210505'
where id = 10

-- QUESTÃO 07: Incluir o conteúdo nos campos da nota, a data a partir da data atual, cidade igual a Curitiba e estado igual a PR. Para o campo data do pedido inserir o conteúdo da data atual.

UPDATE nota
SET cidade = 'Curitiba', estado = 'PR'

UPDATE nota
SET dataemissao = concat (year(getdate()), month(getdate()), day(GETDATE()))




