CREATE TABLE [Aluno]
(Matricula Int NOT NULL Identity(1,1) --Contador automático
,NomeAluno Varchar(100) NOT NULL
,CPF CHAR(11) NOT NULL
,DataNcto SMALLDATETIME NOT NULL
,Mensalidade NUMERIC(6,2) NOT NULL
,Turma char(10) NOT NULL
)
--MANIPULAÇÃO DE DADOS
--Inserção de dados
INSERT ALUNO VALUES ('José da Silva','12345678900','19911121', 1000,'ADS3')
INSERT ALUNO VALUES ('Márcio da Silva', '12345678911','20000317',1000, 'ADS1')
INSERT ALUNO VALUES ('Ana da Silva', '12345678922','20000317', 1000,'ADS3')

SELECT * FROM Aluno

TRUNCATE TABLE aluno

3) Crie um script em PL/SQL que mostre os números de 1 até 100 e mostre se o número é par
ou impar.

DECLARE @Conta AS INT

SET @Conta = 0

WHILE @Conta <= 100
BEGIN
	IF @Conta % 2 = 0
	BEGIN
		PRINT(CONVERT(CHAR(3),@Conta) + 'PAR')
	END
	ELSE
	BEGIN
		PRINT(CONVERT(CHAR(3),@Conta) + 'IMPAR')
	END
	SET @Conta = @Conta + 1
END


4) Desenvolva um script em PL/SQL que apresente o resultado da variável idade será formada
pela data atual, ou seja, dia + mês + 21 do ano igual a 4 + 3 + 21 e mostrar como resultado:
Se Menor que 10 igual a Criança
De 10 até 17 igual a Jovem
De 18 até 60 igual a Adulto
Acima de 61 Idoso 

DECLARE @Idade AS INT
SET @Idade = DATEDIFF(YEAR, '20030411', GETDATE())

SELECT @Idade,
CASE
	WHEN @Idade <= 10 THEN 'CRIANÇA'
	WHEN @Idade > 10 AND @Idade <= 17 THEN 'JOVEM'
	WHEN @Idade > 17 AND @Idade <= 60 THEN 'ADULTO'
	WHEN @Idade > 60 THEN 'IDODO'
END as 'Resultado' 


5) Mostrar em PL/SQL se o aluno Mário da silva está contido em uma variável, bem como seu
salário e calcular aumento de 10% para ele e mostre o nome em letras maiúsculas. 

DECLARE @NomeAluno AS CHAR(100)
DECLARE @Salario AS NUMERIC(6,2)

SET @NomeAluno = UPPER((SELECT NomeAluno FROM Aluno WHERE NomeAluno = 'Márcio da Silva'))
SET @Salario = (SELECT Mensalidade FROM Aluno WHERE NomeAluno = 'Márcio da Silva')

IF @NomeAluno = 'Márcio da Silva'
BEGIN
SET @Salario += @Salario*0.1;
END

SELECT @NomeAluno as 'Nome', @Salario as 'Novo Salário'

6) Elabore um laço de repetição usando PL/SQL que use While e quando o valor for 8 pare e
finalize o programa; 

DECLARE @LACO AS INT
SET @LACO = 0

WHILE @LACO <= 8
BEGIN
	SELECT @LACO AS 'NUMERO'
	SET @LACO += 1
END

7) Desenvolva um script em PL/SQL que use duas variáveis e verifique se a media for acima de
6 o aluno está aprovado senão reprovado; 

DECLARE @Media AS FLOAT
DECLARE @Resultado AS CHAR(50)

SET @Media = 7

IF @Media >= 6
BEGIN
	SET @Resultado = 'APROVADO'
END
ELSE
BEGIN
	SET @Resultado = 'REPROVADO'
END

PRINT(@Resultado)

8) Elabore um script em PL/SQL que verifique os números de 1 até 100 e mostre a quantidade
de pares e impares no final, bem como a soma de todos os pares e também a soma dos
impares.

DECLARE @Numero AS INT
DECLARE @ContaPar AS INT
DECLARE @ContaImpar AS INT
DECLARE @ContaParesImpares AS INT

SET @Numero = 1
SET @ContaImpar = 0
SET @ContaPar = 0
SET @ContaParesImpares = 0;

WHILE @Numero <= 100
BEGIN
IF @Numero % 2 = 0
BEGIN
	SET @ContaPar += 1
END
ELSE
BEGIN
	SET @ContaImpar += 1
END
SET @Numero += 1
END

SET @ContaParesImpares = @ContaPar + @ContaImpar
SELECT @ContaPar AS 'Pares', @ContaImpar AS 'Impares', @ContaParesImpares AS 'Soma'


9) Crie um script em PL/SQL usando CASE que mostre um laço de repetição de 1 até 5000 e
apresente a seguinte mensagem:
Se número entre 1000 e 2000 analista júnior
Se número entre 2500 e 4000 analista pleno
Senão analista sênior 

DECLARE @Num AS INT
SET @Num = 0

WHILE @Num < 5000
BEGIN
SELECT @Num,
CASE
	WHEN @Num >= 1000 AND @Num <= 2000 THEN 'ANALISTA JÚNIOR'
	WHEN @Num >= 2500 AND @Num <= 4000 THEN 'ANALISTA PLENO'
	ELSE 'ANALISTA SÊNIOR'
	END AS 'Categoria'
SET @Num += 1
END
