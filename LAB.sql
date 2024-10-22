
CREATE TABLE IF NOT EXISTS CLIENTES (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(100) NOT null,
    direccion VARCHAR(100) NOT null,
    pais VARCHAR(100) not NULL);


CREATE TABLE if not exists EMPLEADOS (
    id_empleado SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    cargo VARCHAR(50) NOT NULL
);

CREATE table if not exists  PROVEEDORES (
    id_proveedores SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(100) UNIQUE NOT null,
    direccion VARCHAR(100) UNIQUE NOT null);


CREATE TABLE if not exists ENVIOS (
    id_envio SERIAL PRIMARY KEY,
    estado VARCHAR(100) NOT NULL,
    total int NOT NULL,
    departamento VARCHAR(50) NOT null,
    fecha_envio DATE DEFAULT CURRENT_DATE,
    id_cliente INT not null,
    id_empleado INT not null,
    id_proveedores INT not null,
     FOREIGN KEY (id_cliente) 
     REFERENCES CLIENTES(id_cliente)
     ON DELETE RESTRICT
     ON UPDATE CASCADE,
        FOREIGN KEY (id_empleado) 
        REFERENCES EMPLEADOS(id_empleado)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
        FOREIGN KEY (id_proveedores) 
        REFERENCES PROVEEDORES(id_proveedores)
        ON DELETE RESTRICT
        ON UPDATE CASCADE);

CREATE TABLE DETALLES_DEL_ENVIO (
    id_detalle SERIAL PRIMARY KEY,
    producto VARCHAR(100) NOT NULL,
   	cantidad  int NOT NULL,
    precio_un int NOT null,
    id_envio int not null,
    FOREIGN KEY (id_envio) 
        REFERENCES ENVIOS(id_envio)
        ON DELETE RESTRICT
        ON UPDATE CASCADE);

CREATE TABLE if not exists REGIONES (id_regiones SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    pais VARCHAR(100)  NOT null);
   
   
INSERT INTO CLIENTES (nombre, email, telefono, direccion, pais)
VALUES 
('Juan Pérez', 'juan.perez@example.com', '555-123456', 'Calle Falsa 123', 'España'),
('Ana Gómez', 'ana.gomez@example.com', '555-234567', 'Avenida Siempre Viva 456', 'México'),
('Carlos Martínez', 'carlos.martinez@example.com', '555-345678', 'Calle del Sol 789', 'Argentina'),
('Laura Rodríguez', 'laura.rodriguez@example.com', '555-456789', 'Plaza Mayor 101', 'Colombia'),
('Pedro Sánchez', 'pedro.sanchez@example.com', '555-567890', 'Calle 25 de Mayo 202', 'Chile'),
('María Fernández', 'maria.fernandez@example.com', '555-678901', 'Calle Luna 303', 'Perú'),
('Luis García', 'luis.garcia@example.com', '555-789012', 'Avenida Libertador 404', 'Venezuela'),
('Marta López', 'marta.lopez@example.com', '555-890123', 'Calle del Río 505', 'Ecuador'),
('Jorge Torres', 'jorge.torres@example.com', '555-901234', 'Calle de la Paz 606', 'Bolivia'),
('Sofia Ruiz', 'sofia.ruiz@example.com', '555-012345', 'Avenida de la Constitución 707', 'Uruguay');

   
INSERT INTO EMPLEADOS (nombre, email, cargo)
VALUES 
('Pedro López', 'pedro.lopez@example.com', 'Gerente de Ventas'),
('Ana Martínez', 'ana.martinez@example.com', 'Desarrolladora de Software'),
('Carlos Sánchez', 'carlos.sanchez@example.com', 'Director de Marketing'),
('Marta González', 'marta.gonzalez@example.com', 'Asistente Administrativa'),
('Luis Ramírez', 'luis.ramirez@example.com', 'Analista de Sistemas');

INSERT INTO PROVEEDORES (nombre, email, telefono, direccion)
VALUES 
('Proveedor A', 'contacto@proveedora.com', '555-111222', 'Calle Industria 500'),
('Proveedor B', 'ventas@proveedorb.com', '555-333444', 'Avenida Comercio 700'),
('Proveedor C', 'servicios@proveedorc.com', '555-555666', 'Calle Logística 900');


INSERT INTO ENVIOS (estado, total, departamento, fecha_envio, id_cliente, id_empleado, id_proveedores)
VALUES 
('Enviado', 250, 'Logística', '2024-10-10', 18, 1, 1),
('Enviado', 320, 'Marketing', '2024-10-12', 19, 2, 2),
('Enviado', 150, 'Ventas', '2024-10-15', 20, 3, 3),
('Enviado', 500, 'Soporte', '2024-10-17', 21, 4, 1),
('Pendiente', 100, 'Ventas', '2024-10-18', 22, 5, 2),
('Enviado', 200, 'Logística', '2024-10-20',23, 1, 3),
('Enviado', 400, 'Marketing', '2024-10-22', 24, 2, 1),
('Pendiente', 300, 'Soporte', '2024-10-23',25, 3, 2);


INSERT INTO DETALLES_DEL_ENVIO (producto, cantidad, precio_un, id_envio)
VALUES 
('Laptop', 2, 500, 20),
('Smartphone', 5, 150, 21),
('Monitor', 3, 200, 22),
('Teclado', 4, 50, 23),
('Cámara de Seguridad', 1, 250, 24),
('Router', 2, 80, 25),
('Auriculares', 6, 30, 26),
('Disco Duro Externo', 3, 120, 27),
('Cargador', 10, 15, 27),
('Móvil', 4, 180, 25);
   
