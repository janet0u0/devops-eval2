CREATE DATABASE IF NOT EXISTS despachos_db;
CREATE DATABASE IF NOT EXISTS ventas_db;

USE despachos_db;
CREATE TABLE IF NOT EXISTS despachos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero_despacho VARCHAR(50) NOT NULL,
    cliente VARCHAR(255) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    estado ENUM('PENDIENTE', 'EN_CAMINO', 'ENTREGADO', 'CANCELADO') DEFAULT 'PENDIENTE',
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO despachos (numero_despacho, cliente, direccion, estado) VALUES
('D-001', 'Juan Pérez', 'Av. Providencia 1234, Santiago', 'PENDIENTE'),
('D-002', 'María González', 'Calle Los Aromos 567, Maipú', 'EN_CAMINO'),
('D-003', 'Carlos Rojas', 'Pasaje El Sol 89, Las Condes', 'ENTREGADO');

USE ventas_db;
CREATE TABLE IF NOT EXISTS ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero_venta VARCHAR(50) NOT NULL,
    cliente VARCHAR(255) NOT NULL,
    producto VARCHAR(255) NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    estado ENUM('PENDIENTE', 'PAGADA', 'ANULADA') DEFAULT 'PENDIENTE',
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO ventas (numero_venta, cliente, producto, cantidad, precio_unitario, total, estado) VALUES
('V-001', 'Juan Pérez', 'Laptop Dell Inspiron', 1, 599990.00, 599990.00, 'PAGADA'),
('V-002', 'María González', 'Mouse Inalámbrico', 2, 14990.00, 29980.00, 'PENDIENTE'),
('V-003', 'Carlos Rojas', 'Teclado Mecánico', 1, 49990.00, 49990.00, 'PAGADA');