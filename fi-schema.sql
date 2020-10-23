CREATE TABLE user(user_id INT(20) NOT NULL AUTO_INCREMENT,
    password VARCHAR(20) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    email VARCHAR(30) NOT NULL,
    fip_total INT(10),
    PRIMARY KEY(user_id)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE product(product_id INT(20) NOT NULL AUTO_INCREMENT,
    product_name VARCHAR(15),
    product_price FLOAT(15),
    sku INT(20),
    discount TINYINT(3),
    product_description VARCHAR(500),
    quantity_stock SMALLINT(6),
    reviews VARCHAR(250),
    rating TINYINT(1),
    user_id INT(20) NOT NULL,
    PRIMARY KEY(product_id),
    KEY product_sku(sku),
    CONSTRAINT `fk_user_product` FOREIGN KEY(user_id) REFERENCES user(user_id) ON DELETE RESTRICT ON UPDATE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE payment_method(payment_id INT(20) NOT NULL AUTO_INCREMENT,
    credit_card VARCHAR(20),
    debit VARCHAR(20),
    cash INT(20),
    user_id INT(20) NOT NULL,
    fip_value INT(10),
    PRIMARY KEY(payment_id),
    CONSTRAINT `fk_payment_method-user` FOREIGN KEY(user_id) REFERENCES user(user_id) ON DELETE RESTRICT ON UPDATE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE wish(user_id INT(20) NOT NULL AUTO_INCREMENT,
    sku INT(20),
    search_date DATETIME,
    PRIMARY KEY(sku, user_id),
    CONSTRAINT `fk_user_wish` FOREIGN KEY(user_id) REFERENCES user(user_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT `fk_product_wish` FOREIGN KEY(sku) REFERENCES product(sku) ON DELETE RESTRICT ON UPDATE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



CREATE TABLE cart(cart_id INT(20) AUTO_INCREMENT,
    total_value INT(20),
    date DATETIME,
    user_id INT(20),
    product_id INT(20),
    transaction_id INT(20),
    PRIMARY KEY(cart_id),
    CONSTRAINT `fk_user_cart` FOREIGN KEY(user_id) REFERENCES user(user_id) ON DELETE RESTRICT ON UPDATE CASCADE 
    -- CONSTRAINT `fk_product_cart`FOREIGN KEY(product_id) REFERENCES product(product_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    -- CONSTRAINT `fk_transaction_cart`FOREIGN KEY(transaction_id) REFERENCES transaction_(transaction_id) ON DELETE RESTRICT ON UPDATE CASCADE
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE sales(stock INT(20),
    date DATETIME NOT NULL,
    product_id INT(20),
    PRIMARY KEY (stock),
    CONSTRAINT `fk_product_sales` FOREIGN KEY(product_id) REFERENCES product(product_id) ON DELETE RESTRICT ON UPDATE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



------------------------------------------------------------------------------------------ CREATE TABLE transaction() ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE shipping(shipping_id INT(20) NOT NULL AUTO_INCREMENT,
    address VARCHAR(30) NOT NULL,
    city VARCHAR(30) NOT NULL,
    receive_date DATETIME NOT NULL,
    shipping_date DATETIME NOT NULL PRIMARY KEY(shipping_id) KEY payment(payment_id)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- - INSERT INTO product(product_name, product_price, sku, discount, product_description, quantity_stock, reviews, rating, user_id, fip_value) VALUES("teclado", "30.9", 123456789, 30, "Guitarra de arce", 20, 4, 1, 1, 2);

INSERT INTO wish(user_id, sku, search_date) VALUES("1", 123456789, '2006-02-15 04:34:33');

UPDATE user SET fip_total=3 WHERE user_id=1;


ALTER TABLE product ADD fip_value INT(10) AFTER user_id;

SELECT product.product_name FROM wish JOIN user ON user.user_id=wish.user_id JOIN product ON wish.sku=product.sku WHERE fip_total>fip_value;


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --Queries --1. Mostrar los productos mas vendidos y menos vendidos. SELECT SUM(cantidad),
nombre_producto FROM ventas JOIN producto ON sku GROUP BY sku --2. Wish list. SELECT wish,
nombre_producto FROM producto;

--3. Mostrar cuantos puntos ha acumulado un usuario. SELECT total_fip WHERE email='j@j.com';



--5. Mostrar perfil de usuario. --7. Busqueda por nombre,
precio,
categoria,
descuentos. SELECT nombre_producto FROM producto;

SELECT precio_producto FROM producto;

SELECT nombre_producto FROM descripcion;

SELECT descuento FROM producto;
SELECT * FROM usuario;

--8. Dias y horarios con mas ventas. --11. Mostrar el inventario en fecha seleccionada. SELECT stock FROM producto;

--12. Mostrar el iva del total de ventas. SELECT SUM(valor * 0.19) FROM transaccion;

--13. Mostrar ventas respecto al punto de equilibrio de la empresa. SELECT SUM(valor - 1000) FROM transaccion;

--19. Mostrar posibles compras con fidelizacion. --Tables: user con producto.Columns: user.total_fip producto.valor_fip --en medio wish_usuario_producto.id_usuario wish_usuario_producto.id_usuario usuario.id_usuario --20. Enviar correo despues de 3 meses de su ultima compra. --Transaccion-->Usuario --fecha_transaccion-->id_usuario