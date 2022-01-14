/*Cree una base de datos llamada BD_COMERCIAL teniendo en cuenta las siguientes 
opciones:
Un archivo f�sico y el archivo l�gico se crear� autom�ticamente.
Valide la existencia de la base de datos.
Asigne al archivo f�sico el nombre (NAME) �BD_COMERCIAL_PRI� al archivo 
principal con un tama�o inicial de 50MB (SIZE), un tama�o m�ximo aceptado por 
el sistema (MAXSIZE), una tasa de crecimiento del 10% (FILEGROWTH) y debe 
ser guardado en la carpeta C:\COMERCIAL (FILENAME).
Verifique la existencia de los archivos implementados.*/


IF DB_ID('BD_COMERCIAL') IS NOT NULL --LA FUNCIONALIDAD DE LA SENTENCIA IF SE ESPECIFICA M�S ABAJO (LINEA 202)
BEGIN
DROP DATABASE BD_COMERCIAL
END
GO
--CREANDO LA BASE DE DATOS
CREATE DATABASE BD_COMERCIAL
ON
(
NAME = BD_COMERCIAL_PRI,
FILENAME = 'C:\COMERCIAL\BD_COMERCIAL_PRI', --RECUERDA CREAR LA CARPETA ANTES
SIZE = 50MB,
MAXSIZE = 60MB,
FILEGROWTH = 10%
)
GO

--VERIFICANDO LA EXISTENCIA DE LOS ARCHIVOS
SP_HELPDB BD_COMERCIAL
GO


/*---------------------------------------------------------*/


/*Cree una base de datos llamada COMERCIAL2017 teniendo en cuenta las siguientes 
opciones:
Un archivo f�sico y el archivo l�gico.
Valide la existencia de la base de datos.
Asigne al archivo f�sico principal de nombre �COMERCIAL_PRI�, con un tama�o inicial 
de 40MB, un tama�o m�ximo de 250MB, una tasa de crecimiento del 5MB y debe 
ser guardado en la carpeta C:\COMERCIAL\DATA.
Asigne al archivo l�gico el nombre �COMERCIAL_TRA� al archivo de transacciones 
con un tama�o inicial de 10MB, un tama�o m�ximo de 50MB, una tasa de 
crecimiento del 5% y debe ser guardado en la carpeta
C:\COMERCIAL\LOG.
Verifique la existencia de los archivos implementados.
*/
--VALIDANDO LA CREACI�N DE LA BASE DE DATOS
IF DB_ID('COMERCIAL2017') IS NOT NULL
BEGIN DROP DATABASE COMERCIO2017
END
GO

--CREACI�N DE LA BASE DE DATOS
CREATE DATABASE COMERCIAL2017
ON
(
NAME = COMERCIAL_PRI,
FILENAME = 'C:\COMERCIAL\DATA\COMERCIAL_PRI',--RECUERDA CREAR LA CARPETA ANTES
SIZE = 40MB,
MAXSIZE = 250,
FILEGROWTH = 5MB
)
LOG ON
(
NAME = COMERCIAL_TRA,
FILENAME = 'C:\COMERCIAL\LOG\COMERCIAL_TRA',--RECUERDA CREAR LA CARPETA ANTES
SIZE = 10MB,
MAXSIZE = 50MB,
FILEGROWTH = 5%
)
GO

--VERIFICANDO LA CREACI�N DE LOS ARCHIVOS

SP_HELPDB COMERCIAL2017
GO


/*---------------------------------------------------------*/


/*Dise�e una base de datos llamada BD_TIENDA teniendo en cuenta las siguientes 
opciones:
Archivo f�sico principal, archivo f�sico secundario y el archivo l�gico.
Valide la existencia de la base de datos.
Asigne al archivo f�sico principal el nombre �BD_TIENDA_PRI�, con un tama�o 
inicial de 100MB, un tama�o m�ximo permitido por el sistema, una tasa de 
crecimiento del 15% y debe ser guardado en la carpeta C:\TIENDA\DATA.
Asigne al archivo f�sico secundario el nombre �BD_TIENDA_SEC�, con un tama�o 
inicial de 50MB, un tama�o m�ximo de 250MB, una tasa de crecimiento del 10% y 
debe ser guardado en la carpeta C:\TIENDA\SEC.
Asigne al archivo de transacciones el nombre �BD_TIENDA_TRA�, con un tama�o 
inicial de 5MB, un tama�o m�ximo de 50MB, una tasa de crecimiento del 5MB y 
debe ser guardado en la carpeta C:\TIENDA\LOG.
Verifique la existencia de los archivos implementados.
*/


