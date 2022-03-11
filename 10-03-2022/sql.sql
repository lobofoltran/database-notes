create DATABASE DB_Lobo2
use DB_Lobo2

DROP TABLE [Aluno]

CREATE TABLE [Aluno]
(Matricula Int NOT NULL Identity(1,1) --Contador automático
,NomeAluno Varchar(100) NOT NULL
,CPF CHAR(11) NOT NULL
,DataNcto SMALLDATETIME NOT NULL
,Mensalidade NUMERIC(6,2) NOT NULL
,Municipio CHAR(20) NOT NULL
,Nota1 FLOAT NOT NULL
,Nota2 FLOAT NOT NULL
,Media FLOAT NOT NULL
,Turma char(10) NOT NULL
)
--MANIPULAÇÃO DE DADOS
--Inserção de dados
INSERT Aluno VALUES ('José da Silva','12345678900','19911121', 1000,'Curitiba', 4, 4, 8, 'ADS3')
INSERT Aluno VALUES ('Márcio da Silva', '12345678911','20000317',1000,'Paranaguá', 5, 5, 10, 'ADS1')
INSERT Aluno VALUES ('Ana da Silva', '12345678922','20000317', 1000,'Curitiba', 2, 3, 5,'ADS3')

SELECT * FROM Aluno

TRUNCATE TABLE aluno

-- 1. Crie uma stored procedure que selecione os alunos do município de Curitiba.

CREATE PROCEDURE sp_AlunosCuritiba
AS
SELECT * FROM Aluno alu
WHERE alu.Municipio = 'Curitiba' 

EXECUTE sp_AlunosCuritiba

-- 2. Crie uma stored procedure que selecione o número de alunos do município
-- de São José dos Pinhais com média maior ou igual a 7.


CREATE PROCEDURE sp_AlunosAprovados
AS
SELECT * FROM Aluno
WHERE Media >= 7
AND Municipio = 'São José dos Pinhais'

EXECUTE sp_AlunosAprovados

-- 3. Crie uma stored procedure que some o valor das mensalidades por
-- município passando o nome do município por parâmetro.

CREATE PROCEDURE sp_SomaMensalidades
@municipio varchar(50)
AS
SELECT sum(Mensalidade) FROM Aluno
WHERE Municipio = @municipio 

EXECUTE sp_SomaMensalidades 'Curitiba'

-- 4. Crie uma stored procedure que calcule a média de um aluno, passando a
-- matricula do mesmo como parâmetro e informe se o mesmo está aprovado
-- para média maior igual a sete, reprovado para média menor que quatro e em
-- recuperação para médias maiores ou igual a quatro e menores que sete.

CREATE PROCEDURE sp_CalculaMedia
@matricula int
AS

DECLARE @nota1 AS FLOAT
DECLARE @nota2 AS FLOAT
DECLARE @media AS FLOAT

SET @nota1 = (SELECT Nota1 FROM Aluno WHERE Matricula = @matricula)
SET @nota2 = (SELECT Nota2 FROM Aluno WHERE Matricula = @matricula)
SET @media = @nota1 + @nota2

IF @media >= 7
	BEGIN
	PRINT('Aluno aprovado!')
	END
ELSE IF @media < 4
	BEGIN
	PRINT('Aluno reprovado!')
	END
ELSE IF @media >= 4 AND @media < 7
	BEGIN
	PRINT ('Aluno em recuperação!')
END

SELECT * FROM Aluno

EXECUTE sp_CalculaMedia 1
EXECUTE sp_CalculaMedia 2
EXECUTE sp_CalculaMedia 3

-- 5. Crie uma stored procedure que mostre o nome e a média de todos alunos do
-- município de Curitiba

CREATE PROCEDURE sp_MediaCuritiba
AS
SELECT NomeAluno, Media FROM Aluno
WHERE Municipio = 'Curitiba'

EXEC sp_MediaCuritiba
