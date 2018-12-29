ALTER TABLE `customers` ADD `customers_whole` VARCHAR( 4 ) DEFAULT '0' NOT NULL;
ALTER TABLE `products` ADD `products_price_w` VARCHAR( 150 ) DEFAULT '0' AFTER `products_price`;
ALTER TABLE `products_attributes` ADD `options_values_price_w` VARCHAR( 150 ) DEFAULT '0' AFTER `options_values_price`;
ALTER TABLE `products_discount_quantity` ADD `discount_price_w` VARCHAR( 150 ) DEFAULT '0' AFTER `discount_price`;
