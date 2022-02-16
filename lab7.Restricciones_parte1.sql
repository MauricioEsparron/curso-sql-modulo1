0999999999999999999999999999999999999999999999999999855555555555}}}}}}}444444444444444444444444444444444444444444444444444444444444444444444444444444444.-



--Asignar Primary Key al crear la tabla
CREATE TABLE NOMBRE_TABLA (
      COLUMNA1 TIPO NOT NULL PRIMARY KEY,
      COLUMNA2 TIPO NULL,
      COLUMNA3 TIPO NOT NULL
)
GO

/*-------------------------------------------------------*/
/*-------------------------------------------------------*/

--Asignar varias Primary Key al crear la tabla
CREATE TABLE NOMBRE_TABLA (
      COLUMNA1 TIPO NOT NULL,
      COLUMNA2 TIPO NULL,
      COLUMNA3 TIPO NOT NULL,
      PRIMARY KEY (COLUMNA1, COLUMNA2)
)
GO

/*-------------------------------------------------------*/
/*-------------------------------------------------------*/

--Asignar Primary Key modificando la tabla
ALTER TABLE NOMBRE_TABLA
    ADD PRIMARY KEY (COLUMNA1)
GO

/*-------------------------------------------------------*/
/*-------------------------------------------------------*/

--Asignar varias Primary Key modificando la tabla
ALTER TABLE NOMBRE_TABLA
    ADD PRIMARY KEY (COLUMNA1, COLUMNA2)
GO
 4
/*-------------------------------------------------------*/
/*-------------------------------------------------------*/
pññ
/*-------------------------------------------------------*/
/*-------------------------------------------------------*/
