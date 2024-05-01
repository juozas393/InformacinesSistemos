-- admin login
CREATE TABLE admins(
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
username VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL,
user_password VARCHAR(255) NOT NULL,
CONSTRAINT uniqueA_username UNIQUE(username),
CONSTRAINT uniqueA_email UNIQUE(email)
);


-- Naudotojo info
CREATE TABLE users
(
id INT PRIMARY KEY auto_increment NOT NULL,
username VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL,
user_password VARCHAR(255) NOT NULL,
subscribed BOOLEAN NOT NULL DEFAULT FALSE,
CONSTRAINT unique_username UNIQUE(username),
CONSTRAINT unique_email UNIQUE(email)
);

-- produktu info
CREATE TABLE products(
id INT PRIMARY KEY auto_increment NOT NULL,
title VARCHAR(255) NOT NULL,
product_description VARCHAR(4000) NOT NULL,
price decimal(6,2) NOT NULL,
discount_status BOOLEAN DEFAULT FALSE NOT NULL,
old_price decimal(6,2)
);

-- megstamiausi produktai
CREATE TABLE favorites(
id INT PRIMARY KEY auto_increment NOT NULL,
FOREIGN KEY(customer_id) REFERENCES users(id),
FOREIGN KEY(product_id) REFERENCES products(id),
CONSTRAINT same_product UNIQUE(customer_id, product_id)
);

-- pirkimu istorija
CREATE TABLE purchase_history(
order_id INT NOT NULL,
FOREIGN KEY(customer_id) REFERENCES users(id),
FOREIGN KEY(product_id) REFERENCES products(id),
purchase_date DATETIME NOT NULL
);