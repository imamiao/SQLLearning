CREATE DATABASE product;

CREATE TABLE product
(
    product_id     CHAR(4)      NOT NULL,
    product_name   VARCHAR(100) NOT NULL,
    product_type   VARCHAR(32)  NOT NULL,
    sale_price     INTEGER,
    purchase_price INTEGER,
    regist_date    DATE,
    PRIMARY KEY (product_id)
);

DROP TABLE product;
ALTER TABLE product
    ADD COLUMN product_name_pinyin VARCHAR(100);
ALTER TABLE product
    DROP COLUMN product_name_pinyin;

START TRANSACTION;
INSERT INTO Product
VALUES ('0001', 'T恤', '⾐服', 1000, 500, '2009-09-20');
INSERT INTO Product
VALUES ('0002', '打孔器', '办公⽤品', 500, 320, '2009-09-11');
INSERT INTO Product
VALUES ('0003', '运动T恤', '⾐服', 4000, 2800, NULL);
INSERT INTO Product
VALUES ('0004', '菜⼑', '厨房⽤具', 3000, 2800, '2009-09-20');
INSERT INTO Product
VALUES ('0005', '⾼压锅', '厨房⽤具', 6800, 5000, '2009-01-15');
INSERT INTO Product
VALUES ('0006', '叉⼦', '厨房⽤具', 500, NULL, '2009-09-20');
INSERT INTO Product
VALUES ('0007', '擦菜板', '厨房⽤具', 880, 790, '2008-04-28');
INSERT INTO Product
VALUES ('0008', '圆珠笔', '办公⽤品', 100, NULL, '2009-11-11');
COMMIT;

CREATE TABLE addressbook
(
    register_no  INTEGER primary key,
    name         varchar(128) not null,
    address      varchar(256) not null,
    tel_no       char(10),
    mail_address char(20),
    postal_code  char(8)      not null
);

ALTER TABLE addressbook
    ADD COLUMN postal_code char(8) not null;

DROP TABLE addressbook;

SELECT product_id, product_name, purchase_price
FROM product;

SELECT *
FROM product;

SELECT product_id     AS id,
       product_name   AS name,
       purchase_price AS price
FROM product;

SELECT product_id     AS id,
       product_name   AS 名称,
       purchase_price AS 价格
FROM product;

SELECT ' 商品' AS string, 38 AS number, '2009-02-24' AS date, product_id, product_name
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
SELECT product_name, sale_price, sale_price * 2 AS "sale_price_x2"
FROM product;

SELECT product_name, product_type, sale_price
FROM product
WHERE sale_price = 500;

SELECT product_name, product_type, sale_price
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

CREATE TABLE chars
(
    chr CHAR(3) NOT NULL,
    primary key (chr)
);

BEGIN TRANSACTION;
INSERT INTO Chars
VALUES ('1');
INSERT INTO chars
VALUES ('a');
INSERT INTO Chars
VALUES ('2');
INSERT INTO Chars
VALUES ('3');
INSERT INTO Chars
VALUES ('10');
INSERT INTO Chars
VALUES ('11');
INSERT INTO Chars
VALUES ('222');
COMMIT;

SELECT chr
FROM chars
WHERE chr >= '2';

SELECT product_name, purchase_price
FROM product
WHERE purchase_price <> 2800;

SELECT product_name, purchase_price
FROM product
WHERE purchase_price IS NULL;

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
SELECT *
FROM product
WHERE purchase_price = NULL;
SELECT *
FROM product
WHERE purchase_price <> NULL;
SELECT *
FROM product
WHERE purchase_price > NULL;

SELECT product_name, sale_price, purchase_price, sale_price - purchase_price AS 差值
FROM product
WHERE sale_price - purchase_price >= 500;

SELECT product_name, sale_price, purchase_price, sale_price - purchase_price AS "差值"
FROM product
WHERE NOT sale_price - purchase_price < 500;

SELECT product_name,
       product_type,
       sale_price,
       (sale_price * 0.9)                  AS "0.9sale_price",
       purchase_price,
       (sale_price * 0.9) - purchase_price AS profit
FROM product
WHERE (sale_price * 0.9) - purchase_price > 100
  AND (product_type IN ('办公⽤品', '厨房⽤具'));

SELECT count(*)
FROM product;

SELECT count(purchase_price)
FROM product;

SELECT sum(sale_price),
       avg(sale_price),
       max(sale_price),
       sum(purchase_price),
       avg(purchase_price),
       max(purchase_price)
FROM product;

