# Prueba Técnica B89
Este repositorio contiene el esquema de base de datos y los scripts necesarios para gestionar el DataMart de remesas del Neobanco B89, una FinTech dedicada a ofrecer servicios financieros innovadores.

## Estructura de la Base de Datos

El esquema de la base de datos está basado en un modelo en estrella y consta de las siguientes tablas:

### Tablas Dimensión

- **dim_fecha:** Información sobre las fechas.
- **dim_merchant:** Información sobre los merchants (clientes B2B).
- **dim_remitente:** Información sobre los remitentes de las remesas.
- **dim_beneficiario:** Información sobre los beneficiarios de las remesas.
- **dim_moneda:** Información sobre las monedas utilizadas en las remesas.

### Tabla de Hechos

- **fact_remesas:** Almacena información sobre las remesas procesadas, incluyendo el estado y el monto.

## Scripts

Este repositorio incluye scripts SQL para crear las tablas, cargar datos ficticios con Python, y realizar operaciones comunes.

## Pregunta
## Si se necesita presentar las vistas diseñadas en un dashboard ¿qué gráficos y filtros usarías para presentarlos de manera amigable pero entendible?

## Vistas a Presentar:

## 1. Cantidad de Remesas No Procesadas por Merchant.
- Gráfico: Barras Apiladas.
- Filtros: fecha(rango, año,trimestre, etc), estado_remesa.
---
## 2. Top 10 Beneficiarios que Recibieron Más Remesas en el Último Mes.
- Gráfico: Barras Apiladas Horizontalmente.
- Filtros: tipo_documento, estado_remesa, fecha(rango, año,trimestre, etc), total_monto.




