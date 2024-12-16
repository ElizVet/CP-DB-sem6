-- SHIM to ORCL
CREATE TABLESPACE TSPublishingHouse
Datafile 'D:\app\ora_install_user\admin\orcl\TSPublishingHouse.dbf' 
size 10M
autoextend ON NEXT 5M
maxsize unlimited;



CREATE TABLE Authors (
  AUTHOR_ID INT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  LAST_NAME varchar(50) NOT NULL,
  BIRTH_DATE DATE NOT NULL,
  COUNTRY varchar(50),
  EMAIL VARCHAR(100) NOT NULL
)
TABLESPACE TSPublishingHouse;
COMMIT;


CREATE TABLE Genres (
  GENRE_ID int primary key,
  genre_name VARCHAR(50) NOT NULL, UNIQUE
)
TABLESPACE TSPublishingHouse;
COMMIT;


CREATE TABLE ProductTypes (
  product_type_id INT PRIMARY KEY,
  product_type_name VARCHAR(50) NOT NULL -- книга / газета / журнал и тд
)
TABLESPACE TSPublishingHouse;
COMMIT;


CREATE TABLE Typographys (
  typography_id INT PRIMARY KEY,
  typography_name VARCHAR(100) NOT NULL,
  address VARCHAR(200),
  contact_number VARCHAR(20)
)
TABLESPACE TSPublishingHouse;
COMMIT;

ALTER TABLE ProductTypes
ADD CONSTRAINT product_type_name_unique UNIQUE (product_type_name);

CREATE TABLE Publications ( -- издания / книги
  publication_id INT PRIMARY KEY,
  publication_title VARCHAR(100) NOT NULL,
  publication_author_id INT,
  publication_genre_id INT,
  publication_date DATE,
  publication_type_id INT,
  volume_in_pages INT, -- кол-во страниц
  FOREIGN KEY (publication_author_id) REFERENCES Authors(author_id),
  FOREIGN KEY (publication_genre_id) REFERENCES Genres(genre_id),
  FOREIGN KEY (publication_type_id) REFERENCES ProductTypes(product_type_id)
)
TABLESPACE TSPublishingHouse;
COMMIT;


CREATE TABLE CustomerTypes (
  customer_type_id INT PRIMARY KEY,
  customer_type_name VARCHAR(50) NOT NULL -- книжный магазин / бизнес-организация / 
                                          -- онлайн-платформа / библиотека / 
                                          -- организаторы книжных выставок
)
TABLESPACE TSPublishingHouse;
COMMIT;


CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  customer_type INT,
  customer_name VARCHAR(100) NOT NULL, -- имя компании / человека
  email VARCHAR(100),
  country VARCHAR(50),
  FOREIGN KEY (customer_type) REFERENCES CustomerTypes(customer_type_id)
)
TABLESPACE TSPublishingHouse;
COMMIT;


CREATE TABLE Orders (
  order_id INT PRIMARY KEY,
  order_customer_id INT,
  order_acceptance_date DATE, -- дата приема заказа
  order_completion_date DATE, -- дата выполнения заказа
  order_circulation INT, -- тираж / кол-во заказанного издания
  order_publication_id INT,
  order_typography_id INT,
  order_status VARCHAR(20) NOT NULL, -- выполнено, не выполнено, в процессе и тд
  
  FOREIGN KEY (order_publication_id) REFERENCES Publications(publication_id),
  FOREIGN KEY (order_typography_id) REFERENCES Typographys(typography_id),
  FOREIGN KEY (order_customer_id) REFERENCES Customers(customer_id)
)
TABLESPACE TSPublishingHouse;
COMMIT;

-- проверка таблиц
SELECT object_name FROM user_objects WHERE object_type='TABLE';

