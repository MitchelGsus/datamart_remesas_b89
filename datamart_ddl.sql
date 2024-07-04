CREATE DATABASE dm_remesas_2;
USE dm_remesas_2;

CREATE TABLE dim_fecha (
    id_fecha INT PRIMARY KEY,
    fecha DATE,
    año INT,
    mes INT,
    dia INT,
    dia_semana VARCHAR(10),
    semana INT,
    trimestre INT
);

CREATE TABLE dim_merchant (
    id_merchant INT PRIMARY KEY AUTO_INCREMENT,
    nombre_merchant VARCHAR(255),
    email_merchant VARCHAR(255),
    telefono_merchant VARCHAR(20)
);

CREATE TABLE dim_remitente (
    id_remitente INT PRIMARY KEY AUTO_INCREMENT,
    tipo_documento VARCHAR(20),
    numero_documento VARCHAR(50),
    nombres VARCHAR(255),
    email VARCHAR(255),
    telefono VARCHAR(20)
);

CREATE TABLE dim_beneficiario (
    id_beneficiario INT PRIMARY KEY AUTO_INCREMENT,
    tipo_documento VARCHAR(20),
    numero_documento VARCHAR(50),
    nombres VARCHAR(255),
    email VARCHAR(255),
    telefono VARCHAR(20)
);


CREATE TABLE dim_moneda (
    id_moneda INT PRIMARY KEY AUTO_INCREMENT,
    codigo_moneda VARCHAR(10),
    descripcion_moneda VARCHAR(50)
);

CREATE TABLE fact_remesas (
    id_remesa INT PRIMARY KEY AUTO_INCREMENT,
    id_merchant INT,
    id_remitente INT,
    id_beneficiario INT,
    id_moneda INT,
    id_fecha INT,
    monto DECIMAL(18, 2),
    estado_remesa VARCHAR(50),
    FOREIGN KEY (id_merchant) REFERENCES dim_merchant(id_merchant),
    FOREIGN KEY (id_remitente) REFERENCES dim_remitente(id_remitente),
    FOREIGN KEY (id_beneficiario) REFERENCES dim_beneficiario(id_beneficiario),
    FOREIGN KEY (id_moneda) REFERENCES dim_moneda(id_moneda),
    FOREIGN KEY (id_fecha) REFERENCES dim_fecha(id_fecha)
);