SELECT sum(DISTINCT sale_price),
       avg(DISTINCT sale_price),
       max(sale_price),
       sum(purchase_price),
       avg(purchase_price),
       max(purchase_price)
FROM product;

SELECT count(DISTINCT product_type)
FROM product;

SELECT DISTINCT count(product_type)
FROM product;

SELECT sum(sale_price), sum(DISTINCT sale_price)
FROM product;

SELECT product_type, regist_date, count(*)
FROM product
GROUP BY product_type, regist_date;

SELECT purchase_price, count(*)
FROM product
GROUP BY purchase_price;

-- FROM 》 WHERE 》 GROUP BY 》SELECT
SELECT '衣服', purchase_price AS pt, count(*)
FROM product
WHERE product_type = '衣服'
GROUP BY pt;

SELECT product_type, count(*)
FROM product
GROUP BY product_type;

-- FROM 》 WHERE 》 GROUP BY 》 HAVING 》 SELECT
SELECT product_type, count(*)
FROM product
GROUP BY product_type
HAVING count(*) = 2;

SELECT product_type, avg(sale_price)
FROM product
WHERE 1 = 1
GROUP BY product_type
HAVING avg(sale_price) >= 0
ORDER BY avg(sale_price);

SELECT *
FROM product
ORDER BY sale_price ASC, product_id ASC;

-- PostgreSQL会把NULL当成max来处理
-- FROM 》 WHERE 》 GROUP BY 》 HAVING 》 SELECT 》 ORDER BY
SELECT product_id AS id, product_name AS name, sale_price AS sp, purchase_price
FROM product
ORDER BY sp, id;

-- 不推荐使用
-- 2代指name,1代指id。标号是select中列出来的列的顺序。淦！还能这样
SELECT product_id AS id, product_name AS name, sale_price AS sp, purchase_price
FROM product
ORDER BY 2, 1;

SELECT product_type, SUM(sale_price)
FROM Product
WHERE regist_date > '2009-09-01'
GROUP BY product_type;

SELECT product_type, sum(sale_price) AS sumSP, sum(purchase_price) AS sumPP
FROM product
--WHERE purchase_price * 1.5 > sale_price
GROUP BY product_type
HAVING sum(purchase_price) * 1.5 = sum(sale_price);

SELECT product_id, product_name, product_type, sale_price, purchase_price, regist_date
FROM product
ORDER BY regist_date DESC, sale_price;

-- page 116

CREATE TABLE productins
(
    product_id     CHAR(4)      NOT NULL primary key,
    product_name   VARCHAR(100) NOT NULL,
    product_type   VARCHAR(32)  NOT NULL,
    sale_price     INTEGER DEFAULT 0,
    purchase_price INTEGER,
    regist_date    DATE
);

INSERT INTO productins (product_id, product_name, product_type, sale_price, purchase_price, regist_date)
VALUES ('0001', 'T恤衫', '衣服', 1000, 500, '2009-09-20');

INSERT INTO productins
VALUES ('0002', 'T恤衫', '衣服', 1000, 500, '2009-09-20');

INSERT INTO productins
VALUES ('0003', 'T恤衫', '衣服', 1000, NULL, '2009-09-20');

INSERT INTO productins (product_id, product_name, product_type, sale_price, purchase_price, regist_date)
VALUES ('0004', 'T恤衫', '衣服', DEFAULT, 500, '2009-09-20');

SELECT *
FROM productins
WHERE product_id = '0004';

INSERT INTO productins (product_id, product_name, product_type, purchase_price, regist_date)
VALUES ('0005', 'T恤衫', '衣服', 500, '2009-09-20');

CREATE TABLE productcopy
(
    product_id     CHAR(4)      NOT NULL primary key,
    product_name   VARCHAR(100) NOT NULL,
    product_type   VARCHAR(32)  NOT NULL,
    sale_price     INTEGER,
    purchase_price INTEGER,
    regist_date    DATE
);

INSERT INTO productcopy (product_id, product_name, product_type, sale_price, purchase_price, regist_date)
SELECT product_id, product_name, product_type, sale_price, purchase_price, regist_date
FROM product;

CREATE TABLE producttype
(
    product_type       VARCHAR(32) NOT NULL primary key,
    sum_sale_price     INTEGER,
    sum_purchase_price INTEGER
);

INSERT INTO producttype (product_type, sum_sale_price, sum_purchase_price)
SELECT product_type, SUM(sale_price), SUM(purchase_price)
FROM product
GROUP BY product_type;

