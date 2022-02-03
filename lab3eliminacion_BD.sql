
/*
NOTA:

archivo principal		  -> ON	           -> .MDF
Archivo de datos:         -> ON PRIMARY     -> .MDF
Archivo secunda,rio:       -> ),(           -> .NDF
Archivo de transacciones: -> LOG ON        -> .LDF 
*/


/*------------------------------------------------------------*/
/*-------------------ELIMINACIÓN------------------------------*/
/*------------------------------------------------------------*/

--Caso 1: Eliminar la base de datos BD_EJEMPLO
DROP DATABASE BD_FARMACIA
GO

/*---------------------------------------------------------------*/

--Caso 2: Eliminar la base de datos BD_COMERCIAL validando la existencia del mismo.
USE MASTER
GO
IF DB_ID('BD_COMERCIAL') IS NOT NULL
DROP DATABASE BD_COMERCIAL
GO
