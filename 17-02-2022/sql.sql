DECLARE @ALUNO INT
DECLARE @msg CHAR(100)
DECLARE @TURMA CHAR(5)

SET @TURMA = 'ADS3'
SET @ALUNO = (SELECT count(*) FROM Aluno WHERE Turma = @TURMA)

IF @ALUNO > 5
	BEGIN
		SET @msg = 'Maior que 5 a Qtde de Alunos Igual a ' + CONVERT(CHAR(10),@ALUNO)
		PRINT(@msg)
	END
ELSE
	BEGIN
		SET @msg = 'Menor que 5 a Qtde de Alunos Igual a ' + CONVERT(CHAR(10),@ALUNO)
		PRINT (@msg)
	END

DECLARE @VALOR NUMERIC(6,2)
DECLARE @msg char(100)
DECLARE @NOME char(100)

SET @VALOR = (SELECT SUM(Mensalidade) FROM Aluno WHERE Matricula = 7)
SET @NOME = (SELECT NomeAluno FROM Aluno WHERE Matricula = 7)

IF @VALOR > 1000
	BEGIN
		SET @VALOR += -(@VALOR*10)/100
		SET @msg = 'Maior que 1000, novo valor de mensalidade (10% de desconto): ' + CONVERT(CHAR(10),@VALOR) + 'Nome: ' + @NOME
	END
ELSE
	BEGIN
		SET @VALOR += -(@VALOR*5)/100
		SET @msg = 'Menor que 1000, novo valor de mensalidade (5% de desconto): ' + CONVERT(CHAR(10),@VALOR) + 'Nome: ' + @NOME
	END
PRINT(@msg)
