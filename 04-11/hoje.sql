-- QUESTÃO 08: Mostre a qtde de notas, onde a solicitação seja dos dias 4, 5, 8, 9, 22, 25, 26, 27.

SELECT count(n.id) FROM nota n
inner join pedido ped
ON n.id = ped.fk_nota_id
inner join cotacao cota
ON ped.id = cota.fk_pedido_id
inner join solicitacao sol
ON sol.id = cota.fk_solicitacao_id
where day(sol.dataemissao) in (4, 5, 8, 9, 22, 25, 26, 27)

-- QUESTÃO 09: Liste a soma do valor total do pedido onde a cotação seja com qtde maior 5 e menor que 4585, e o nome do produto na solicitação contenha a letra A.

SELECT sum(ped.valortotal) FROM pedido ped
inner join cotacao cota
ON ped.id = cota.fk_pedido_id
inner join solicitacao sol
ON sol.id = cota.fk_solicitacao_id
where cota.qtde > 5 and cota.qtde < 4585
and sol.nomeproduto like '%A%'

-- Funções de Data:

SELECT GETDATE() -- Mostra a hora atual (corrente) do computador.

SELECT DATEPART(YEAR, '25/09/2004') -- Mostra o ano da data selecionada (dia, mês ou ano).
SELECT YEAR('02/01/2004')

SELECT DATEADD(MONTH, 6, getdate()) -- Adiciona mês, dias e anos a data.

SELECT DATEDIFF(MONTH, '02/01/2021', '02/01/2022') -- Mostra a diferença de dias, meses ou anos entre as datas.

-- QUESTÃO 10: Apresentar todos os pedidos onde o mês da solicitação seja 5, 7, 8, 10, 11.

SELECT * FROM solicitacao
SELECT * FROM pedido

SELECT * FROM pedido ped
inner join cotacao c
ON ped.id = c.fk_pedido_id
inner join solicitacao sol
ON sol.id = c.fk_solicitacao_id
where month(sol.dataemissao) not in (5, 7, 8, 10, 11)

-- QUESTÃO 11: Exibir a data da solicitação mais 10 dias e a data do pedido mais 5 meses, somente dos pedidos com id diferente de 5, 7, 9.

SELECT DATEADD(DAY, 10, sol.dataemissao) as 'Data Solicitação', DATEADD(MONTH, 5, ped.dataemissao) as 'Data Pedido' FROM  solicitacao sol
inner join cotacao c
ON sol.id = c.fk_solicitacao_id
inner join pedido ped
ON ped.id = c.fk_pedido_id
where ped.id not in (5, 7, 9)

-- QUESTÃO 12: Mostrar a diferença de data entre as datas da solicitação e do pedido em dias e meses, somente do ano diferente de 2020 da solicitação.

SELECT DATEDIFF(DAY, sol.dataemissao, ped.dataemissao) as 'Dias', DATEDIFF(MONTH, sol.dataemissao, ped.dataemissao) as 'Meses' FROM solicitacao sol
inner join cotacao c
ON sol.id = c.fk_solicitacao_id
inner join pedido ped
ON ped.id = c.fk_pedido_id
where DATEPART(YEAR, sol.dataemissao) <> 2020