DELETE
FROM product
WHERE sale_price >= 4000;

SELECT *
FROM product;

-- page 133

UPDATE product
SET regist_date = '2009-10-10';

SELECT *
FROM product
ORDER BY product_id;

UPDATE product
SET sale_price = sale_price * 10
WHERE product_type = '厨房用具';

SELECT *
from product;

UPDATE product
SET regist_date = NULL
WHERE product_id = '0008';

SELECT *
FROM product
ORDER BY product_id DESC;

UPDATE product
SET sale_price     = sale_price * 10,
    purchase_price = purchase_price / 2
WHERE product_type = '厨房用具';

UPDATE product
SET (sale_price, purchase_price) = (sale_price * 10, purchase_price / 2)
WHERE product_type = '厨房用具';

BEGIN TRANSACTION;

UPDATE product
SET sale_price = sale_price - 1000
WHERE product_name = '运动T恤';

UPDATE product
SET sale_price = sale_price + 1000
WHERE product_name = 'T恤衫';

COMMIT;

BEGIN TRANSACTION;

UPDATE product
SET sale_price = sale_price - 1000
WHERE product_name = '运动T恤';

UPDATE product
SET sale_price = sale_price + 1000
WHERE product_name = 'T恤衫';

ROLLBACK;

BEGIN TRANSACTION;
DELETE
FROM producttype
WHERE product_type = '衣服';
DELETE
FROM producttype
WHERE product_type = '厨房用具';
DELETE
FROM producttype
WHERE product_type = '办公⽤品';

SELECT *
FROM producttype;

ROLLBACK;

SELECT *
FROM producttype;

CREATE TABLE aa
(
    aa INTEGER primary key
);

BEGIN TRANSACTION;

INSERT INTO aa
VALUES (1);
INSERT INTO aa
VALUES (2);
INSERT INTO aa
VALUES (3);
INSERT INTO aa
VALUES (4);

COMMIT;

CREATE TABLE productmargin
(
    product_id     CHAR(4)      NOT NULL primary key,
    product_name   VARCHAR(100) NOT NULL,
    sale_price     INTEGER,
    purchase_price INTEGER,
    margin         INTEGER
);

CREATE TABLE productTemp
(
    product_id     CHAR(4) primary key,
    product_name   VARCHAR(100) NOT NULL,
    product_type   VARCHAR(50)  NOT NULL,
    sale_price     INTEGER,
    purchase_price INTEGER,
    register_date  DATE
);

INSERT INTO productTemp (product_id, product_name, product_type, sale_price, purchase_price, register_date)
VALUES ('0001', 'T恤衫', '衣服', 1000, 500, '2009-09-20'),
       ('0002', '打孔器', '办公用品', 500, 320, '2009-09-11'),
       ('0003', '运动T恤', '衣服', 4000, 2800, NULL);

INSERT INTO productmargin
SELECT product_id, product_name, sale_price, purchase_price, (sale_price - purchase_price) AS margin
FROM productTemp;

UPDATE productmargin
SET sale_price = (sale_price - 1000)
WHERE product_name = '运动T恤';

UPDATE productmargin
SET margin = (sale_price - purchase_price);

DELETE
FROM product;

INSERT INTO Product
VALUES ('0001', 'T恤', '衣服', 1000, 500, '2009-09-20');
INSERT INTO Product
VALUES ('0002', '打孔器', '办公用品', 500, 320, '2009-09-11');
INSERT INTO Product
VALUES ('0003', '运动T恤', '衣服', 4000, 2800, NULL);
INSERT INTO Product
VALUES ('0004', '菜刀', '厨房用具', 3000, 2800, '2009-09-20');
INSERT INTO Product
VALUES ('0005', '高压锅', '厨房用具', 6800, 5000, '2009-01-15');
INSERT INTO Product
VALUES ('0006', '叉子', '厨房用具', 500, NULL, '2009-09-20');
INSERT INTO Product
VALUES ('0007', '擦菜板', '厨房用具', 880, 790, '2008-04-28');
INSERT INTO Product
VALUES ('0008', '圆珠笔', '办公用品', 100, NULL, '2009-11-11');

CREATE VIEW productsum (product_type, cnt_product)
AS
SELECT product_type, count(*)
FROM product
GROUP BY product_type;

SELECT product_type, cnt_product
FROM productsum;

CREATE VIEW productsumjim (product_type, cnt_product)
AS
SELECT product_type, cnt_product
FROM productsum
WHERE product_type = '办公用品';

SELECT product_type, cnt_product
FROM productsumjim;

