create database module3;
use module3;
drop database module3;

create TABLE role (
    id INT PRIMARY KEY,
    name VARCHAR(20)
);

create table users(
    id int AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) not null,
    email VARCHAR(50) not null unique,
    phone varchar(12) not null unique,
    password VARCHAR(50) not null,
    idRestaurant varchar(100)
);

create table address(
	id int primary key auto_increment,
    name varchar(255) not null,
    idUser int,
    foreign key (idUser) references users(id)
);

create table role_user(
	idRole int,
    idUser int,
    primary key(idRole, idUser),
    foreign key (idRole) references role(id),
    foreign key (idUser) references users(id)
);
 
create table restaurant(
	id int primary key auto_increment,
    name varchar(100) unique,
    operatingtime varchar(100),
    address varchar(255),
    idUser int,
    foreign key (idUser) references users(id)
);

drop table category;
create table category(
	id int primary key auto_increment,
    name varchar(50) not null unique,
    type varchar(30) not null,
    image varchar(30),
    amountAddress int default 0,
    idrestaurant int,
    foreign key (idrestaurant) references restaurant(id)
);

create table tag(
	id int primary key auto_increment,
    name varchar(50) not null,
    slug varchar(50) not null unique,
    innings int default 0,
    view int default 0
);

create table discount(
	id varchar(100) primary key,
    name varchar(100) unique,
	value float not null
);

create table product(
	id int auto_increment primary key,
    name varchar(100) not null unique,
    idCategory int,
    idtag int,
    image varchar(50) not null,
    price varchar(50) not null,
    promotionalprice varchar(50) not null,
    serviceprice varchar(50) default 0,
    servicenote varchar(255) not null,
    preparationtime varchar(50) not null,
    usagesdiscount int default 0,
    view int default 0,
    amount int,
    creationdate date, 
    editdateend date,
    foreign key (idCategory) references category(id),
    foreign key (idtag) references tag(id)
);


create table cart(
	id int auto_increment primary key,
    iduser int,
	total int default 0,
    createDay datetime,
    foreign key (iduser) references users(id)
);

create table cartdetails(
	id int auto_increment primary key,
    idproduct int,
    idcart int,
    amount int,
    price int,
    foreign key (idproduct) references product(id),
    foreign key (idcart) references cart(id)
);
insert into role(id, name) values 
(0, 'admin'), 
(1, 'collabarator'), 
(2, 'client');

select * from users;

insert into users(name, email, phone, password) values 
('Ng?? Gia B???o', 'bao@gmail.com', 0123456789, '123456aA@'),
('Shop 1', 'shop1@gmail.com', 0123455523, '123456aA@'),
('Shop 2', 'shop2@gmail.com', 0123455456, '123456aA@'),
('Shop 3', 'shop3@gmail.com', 0123451211, '123456aA@'),
('Shop 4', 'shop4@gmail.com', 0123456567, '123456aA@');
insert into users(name, email, phone, password) values 
('Shop 5', 'shop5@gmail.com', 0123456422, '123456aA@'),
('Shop 6', 'shop6@gmail.com', 0123456311, '123456aA@'),
('Shop 7', 'shop7@gmail.com', 0123456665, '123456aA@'),
('Shop 8', 'shop8@gmail.com', 0123456476, '123456aA@');

select * from users;
insert into role_user(idRole, IdUser) values (2, 1), (2, 2), (2, 3) ,(2, 4), (2, 5), (2, 6), (2, 7), (2, 8), (2, 9);
insert into role_user(idRole, IdUser) values (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7), (1, 8), (1, 9);
select * from role_user;

select id from users order by id desc limit 1;

select * from users;

update users set name='a', email='a@gmail.com', phone='0121212121', password='1212121' where id = 1;

delete from users where id = 1;

insert into tag(name, slug) values  ('All', 'all'),
							  ('????? ??n', 'do-an'),	
							  ('????? u???ng', 'do-uong'),
                              ('????? chay', 'do-chay'),
                              ('B??nh kem', 'banh-kem'),
                              ('Tr??ng mi???ng', 'trang-mieng'),
                              ('Piza/Burger', 'pizza-burger'),
                              ('M??n g??', 'mon-ga'),
                              ('M??n l???u', 'mon-lau'),
                              ('M?? ph???', 'mi-pho'),
                              ('C??m h???p', 'com-hop'),
                              ('Sushi', 'sushi');
					
insert into category(name,type, image) values  ('C??m', 'product', '1.png'),
										('B??n/Ph???', 'product', '2.jpg'),
										('????? u???ng', 'product', '3.jpg'),
										('????? ??n nhanh', 'product', '4.jpg'),
										('??n v???t', 'product', '5.jpg'),
                                        ('L???u n?????ng', 'product', '6.jpg'),
										('?????c s???n', 'product', '7.jpg'),
										('Healthy', 'product', '8.jpg');
