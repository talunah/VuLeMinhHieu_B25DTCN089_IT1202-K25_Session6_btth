
create database btth;
use btth;
drop database btth;

create table users(
	user_id int primary key auto_increment,
    user_name varchar(67) not null
);
create table hotels(
	hotel_id int primary key,
    hotel_name varchar(67) not null,
    rating int check (rating between 0 and 5) default(5)
);
create table bookings(
	booking_id int primary key,
    user_id int,
	hotel_id int,
    price decimal(10,2) not null,
    status varchar(67) not null,
    foreign key(user_id) references users(user_id),
    foreign key(hotel_id) references hotels(hotel_id)
);




INSERT INTO Users(user_name) VALUES 
('Nguyễn Văn A'),
('Trần Thị B'),
('Lê Văn C'), 
('Phạm Minh D'),
('Hoàng Gia E'),
('Vũ Hải F'), 
('Đặng Thu G'), 
('Bùi Quang H'),
('Đỗ Thùy I'),
('Ngô Bảo K'),
('Lý Triều L'),
('Phan Nam M'),
('Trịnh Văn N'),
('Hồ Xuân O'), 
('Trương Mỹ P'),
('Đinh Quang Q'),
('Lương Gia R'), 
('Võ Văn S'), 
('Diệp Lan T'), 
('Cao Minh U');


INSERT INTO Hotels(hotel_id,hotel_name,rating) VALUES 
(101,'Sheraton',5), 
(102,'InterContinental',5), 
(103,'Pullman',5), 
(104,'Park Hyatt',5), 
(105,'Marriott',5),
(106,'Novotel',4), 
(107,'Liberty Central',4), 
(108,'Muong Thanh',4), 
(109,'Vissai',4), 
(110,'Edenstar',4),
(111,'Ibis',3), 
(112,'A25 Hotel',3), 
(113,'Little Hanoi',3), 
(114,'Floral Hotel',3), 
(115,'Lavender',3),
(116,'RedDoorz Lux',4), 
(117,'Vinpearl Resort',5), 
(118,'FLC Luxury',5), 
(119,'Boutique Hotel',3), 
(120,'Rex Hotel',5);

INSERT INTO Bookings(booking_id,user_id,hotel_id,price,status) VALUES 
(1,1,101,30000000,'COMPLETED'), 
(2,1,102,25000000,'COMPLETED'), 
(3,1,106,60000000,'COMPLETED'),                           
(4,2,103,55000000,'PENDING'),                             
(5,3,101,10000000,'COMPLETED'), 
(6,3,101,-2000000,'COMPLETED'), 
(7,4,117,70000000,'PENDING'),                           
(8,5,108,12000000,'COMPLETED'), 
(9,5,109,40000000,'COMPLETED'), 
(10,6,120,45000000,'COMPLETED'), 
(11,6,101,10000000,'COMPLETED'),
(12,7,111,5000000,'PENDING'),                                
(13,8,104,80000000,'COMPLETED'),                            
(14,9,105,15000000,'COMPLETED'), 
(15,9,117,40000000,'COMPLETED'),
(16,10,110,51000000,'COMPLETED'),                            
(17,11,102,20000000,'COMPLETED'),
(18,12,103,10000000,'COMPLETED'),
(19,1,101,5000000,'PENDING'),                               
(20,13,120,90000000,'COMPLETED');

select c.user_name, h.rating, sum(price) as total from bookings as b 
join hotels as h on b.hotel_id = h.hotel_id 
join users as c on b.user_id = c.user_id
where b.status = 'COMPLETED' 
group by booking_id
having total > 50000000 
order by rating desc;
