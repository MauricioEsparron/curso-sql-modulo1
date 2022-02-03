
/*
INDICE:

Agregar una columna a la tabla:         -  LINEA -> 28
Agregar varias columnas a la tabla:     -  LINEA -> 37
Agregar una llave primaria a la tabla:  -  LINEA -> 46
Agregar llave compuesta a la tabla:     -  LINEA -> 54
Agregar una llave foránea a la tabla:   -  LINEA -> 62
Eliminar una columna de la tabla:       -  LINEA -> 70
Modificar una columna a la tabla:       -  LINEA -> 79

*/






--Modificación de una tabla de datos ALTER

ALTER TABLE NOMBRE_TABLA
FUNCION ESPECIFICACIÓN
GO

/*-------------------------------------------------------------*/

--Agregar una columna a la tabla:

ALTER TABLE NOMBRE_TABLA
ADD COLUMNANUEVA TIPO NULL | NOT NULL
)
GO

/*-------------------------------------------------------------*/

--Agregar varias columnas a la tabla:

ALTER TABLE NOMBRE_TABLA
ADD COLUMNANUEVA1 TIPO NULL | NOT NULL,
    COLUMNANUEVA2 TIPO NULL | NOT NULL
GO

/*-------------------------------------------------------------*/

--Agregar una llave primaria a la tabla:

ALTER TABLE NOMBRE_TABLA
    ADD PRIMARY KEY (COLUMNA)
GO

/*-------------------------------------------------------------*/

--Agregar llave compuesta a la tabla:

ALTER TABLE NOMBRE_TABLA
    ADD PRIMARY KEY (COLUMNA1, COLUMNA2)
GO

/*-------------------------------------------------------------*/

--Agregar una llave foránea a la tabla:

ALTER TABLE NOMBRE_TABLA1
    ADD FOREING KEY (COLUMNA) REFERENCES NOMBRE_TABLA2
GO

/*-------------------------------------------------------------*/

--Eliminar una columna de la tabla:

ALTER TABLE NOMBRE_TABLA
  DROP COLUMN COLUMNA
)
GO

/*-------------------------------------------------------------*/

--Modificar una columna a la tabla:

ALTER TABLE NOMBRE_TABLA
ALTER COLUMN COLUMNA TIPO
)
GO
