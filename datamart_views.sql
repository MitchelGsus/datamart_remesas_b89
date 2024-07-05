-- Una vista que muestre la cantidad de remesas por merchant que no pudieron ser procesadas en el último mes.
CREATE VIEW remesas_no_procesadas_ultimo_mes AS
SELECT
    m.nombre_merchant AS nombre_merchant,
    COUNT(f.id_remesa) AS cantidad_no_procesadas,
    d.fecha,
    f.estado_remesa
FROM
    fact_remesas f
    JOIN dim_merchant m ON f.id_merchant = m.id_merchant
    JOIN dim_fecha d ON f.id_fecha = d.id_fecha
WHERE
    f.estado_remesa != 'Entregado'
    AND d.fecha BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 MONTH) AND CURDATE()
GROUP BY
    m.nombre_merchant, d.fecha, f.estado_remesa;

-- Una vista que muestre la información de los 10 clientes que recibieron más remesas el último mes
CREATE VIEW top_10_beneficiarios_ultimo_mes AS
SELECT
    b.id_beneficiario,
    b.tipo_documento,
    b.numero_documento,
    b.nombres,
    b.email,
    b.telefono,
    d.fecha,
    f.estado_remesa,
    COUNT(f.id_remesa) AS cantidad_remesas,
    SUM(f.monto) AS total_monto
FROM
    fact_remesas f
    JOIN dim_beneficiario b ON f.id_beneficiario = b.id_beneficiario
    JOIN dim_fecha d ON f.id_fecha = d.id_fecha
WHERE
    d.fecha BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 MONTH) AND CURDATE()
GROUP BY
    b.id_beneficiario, b.tipo_documento, b.numero_documento, b.nombres, b.email, b.telefono,
    d.fecha, f.estado_remesa
ORDER BY
    cantidad_remesas DESC
LIMIT 10;
