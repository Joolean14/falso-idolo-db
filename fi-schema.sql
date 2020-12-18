CREATE TABLE user (
    user_id INT(20) NOT NULL AUTO_INCREMENT,
    password VARCHAR(20) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    email VARCHAR(30) NOT NULL,
    fip_total INT(10),
    PRIMARY KEY(user_id)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE product (
    product_id INT(20) NOT NULL AUTO_INCREMENT,
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
    CONSTRAINT `fk_user_product` FOREIGN KEY(user_id) REFERENCES user(user_id) ON DELETE RESTRICT ON UPDATE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- SELECT product_name, product_price, discount FROM product;
-- INSERT INTO product(product_name, product_price, sku, discount, product_description, quantity_stock, reviews, rating, user_id)
--  VALUES("Camiseta", 20.9, 123456789, 10, "Camiseta temporada 1 YML", 50, "Muy bueno el tie dye", 5, 1);

-- INSERT INTO product(product_name, product_price, sku, discount, product_description, quantity_stock, reviews, rating, user_id)
--  VALUES("Camiseta", 20.9, 123456789, 10, "Camiseta temporada 2 YML", 50, "Muy bueno el tie diseno", 5, 1);


-- INSERT INTO product(product_name, product_price, sku, discount, product_description, quantity_stock, reviews, rating, user_id)
--  VALUES("Camiseta", 20.9, 12345678, 10, "Camiseta temporada 3 YML", 50, "Muy buena la talla", 5, 1);

-- DELETE FROM product
-- WHERE sku = 523456789;

-- UPDATE product
-- SET sku = 623456789
-- WHERE product_description = "Camiseta temporada 1 YML"



CREATE TABLE payment_method (
    payment_id INT(20) NOT NULL AUTO_INCREMENT,
    credit_card VARCHAR(20),
    debit VARCHAR(20),
    cash INT(20),
    user_id INT(20) NOT NULL,
    fip_value INT(10),
    PRIMARY KEY(payment_id),
    CONSTRAINT `fk_payment_method-user` FOREIGN KEY(user_id) REFERENCES user(user_id) ON DELETE RESTRICT ON UPDATE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

    -- INSERT INTO payment_method(credit_card, debit, cash, user_id)
    -- VALUES ('mastercard', 'Bancolombia', 0, 1);

    -- INSERT INTO payment_method(credit_card, debit, cash, user_id)
    -- VALUES ('visa', 'Banco de Bogota', 100, 3);

    -- INSERT INTO payment_method(credit_card, debit, cash, user_id)
    -- VALUES ('mastercard', 'Banco Pichincha', 200, 4);

    -- INSERT INTO payment_method(credit_card, debit, cash, user_id)
    -- VALUES ('visa', 'Bancolombia', 300, 4);

    --     INSERT INTO payment_method(credit_card, debit, cash, user_id)
    -- VALUES ('visa', 'Banco de Bogota', 100, 5);

    --     INSERT INTO payment_method(credit_card, debit, cash, user_id)
    -- VALUES ('visa', 'Bancolombia', 50, 6);






CREATE TABLE wish(
    user_id INT(20) NOT NULL AUTO_INCREMENT,
    sku INT(20),
    search_date DATETIME,
    PRIMARY KEY(sku, user_id),
    CONSTRAINT `fk_user_wish` FOREIGN KEY(user_id) REFERENCES user(user_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT `fk_product_wish` FOREIGN KEY(sku) REFERENCES product(sku) ON DELETE RESTRICT ON UPDATE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

    INSERT INTO wish(user_id, sku, search_date)
    VALUES (1, 223456789,'2020-01-01');



CREATE TABLE cart(
    cart_id INT(20) AUTO_INCREMENT,
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
    CONSTRAINT `fk_product_sales` FOREIGN KEY(product_id) REFERENCES product(product_id) ON DELETE RESTRICT ON UPDATE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



------------------------------------------------------------------------------------------
 CREATE TABLE transaction (
     transaction_id INT(20) NOT NULL AUTO_INCREMENT,
     value FLOAT(20) NOT NULL,
     date DATETIME NOT NULL,
     shipping_id INT(20) NOT NULL,
     cart_id INT(20) NOT NULL,
     PRIMARY KEY(transaction_id),
     CONSTRAINT `fk_cart_transaction` FOREIGN KEY(cart_id) REFERENCES cart(cart_id) ON DELETE RESTRICT ON UPDATE CASCADE   
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    --  CONSTRAINT `fk_shipping_transaction` FOREIGN KEY(shipping_id) REFERENCES shipping(shipping_id) ON DELETE RESTRICT ON UPDATE CASCADE

CREATE TABLE shipping (
    shipping_id INT(20) NOT NULL AUTO_INCREMENT,
    address VARCHAR(30) NOT NULL,
    city VARCHAR(30) NOT NULL,
    country VARCHAR(30) NOT NULL,
    delivery_date DATETIME NOT NULL,
    shipping_date DATETIME NOT NULL,
    transaction_id INT(20) NOT NULL,
    PRIMARY KEY(shipping_id),
    CONSTRAINT `fk_transaction_shipping` FOREIGN KEY(transaction_id) REFERENCES transaction(transaction_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- - INSERT INTO product(product_name, product_price, sku, discount, product_description, quantity_stock, reviews, rating, user_id, fip_value) VALUES("teclado", "30.9", 123456789, 30, "Guitarra de arce", 20, 4, 1, 1, 2);

INSERT INTO wish(user_id, sku, search_date) VALUES("1", 123456789, '2006-02-15 04:34:33');


UPDATE user SET fip_total=3 WHERE user_id=1;


ALTER TABLE product ADD fip_value INT(10) AFTER user_id;

ALTER TABLE sales ADD user_id INT(20) AFTER product_id;
ALTER TABLE sales ADD CONSTRAINT `fk_user_sales` FOREIGN KEY(user_id) REFERENCES user(user_id) ON DELETE RESTRICT ON UPDATE CASCADE

SELECT product.product_name 
FROM wish JOIN user ON user.user_id=wish.user_id JOIN product ON wish.sku=product.sku 
WHERE fip_total>fip_value;

ALTER TABLE cart ADD CONSTRAINT `fk_product_cart`FOREIGN KEY(product_id) REFERENCES product(product_id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE cart ADD CONSTRAINT `fk_transaction_cart`FOREIGN KEY(transaction_id) REFERENCES transaction(transaction_id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE transaction ADD CONSTRAINT `fk_shipping_transaction`FOREIGN KEY(shipping_id) REFERENCES shipping(shipping_id) ON DELETE RESTRICT ON UPDATE CASCADE;

--DELETE FROM user WHERE fip_total = 200;



-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
--Queries 


--1. Mostrar los productos mas vendidos y menos vendidos. 
SELECT SUM(product.quantity_stock) AS quantity, product_name AS product 
FROM sales JOIN product ON sku GROUP BY sku ORDER BY quantity;

 --2. Wish list. 
 SELECT wish, nombre_producto FROM producto;

--3. Mostrar cuantos puntos ha acumulado un usuario. 
SELECT total_fip WHERE email='j@j.com';

--4. Mostrar productos con mayor cantidad de compras en un periodo de tiempo determinado. (hacer el requirimiento 4)

SELECT SUM(product.product_price), product.product_name
FROM sales JOIN product ON sales.product_id = product.product_price JOIN user ON user.user_id = sales.user_id
WHERE sales.date BETWEEN '2006-01-01 00:00:00' AND '2006-02-01 00:00:00'
GROUP BY product.product_id;
--WHERE sales.date >= '2006-01-01 00:00:00' AND sales.date <= '2006-02-01 00:00:00';


--5. Mostrar perfil de usuario.
SELECT * FROM usuario;

 --7. Busqueda por nombre,precio, categoria,descuentos.
  SELECT nombre_producto FROM producto WHERE nombre_producto = busqueda(gutarra);

SELECT precio_producto FROM producto; --corregir

SELECT nombre_producto FROM descripcion; --corregir

SELECT descuento FROM producto; --corregir

--8. Mostrar dias y horarios con mas ventas.

-- SELECT columna u operaciones
--FROM tablas JOIN que tablas vamos a unir ON condicion que las une
--WHERE condicion
--GROUP BY agrupamiento que es cuando hay operaciones arriba
--ORDER BY

SELECT MAX(product.product_price), sales.date
FROM sales JOIN product ON sales.product_id = product.product_id
GROUP BY sales.date;

--WHERE MAX(sales.date) > MAX(sales.date)


--11. Mostrar el inventario en fecha seleccionada.
  SELECT stock FROM producto; --corregir poner where

--12. Mostrar el iva del total de ventas. 
SELECT SUM(valor * 0.19) FROM transaccion;

--13. Mostrar ventas respecto al punto de equilibrio de la empresa. 
SELECT SUM(valor - 1000) FROM transaccion;

--19. Mostrar posibles compras con fidelizacion. --Tables: user con producto.Columns: user.total_fip producto.valor_fip --en medio wish_usuario_producto.id_usuario wish_usuario_producto.id_usuario usuario.id_usuario

 --20. Enviar correo despues de 3 meses de su ultima compra. --Transaccion-->Usuario --fecha_transaccion-->id_usuario