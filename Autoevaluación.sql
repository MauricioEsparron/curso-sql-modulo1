
/*VENTAS1, en la carpeta C:\DATABASE\, considerando que el archivo principal
tiene tamaño de 20 megabytes, un tamaño máximo de 80 megabytes y un 
incremento de 10 megabytes.*/

IF DB_ID ('VENTAS1') IS NOT NULL
DROP DATABASE VENTAS1
GO

CREATE DATABASE VENTAS1
ON
(
	NAME = VENTAS1,
	FILENAME = 'C:\BASES DE DATOS\VENTAS1\VENTAS1_PRI.MDF',
	SIZE = 20 MB,
	MAXSIZE = 80 MB,
	FILEGROWTH = 10 MB
)
GO

SP_HELPDB VENTAS1
GO

/*-----------------------------------------------------------------------*/
/*-----------------------------------------------------------------------*/

/*VENTAS2, en la carpeta C:\MSSQL\DATA\, considerando que el archivo
principal tiene tamaño de 20 megabytes, un tamaño máximo de 80 megabytes y 
un incremento de 10 megabytes. Por otro lado, considere que el archivo de 
transacciones tiene tamaño de 3 megabytes, un tamaño máximo de 13 
megabytes y un incremento del 15% .*/

IF DB_ID ('VENTAS2') IS NOT NULL
DROP DATABASE VENTAS2
GO

CREATE DATABASE VENTAS2
ON(
	NAME = 'VENTAS2_PRI',
	FILENAME = 'C:\BASES DE DATOS\VENTAS2\DATA\VENTAS2_PRI.MDF',
	SIZE = 20 MB,
	MAXSIZE = 80 MB,
	FILEGROWTH = 10 MB
	)
LOG ON(
	NAME = 'VENTAS2_TRA',
	FILENAME = 'C:\BASES DE DATOS\VENTAS2\TRANSACCIONES\VENTAS2_TRA.LDF',
	SIZE = 3 MB,
	MAXSIZE = 13 MB,
	FILEGROWTH = 15%
 	)
GO

SP_HELPDB VENTAS2
GO

--SIRVE PARA CAMBIAR EL NAME DE LOS ARCHIVOS
ALTER DATABASE VENTAS2  
MODIFY FILE (NAME=N'VENTAS22222_TRA', NEWNAME=N'VENTAS2_TRA')
GO

/*-----------------------------------------------------------------------*/
/*-----------------------------------------------------------------------*/

/*VENTAS3, en la carpeta C:\CIBERMARANATA\DATOS\, con la siguiente
configuración:
Archivo de datos: Un tamaño inicial de 20 megabytes, máximo de 120
megabytes y un factor de crecimiento de 5%,
Archivo secundario: Un tamaño inicial de 10 megabytes, máximo de 50
megabytes y un factor de crecimiento de 2 megabytes,
Archivo de transacciones: un tamaño inicial de 8 megabytes, máximo de 75 
megabytes y un factor de crecimiento de 2%.*/

IF DB_ID ('VENTAS3') IS NOT NULL
DROP DATABASE VENTAS3
GO

CREATE DATABASE VENTAS3
ON PRIMARY(
	NAME = VENTAS3_PRI,
	FILENAME = 'C:\BASES DE DATOS\VENTAS3\DATOS\VENTAS3_PRI',
	SIZE = 20 MB,
	MAXSIZE = 120 MB,
	FILEGROWTH = 5%
),
(
	NAME = VENTAS3_SEC,
	FILENAME = 'C:\BASES DE DATOS\VENTAS3\DATOS\VENTAS3_SEC',
	SIZE = 10 MB,
	MAXSIZE = 50 MB,
	FILEGROWTH = 2 MB)
LOG ON 
(		
	NAME = VENTAS_TRA,
	FILENAME = 'C:\BASES DE DATOS\VENTAS3\DATOS\VENTAS3_TRA',
	SIZE = 8 MB,
	MAXSIZE = 75 MB,
	FILEGROWTH = 2%)
GO

SP_HELPDB VENTAS3
GO

--CAMBIARE EL NAME DEL ARCHIVO DE TRANSACCIONES 'VENTAS_TRA' A 'VENTAS3_TRA'

/*-----------------------------------------------------------------------*/
/*-----------------------------------------------------------------------*/

/*Cree la base de datos BD_COLEGIO en la carpeta D:\COLEGIO\DATA\ con la 
siguiente configuración:
Archivo de datos: Un tamaño inicial de 80MB, máximo de 120MB y un
factor de crecimiento de 10%.
Archivo secundario: Un tamaño inicial de 10MB, máximo de 100MB y un
factor de crecimiento de 5MB.*/

IF DB_ID ('BD_COLEGIO') IS NOT NULL
BEGIN DROP DATABASE BD_COLEGIO
END
GO

CREATE DATABASE BD_COLEGIO
ON PRIMARY(
			NAME= BD_COLEGIO_PRI,
			FILENAME = 'C:\BASES DE DATOS\COLEGIO\DATA\BD_COLEGIO_PRI',
			SIZE = 80 MB,
			MAXSIZE = 120 MB,
			FILEGROWTH = 10%)
,
(
            NAME= BD_COLEGIO_SEC,
			FILENAME = 'C:\BASES DE DATOS\COLEGIO\DATA\BD_COLEGIO_SEC.NDF',
			SIZE = 10 MB,
			MAXSIZE = 100 MB,
			FILEGROWTH = 5 MB)
GO

SP_HELPDB BD_COLEGIO
GO

/*---------------------------------------------------------------------------*/
/*---------------------------------------------------------------------------*/

/*La “AGENCIAPERU” tiene por misión tener un control de las estadías de los 
turistas que visitan nuestro país para esto tiene agencias en todo el Perú, por lo 
tanto, necesita automatizar sus procesos actuales. Cree la base de datos 
“AGENCIAPERU”, en la carpeta D:\AGENCIAPERU\DATA\, considerando que:
Archivo de datos: Un tamaño inicial de 50 MegaBytes y máximo de 200
MegaBytes. Habilite la opción de incremento en 12%.
Archivo de transacciones: Un tamaño inicial de 10 MegaBytes y máximo
de 25 MegaBytes. Habilite la opción de incremento en 12%.*/

IF DB_ID ('AGENCIAPERU') IS NOT NULL
BEGIN DROP DATABASE AGENCIAPERU
END 
GO

CREATE DATABASE AGENCIAPERU
ON PRIMARY(
			NAME = AGENCIA_PRI,
			FILENAME = 'C:\BASES DE DATOS\AGENCIAPERU\DATA\AGENCIA_PRI.MDF',
			SIZE = 50,
			MAXSIZE = 200,
			FILEGROWTH = 12%)
			
LOG ON(
			NAME = AGENCIA_TRA,
			FILENAME = 'C:\BASES DE DATOS\AGENCIAPERU\DATA\AGENCIA_TRA.LDF',
			SIZE = 10,
			MAXSIZE = 25,
			FILEGROWTH = 12%)
GO

SP_HELPDB AGENCIAPERU
GO