--VERIFICACI�N DE EXISTENCIA DE LA BASE DE DATOS

IF DB_ID('BD_TIENDA')IS NOT NULL
BEGIN 
DROP DATABASE BD_TIENDA
END
GO

--CREACI�N DE LA BASE DE DATOS

CREATE DATABASE BD_TIENDA
ON
(
NAME = BD_TIENDA_PRI,
FILENAME = 'C:\TIENDA\DATA\BD_TIENDA_PRI.MDF',--RECUERDA CREAR LA CARPETA ANTES
SIZE = 100,
MAXSIZE = UNLIMITED,
FILEGROWTH = 15%
),
(
NAME = BD_TIENDA_SEC,
FILENAME = 'C:\TIENDA\SEC\BD_TIENDA_SEC.NDF',--RECUERDA CREAR LA CARPETA ANTES
SIZE = 50,
MAXSIZE = 250,
FILEGROWTH = 10%
)
LOG ON(
NAME = BD_TIENDA_LOG,
FILENAME = 'C:\TIENDA\LOG\BD_TIENDA_TRA.LDF',--RECUERDA CREAR LA CARPETA ANTES
SIZE = 5,
MAXSIZE = 50,
FILEGROWTH = 5
)
GO
SP_HELPDB BD_TIENDA
GO


/*---------------------------------------------------------*/


--MODIFICACI�N

/*Cuando se trata de modificar en una base de datos SQL SERVER 2014, se utiliza el 
comando ALTER.*/

-- CASO 1.Modificar el nombre de la base de datos BD_TIENDA por MINIMARKET

USE MASTER 
GO
ALTER DATABASE BD_TIENDA -- AQU� DEBES COLOCAR EL NOMBRE DE LA BASE DE DATOS A MODIFICAR
MODIFY NAME = MINIMARKET -- AQU� DEBES COLOCAR EL NOMBRE QUE LE ASIGNARAS
GO

--CASO 2.Agregar 2 archivos secundarios a la base de datos COMERCIAL2017

ALTER DATABASE COMERCIAL2017
ADD FILE
(
NAME = COMERCIAL_SEC1,
FILENAME = 'C:\COMERCIAL\SEC\COMERCIAL_SEC1.NDF',--RECUERDA CREAR LA CARPETA ANTES
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 10%
),
(
NAME = COMERCIAL_SEC2,
FILENAME = 'C:\COMERCIAL\SEC\COMERCIAL_SEC2.NDF',--RECUERDA CREAR LA CARPETA ANTES
SIZE = 10,
MAXSIZE = 100,
FILEGROWTH = 15%
)
GO

--VERIFICANDO LOS ARCHIVOS CREADOS
SP_HELPDB COMERCIAL2017
GO


--CASO 3. Eliminar el archivo secundario COMERCIAL_SEC2 de la base de datos COMERCIAL2017

ALTER DATABASE COMERCIAL2017
REMOVE FILE COMERCIAL_SEC2
GO

--VERIFICANDO LOS ARCHIVOS
SP_HELPDB COMERCIAL2017
GO


/*---------------------------------------------------------*/


--ELIMINACI�N

/*A continuaci�n, utilizaremos el comando DROP*/

--CASO 1. Eliminar la base de datos BD_EJEMPLO

DROP DATABASE BD_FARMACIA
GO

--CASO 2. Eliminar la base de datos BD_COMERCIAL validando la existencia del mismo.

USE MASTER
GO
IF DB_ID('BD_COMERCIAL') IS NOT NULL
DROP DATABASE BD_COMERCIAL
GO


