---JADILAH TAPI BARU PERKATEGORI
DECLARE @ID VARCHAR (15)							
DECLARE @Rata_rata VARCHAR (15)
DECLARE @knapsack MONEY
DECLARE @temp MONEY, @temp2 MONEY
SET @temp = 0
SET @temp2 = 0
SET @knapsack = 100000						

DECLARE data_sortingan CURSOR FOR		
	SELECT I.Category, AVG(I.Price) AS Rata_rata
	FROM Categories C JOIN Items I
		ON C.ID = I.Category
	GROUP BY I.Category
	ORDER BY Rata_rata

OPEN data_sortingan
/*
PRINT'ID	Rata_rata'
PRINT'-------------'											
*/
FETCH NEXT FROM data_sortingan INTO @ID, @Rata_rata
WHILE @@FETCH_STATUS = 0			
BEGIN
	---PRINT CAST(@Rata_rata AS MONEY)
	SET @temp = @temp + CAST(@Rata_rata AS MONEY)
	IF @temp < @knapsack
		BEGIN	
			---PRINT @ID + '	' + @Rata_rata
			INSERT INTO HasilGreedy VALUES (CAST(@ID AS VARCHAR(3)))
			FETCH NEXT FROM data_sortingan INTO @ID, @Rata_rata
		END
	ELSE
		BEGIN
			SET @temp = @temp - CAST(@Rata_rata AS MONEY)
			BREAK
		END
END
CLOSE data_sortingan									
DEALLOCATE data_sortingan

---Sampai disini kita mulai cari detil itemnya

DECLARE @lowprice VARCHAR (15)						
DECLARE @idnya VARCHAR (15)	
DECLARE @sementarajon MONEY
DECLARE @ID_PK INT
DECLARE @nama_item VARCHAR(50)
SET @sementarajon = 0					

DECLARE data_detail_greedy CURSOR FOR		
	SELECT MIN(PRICE) AS Low_Price, Category
	FROM Items
	WHERE Category IN (SELECT * FROM HasilGreedy)
	GROUP BY Category						

OPEN data_detail_greedy											
FETCH NEXT FROM data_detail_greedy INTO @lowprice, @idnya	
WHILE @@FETCH_STATUS = 0					
BEGIN
	---PRINT @lowprice + '	 ' + @idnya
	SET @sementarajon = @sementarajon + @lowprice
	
	SELECT @ID_PK = ID, @nama_item = item
	FROM Items
	WHERE Price = @lowprice AND Category = @idnya

	INSERT INTO DetailGreedy
	VALUES (@ID_PK, @nama_item, @lowprice, @idnya)

	FETCH NEXT FROM data_detail_greedy INTO @lowprice, @idnya	
END
CLOSE data_detail_greedy								
DEALLOCATE data_detail_greedy						

---Tampilin data Hasil Greedynya
DECLARE @dataID INT						
DECLARE @dataItem VARCHAR(50)
DECLARE @dataPrice MONEY
DECLARE @dataCategory INT						

DECLARE data_hasil_greedy CURSOR FOR		
	SELECT * FROM DetailGreedy					
PRINT ''
PRINT ''
PRINT 'ID  |  Price  |  Category	|	Item'
PRINT '------------------------------------------------------------'
OPEN data_hasil_greedy											
FETCH NEXT FROM data_hasil_greedy INTO @dataID, @dataItem, @dataPrice, @dataCategory
WHILE @@FETCH_STATUS = 0					
BEGIN
PRINT CAST(@dataID AS VARCHAR(50))  + '   ' + CAST(@dataPrice AS VARCHAR(50)) + '    ' + CAST(@dataCategory AS VARCHAR(50))+ '			 ' + CAST(@dataItem AS VARCHAR(50))
	FETCH NEXT FROM data_hasil_greedy INTO @dataID, @dataItem, @dataPrice, @dataCategory
END
CLOSE data_hasil_greedy								
DEALLOCATE data_hasil_greedy
PRINT''
PRINT'Knapsack = Rp'+CAST(@knapsack AS VARCHAR(15))	+',-'
PRINT'Total Per Kategori Item = Rp'+CAST(@temp AS VARCHAR(15)) +',-'						
PRINT'Total Detil Item = Rp'+CAST(@sementarajon AS VARCHAR(15)) +',-'						
TRUNCATE TABLE HasilGreedy
TRUNCATE TABLE DetailGreedy
