delete CustomerTypes;
INSERT INTO CustomerTypes VALUES (1, 'Онлайн-платформа');
INSERT INTO CustomerTypes VALUES (2, 'Компания');
INSERT INTO CustomerTypes VALUES (3, 'Библиотека');
INSERT INTO CustomerTypes VALUES (4, 'Бизнес-организация');
INSERT INTO CustomerTypes VALUES (5, 'Книжная выставка');
INSERT INTO CustomerTypes VALUES (6, 'Книжный магазин');
COMMIT;

select * from CustomerTypes;



delete Genres;
INSERT INTO Genres VALUES (1, 'Боевик');
INSERT INTO Genres VALUES (2, 'Детектив');
INSERT INTO Genres VALUES (3, 'Исторический роман');
INSERT INTO Genres VALUES (4, 'Любовный роман');
INSERT INTO Genres VALUES (5, 'Мистика');
INSERT INTO Genres VALUES (6, 'Приключения');
COMMIT;

select * from Genres;



delete ProductTypes;
INSERT INTO ProductTypes VALUES (1, 'Учебное');
INSERT INTO ProductTypes VALUES (2, 'Научное');
INSERT INTO ProductTypes VALUES (3, 'Официальное');
INSERT INTO ProductTypes VALUES (4, 'Справочное');
INSERT INTO ProductTypes VALUES (5, 'Литературно-художественное');
INSERT INTO ProductTypes VALUES (6, 'Рекламное');
COMMIT;

select * from ProductTypes;



delete Typographys;
INSERT INTO Typographys VALUES (1, 'Веда-Полиграф', 'г. Минск, ул. Чайлытко, д22, кв86', '+375(17)313-33-54');
INSERT INTO Typographys VALUES (2, 'Галерея Печати', 'г. Витебск, ул. Кирова, д258, кв39', '+375(163)47-17-39');
INSERT INTO Typographys VALUES (3, 'Главная Печать', 'г. Бобруйск, Минская ул., д271, кв8', '+375(225)55-00-37');
INSERT INTO Typographys VALUES (4, 'Европейский центр печати', 'г. Витебск, ул.Чкалова, д16', '+375(212)63-27-63');
INSERT INTO Typographys VALUES (5, 'Ладога', 'г. Барановичи, Московский пр., д221/5, кв20', '+375(17)341-86-67');
INSERT INTO Typographys VALUES (6, 'Печатный Элемент', 'г. Минск, Уборевича ул., д28, кв62', '+375(212)22-74-87');
COMMIT;

select * from Typographys;



delete Authors;
INSERT INTO Authors VALUES (1, 'Роман', 'Бобров', '27.04.1972', 'Россия', 'roman.bobrov@gmail.com');
INSERT INTO Authors VALUES (2, 'Галина', 'Кобыльских', '07.06.1989', 'Россия', 'galina07061989@hotmail.com');
INSERT INTO Authors VALUES (3, 'Марфа', 'Федотова', '04.04.1975', 'Россия', 'marfa1975@yandex.ru');
INSERT INTO Authors VALUES (4, 'Оксана', 'Кочкорбаева', '07.09.1990', 'Россия', 'oksana07091990@mail.ru');
INSERT INTO Authors VALUES (5, 'Иван', 'Болтунов', '17.12.1964', 'Россия', 'ivan9973@outlook.com');
INSERT INTO Authors VALUES (6, 'Лидия', 'Чукчова', '15.11.1996', 'Россия', 'lidiya92@mail.ru');
COMMIT;

select * from Authors;



delete Publications;
INSERT INTO Publications VALUES (1, 'Путь воина', 2, 2, '08.08.2019', 5, 320);
INSERT INTO Publications VALUES (2, 'Преступление и наказание', 1, 4, '06.10.2011', 3, 800);
INSERT INTO Publications VALUES (3, 'Маленький принц', 3, 2, '20.11.2000', 4, 620);
INSERT INTO Publications VALUES (4, 'Война и мир', 5, 1, '25.01.2002', 1, 110);
INSERT INTO Publications VALUES (5, 'Мастер и Маргарита', 2, 2, '03.04.2020', 1, 420);
INSERT INTO Publications VALUES (6, 'Анна Каренина', 3, 6, '11.07.2014', 4, 360);
COMMIT;

select * from Publications;



delete Customers;
INSERT INTO Customers VALUES (1, 3, 'Радуга', 'moivouvoheppoi-7326@yopmail.com', 'Беларусь');
INSERT INTO Customers VALUES (2, 5, 'Детская выставка', 'xuppenifasou-7616@yopmail.com', 'Россия');
INSERT INTO Customers VALUES (3, 4, 'ITTI', 'vepaufoteitrou-1515@yopmail.com', 'Франция');
INSERT INTO Customers VALUES (4, 2, 'БелБанк', 'douddegrouppitrei-4636@yopmail.com', 'Швейцария');
INSERT INTO Customers VALUES (5, 2, 'Инорикс', 'croinnittounnita-6689@yopmail.com', 'Беларусь');
INSERT INTO Customers VALUES (6, 1, 'Марру', 'lasiyucekei-1793@yopmail.com', 'Росиия');
COMMIT;

select * from Customers;



delete Orders;
INSERT INTO Orders VALUES (1, 1, '05.02.2015', '05.03.2015', 2000, 1, 2, 'выполнено');
INSERT INTO Orders VALUES (2, 2, '23.11.2001', '20.12.2001', 1000, 6, 5, 'выполнено');
INSERT INTO Orders VALUES (3, 5, '07.09.2007', '07.11.2007', 5000, 4, 1, 'выполнено');
INSERT INTO Orders VALUES (4, 2, '04.02.2011', '27.02.2011', 1000, 3, 2, 'выполнено');
INSERT INTO Orders VALUES (5, 3, '26.04.2012', '13.05.2012', 500, 6, 5, 'выполнено');
INSERT INTO Orders VALUES (6, 6, '19.07.2016', '29.08.2016', 2000, 3, 4, 'выполнено');
COMMIT;

select * from Orders;







