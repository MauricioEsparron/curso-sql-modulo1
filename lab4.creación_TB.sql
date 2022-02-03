

--formato BÁSICO de la sentencia Create para una tabla o entidad:

CREATE TABLE NOMBRE_TABLA (
            CAMPO1 TIPO,
            CAMPO1 TIPO,
            CAMPO1 TIPO
)
GO

/*----------------------------------------------------------*/

/*Al formato básico podemos agregarle clausulas que permiten optimizar de la 
mejor manera la creación de la tabla, podemos mencionar:
Asignación de valores nulos y no nulos a las columnas:*/

/*CREATE TABLE NOMBRE_TABLA (
                CAMPO1 TIPO NULL | NOT NULL,
                CAMPO2 TIPO NULL | NOT NULL,
                CAMPO3 TIPO NULL | NOT NULL
)
GO*/

/*----------------------------------------------------------*/

--Asignación de llave primaria:

/*CREATE TABLE NOMBRE_TABLA (
                CAMPO1 TIPO NOT NULL PRIMARY KEY,
                CAMPO2 TIPO NULL | NOT NULL,
                CAMPO3 TIPO NULL | NOT NULL
)
GO*/

/*----------------------------------------------------------*/

--Asignación de llave compuesta:

/*CREATE TABLE NOMBRE_TABLA (
              CAMPO1 TIPO NOT NULL,
              CAMPO2 TIPO NOT NULL,
              CAMPO3 TIPO NULL | NOT NULL,
              PRIMARY KEY (CAMPO1, CAMPO2)
)
GO*/

/*----------------------------------------------------------*/

--Asignación de llave FORÁNEA:

/*CREATE TABLE NOMBRE_TABLA (
              CAMPO1 TIPO NOT NULL PRIMARY KEY,
              CAMPO2 TIPO NULL | NOT NULL,
              CAMPO3 TIPO NULL REFERENCES NOMBRE_TABLA2
)
GO*/

/*----------------------------------------------------------*/

--Asignación de valores por defecto:

/*CREATE TABLE NOMBRE_TABLA (
                CAMPO1 TIPO NULL | NOT NULL,
                CAMPO2 TIPO DEFAULT VALOR_POR_DEFECTO,
                CAMPO3 TIPO NULL | NOT NULL
)
GO*/

/*----------------------------------------------------------*/

--Asignación de restricciones:

/*CREATE TABLE NOMBRE_TABLA (
                CAMPO1 TIPO NULL | NOT NULL,
                CAMPO2 TIPO CHECK (CAMPO=VALOR),
                CAMPO3 TIPO NULL | NOT NULL
)
GO*/

/*-----------------------------------------------------------*/

/*Si la tabla ya existe la elimina y la crea, caso contrario solo la crea. 
Para eso utilizamos la sentencia If.*/

IF OBJECT_ID('TABLA') IS NOT NULL
DROP TABLE TABLA
GO
CREATE TABLE TABLA (
          CAMPO1 CHAR (3) NOT NULL PRIMARY KEY,
          CAMPO2 VARCHAR (30) NOT NULL
)
GO