CREATE VIEW productjim (product_id, product_name, product_type, sale_price, purchase_price, regist_date)
AS
SELECT *
FROM product
WHERE product_type = '办公用品';

INSERT INTO productjim
VALUES ('0009', '印章', '办公用品', 95, 10, '2009-11-30');

SELECT *
FROM productjim;

DROP VIEW productsum CASCADE;

DELETE
FROM product
WHERE product_id = '0009';

CREATE VIEW productsum (product_type, cnt_product)
AS
SELECT product_type, count(*)
FROM product
GROUP BY product_type;

SELECT product_type, cnt_product
FROM productsum;

SELECT product_type, count(*) AS cnt_product
FROM product
GROUP BY product_type;

SELECT product_type, count(*) AS cnt_product
FROM product
GROUP BY product_type;

SELECT product_type, cnt_product
FROM (SELECT product_type, count(*) AS cnt_product
      FROM product
      GROUP BY product_type) AS productsum;

-- page161

SELECT product_id, product_name, sale_price
FROM product
WHERE sale_price > (SELECT avg(sale_price) FROM product);

SELECT product_id,
       product_name,
       sale_price,
       (SELECT avg(sale_price)
        FROM product) AS avg_price
FROM product;

SELECT product_type, avg(sale_price), (SELECT avg(sale_price) FROM product) AS all_avg
FROM product
GROUP BY product_type
HAVING avg(sale_price) > (SELECT avg(sale_price) FROM product);

/*SELECT product_id,
       product_name,
       sale_price,
       (SELECT avg(sale_price)
           FROM product
           GROUP BY product_type) AS avg_price
FROM product;*/

SELECT product_name, product.product_type, sale_price, avgt
FROM product,
     (SELECT product_type, avg(sale_price) AS avgt FROM product GROUP BY product_type) AS type_avg
WHERE product.product_type = type_avg.product_type
  AND sale_price > avgt;

SELECT product_type, product_name, sale_price
FROM product AS p1
WHERE sale_price >
      (SELECT avg(sale_price)
       FROM product AS p2
       WHERE p1.product_type = p2.product_type);

DROP VIEW viewpractice5_1;

CREATE VIEW viewpractice5_1 (product_name, sale_price, regist_date)
AS
SELECT product_name, sale_price, regist_date
FROM product
WHERE sale_price >= 1000
  AND regist_date = '2009-09-20';

SELECT *
FROM viewpractice5_1;

--INSERT INTO viewpractice5_1 VALUES ('0010','刀子',1000,300,NULL,'2009-11-02');

SELECT product_id, product_name, product_type, sale_price, (SELECT avg(sale_price) FROM product) AS sale_price_all
FROM product
ORDER BY sale_price;

CREATE VIEW avgpricebytype (product_id, product_name_product_type, sale_price, avg_sale_price)
AS
SELECT product_id, product_name, product.product_type, sale_price, aspTable.asp AS sale_price_all
FROM product,
     (SELECT product_type,
             avg(sale_price)
                 AS asp
      FROM product
      GROUP BY product_type) AS aspTable
WHERE product.product_type = aspTable.product_type;

SELECT *
FROM avgpricebytype;

SELECT product_id,
       product_name,
       product_type,
       sale_price,
       (SELECT avg(sale_price) FROM product p2 GROUP BY p1.sale_price)
FROM product p1;

CREATE TABLE samplemath
(
    m NUMERIC(10, 3),
    n INTEGER,
    p INTEGER
);

BEGIN TRANSACTION;

INSERT INTO samplemath(m, n, p)
VALUES (500, 0, NULL);
INSERT INTO samplemath(m, n, p)
VALUES (-180, 0, NULL);
INSERT INTO samplemath(m, n, p)
VALUES (NULL, NULL, NULL);
INSERT INTO samplemath(m, n, p)
VALUES (NULL, 7, 3);
INSERT INTO samplemath(m, n, p)
VALUES (NULL, 5, 2);
INSERT INTO samplemath(m, n, p)
VALUES (NULL, 4, NULL);
INSERT INTO samplemath(m, n, p)
VALUES (8, NULL, 3);
INSERT INTO samplemath(m, n, p)
VALUES (2.27, 1, NULL);
INSERT INTO samplemath(m, n, p)
VALUES (5.555, 2, NULL);
INSERT INTO samplemath(m, n, p)
VALUES (NULL, 1, NULL);
INSERT INTO samplemath(m, n, p)
VALUES (8.76, NULL, NULL);

COMMIT;

