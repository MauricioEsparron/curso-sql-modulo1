/*Sintaxis para la creación de una base de datos estándar:*/

CREATE DATABASE [NOMBRE_BASE_DATOS]
GO

/*Caso 1: BD_EJEMPLO
Crear la base de datos BD_EJEMPLO de forma estándar y visualizar las características 
de sus archivos:*/

--1. Creando la base de datos BD_EJEMPLO 
CREATE DATABASE BD_EJEMPLO GO

--2. Visualizando las características de sus archivos
SP_HELPDB BD_EJEMPLO
GO

/*--------------------------------------------------------------------*/

/*Sintaxis para la creación de una base de datos personalizada:*/

CREATE DATABASE [NOMBRE_BASE_DATOS]
ON
(
/*Es el nombre lógico del archivo primario; no puede haber dos archivos lógicos con el mismo nombre en una misma base de datos.*/
NAME=NOMBRELOGICO_ARCHIVO,
/*Es la especificación de la ruta y el nombre del archivo físico: FILENAME='C:\base\ventas.mdf'*/
FILENAME='RUTA DEL ARCHIVO',
/*Es el tamaño inicial del archivo*/
SIZE=TAMAÑO INICIAL,
/*Es la definición del máximo tamaño que puede llegar a tener una base de datos.*/
MAXSIZE=MAXIMO TAMAÑO,
/*Es la definición de la tasa de crecimiento; esto puede darse en tamaños específicos (KB, MB o GB) o en porcentajes.*/
FILEGROWTH=TASA DE CRECIMIENTO
)
GO

/*--------------------------------------------------------------------*/

/*Caso 2: BD_COMERCIAL
Cree una base de datos llamada BD_COMERCIAL teniendo en cuenta las siguientes 
opciones:
Un archivo físico y el archivo lógico se creará automáticamente.
Valide la existencia de la base de datos.
Asigne al archivo físico el nombre (NAME) “BD_COMERCIAL_PRI” al archivo 
principal con un tamaño inicial de 50MB (SIZE), un tamaño máximo aceptado por 
el sistema (MAXSIZE), una tasa de crecimiento del 10% (FILEGROWTH) y debe 
ser guardado en la carpeta C:\COMERCIAL (FILENAME).
Verifique la existencia de los archivos implementados.*/


IF DB_ID('BD_COMERCIAL') IS NOT NULL --LA FUNCIONALIDAD DE LA SENTENCIA IF SE ESPECIFICA MÁS ABAJO (LINEA 202)
BEGIN
DROP DATABASE BD_COMERCIAL
END
GO
--CREANDO LA BASE DE DATOS
CREATE DATABASE BD_COMERCIAL
ON
(
NAME = BD_COMERCIAL_PRI,
FILENAME = 'C:\COMERCIAL\BD_COMERCIAL_PRI', --RECUERDA CREAR LAS CARPETAS ANTES
SIZE = 50MB,
MAXSIZE = 60MB,
FILEGROWTH = 10%
)
GO

--VERIFICANDO LA EXISTENCIA DE LOS ARCHIVOS
SP_HELPDB BD_COMERCIAL
GO

/*--------------------------------------------------------------------*/

/*Caso 3: COMERCIAL2017
Cree una base de datos llamada COMERCIAL2017 teniendo en cuenta las siguientes 
opciones:
Un archivo físico y el archivo lógico.
Valide la existencia de la base de datos.
Asigne al archivo físico principal de nombre “COMERCIAL_PRI”, con un tamaño inicial 
de 40MB, un tamaño máximo de 250MB, una tasa de crecimiento del 5MB y debe 
ser guardado en la carpeta C:\COMERCIAL\DATA.
Asigne al archivo lógico el nombre “COMERCIAL_TRA” al archivo de transacciones 
con un tamaño inicial de 10MB, un tamaño máximo de 50MB, una tasa de 
crecimiento del 5% y debe ser guardado en la carpeta
C:\COMERCIAL\LOG.
Verifique la existencia de los archivos implementados.
*/
--VALIDANDO LA CREACIÓN DE LA BASE DE DATOS
IF DB_ID('COMERCIAL2017') IS NOT NULL
BEGIN DROP DATABASE COMERCIO2017
END
GO

--CREACIÓN DE LA BASE DE DATOS
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

--VERIFICANDO LA CREACIÓN DE LOS ARCHIVOS

SP_HELPDB COMERCIAL2017
GO

/*--------------------------------------------------------------------*/

/*Caso 4: BD_TIENDA
Diseñe una base de datos llamada BD_TIENDA teniendo en cuenta las siguientes 
opciones:
Archivo físico principal, archivo físico secundario y el archivo lógico.
Valide la existencia de la base de datos.
Asigne al archivo físico principal el nombre “BD_TIENDA_PRI”, con un tamaño 
inicial de 100MB, un tamaño máximo permitido por el sistema, una tasa de 
crecimiento del 15% y debe ser guardado en la carpeta C:\TIENDA\DATA.
Asigne al archivo físico secundario el nombre “BD_TIENDA_SEC”, con un tamaño 
inicial de 50MB, un tamaño máximo de 250MB, una tasa de crecimiento del 10% y 
debe ser guardado en la carpeta C:\TIENDA\SEC.
Asigne al archivo de transacciones el nombre “BD_TIENDA_TRA”, con un tamaño 
inicial de 5MB, un tamaño máximo de 50MB, una tasa de crecimiento del 5MB y 
debe ser guardado en la carpeta C:\TIENDA\LOG.
Verifique la existencia de los archivos implementados.
*/


--VERIFICACIÓN DE EXISTENCIA DE LA BASE DE DATOS

IF DB_ID('BD_TIENDA')IS NOT NULL
BEGIN 
DROP DATABASE BD_TIENDA
END
GO

--CREACIÓN DE LA BASE DE DATOS

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
