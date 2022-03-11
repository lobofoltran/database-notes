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

1) Desenvolva um script em SQL que mostre um contador até 100 e pare no número 62
mostrando o número como resultado;

DECLARE @Contador AS INT
SET @Contador = 100

WHILE @Contador = 62
BEGIN
	IF @Contador = 62
	BEGIN
		PRINT('62')
	END
	SET @Contador += 1
END

2) Elabore um script em SQL que apresente um contador até 1000 e mostre a soma dos
números multiplicados por 3 e multiplicados por 5 e no final mostrar a soma de cada um deles; 

DECLARE @Conta AS INT
DECLARE @ContadorMult3 AS INT
DECLARE @Quantidade3 AS INT
DECLARE @ContadorMult5 AS INT
DECLARE @Quantidade5 AS INT
DECLARE @SomaCont AS INT

SET @SomaCont = 0
SET @Conta = 1
SET @ContadorMult3 = 0
SET @ContadorMult5 = 0
SET @Quantidade3 = 0
SET @Quantidade5 = 0

WHILE @Conta <= 1000
BEGIN
	IF @Conta % 3 = 0
	BEGIN
		SET @Quantidade3 += 1
		SET @ContadorMult3 += @Conta
	END
	IF @Conta % 5 = 0
	BEGIN
		SET @Quantidade5 += 1
		SET @ContadorMult5 += @Conta
	END
SET @Conta += 1
END

SET @SomaCont = @ContadorMult3 + @ContadorMult5

SELECT 'Soma Múltiplos de 3 => ' + convert(char(10), @ContadorMult3) AS 'Soma Mult 3'
SELECT 'Quantidade Múltiplos de 3 => ' + convert(char(10), @Quantidade3) AS 'Quantidade Mult 3'
SELECT 'Soma Múltiplos de 5 => ' + convert(char(10), @ContadorMult5) AS 'Soma Mult 5'
SELECT 'Quantidade Múltiplos de 5 => ' + convert(char(10), @Quantidade5) AS 'Quantidade Mult 5'
SELECT 'Soma dos dois => ' + convert(char(10), @SomaCont) AS 'Soma Geral'



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
SET @Idade = DAY(GETDATE()) + MONTH(GETDATE()) + CONVERT(INT, SUBSTRING(CONVERT(CHAR(4), YEAR(GETDATE())),3,2))

SELECT @Idade,
CASE
	WHEN @Idade <= 10 THEN 'CRIANÇA'
	WHEN @Idade > 10 AND @Idade <= 17 THEN 'JOVEM'
	WHEN @Idade > 17 AND @Idade <= 60 THEN 'ADULTO'
	ELSE 'IDODO'
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

WHILE @LACO <= 10
BEGIN
	IF @LACO = 8
		BEGIN 
		SELECT @LACO AS 'NUMERO'
		BREAK
		END
	SET @LACO += 1
END

7) Desenvolva um script em PL/SQL que use duas variáveis e verifique se a media for acima de
6 o aluno está aprovado senão reprovado; 

DECLARE @Media AS FLOAT
DECLARE @Resultado AS CHAR(50)

SET @Media = (2 + 6)

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
DECLARE @QuantidadePares AS INT
DECLARE @QuantidadeImpares AS INT

SET @Numero = 1
SET @ContaImpar = 0
SET @ContaPar = 0
SET @QuantidadePares = 0
SET @QuantidadeImpares = 0

WHILE @Numero <= 100
BEGIN
IF @Numero % 2 = 0
BEGIN
	SET @ContaPar += @Numero
	SET @QuantidadePares += 1
END
ELSE
BEGIN
	SET @ContaImpar += @Numero
	SET @QuantidadeImpares += 1
END
SET @Numero += 1
END

SELECT @ContaPar AS 'Pares', @ContaImpar AS 'Impares', @QuantidadePares AS 'Soma Pares', @QuantidadeImpares AS 'Quantidade Impares'


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
