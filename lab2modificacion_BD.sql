

/*
NOTA:

Achivo principal		      -> ON	           -> .MDF
Archivo de datos:         -> ON PRIMARY     -> .MDF
Archivo secunda,rio:       -> ),(           -> .NDF
Archivo de transacciones: -> LOG ON        -> .LDF 
*/

/*------------------------------------------------------------*/
/*-------------------MODIFICACIÓN-----------------------------*/
/*------------------------------------------------------------*/

--Caso 1: Modificar el nombre de la base de datos BD_TIENDA por MINIMARKET
USE MASTER
GO
ALTER DATABASE BD_TIENDA
MODIFY NAME=MINIMARKET
GO

/*---------------------------------------------------------------*/

--Caso 2: Agregar 2 archivos secundarios a la base de datos COMERCIAL2017
ALTER DATABASE COMERCIAL2017
ADD FILE
(
NAME=COMERCIAL_SEC1,
FILENAME='C:\COMERCIAL\SEC\COMERCIAL_SEC1.NDF',
SIZE=10,
MAXSIZE=50,
FILEGROWTH=10%
),
(
NAME=COMERCIAL_SEC2,
FILENAME='C:\COMERCIAL\SEC\COMERCIAL_SEC2.NDF',
SIZE=10,
MAXSIZE=100,
FILEGROWTH=15%
)
GO
--VERIFICANDO LOS ARCHIVOS CREADOS
SP_HELPDB COMERCIAL2017
GO

/*---------------------------------------------------------------*/

--Caso 3: Eliminar el archivo secundario COMERCIAL_SEC2 de la base de datos COMERCIAL2017
ALTER DATABASE COMERCIAL2017
REMOVE FILE COMERCIAL_SEC2
GO
--VERIFICANDO LOS ARCHIVOS
SP_HELPDB COMERCIAL2017
GO

/*----------------------------------------------------------------*/

--SINTAXIS PARA LA MODIFICACIÓN DEL NOMBRE DE UNA ARCHIVO
ALTER DATABASE [BaseDeDatos]       
MODIFY FILE (NAME=N’NombreAnterior’, NEWNAME=N’NuevoNombre’)
GO

/*-----------------------------------------------------------------*/
                                   
