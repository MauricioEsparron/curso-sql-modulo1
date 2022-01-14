/*Cree una base de datos llamada BD_COMERCIAL teniendo en cuenta las siguientes 
opciones:
Un archivo físico y el archivo lógico se creará automáticamente.
Valide la existencia de la base de datos.
Asigne al archivo físico el nombre (NAME) “BD_COMERCIAL_PRI” al archivo 
principal con un tamaño inicial de 50MB (SIZE), un tamaño máximo aceptado por 
el sistema (MAXSIZE), una tasa de crecimiento del 10% (FILEGROWTH) y debe 
ser guardado en la carpeta C:\COMERCIAL (FILENAME).
Verifique la existencia de los archivos implementados.*/


IF DB_ID('BD_COMERCIAL') IS NOT NULL 
BEGIN
DROP DATABASE BD_COMERCIAL
END
GO
--CREANDO LA BASE DE DATOS
CREATE DATABASE BD_COMERCIAL
ON
(
NAME = BD_COMERCIAL_PRI,
FILENAME = 'C:\COMERCIAL\BD_COMERCIAL_PRI', --RECUERDA CREAR LAS CARPETAS CORRESPONDIENTES ANTES
SIZE = 50MB,
MAXSIZE = 60MB,
FILEGROWTH = 10%
)
GO

--VERIFICANDO LA EXISTENCIA DE LOS ARCHIVOS
SP_HELPDB BD_COMERCIAL
GO
