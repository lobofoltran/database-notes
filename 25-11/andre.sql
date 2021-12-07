create database Andre2000
use Andre2000

CREATE TABLE cliente (
    codcli int PRIMARY KEY,
    nomecli varchar(50),
    cidadecli varchar(50)
);

CREATE TABLE produto (
    codpro int PRIMARY KEY,
    nomepro varchar(50),
    precopro numeric(12,2)
);

CREATE TABLE venda (
    codven int PRIMARY KEY,
    dataven date,
    qtdeven int,
    totalven numeric(12,2),
    fk_cliente_codcli int FOREIGN KEY REFERENCES cliente (codcli),
    fk_produto_codpro int FOREIGN KEY REFERENCES produto (codpro)
);

-----------

SELECT cli.cidadecli, sum(ven.totalven) FROM cliente cli
inner join venda ven
ON cli.codcli = ven.fk_cliente_codcli
-- WHERE ven.dataven between ('20210706', '20210915')
WHERE ven.dataven > '20210706'
and ven.dataven > '20210915'
inner join produto pro
ON pro.codpro = ven.fk_produto_codpro
and pro.nomepro LIKE '%e%'
GROUP BY cli.cidadecli

----------

SELECT cli.cidadecli, sum(ven.totalven) as 'Total Vendas' FROM cliente cli
inner join venda ven
ON cli.codcli = ven.fk_cliente_codcli
and ven.dataven between '20210706' and '20210915'
inner join produto pro
ON pro.codpro = ven.fk_produto_codpro
WHERE pro.nomepro LIKE '%e%'
GROUP BY cli.cidadecli

----------

UPDATE produto
SET precopro += precopro*0.2
FROM produto pro
WHERE pro.nomepro LIKE '%i%'

UPDATE venda
SET totalven = qtdeven * pro.precopro
FROM venda ven
inner join produto pro
ON pro.codpro = ven.fk_produto_codpro
WHERE month(ven.dataven) in (4, 6, 8, 9)
and year(ven.dataven) = 2021
and ven.qtdeven > 50

----------

DELETE venda
FROM venda ven
inner join cliente cli
ON cli.codcli = ven.fk_cliente_codcli
and cli.cidadecli in ('São Paulo', 'Curitiba', 'Santos', 'Rio de Janeiro')
and year(month(ven.dataven)) not in ('20105', '202107')
inner join produto pro
ON pro.codpro = ven.fk_produto_codpro
WHERE pro.codpro > 10
and pro.codpro < 150
and pro.precopro >= 980

----------

UPDATE venda
SET totalven = qtdeven * pro.precopro
FROM venda ven
inner join produto pro
ON pro.codpro = ven.fk_produto_codpro
inner join cliente cli
ON cli.codcli = ven.fk_cliente_codcli





