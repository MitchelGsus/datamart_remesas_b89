SELECT * FROM temp_remesas
drop PROCEDURE cargar_remesas
CREATE PROCEDURE cargar_remesas
AS
BEGIN

    IF OBJECT_ID('temp_remesas') IS NOT NULL
        DROP TABLE temp_remesas;

    CREATE TABLE temp_remesas (
        id_remesa       INT PRIMARY KEY IDENTITY,
        id_merchant     INT,
        id_remitente    INT,
        id_beneficiario INT,
        id_moneda       INT,
        id_fecha        INT,
        monto           DECIMAL(18, 2),
        estado_remesa   VARCHAR(50)
    );

    TRUNCATE TABLE temp_remesas;

    BULK INSERT temp_remesas
    FROM 'remesas.csv'
    WITH (
        FORMAT = 'CSV',
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        FIRSTROW = 2
    );
END;

EXEC cargar_remesas;