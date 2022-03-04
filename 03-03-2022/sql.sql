DECLARE @Conta AS INT
DECLARE @ContadorMult3 AS INT
DECLARE @ContadorMult5 AS INT
DECLARE @SomaCont AS INT

SET @SomaCont = 0
SET @Conta = 1
SET @ContadorMult3 = 0
SET @ContadorMult5 = 0

WHILE @Conta <= 1000
BEGIN
	IF @Conta % 3 = 0
	BEGIN
		SET @ContadorMult3 += 1
	END
	ELSE IF @Conta % 5 = 0
	BEGIN
		SET @ContadorMult5 += 1
	END
SET @Conta += 1
END

SET @SomaCont = @ContadorMult3 + @ContadorMult5

SELECT @ContadorMult3 AS 'Mult 3', @ContadorMult5 AS 'Mult 5', @SomaCont AS 'Soma'