INSERT INTO REGIONES (nombre, pais)
VALUES 
('Andalucía', 'España'),
('Baja California', 'México'),
('Buenos Aires', 'Argentina'),
('Lima Metropolitana', 'Perú'),
('Cundinamarca', 'Colombia'),
('Santiago', 'Chile'),
('Mendoza', 'Argentina'),
('Montevideo', 'Uruguay');

update envios 
set estado = 'Entregado'
where id_envio = 4;

update envios 
set departamento = 'Director de Datos'
where id_empleado = 5;

update detalles_del_envio 
set precio_un = precio_un *0.1
where producto = 'producto A';

4. Actualizar la Dirección de un Cliente. Modifica la dirección del cliente con `id_cliente = 2` a "Nueva Calle B, 123".

update clientes 
set direccion = 'calle rosa'
where id_cliente = 2;

select * from envios e 
5.Cambiar el Proveedor de un Envío. Cambia el proveedor del envío con `id_envio = 4` al proveedor con `id_proveedor = 3`.
update envios 
set id_envio = 19
where id_proveedores = 3;			Esta bien pero los id no me funcionan.

6. Actualizar la Cantidad de un Producto en un Envío. Modifica la cantidad del producto "Producto C" en el envío con `id_envio = 2` a 5 unidades.
update detalles_del_envio 
set cantidad = 5
where producto = 'Producto C';

7. Actualizar el Total de un Envío. Incrementa el total del envío con `id_envio = 25` en 50 unidades monetarias.

update envios 
set total = total+50
where id_envio = '25';


8. Modificar el Contacto de un Proveedor. Cambia el contacto del proveedor con `id_proveedor = 2` a "Nuevo Contacto 2".

update proveedores 
set email = 'Nuevo contacto 2'
where id_proveedores = 2;

9. Cambiar el País de un Cliente. Actualiza el país del cliente con `id_cliente = 6` a "Portugal".

update clientes 
set pais = 'Portugal'
where id_cliente = 6;


10. Actualizar la Fecha de un Envío. Modifica la fecha del envío con `id_envio = 7` a "2024-08-10".

update envios 
set fecha_envio = '2024-08-10'
where id_envio = 7;


1. Añadir una Columna. Añade una columna `fecha_nacimiento` de tipo `DATE` a la tabla `Clientes`.

alter table clientes 
add column fecha_nacimiento type DATE DEFAULT CURRENT_DATE;

2. Añadir una Columna. Añade una columna `codigo_postal` de tipo `VARCHAR(10)` a la tabla `Proveedores`.

alter table	proveedores 
alter column email type varchar(300);


3. Eliminar una Columna. Elimina la columna `contacto` de la tabla `Proveedores`.,, yo he llamado email a contacto

alter table proveedores 
drop column email;

4. Eliminar una Columna. Elimina la columna `pais` de la tabla `Regiones`.

alter table regiones 
drop column pais;

5. Modificar el Tipo de Dato de una Columna. Modifica el tipo de dato de la columna `telefono` en la tabla `Clientes` a `VARCHAR(15)`

alter table	clientes 
alter column telefono type varchar(15);

6. Modificar el Tipo de Dato de una Columna. Modifica el tipo de dato de la columna `total` en la tabla `Envíos` a `NUMERIC(12, 2)`.

alter table	envios 
alter column total type NUMERIC(12, 2);

select *
from empleados e 
7. Añadir una Columna. Añade una columna `fecha_contrato` de tipo `DATE` a la tabla `Empleados`.

ALTER TABLE EMPLEADOS
ADD COLUMN fecha_contrato DATE DEFAULT CURRENT_DATE;

8. Eliminar una Columna. Elimina la columna `estado` de la tabla `Envíos`.

alter table envios 
drop column estado;

9. Modificar el Nombre de una Columna. Modifica el nombre de la columna `nombre` en la tabla `Empleados` a `nombre_completo`.

  ALTER TABLE empleados
  RENAME COLUMN nombre TO nombre_completo;
 


1. Listar todos los clientes que viven en España.

select *
from clientes c 
where pais = 'España'

2. Obtener todos los envíos realizados por un empleado específico.

select sum(id_envio) , id_empleado 
from envios e 
group by id_empleado 


3. Listar todos los productos incluidos en un envío específico.

select id_envio, count(producto) as productos_en_envio_id
from detalles_del_envio
group by id_envio;

4. Encontrar todos los proveedores con un teléfono específico.

select *
from proveedores p
where telefono = '666'

5. Listar los empleados que tienen un cargo de "Supervisor de Envíos".

select *
from empleados e 
where cargo = 'Supervisor de envios'

6. Obtener todos los envíos que fueron realizados por el cliente con id_cliente = 25.

select id_envio,id_cliente 
from envios e 
where id_cliente = 25


7. Listar todas las regiones con su nombre y país.

select *
from regiones r 

8. Mostrar todos los productos cuyo precio unitario sea mayor que 50.

select *
from detalles_del_envio
where precio_un > 50
order by precio_un desc

9. Obtener todos los envíos realizados el 2024-08-05.

select *
from envios e 
where fecha_envio = '2024-08-05'

10. Listar todos los clientes que tienen un número de teléfono que comienza con "6003".

SELECT *
FROM CLIENTES
WHERE telefono LIKE '%6003%';










   
   