SELECT *
FROM samplemath;

SELECT m, abs(m) AS abs_col
FROM samplemath;

SELECT n, p, mod(n, p) AS mod_col
FROM samplemath;

SELECT m, n, round(m, n) AS round_col
FROM samplemath;

CREATE TABLE samplestr
(
    str1 VARCHAR(40),
    str2 VARCHAR(40),
    str3 VARCHAR(40)
);

INSERT INTO SampleStr (str1, str2, str3)
VALUES ('opx', 'rt', NULL);
INSERT INTO SampleStr (str1, str2, str3)
VALUES ('abc', 'def', NULL);
INSERT INTO SampleStr (str1, str2, str3)
VALUES ('山田', '太郎', '是我');
INSERT INTO SampleStr (str1, str2, str3)
VALUES ('aaa', NULL, NULL);
INSERT INTO SampleStr (str1, str2, str3)
VALUES (NULL, 'xyz', NULL);
INSERT INTO SampleStr (str1, str2, str3)
VALUES ('@!#$%', NULL, NULL);
INSERT INTO SampleStr (str1, str2, str3)
VALUES ('ABC', NULL, NULL);
INSERT INTO SampleStr (str1, str2, str3)
VALUES ('aBC', NULL, NULL);
INSERT INTO SampleStr (str1, str2, str3)
VALUES ('abc太郎', 'abc', 'ABC');
INSERT INTO SampleStr (str1, str2, str3)
VALUES ('abcdefabc', 'abc', 'ABC');
INSERT INTO SampleStr (str1, str2, str3)
VALUES ('micmic', 'i', 'I');

COMMIT;

SELECT *
FROM samplestr;

SELECT str1, str2, str3, str1 || str2 || str3 AS str_concat
FROM samplestr;

SELECT str1, length(str1) AS len_str
FROM samplestr;

SELECT str1, lower(str1) AS low_str
FROM samplestr
WHERE str1 IN ('ABC', 'aBC', 'abc', '山田');

SELECT str1, str2, str3, replace(str1, str2, str3) AS rep_str
FROM samplestr;

SELECT str1, substring(str1 FROM 3 FOR 2) AS sub_str
FROM samplestr;

SELECT str1, upper(str1) AS up_str
FROM samplestr
WHERE str1 IN ('ABC', 'aBC', 'abc', '山田');

SELECT CURRENT_DATE;

SELECT CURRENT_TIME;

SELECT CURRENT_TIMESTAMP;

SELECT CURRENT_TIMESTAMP,
       EXTRACT(YEAR FROM CURRENT_TIMESTAMP)  AS year,
       EXTRACT(MONTH FROM CURRENT_TIMESTAMP) AS month,
       EXTRACT(DAY FROM CURRENT_TIMESTAMP)   AS day,
       EXTRACT(HOUR FROM CURRENT_TIMESTAMP)  AS hour;

SELECT CAST('0001' AS INTEGER) AS int_col;

SELECT CAST('2009-12-14' AS DATE) AS date_col;

SELECT COALESCE(NULL, 1)                  AS col_1,
       COALESCE(NULL, 'test', NULL)       AS col_2,
       COALESCE(NULL, NULL, '2009-11-11') AS col_3;

SELECT COALESCE(str2, 'NULL')
FROM samplestr;

-- DDL：创建表
CREATE TABLE SampleLike
(
    strcol VARCHAR(6) NOT NULL,
    PRIMARY KEY (strcol)
);

-- DML：插入数据

INSERT INTO SampleLike (strcol)
VALUES ('abcddd');
INSERT INTO SampleLike (strcol)
VALUES ('dddabc');
INSERT INTO SampleLike (strcol)
VALUES ('abdddc');
INSERT INTO SampleLike (strcol)
VALUES ('abcdd');
INSERT INTO SampleLike (strcol)
VALUES ('ddabc');
INSERT INTO SampleLike (strcol)
VALUES ('abddc');

COMMIT;

SELECT *
FROM samplelike
WHERE strcol LIKE 'ddd%';

SELECT *
FROM samplelike
WHERE strcol LIKE '%ddd%';

SELECT *
FROM samplelike
WHERE strcol LIKE '%ddd';

SELECT *
FROM samplelike
WHERE strcol LIKE 'abc__%';

SELECT product_name, sale_price
FROM product
WHERE sale_price BETWEEN 100 AND 1000;

SELECT product_name, sale_price
FROM product
WHERE sale_price > 100
  AND sale_price < 1000;

