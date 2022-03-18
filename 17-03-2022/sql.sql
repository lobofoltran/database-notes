create DATABASE DB_Lobo
use DB_Lobo

DROP TABLE [Aluno]

CREATE TABLE [Aluno]
(matricula int primary key identity,
 nome varchar(100),
 cpf char(11),
 email varchar(100),
 turma varchar(100)) 
--MANIPULAÇÃO DE DADOS
--Inserção de dados
INSERT [Aluno] VALUES ('José da Silva','12345678900','josedasilva@gmail.com', 'ADS')
INSERT [Aluno] VALUES ('Márcio da Silva', '12345678911','marciodasilva@gmail.com', 'ADS')
INSERT [Aluno] VALUES ('Ana da Silva', '12345678922','anadasilva@gmail.com', 'VET')

SELECT * FROM [Aluno]

TRUNCATE TABLE [Aluno]

DROP TABLE [Funcionario]

CREATE TABLE [Funcionario]
(matricula int primary key identity,
 nome varchar(100),
 salario numeric(12,2),
 departamento varchar(50),
 cargo varchar(50))

INSERT [Funcionario] VALUES ('José da Silva', 1650.00 ,'VENDAS', 'Vendedor')
INSERT [Funcionario] VALUES ('Márcio da Silva', 5680.00, 'EXECUTIVO','Diretor Executivo')
INSERT [Funcionario] VALUES ('Ana da Silva', 3410.20, 'FISCAL','Fiscalizador')

SELECT * FROM [Funcionario]

TRUNCATE TABLE [Produto]

DROP TABLE [Produto]

CREATE TABLE [Produto]
(codigo int primary key identity,
 nome varchar(100),
 quantidade int,
 valor numeric(12,2))

INSERT [Produto] VALUES ('Monitor 4K', 3, 3000.00)
INSERT [Produto] VALUES ('Teclado HyperX', 3, 849.90)
INSERT [Produto] VALUES ('Cadeira Pichau Gaming', 3, 2125.50)

SELECT * FROM [Produto]

TRUNCATE TABLE [Produto]

CREATE TABLE NF_Produto 
(numero int,
fk_quant_prod int FOREIGN KEY REFERENCES [Produto] (quantidade),
fk_codigo_prod int FOREIGN KEY REFERENCES [Produto] (codigo))


-- 1. Criar procedure para inserir dados na tabela FUNCIONARIO (MATRICULA, NOME,
-- SALARIO, DEPARTAMENTO, CARGO);

CREATE PROCEDURE sp_AddFunc
ALTER PROCEDURE sp_AddFunc
@nome varchar(100), @salario numeric(12,2), @departamento varchar(50), @cargo varchar(50)
AS
INSERT INTO [Funcionario] (nome, salario, departamento, cargo) VALUES (@nome, @salario, @departamento, @cargo)

EXEC sp_AddFunc 'Gustavo Lobo', 6890.49, 'EXECUTIVO', 'Vice-Presidente'

SELECT * FROM [Funcionario]

-- 2. Criar procedure para inserir dados na tabela FUNCIONARIO do exercício 1. Se o
-- funcionário já existir alterar os dados do mesmo.

ALTER PROCEDURE sp_AddFunc2
@nome varchar(100), @salario numeric(12,2), @departamento varchar(50), @cargo varchar(50)
AS

DECLARE @nomeComparar AS varchar(100)

SET @nomeComparar = (SELECT nome FROM [Funcionario] WHERE nome = @nome)

IF @nome = @nomeComparar
	BEGIN
	UPDATE [Funcionario] SET nome = @nome, salario = @salario, departamento = @departamento, cargo = @cargo WHERE nome = @nome;
	END
ELSE
	BEGIN
	INSERT INTO [Funcionario] (nome, salario, departamento, cargo) VALUES (@nome, @salario, @departamento, @cargo)
END

EXEC sp_AddFunc2 'Gustavo Lobo', 1250.00, 'Gerencia', 'Gerente'
EXEC sp_AddFunc2 'Thiago Prandini', 1250.00, 'Vendas', 'Vendedor'

SELECT * FROM [Funcionario]


-- 3. Criar procedure para inserir dados na tabela FUNCIONARIO do exercício 1. Se o cargo
-- do funcionário for GERENTE o salário do mesmo deve ser acrescido de um bônus de
-- 10% e se o funcionário já existir alterar os dados devem ser alterados na tabela.

ALTER PROCEDURE sp_AumGer
@nome varchar(100), @salario numeric(12,2), @departamento varchar(50), @cargo varchar(50)
AS

DECLARE @nomeComparar AS varchar(100)

SET @nomeComparar = (SELECT nome FROM [Funcionario] WHERE nome = @nome)

IF @nome = @nomeComparar
	BEGIN
	UPDATE [Funcionario] SET nome = @nome, salario = @salario, departamento = @departamento, cargo = @cargo WHERE nome = @nome;
	END
ELSE
	BEGIN
	INSERT INTO [Funcionario] (nome, salario, departamento, cargo) VALUES (@nome, @salario, @departamento, @cargo)
END
	
IF @cargo = 'GERENTE'
	BEGIN
	UPDATE [Funcionario] SET salario += (salario * 0.1) WHERE nome = @nome
END

EXEC sp_AumGer 'Gustavo Lobo', 1250.00, 'Gerencia', 'Gerente' -- ganha 10%
EXEC sp_AumGer 'Marcelo', 1500.00, 'Gerencia', 'Gerente' -- cria e ganha 10%
EXEC sp_AumGer 'Thiago Prandini', 1250.00, 'Vendas', 'Vendedor' -- não muda nada

SELECT * FROM [Funcionario]

-- 4. Considerar a tabela PRODUTO (CODIGO, NOME, QUANTIDADE, VALOR) para criar
-- uma procedure de inserção de dados e se o produto já existir alterar a quantidade em
-- estoque do mesmo.

CREATE PROCEDURE sp_AddProduto
@nome varchar(100), @quantidade int, @valor numeric(12,2)
AS

DECLARE @nomeComparar AS varchar(100)

SET @nomeComparar = (SELECT nome FROM [Produto] WHERE nome = @nome)

IF @nome = @nomeComparar
	BEGIN
	UPDATE [Produto] SET quantidade = @quantidade WHERE nome = @nome;
	END
ELSE
	BEGIN
	INSERT INTO [Produto] (nome, quantidade, valor) VALUES (@nome, @quantidade, @valor)
END

EXEC sp_AddProduto 'Monitor 4K', 3, 3000.00
EXEC sp_AddProduto 'CPU Gamer', 2, 1250.00

SELECT * FROM [Produto]

-- 5. Considerando o DE-R acima, elaborar stored procedure para inserir dados na tabela
-- NF_PRODUTO (QUANTIDADE, CODIGO, NUMERO) cancelando a inserção se a
-- quantidade vendida for menor que a quantidade em estoque.
