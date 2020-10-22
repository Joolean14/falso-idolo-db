CREATE TABLE user (
    user_id INT(20) NOT NULL AUTO_INCREMENT,
    password VARCHAR(20) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    email VARCHAR(30) NOT NULL,
    PRIMARY KEY (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE cart (
    sku INT(20) NOT NULL,
    value INT(20) NOT NULL,
    date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (sku),
    KEY user(user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE product (
    product_id VARCHAR(15) AUTO_INCREMENT,
    product_name VARCHAR(15),
    product_price FLOAT(15),
    sku INT(20),
    discount TINYINT(3),
    product_description VARCHAR(500),
    quantity_stock SMALLINT(6),
    reviews VARCHAR(250),
    rating TINYINT(1),
    PRIMARY KEY(product_id),
    KEY product_sku(sku)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE transaction (
    transaction_id INT(20) AUTO_INCREMENT,
    value INT(20),
    success BOOLEAN,
    date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    discount TINYINT(3) DEFAULT NULL,
    PRIMARY KEY (transaction_id)
    KEY sku(sku) 
    KEY user(user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE shipping (
    shipping_id INT(20) NOT NULL AUTO_INCREMENT,
    address VARCHAR(30) NOT NULL,
    city VARCHAR(30) NOT NULL,
    receive_date DATETIME NOT NULL,
    shipping_date DATETIME NOT NULL
    PRIMARY KEY(shipping_id)
    KEY payment(payment_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE payment_method (
    payment_id NOT NULL AUTO_INCREMENT,
    credit_card VARCHAR(20),
    debit VARCHAR(20),
    cash INT(20),
    PRIMARY KEY(payment_id),
    KEY user(user_id)
    CONSTRAINT `fk_payment_method-user` FOREIGN KEY (user_id) REFERENCES user (user_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