SELECT product_name, purchase_price
FROM product
WHERE purchase_price IS NULL;

SELECT product_name, purchase_price
FROM product
WHERE purchase_price IS NOT NULL;

SELECT product_name, purchase_price
FROM product
WHERE purchase_price = 320
   OR purchase_price = 500
   OR purchase_price = 5000;

SELECT product_name, purchase_price
FROM product
WHERE purchase_price IN (320, 500, 5000, NULL);

-- DDL：创建表
CREATE TABLE ShopProduct
(
    shop_id    CHAR(4)      NOT NULL,
    shop_name  VARCHAR(200) NOT NULL,
    product_id CHAR(4)      NOT NULL,
    quantity   INTEGER      NOT NULL,
    PRIMARY KEY (shop_id, product_id)
);

-- DML：插入数据

INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity)
VALUES ('000A', '东京', '0001', 30);
INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity)
VALUES ('000A', '东京', '0002', 50);
INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity)
VALUES ('000A', '东京', '0003', 15);
INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity)
VALUES ('000B', '名古屋', '0002', 30);
INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity)
VALUES ('000B', '名古屋', '0003', 120);
INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity)
VALUES ('000B', '名古屋', '0004', 20);
INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity)
VALUES ('000B', '名古屋', '0006', 10);
INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity)
VALUES ('000B', '名古屋', '0007', 40);
INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity)
VALUES ('000C', '大阪', '0003', 20);
INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity)
VALUES ('000C', '大阪', '0004', 50);
INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity)
VALUES ('000C', '大阪', '0006', 90);
INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity)
VALUES ('000C', '大阪', '0007', 70);
INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity)
VALUES ('000D', '福冈', '0001', 100);

COMMIT;

SELECT product.product_id, product_name, sale_price
FROM product,
     shopproduct
WHERE product.product_id = ShopProduct.product_id
  AND ShopProduct.shop_id = '000C';

SELECT *
FROM ShopProduct
WHERE shop_id = '000C';

SELECT product_id, product_name, sale_price
FROM product
WHERE product_id NOT IN
      (SELECT ShopProduct.product_id
       FROM ShopProduct
       WHERE shop_id = '000A');

SELECT product_name, sale_price
FROM product AS p
WHERE EXISTS(SELECT *
             FROM ShopProduct AS sp
             WHERE sp.shop_id = '000C'
               AND sp.product_id = p.product_id
               AND sp.product_id = '0003');

SELECT product_name, sale_price
FROM product AS p
WHERE NOT EXISTS(SELECT *
                 FROM ShopProduct AS sp
                 WHERE sp.shop_id = '000A'
                   AND sp.product_id = p.product_id
                   AND sp.product_id = '0003');

SELECT product_name,
       CASE
           WHEN product_type = '衣服' THEN 'A:' || product_type
           WHEN product_type = '办公用品' THEN 'B:' || product_type
           WHEN product_type = '厨房用具' THEN 'C:' || product_type
           ELSE NULL
           END AS abs_product_type
FROM product;

SELECT product_type, sum(sale_price) AS sum_price
FROM product
GROUP BY product_type;

SELECT sum(CASE WHEN product_type = '衣服' THEN sale_price ELSE 0 END)   AS sum_price_clothes,
       sum(CASE WHEN product_type = '厨房用具' THEN sale_price ELSE 0 END) AS sum_price_kitchen,
       sum(CASE WHEN product_type = '办公用品' THEN sale_price ELSE 0 END) AS sum_price_office
FROM product;

-- page221

SELECT count(CASE WHEN sale_price <= 1000 THEN sale_price ELSE NULL END)                        AS low_price,
       count(CASE WHEN sale_price >= 1000 AND sale_price <= 3000 THEN sale_price ELSE NULL END) AS mid_price,
       count(CASE WHEN sale_price >= 3001 THEN sale_price ELSE NULL END)                        AS high_price
FROM product;

-- DDL：创建表
CREATE TABLE product2
(
    product_id     CHAR(4)      NOT NULL,
    product_name   VARCHAR(100) NOT NULL,
    product_type   VARCHAR(32)  NOT NULL,
    sale_price     INTEGER,
    purchase_price INTEGER,
    regist_date    DATE,
    PRIMARY KEY (product_id)
);

-- DML：插入数据

