USE Kaggle
GO

--EN CASO NO EXISTA LA TABLA dbo.starbucks LA CREAR TABLA
IF NOT EXISTS (SELECT * FROM SYS.TABLES WHERE object_id=OBJECT_ID(N'dbo.starbucks') AND type='U')
	CREATE TABLE dbo.starbucks (
					beverage_category VARCHAR(50),
					beverage VARCHAR(100),
					beverage_prep VARCHAR(50),
					calories DECIMAL(6,3),
					total_fat_g VARCHAR(10),
					trans_fat_g DECIMAL(6,3),
					saturated_fat_g DECIMAL(6,3),
					sodium_mg DECIMAL(6,3),
					total_carbohydrates_g DECIMAL(6,3),
					cholesterol_mg DECIMAL(6,3),
					dietary_fibre_g  DECIMAL(6,3),
					sugars_g  DECIMAL(6,3),
					protein_g  DECIMAL(6,3),
					vitamin_a_pct VARCHAR(10),
					vitamin_c_pct VARCHAR(10),
					calcium_pct VARCHAR(10),
					iron_pct VARCHAR(10),
					caffeine_mg VARCHAR(10)
	)
GO

--SI YA EXISTE LA TABLA dbo.starbucks LA LIMPIA
TRUNCATE TABLE dbo.starbucks;
GO

--IMPORTAR DATA DESDE ARCHIVO
BULK INSERT dbo.starbucks
FROM 'C:\Users\USER\Documents\proyecto_parcial\dataset\starbucks.csv'
WITH
(
	FIRSTROW = 2, --empieza en la 2da fila, ya que la 1era es la cabecera
	FIELDTERMINATOR = ',', --indicamos separador de columnas
	ROWTERMINATOR = '0x0a' --hace referencia a un salto de linea
)

GO
