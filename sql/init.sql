USE datadespensa;


CREATE TABLE IF NOT EXISTS donantes(
    id INT PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    zona VARCHAR(50) NOT NULL,
    contacto VARCHAR(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS producto (
    id INT PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    unidad VARCHAR(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXIST lotes(
    id INT PRIMARY KEY,
    producto_id INT NOT NULL,
    donante_id INT NOT NULL,
    cantidad INT NOT NULL,
    fecha_caducidad DATE  NOT NULL,
    zona VARCHAR(50) NOT NULL,
    estado VARCHAR(30) NOT NULL,
    CONSTRAINT fk_lotes_producto FOREIGN KEY(producto_id) REFERENCES productos(id),
    CONSTRAINT fk_lotes_donante FOREIGN KEY(donante_id) REFERENCES donantes(id),
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS familias(
    id INT PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    zona VARCHAR(50) NOT NULL,
    num_personas INT NOT NULL,
    necesidad VARCHAR(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE IF NOT EXISTS entregas(
    id INT PRIMARY KEY,
    familia_id INT NOT NULL,
    lote_id INT NOT NULL,
    fecha DATE NOT NULL,
    estado VARCHAR(30) NOT NULL,
    CONSTRAINT fk_familia FOREIGN KEY(familia_id) REFERENCES familias(id)
    CONSTRAINT fk_familia FOREIGN KEY(lote_id) REFERENCES lotes(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;