INSERT INTO product2
VALUES ('0001', 'T恤', '衣服', 1000, 500, '2009-09-20');
INSERT INTO product2
VALUES ('0002', '打孔器', '办公用品', 500, 320, '2009-09-11');
INSERT INTO product2
VALUES ('0003', '运动T恤', '衣服', 4000, 2800, NULL);
INSERT INTO product2
VALUES ('0009', '手套', '衣服', 800, 500, NULL);
INSERT INTO product2
VALUES ('0010', '水壶', '厨房用具', 2000, 1700, '2009-09-20');

COMMIT;

DROP TABLE product2;

SELECT product_id, product_name
FROM product
UNION
SELECT product_id, product_name
FROM product2
ORDER BY product_id;

-- 列数不一致
/*SELECT product_id, product_name
FROM product
UNION
SELECT product_id, product_name, sale_price
FROM product;*/

-- 类型不一致
/*SELECT product_name,sale_price
FROM product
UNION
SELECT product_id,regist_date
FROM product2;*/

SELECT product_id, product_name
FROM product
UNION ALL
SELECT product_id, product_name
FROM product2;

SELECT product_id, product_name
FROM product
INTERSECT
SELECT product_id, product_name
FROM product2
ORDER BY product_id;

SELECT product_id, product_name
FROM product
    EXCEPT
SELECT product_id, product_name
FROM product2
ORDER BY product_id;

SELECT *
FROM shopproduct;

SELECT shopproduct.*, product_name
FROM product,
     shopproduct
WHERE product.product_id = ShopProduct.product_id;

SELECT SP.shop_id, SP.shop_name, SP.product_id, p.product_name
FROM shopproduct AS SP
         INNER JOIN product p on SP.product_id = p.product_id
WHERE SP.shop_id = '000A';

CREATE VIEW view_productjoinshopproduct (shop_id, shop_name, product_id, product_name)
AS
SELECT SP.shop_id, SP.shop_name, SP.product_id, p.product_name
FROM shopproduct AS SP
         INNER JOIN product p on SP.product_id = p.product_id;

SELECT *
FROM view_productjoinshopproduct;

SELECT sp.shop_id, sp.shop_name, sp.product_id, p.product_name, p.sale_price
FROM shopproduct AS sp
         RIGHT OUTER JOIN product AS p on p.product_id = sp.product_id;

-- DDL：创建表
CREATE TABLE InventoryProduct
(
    inventory_id       CHAR(4) NOT NULL,
    product_id         CHAR(4) NOT NULL,
    inventory_quantity INTEGER NOT NULL,
    PRIMARY KEY (inventory_id, product_id)
);

-- DML：插入数据

INSERT INTO InventoryProduct (inventory_id, product_id, inventory_quantity)
VALUES ('S001', '0001', 0);
INSERT INTO InventoryProduct (inventory_id, product_id, inventory_quantity)
VALUES ('S001', '0002', 120);
INSERT INTO InventoryProduct (inventory_id, product_id, inventory_quantity)
VALUES ('S001', '0003', 200);
INSERT INTO InventoryProduct (inventory_id, product_id, inventory_quantity)
VALUES ('S001', '0004', 3);
INSERT INTO InventoryProduct (inventory_id, product_id, inventory_quantity)
VALUES ('S001', '0005', 0);
INSERT INTO InventoryProduct (inventory_id, product_id, inventory_quantity)
VALUES ('S001', '0006', 99);
INSERT INTO InventoryProduct (inventory_id, product_id, inventory_quantity)
VALUES ('S001', '0007', 999);
INSERT INTO InventoryProduct (inventory_id, product_id, inventory_quantity)
VALUES ('S001', '0008', 200);
INSERT INTO InventoryProduct (inventory_id, product_id, inventory_quantity)
VALUES ('S002', '0001', 10);
INSERT INTO InventoryProduct (inventory_id, product_id, inventory_quantity)
VALUES ('S002', '0002', 25);
INSERT INTO InventoryProduct (inventory_id, product_id, inventory_quantity)
VALUES ('S002', '0003', 34);
INSERT INTO InventoryProduct (inventory_id, product_id, inventory_quantity)
VALUES ('S002', '0004', 19);
INSERT INTO InventoryProduct (inventory_id, product_id, inventory_quantity)
VALUES ('S002', '0005', 99);
INSERT INTO InventoryProduct (inventory_id, product_id, inventory_quantity)
VALUES ('S002', '0006', 0);
INSERT INTO InventoryProduct (inventory_id, product_id, inventory_quantity)
VALUES ('S002', '0007', 0);
INSERT INTO InventoryProduct (inventory_id, product_id, inventory_quantity)
VALUES ('S002', '0008', 18);

