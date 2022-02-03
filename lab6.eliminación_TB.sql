

--Eliminación de una tabla de datos DROP

DROP TABLE NOMBRE_TABLA
GO

/*----------------------------------------------------------------*/

--se creará la tabla validando su existencia. Si la tabla ya existe la elimina 

IF OBJECT_ID('TABLA') IS NOT NULL
DROP TABLE TABLA
GO
