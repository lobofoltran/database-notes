-- create database Db_Lobo09092021
-- use Db_Lobo09092021

-- CRIAÇÃO DAS TABELAS

CREATE TABLE veiculo (
    id_veic int PRIMARY KEY,
    marca_veic varchar(30),
    chassi_veic varchar(30),
	modelo_veic varchar(30),
    valor_veic numeric(12,2),
    data_veic date
);

CREATE TABLE proprietario (
    id_prop int PRIMARY KEY,
    nome_prop varchar(30),
    endereco_prop varchar(30),
    bairro_prop varchar(30),
    rg_prop varchar(10),
    habilitacao_prop varchar(3)
);

CREATE TABLE vendas (
    fk_veiculo_id_veic int FOREIGN KEY REFERENCES veiculo (id_veic),
    fk_proprietario_id_prop int FOREIGN KEY REFERENCES proprietario (id_prop),
    id_vend int PRIMARY KEY,
    data_vend date,
    valor_vend numeric(12,2)
);

-- Inserindo dados de veículos
insert into veiculo values (1, 'Ford', '5yuTk5tT3X31k3155', 'Versailles Ghia', 25000, '20210501')
insert into veiculo values (2, 'Wolkswagen', '7UZhm3R7vmA9A4588', 'New Beetle', 40000, '20200610')
insert into veiculo values (3, 'Hyundai', '44N1Al8GbLb351349', 'Sonata', 69000, '20210909')

-- Inserindo dados de proprietários
insert into proprietario values (1, 'GUSTAVO LOBO', 'RUA JAIR COELHO', 'CIDADE INDUSTRIAL', '135520667', 'B')
insert into proprietario values (2, 'RAYANY COSTA', 'RUA XV', 'CENTRO', '105889957', 'AB')
insert into proprietario values (3, 'VICTOR CANELLI', 'RUA JOSÉ ARMINDO DE PAULA', 'CIDADE INDUSTRIAL', '127416964', 'ABC')

-- Inserindo dados de vendas
insert into vendas values (1, 3, 1, '20220510', 24000)
insert into vendas values (2, 1, 2, '20211012', 37900)
insert into vendas values (3, 2, 3, '20211125', 65400)

select * from veiculo
select * from proprietario
select * from vendas

-- mostrando todos os registros
SELECT * FROM veiculo vei
inner join vendas ven
ON fk_veiculo_id_veic =  id_veic
inner join proprietario pro
ON fk_proprietario_id_prop = id_prop

-- mostrando o nome do propritario, o a marca e o modelo do veiculo comprado, valor dele, valor de venda e data de venda. 
SELECT pro.nome_prop, vei.marca_veic, vei.modelo_veic, vei.valor_veic, ven.valor_vend, ven.data_vend FROM veiculo vei
inner join vendas ven
ON fk_veiculo_id_veic =  id_veic
inner join proprietario pro
ON fk_proprietario_id_prop = id_prop