insert into restaurant(name, operatingtime, address, idUser) values ('C??m Rang G?? S???t 30K - M??? ????nh', '06:30 - 22:30', '14 Ng?? 20 M??? ????nh, P. M??? ????nh 2, Nam T??? Li??m, H?? N???i', 2),
('BUMTRO - B??n Tr???n Nam B??? - ????o T???n', '07:00 - 21:00', '26 Ngo?? 58 ??a??o T????n, P. C???ng V???, Ba ????nh, H?? N???i', 3),
('Tr?? s???a Tocotoco - L?? Tr???ng T???n', '08:00 - 23:00', '156 L?? Tr???ng T???n, P. La Kh??, H?? ????ng, H?? N???i', 4),
('McDonald - H??? G????m', '07:00 - 23:00', '2 H??ng B??i, P. Tr??ng Ti???n, Ho??n Ki???m, H?? N???i', 5),
('T??o Ph??? Jellybean - Quang Trung', '07:30 - 21:30', '28 Quang Trung, P. Tr???n H??ng ?????o, Ho??n Ki???m, H?? N???i', 6),
('Qu??n Ngon Th??i - ???m Th???c Th??i Lan', '08:00 - 22:00', '56/52 T?? Ng???c V??n, T??y H???, H?? N???i',7 ),
('C?? H????ng B??o - B??n Ri??u T??p M??? M???c Gi??n - T???ng Duy T??n', '07:30 - 23:59', '2C T???ng Duy T??n, P. H??ng B??ng, Ho??n Ki???m, H?? N???i', 8),
('Di???u ??m Qu??n - Ng???c L??m', '07:00 - 21:50', '696 Ng???c L??m, P. Gia Thu???, Long Bi??n, H?? N???i', 9);

-- insert into discount(id,value) values   ('gi???m 20k cho ????n 50k', '20000'),
-- 										('gi???m 30k cho ????n 70k', '30000'),
-- 										('Gi???m 50k cho ????n 120k', '50000'),
-- 										('Gi???m 70k cho ????n 200k', '70000'),
-- 										('Gi???m 100k cho ????n 300k', '100000')
insert into product(name, idCategory, idtag, image, price, promotionalprice, serviceprice, servicenote, preparationtime, creationdate, editdateend ) values  ('C??m S?????n', 1,2,'11.png','40000','4000','2000','Th??m ngon','10 ph??t','2022-07-25','22-07-25'),
																																							 ('C??m G??', 1,8,'12.jpg','40000','4000','2000','Th??m ngon','10 ph??t','2022-07-25','22-07-25'),
                                                                                                                                                             ('C??m B??', 1,2,'13.jpg','50000','5000','2000','Th??m ngon','10 ph??t','2022-07-25','22-07-25'),
																																							 ('B??n B??', 2,10,'21.jpg','60000','6000','2000','Th??m ngon','10 ph??t','2022-07-25','22-07-25'),
                                                                                                                                                             ('B??n H???n', 2,10,'22.jpg','30000','3000','2000','Th??m ngon','10 ph??t','2022-07-25','22-07-25'),
                                                                                                                                                             ('Ph??? b??', 2,10,'23.jpg','45000','4500','2000','Th??m ngon','10 ph??t','2022-07-25','22-07-25'),
																																							 ('Tr?? s???a', 3,3,'31.jpg','35000','3500','2000','Th??m ngon','10 ph??t','2022-07-25','22-07-25'),
                                                                                                                                                             ('Tr?? chanh', 3,3,'32.jpg','15000','1500','2000','Th??m ngon','5 ph??t','2022-07-25','22-07-25'),
                                                                                                                                                             ('N?????c sinh t???', 3,3,'33.jpg','25000','2500','2000','Th??m ngon','10 ph??t','2022-07-25','22-07-25'),
																																							 ('B??nh m??', 4,2,'41.png','25000','2500','2000','Th??m ngon','5 ph??t','2022-07-25','22-07-25'),
                                                                                                                                                             ('G?? r??n', 4,8,'42.jpg','50000','5000','2000','Th??m ngon','10 ph??t','2022-07-25','22-07-25'),
                                                                                                                                                             ('Hambuger', 4,7,'43.jpg','60000','6000','2000','Th??m ngon','10 ph??t','2022-07-25','22-07-25'),
																																							 ('M?? l???c', 5,10,'51.jpg','35000','3500','2000','Th??m ngon','10 ph??t','2022-07-25','22-07-25'),
                                                                                                                                                             ('B??nh tr??ng tr???n', 5, 2,'52.jpg','15000','1500','2000','Th??m ngon','5 ph??t','2022-07-25','22-07-25'),
                                                                                                                                                             ('Ph?? mai que', 5,2,'53.jpg','10000','1000','2000','Th??m ngon','10 ph??t','2022-07-25','22-07-25'),
																																							 ('L???u th??i', 6,9,'61.jpg','250000','25000','5000','Th??m ngon','15 ph??t','2022-07-25','22-07-25'),
                                                                                                                                                             ('L???u h???i s???n', 6,9,'62.jpg','350000','35000','5000','Th??m ngon','15 ph??t','2022-07-25','22-07-25'),
                                                                                                                                                             ('L???u Tokbokki', 6, 9,'63.jpg','200000','20000','5000','Th??m ngon','15 ph??t','2022-07-25','22-07-25'),
																																							 ('NEM 36 - ?????c S???n Thanh H??a', 7,2,'71.jpg','120000','12000','2000','Th??m ngon','5 ph??t','2022-07-25','22-07-25'),
                                                                                                                                                             ('Tr??u g??c b???p T??y B???c', 7,2,'72.jpg','400000','40000','2000','Th??m ngon','5 ph??t','2022-07-25','22-07-25'),
                                                                                                                                                             (' ?????c S???n Nem B??i B???c Ninh', 7,2,'73.jpg','80000','8000','2000','Th??m ngon','5 ph??t','2022-07-25','22-07-25'),
																																							 ('Gateau Healthy', 8, 4,'81.jpg','40000','4000','2000','Th??m ngon','10 ph??t','2022-07-25','22-07-25'),
                                                                                                                                                             ('Salad - Healthy', 8,4,'82.jpg','30000','3000','2000','Th??m ngon','10 ph??t','2022-07-25','22-07-25'),
                                                                                                                                                             ('B???t - Healthy Food ', 8,4,'83.jpg','40000','4000','2000','Th??m ngon','10 ph??t','2022-07-25','22-07-25');


                                        
