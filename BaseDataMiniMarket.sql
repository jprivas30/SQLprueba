CREATE SCHEMA MinimarketDonJose;

USE MinimarketDonJose;

#Se van a crear 5 tablas NORMALES y 1 RELACIONAL 
#cliente/producto/provedor/tipoproducto/ventas
#producto/provedor

CREATE TABLE Cliente(
cliente_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre_cliente VARCHAR(30),
direccion VARCHAR(60),
rut VARCHAR (15),
telefono VARCHAR (15)
);

CREATE TABLE TipoProducto(
tipoProducto_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
tipoProducto VARCHAR (20)
);

CREATE TABLE Producto(
producto_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre_producto VARCHAR(20),
marca VARCHAR(15),
precio DOUBLE,
presentacion VARCHAR(20),
tipoProducto_id INTEGER,
FOREIGN KEY (tipoProducto_id) REFERENCES TipoProducto(tipoProducto_id) 
);

CREATE TABLE Proveedor(
proveedor_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre_proveedor VARCHAR (20),
empresa VARCHAR (20),
telefono  VARCHAR (15)
);

CREATE TABLE Venta(
venta_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
fecha_venta DATE,
monto_venta DOUBLE, 
tipo_venta VARCHAR(20),
cliente_id INTEGER,
FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id) 
); 

CREATE TABLE ProductoProveedor(
ProductoProveedor_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
producto_id INTEGER,
proveedor_id INTEGER,
FOREIGN KEY (producto_id) REFERENCES Producto(producto_id) ,
FOREIGN KEY (proveedor_id) REFERENCES Proveedor(proveedor_id)
);

#Insertar datos en las Tablas 

#Agregar Clientes
INSERT INTO Cliente (nombre_cliente,direccion,rut,telefono) VALUES 
("Jhoanna Ramirez", "las rosas 1314", "23456782-k", "+56948527412" ),
("Gabriel Garcia", "matta 2423", "14562352-9", "+56954123025"), 
("Jhosiany Urdaneta", "carmen 1516", "25678987-1", "+56987456124"),
("Camila Valdez", "san francisco 323", "8415621-1", "+56223459545");

#Agregar Tipos de Productos a la tabla 
INSERT INTO TipoProducto (tipoProducto) VALUES 
("Frutas"),
("Verduras"),
("Abarrotes"),
("Carnes"),
("Licores"), 
("Bebidas"), 
("Limpieza"), 
("Cuidado Personal");

#Insertar Productos a la Tabla 
INSERT INTO Producto (nombre_producto, marca, precio, presentacion, tipoProducto_id) VALUES 
("Mayonesa","Kraft", 4500,"700gr",2),
("Aceite","DelChef",3000,"1lt",3),
("Jabon Baño","Protex",2590,"3*90gr",8),
("Harina","MontBlanc",1500,"1kg",3),
("Crema Multiuso","Cif",2700,"900ml",7),
("Bebida Energetica","RedBull",2000,"350ml",6),
("Cerveza","Torobayo",1500,"450ml",5),
("Frutilla","Frutilla",2000,"Bandeja 1kilo",1);

UPDATE Producto SET tipoProducto_id=3 WHERE producto_id= 1;

#Agregar proveedores a la Tabla 
INSERT INTO Proveedor(nombre_proveedor,empresa,telefono) VALUES 
("Claudio Lopez","Distribuidora Stgo","+56947858741"),
("Francisco Soto","CCU","+56987452631"),
("Paulina Mejia","Fresh","+56985142210"),
("Laura Perez","P&G","+56987456321"),
("Jose Sanchez","Centro Abasto","+56932564125"),
("Jesus Santamaria","Gran Mayorista","+56978452411");

#Tabla relacional para saber que proveedor me trae cada producto 
INSERT INTO ProductoProveedor(producto_id, proveedor_id) VALUES 
(1,1),(2,1),(3,4),(4,6),(5,5),(6,2),(7,2),(8,3);

#Insertar Ventas

INSERT INTO Venta(fecha_venta,monto_venta,tipo_venta,cliente_id) VALUES 
("2022-02-13",20000,"En tienda",1),
("2022-03-14",20000,"En tienda",2),
("2022-04-16",20000,"Domicilio",1),
("2022-05-11",20000,"En tienda",3),
("2022-06-09",20000,"En tienda",4),
("2022-07-10",20000,"Domicilio",4),
("2022-07-28",20000,"En tienda",2),
("2022-07-30",20000,"Domicilio",1),
("2022-08-10",20000,"En tienda",2),
("2022-08-12",20000,"En tienda",3),
("2022-08-21",20000,"En tienda",4),
("2022-09-22",20000,"Domicilio",4),
("2022-12-01",20000,"Domicilio",1);

#cambiar los montos de las ventas 
UPDATE Venta SET monto_venta= 3000 WHERE venta_id= 2;
UPDATE Venta SET monto_venta= 10000 WHERE venta_id= 3;
UPDATE Venta SET monto_venta= 15000 WHERE venta_id= 4;
UPDATE Venta SET monto_venta= 5000 WHERE venta_id= 5;
UPDATE Venta SET monto_venta= 25000 WHERE venta_id= 6;
UPDATE Venta SET monto_venta= 14000 WHERE venta_id= 7;
UPDATE Venta SET monto_venta= 7000 WHERE venta_id= 8;
UPDATE Venta SET monto_venta= 9500 WHERE venta_id= 9;
UPDATE Venta SET monto_venta= 1240 WHERE venta_id= 10;
UPDATE Venta SET monto_venta= 18000 WHERE venta_id= 11;
UPDATE Venta SET monto_venta= 3750 WHERE venta_id= 12;
UPDATE Venta SET monto_venta= 13200 WHERE venta_id= 13;

#Consultas a las tablas generales
SELECT*FROM Producto ;
SELECT*FROM TipoProducto ;
SELECT*FROM Proveedor ;
SELECT*FROM ProductoProveedor;
SELECT*FROM Cliente;
SELECT*FROM Venta;

#Total de ventas realizadas 
SELECT SUM(monto_venta) FROM Venta WHERE fecha_venta > "2022-01-10" AND fecha_venta < "2023-03-01";

#Nombre de cliente con las Compras que ha realizado 
SELECT nombre_cliente, monto_venta FROM Cliente JOIN Venta ON Cliente.Cliente_id = Venta.Cliente_id;

#Nombre de producto con su tipo 
SELECT  nombre_producto,tipoProducto FROM  TipoProducto JOIN Producto ON TipoProducto.tipoProducto_id = Producto.tipoProducto_id;









