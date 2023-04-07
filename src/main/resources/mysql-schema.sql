CREATE TABLE `t_cart` (
  `customer_id` bigint DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
UNIQUE KEY `UK_1sscka4n9903jr6c9bu4jnxx0` (`customer_id`),
CONSTRAINT `FKqvd5pk1378lygsduq0abn6yo4` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`)
);

CREATE TABLE `t_cart_item` (
  `quantity` int DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `cart_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`cart_id`,`product_id`),
KEY `FKdkanjbj8pw1gf2n8664pnqlom` (`product_id`),
CONSTRAINT `FKdkanjbj8pw1gf2n8664pnqlom` FOREIGN KEY (`product_id`) REFERENCES `t_product` (`id`),
CONSTRAINT `FKovd7lmhrumwcfgv15wn9yqspr` FOREIGN KEY (`cart_id`) REFERENCES `t_cart` (`id`)
);

CREATE TABLE `t_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
PRIMARY KEY (`id`)
);

CREATE TABLE `t_customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
PRIMARY KEY (`id`)
);

CREATE TABLE `t_order` (
  `customer_id` bigint NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
`order_data` datetime(6) DEFAULT NULL,
PRIMARY KEY (`id`),
KEY `FKesy3n2gc3fa0s3trrk3tvyv9a` (`customer_id`),
CONSTRAINT `FKesy3n2gc3fa0s3trrk3tvyv9a` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`)
);

CREATE TABLE `t_order_item` (
  `quantity` int NOT NULL,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
KEY `FKn4krp2vsjtox6l7sj5h55inx0` (`product_id`),
CONSTRAINT `FK2y83rerik30vumt2a1mff6606` FOREIGN KEY (`order_id`) REFERENCES `t_order` (`id`),
CONSTRAINT `FKn4krp2vsjtox6l7sj5h55inx0` FOREIGN KEY (`product_id`) REFERENCES `t_product` (`id`)
);

CREATE TABLE `t_product` (
  `price` double DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
KEY `FKp17nkwpqnnxh5iax87dc58sp3` (`category_id`),
CONSTRAINT `FKp17nkwpqnnxh5iax87dc58sp3` FOREIGN KEY (`category_id`) REFERENCES `t_category` (`id`)
);
