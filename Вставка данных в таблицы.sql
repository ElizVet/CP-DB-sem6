delete CustomerTypes;
INSERT INTO CustomerTypes VALUES (1, '������-���������');
INSERT INTO CustomerTypes VALUES (2, '��������');
INSERT INTO CustomerTypes VALUES (3, '����������');
INSERT INTO CustomerTypes VALUES (4, '������-�����������');
INSERT INTO CustomerTypes VALUES (5, '������� ��������');
INSERT INTO CustomerTypes VALUES (6, '������� �������');
COMMIT;

select * from CustomerTypes;



delete Genres;
INSERT INTO Genres VALUES (1, '������');
INSERT INTO Genres VALUES (2, '��������');
INSERT INTO Genres VALUES (3, '������������ �����');
INSERT INTO Genres VALUES (4, '�������� �����');
INSERT INTO Genres VALUES (5, '�������');
INSERT INTO Genres VALUES (6, '�����������');
COMMIT;

select * from Genres;



delete ProductTypes;
INSERT INTO ProductTypes VALUES (1, '�������');
INSERT INTO ProductTypes VALUES (2, '�������');
INSERT INTO ProductTypes VALUES (3, '�����������');
INSERT INTO ProductTypes VALUES (4, '����������');
INSERT INTO ProductTypes VALUES (5, '�����������-��������������');
INSERT INTO ProductTypes VALUES (6, '���������');
COMMIT;

select * from ProductTypes;



delete Typographys;
INSERT INTO Typographys VALUES (1, '����-��������', '�. �����, ��. ��������, �22, ��86', '+375(17)313-33-54');
INSERT INTO Typographys VALUES (2, '������� ������', '�. �������, ��. ������, �258, ��39', '+375(163)47-17-39');
INSERT INTO Typographys VALUES (3, '������� ������', '�. ��������, ������� ��., �271, ��8', '+375(225)55-00-37');
INSERT INTO Typographys VALUES (4, '����������� ����� ������', '�. �������, ��.�������, �16', '+375(212)63-27-63');
INSERT INTO Typographys VALUES (5, '������', '�. ����������, ���������� ��., �221/5, ��20', '+375(17)341-86-67');
INSERT INTO Typographys VALUES (6, '�������� �������', '�. �����, ��������� ��., �28, ��62', '+375(212)22-74-87');
COMMIT;

select * from Typographys;



delete Authors;
INSERT INTO Authors VALUES (1, '�����', '������', '27.04.1972', '������', 'roman.bobrov@gmail.com');
INSERT INTO Authors VALUES (2, '������', '����������', '07.06.1989', '������', 'galina07061989@hotmail.com');
INSERT INTO Authors VALUES (3, '�����', '��������', '04.04.1975', '������', 'marfa1975@yandex.ru');
INSERT INTO Authors VALUES (4, '������', '�����������', '07.09.1990', '������', 'oksana07091990@mail.ru');
INSERT INTO Authors VALUES (5, '����', '��������', '17.12.1964', '������', 'ivan9973@outlook.com');
INSERT INTO Authors VALUES (6, '�����', '�������', '15.11.1996', '������', 'lidiya92@mail.ru');
COMMIT;

select * from Authors;



delete Publications;
INSERT INTO Publications VALUES (1, '���� �����', 2, 2, '08.08.2019', 5, 320);
INSERT INTO Publications VALUES (2, '������������ � ���������', 1, 4, '06.10.2011', 3, 800);
INSERT INTO Publications VALUES (3, '��������� �����', 3, 2, '20.11.2000', 4, 620);
INSERT INTO Publications VALUES (4, '����� � ���', 5, 1, '25.01.2002', 1, 110);
INSERT INTO Publications VALUES (5, '������ � ���������', 2, 2, '03.04.2020', 1, 420);
INSERT INTO Publications VALUES (6, '���� ��������', 3, 6, '11.07.2014', 4, 360);
COMMIT;

select * from Publications;



delete Customers;
INSERT INTO Customers VALUES (1, 3, '������', 'moivouvoheppoi-7326@yopmail.com', '��������');
INSERT INTO Customers VALUES (2, 5, '������� ��������', 'xuppenifasou-7616@yopmail.com', '������');
INSERT INTO Customers VALUES (3, 4, 'ITTI', 'vepaufoteitrou-1515@yopmail.com', '�������');
INSERT INTO Customers VALUES (4, 2, '�������', 'douddegrouppitrei-4636@yopmail.com', '���������');
INSERT INTO Customers VALUES (5, 2, '�������', 'croinnittounnita-6689@yopmail.com', '��������');
INSERT INTO Customers VALUES (6, 1, '�����', 'lasiyucekei-1793@yopmail.com', '������');
COMMIT;

select * from Customers;



delete Orders;
INSERT INTO Orders VALUES (1, 1, '05.02.2015', '05.03.2015', 2000, 1, 2, '���������');
INSERT INTO Orders VALUES (2, 2, '23.11.2001', '20.12.2001', 1000, 6, 5, '���������');
INSERT INTO Orders VALUES (3, 5, '07.09.2007', '07.11.2007', 5000, 4, 1, '���������');
INSERT INTO Orders VALUES (4, 2, '04.02.2011', '27.02.2011', 1000, 3, 2, '���������');
INSERT INTO Orders VALUES (5, 3, '26.04.2012', '13.05.2012', 500, 6, 5, '���������');
INSERT INTO Orders VALUES (6, 6, '19.07.2016', '29.08.2016', 2000, 3, 4, '���������');
COMMIT;

select * from Orders;