COMMIT;

SELECT sp.shop_id, sp.shop_name, sp.product_id, p.product_name, p.sale_price, ip.inventory_quantity
FROM shopproduct AS sp
         RIGHT OUTER JOIN inventoryproduct AS ip ON sp.product_id = ip.product_id
         LEFT OUTER JOIN product AS p on sp.product_id = p.product_id;

SELECT *
FROM product
    EXCEPT
SELECT *
FROM product
UNION
SELECT *
FROM product
ORDER BY product_id;

SELECT COALESCE(sp.shop_id, '不确定'),
       COALESCE(sp.shop_name, '不确定'),
       COALESCE(sp.product_id, '不确定'),
       p.product_name,
       p.sale_price
FROM shopproduct AS sp
         RIGHT OUTER JOIN product p on sp.product_id = p.product_id;

-- page 197
SELECT shop_id, count(*)
FROM ShopProduct
GROUP BY shop_id;

SELECT product_name,
       product_type,
       sale_price,
       rank() OVER (PARTITION BY product_type ORDER BY sale_price) AS ranking,
       dense_rank() OVER ( ORDER BY sale_price)                    AS dense_ranking,
       row_number() OVER ( ORDER BY sale_price)                    AS row_number
FROM product;

SELECT *
FROM (SELECT product_name,
             product_type,
             sale_price,
             rank() OVER (PARTITION BY product_type ORDER BY sale_price) AS ranking,
             dense_rank() OVER ( ORDER BY sale_price)                    AS dense_ranking,
             row_number() OVER ( ORDER BY sale_price)                    AS row_number
      FROM product) AS p1
WHERE p1.ranking <= 2;

SELECT product_id,
       product_name,
       sale_price,
       avg(sale_price) OVER (ORDER BY product_id) AS current_sum
FROM product;

SELECT product_id,
       product_name,
       sale_price,
       avg(sale_price) OVER (ORDER BY product_id ROWs BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS current_sum
FROM product;

SELECT product_id,
       product_name,
       product_type,
       sale_price,
       rank() OVER (ORDER BY sale_price) AS ranking
FROM product
ORDER BY product_id;

SELECT product_type, count(*)
FROM product
GROUP BY product_type
HAVING count(*) >= 2;

SELECT product_type, sum(sale_price)
FROM product
GROUP BY product_type;

SELECT '合计' AS product_type, sum(sale_price)
FROM product
UNION ALL
SELECT product_type, sum(sale_price)
FROM product
GROUP BY product_type;

SELECT COALESCE(product_type, '合计'), sum(sale_price) AS sum_price
FROM product
GROUP BY rollup (product_type);

SELECT product_type, regist_date, sum(sale_price) AS sum_price, count(*)
FROM product
GROUP BY product_type, regist_date;

SELECT CASE
           WHEN GROUPING(product_type) = 1
               THEN '商品种类 合计'
           ELSE product_type END
                       AS product_type,
       CASE
           WHEN GROUPING(regist_date) = 1
               THEN '登记日期 合计'
           ELSE CAST(regist_date AS VARCHAR(16)) END
                       AS regist_date,
       sum(sale_price) AS sum_price,
       count(*)
FROM product
GROUP BY cube (product_type, regist_date)
ORDER BY sum_price DESC, product_type;

SELECT GROUPING(product_type) AS product_type, grouping(regist_date) AS regist_date, sum(sale_price) AS sum_price
FROM product
GROUP BY rollup (product.product_type, product.regist_date);

SELECT CASE
           WHEN GROUPING(product_type) = 1
               THEN '商品种类 合计'
           ELSE product_type END                     AS product_type,
       CASE
           WHEN GROUPING(regist_date) = 1
               THEN '登记日期 合计'
           ELSE CAST(regist_date AS VARCHAR(16)) END AS regist_date,
       sum(sale_price)                               AS sum_price
FROM product
GROUP BY CUBE (product_type, regist_date);

SELECT CASE
           WHEN GROUPING(product_type) = 1
               THEN '商品种类 合计'
           ELSE product_type END                     AS product_type,
       CASE
           WHEN GROUPING(regist_date) = 1
               THEN '登记日期 合计'
           ELSE CAST(regist_date AS VARCHAR(16)) END AS regist_date,
       sum(sale_price)                               AS sum_price
FROM product
GROUP BY GROUPING SETS (product_type, regist_date);

SELECT product_id, product_name, sale_price, MAX(sale_price) OVER ( ORDER BY product_id ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS current_max_price
FROM product;


