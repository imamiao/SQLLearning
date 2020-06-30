CREATE DATABASE product;

CREATE TABLE product
(
product_id CHAR(4) NOT NULL ,
product_name VARCHAR(100) NOT NULL ,
product_type VARCHAR(32) NOT NULL ,
sale_price INTEGER ,
purchase_price INTEGER ,
regist_date DATE ,
PRIMARY KEY (product_id)
);

DROP TABLE product;
ALTER TABLE product ADD COLUMN product_name_pinyin VARCHAR(100);
ALTER TABLE product DROP COLUMN product_name_pinyin;

START TRANSACTION;
INSERT INTO Product VALUES ('0001', 'T恤' ,'⾐服', 1000, 500, '2009-09-20');
INSERT INTO Product VALUES ('0002', '打孔器', '办公⽤品', 500, 320, '2009-09-11');
INSERT INTO Product VALUES ('0003', '运动T恤', '⾐服', 4000, 2800, NULL);
INSERT INTO Product VALUES ('0004', '菜⼑', '厨房⽤具', 3000, 2800, '2009-09-20');
INSERT INTO Product VALUES ('0005', '⾼压锅', '厨房⽤具', 6800, 5000, '2009-01-15');
INSERT INTO Product VALUES ('0006', '叉⼦', '厨房⽤具', 500, NULL, '2009-09-20');
INSERT INTO Product VALUES ('0007', '擦菜板', '厨房⽤具', 880, 790, '2008-04-28');
INSERT INTO Product VALUES ('0008', '圆珠笔', '办公⽤品', 100, NULL, '2009-11-11');
COMMIT;

CREATE TABLE addressbook(
register_no INTEGER primary key ,
name varchar(128) not null ,
address varchar(256) not null ,
tel_no char(10) ,
mail_address char(20) ,
postal_code char(8) not null
);

ALTER TABLE addressbook ADD COLUMN postal_code char(8) not null ;

DROP TABLE addressbook;

SELECT product_id, product_name, purchase_price
FROM product;

SELECT * FROM product;

SELECT product_id AS id,
product_name AS name,
purchase_price AS price
FROM product;

SELECT product_id AS id,
product_name AS 名称,
purchase_price AS 价格
FROM product;

SELECT '商品' AS string, 38 AS number, '2009-02-24' AS date, product_id, product_name
FROM product;

SELECT DISTINCT purchase_price
FROM product;

SELECT DISTINCT product_type, regist_date
FROM product;

SELECT product_name, product_type
FROM product
WHERE product_type = '⾐服';

SELECT product_name
FROM product
WHERE product_type = '⾐服';
-- 单⾏注释
/*
多⾏注释
多⾏注释
*/
SELECT product_name,sale_price,sale_price*2 AS "sale_price_x2"
FROM product;

SELECT product_name, product_type, sale_price
FROM product
WHERE sale_price = 500;

SELECT product_name,product_type,sale_price
FROM product
WHERE sale_price <> 500;

SELECT product_name, product_type, sale_price
FROM product
WHERE sale_price >= 1000;

SELECT product_name, product_type, regist_date
FROM product
WHERE regist_date < '2009-09-27';

SELECT product_name, sale_price, purchase_price
FROM product
WHERE sale_price - purchase_price >= 500;

CREATE TABLE chars (
chr CHAR(3) NOT NULL ,
primary key (chr)
);

BEGIN TRANSACTION;
INSERT INTO Chars VALUES ('1');
INSERT INTO chars VALUES ('a');
INSERT INTO Chars VALUES ('2');
INSERT INTO Chars VALUES ('3');
INSERT INTO Chars VALUES ('10');
INSERT INTO Chars VALUES ('11');
INSERT INTO Chars VALUES ('222');
COMMIT;

SELECT chr
FROM chars
WHERE chr >= '2';

SELECT product_name, purchase_price
FROM product
WHERE purchase_price <> 2800;

SELECT product_name, purchase_price
FROM product
WHERE purchase_price IS NULL ;

SELECT product_name, product_type, sale_price
FROM product
WHERE NOT sale_price >= 1000;

SELECT product_name, purchase_price
FROM product
WHERE product_type = '厨房⽤具'
AND sale_price >= 3000;

SELECT product_type, product_name, purchase_price
FROM product
WHERE product_type = '厨房⽤具'
OR sale_price >= 3000;

SELECT product_type, product_name, regist_date
FROM product
WHERE product_type = '办公⽤品'
AND (regist_date = '2009-9-11'
OR regist_date = '2009-9-20');

SELECT regist_date, product_name
FROM product
WHERE regist_date >= '2009-4-28';

-- 对null使⽤⽐较运算符，得不到任何值
SELECT * FROM product WHERE purchase_price = NULL;
SELECT * FROM product WHERE purchase_price <> NULL;
SELECT * FROM product WHERE purchase_price > NULL;

SELECT product_name, sale_price, purchase_price, sale_price-purchase_price AS 差值
FROM product
WHERE sale_price - purchase_price >= 500;

SELECT product_name, sale_price, purchase_price, sale_price-purchase_price AS "差值"
FROM product
WHERE NOT sale_price - purchase_price < 500;

SELECT product_name, product_type, sale_price, (sale_price*0.9) AS "0.9sale_price", purchase_price,
(sale_price*0.9)-purchase_price AS profit
FROM product
WHERE (sale_price*0.9)-purchase_price > 100 AND (product_type IN ('办公⽤品','厨房⽤具'));

SELECT count(*)
FROM product;

SELECT count(purchase_price)
FROM product;

SELECT sum(sale_price),avg(sale_price),max(sale_price),sum(purchase_price),avg(purchase_price),max(purchase_price)
FROM product;

SELECT sum(DISTINCT sale_price),avg( DISTINCT sale_price),max(sale_price),sum(purchase_price),avg(purchase_price),max(purchase_price)
FROM product;

SELECT count(DISTINCT product_type)
FROM product;

SELECT DISTINCT count(product_type)
FROM product;

SELECT sum(sale_price), sum(DISTINCT sale_price)
FROM product;

SELECT product_type,regist_date,count(*)
FROM product
GROUP BY product_type,regist_date;

SELECT purchase_price,count(*)
FROM product
GROUP BY purchase_price;

SELECT purchase_price,product_type,product_name
FROM product WHERE product_type = '衣服';















