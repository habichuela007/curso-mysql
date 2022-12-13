CREATE DATABASE IF NOT EXISTS prb_power_bi02;

CREATE TABLE IF NOT EXISTS books (
	book_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	author  INTEGER,
	title VARCHAR(100) NOT NULL,
	year INTEGER UNSIGNED NOT NULL DEFAULT 1900,
	language VARCHAR(2) NOT NULL DEFAULT 'es' COMMENT 'ISO 639-1 Language',
	cover_url VARCHAR(500),
	price DOUBLE(6,2) NOT NULL DEFAULT 10.0,
	sallable TINYINT(1) DEFAULT 1,
	Copies INTEGER NOT NULL DEFAULT 1,
	Description TEXT
);

CREATE TABLE IF NOT EXISTS authors (
	author_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	Name VARCHAR(100) NOT NULL,
	Nationality VARCHAR(3)
)

CREATE TABLE IF NOT EXISTS clients (
	Client_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL,
	`email` VARCHAR(300) NOT NULL UNIQUE,
	Birthdate DATE_TIME,
	Gender ENUM('M','F','ND') NOT NULL,
	Active TINYINT(1) NOT NULL DEFAULT 1,
	#Created_at TIMESTAMP 'yyyy-mm-dd hh:mm:ss'
	Created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	Updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMASTAMP
	  ON UPDATE CURRENTE_TIMESTAMP
)

INSERT INTO authors(author_id, name, nationality)
VALUES('','Juan Rulfo','MX');

INSERT INTO authors(name, nationality)
VALUES('Juan Rulfo','MX');

INSERT INTO authors(name, nationality)
VALUES('Gabriel Garcia Marquez','COL');

CREATE TABLE IF NOT EXISTS bio_inf_pedidos_compras (
	pedidos_compras_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	fecha_pedido DATE NOT NULL,
	org_compras VARCHAR(10) NOT NULL,
	orden_compra VARCHAR(20) NOT NULL,
	proveedor VARCHAR(100) NOT NULL,
	codigo_articulo VARCHAR(20) NOT NULL,
	articulo VARCHAR(100) NOT NULL,
	cantidad INTEGER NOT NULL DEFAULT 1,
	precio DOUBLE(6,2) NOT NULL DEFAULT 10.0,
	total DOUBLE(6,2) NOT NULL DEFAULT 10.0,
	estado ENUM('Pendiente','Realizado') NOT NULL
)



SELECT CODIGO_EMPRESA,ORGANIZACION_COMPRAS,FECHA_PEDIDO,SERIE_NUMERACION,NUMERO_PEDIDO,CODIGO_ALMACEN,D_CODIGO_ALMACEN,CODIGO_PROVEEDOR,D_CODIGO_PROVEEDOR,PERSONA_PEDIDO,NUMERO_EXPEDIENTE,D_NUMERO_EXPEDIENTE,D_ORGANIZACION_COMPRAS,STATUS_AUTORIZACION,TIPO_PEDIDO,STATUS_CIERRE,CODIGO_DIVISA,NUMERO_DIRECCION,CLIENTE_TARIFA,D_CLIENTE_TARIFA,TIPO_PORTES,FECHA_CONFIRM,FORMA_PAGO,USUARIO_ALTA,ROWID,ANULADO,FECHA_REVISION,STATUS_APROBADO,ID_DIGITAL,CONFIRM_EDI,FECHA_CONFIRM_EDI FROM (SELECT C.* ,(select pl.cliente_tarifa from pedidos_compras_lin pl where pl.serie_numeracion = c.serie_numeracion and pl.numero_pedido = c.numero_pedido and pl.organizacion_compras = c.organizacion_compras and pl.numero_linea = 1 and pl.codigo_empresa = c.codigo_empresa) CLIENTE_TARIFA,(select c.nombre from clientes c where c.codigo_rapido = (select pl.cliente_tarifa from pedidos_compras_lin pl where pl.serie_numeracion = c.serie_numeracion and pl.numero_pedido = c.numero_pedido and pl.organizacion_compras = c.organizacion_compras and pl.numero_linea = 1 and pl.codigo_empresa = c.codigo_empresa)) D_CLIENTE_TARIFA,(SELECT a.nombre FROM almacenes a WHERE a.almacen = c.codigo_almacen AND a.codigo_empresa = c.codigo_empresa) D_CODIGO_ALMACEN,(SELECT nombre FROM proveedores WHERE codigo_rapido = c.codigo_proveedor AND codigo_empresa = c.codigo_empresa) D_CODIGO_PROVEEDOR,(SELECT a.descripcion
FROM expedientes_cab a
WHERE a.codigo = c.numero_expediente AND a.empresa = c.codigo_empresa) D_NUMERO_EXPEDIENTE,(SELECT nombre FROM organizacion_compras WHERE codigo_org_compras = c.organizacion_compras AND codigo_empresa = c.codigo_empresa) D_ORGANIZACION_COMPRAS,(SELECT DECODE(C.STATUS_APROBADO,'N',NVL(PKPANTALLAS.BUSCA_TRADUCCION(pkpantallas.idioma_usuario_validado, 'Pendiente'), 'Pendiente'),'S',NVL(PKPANTALLAS.BUSCA_TRADUCCION(pkpantallas.idioma_usuario_validado, 'Aprobado'), 'Aprobado'),'R',NVL(PKPANTALLAS.BUSCA_TRADUCCION(pkpantallas.idioma_usuario_validado, 'Rechazado'), 'Rechazado')) FROM DUAL) STATUS_AUTORIZACION FROM PEDIDOS_COMPRAS C) C WHERE CODIGO_EMPRESA = '01' and NUMERO_PEDIDO >= 1327 and NUMERO_PEDIDO <= 1327 AND ORGANIZACION_COMPRAS = '0100' AND ANULADO = 'N' AND STATUS_CIERRE = 'Z' AND (c.STATUS_APROBADO = 'T' OR 'T' = 'T' ) AND EXISTS (SELECT 1 FROM PEDIDOS_COMPRAS_LIN A, ARTICULOS AR WHERE A.NUMERO_PEDIDO =C.NUMERO_PEDIDO AND A.SERIE_NUMERACION = C.SERIE_NUMERACION AND A.ORGANIZACION_COMPRAS = c.ORGANIZACION_COMPRAS AND A.CODIGO_EMPRESA = c.CODIGO_EMPRESA AND AR.CODIGO_EMPRESA = A.CODIGO_EMPRESA AND AR.CODIGO_ARTICULO = A.CODIGO_ARTICULO )  order by ORGANIZACION_COMPRAS,FECHA_PEDIDO DESC, SERIE_NUMERACION, NUMERO_PEDIDO, CODIGO_PROVEEDOR

