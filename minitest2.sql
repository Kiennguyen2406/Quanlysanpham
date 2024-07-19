CREATE DATABASE Tour;

USE Tour;

CREATE TABLE destination (
                             destination_id INT PRIMARY KEY AUTO_INCREMENT,
                             destinationName VARCHAR(255),
                             describes VARCHAR(255),
                             cost INT,
                             city_id INT,
                             FOREIGN KEY (city_id)
                                 REFERENCES city (city_id)
                                 ON DELETE CASCADE
);
TRUNCATE TABLE destination;
set foreign_key_checks = 1;
CREATE TABLE categorytour (
                              categorytour_id INT PRIMARY KEY AUTO_INCREMENT,
                              categoryCode VARCHAR(255),
                              categoryName VARCHAR(255)

);
TRUNCATE TABLE categorytour;
CREATE TABLE tour (
                      tour_id INT PRIMARY KEY AUTO_INCREMENT,
                      tourCode VARCHAR(255),
                      category_id INT,
                      dateStart DATE,
                      dateEnd DATE,
                      destination_id INT,
                      FOREIGN KEY (category_id)
                          REFERENCES categorytour (categorytour_id)
                          ON DELETE CASCADE,
                      FOREIGN KEY (destination_id)
                          REFERENCES destination (destination_id)
                          ON DELETE CASCADE
);
TRUNCATE TABLE tour;
CREATE TABLE city (
                      city_id INT PRIMARY KEY AUTO_INCREMENT,
                      cityName VARCHAR(255)
);
TRUNCATE TABLE city;
CREATE TABLE ordertour (
                           ordertour_id INT PRIMARY KEY AUTO_INCREMENT,
                           tour_id INT,
                           clients_id INT,
                           statuss VARCHAR(255),
                           FOREIGN KEY (tour_id)
                               REFERENCES tour (tour_id)
                               ON DELETE CASCADE,
                           FOREIGN KEY (clients_id)
                               REFERENCES clients (clients_id)
                               ON DELETE CASCADE
);
TRUNCATE TABLE ordertour;
CREATE TABLE clients (
                         clients_id INT PRIMARY KEY AUTO_INCREMENT,
                         nameClients VARCHAR(255),
                         idNumber VARCHAR(255),
                         dateBirth DATE,
                         city_id INT,
                         FOREIGN KEY (city_id)
                             REFERENCES city (city_id)
                             ON DELETE CASCADE
);
TRUNCATE TABLE clients;
INSERT INTO clients (nameClients, idNumber, dateBirth, city_id) VALUES
                                                                    ('Nguyễn Văn A', '123456789', '1990-05-10', 1),
                                                                    ('Trần Thị B', '987654321', '1985-02-15', 2),
                                                                    ('Phạm Văn C', '456123789', '2000-11-20', 3),
                                                                    ('Lê Thị D', '789456123', '1998-09-05', 4),
                                                                    ('Hoàng Văn E', '321654987', '1980-12-25', 5),
                                                                    ('Đặng Thị F', '654789321', '1995-03-30', 1),
                                                                    ('Vũ Văn G', '147258369', '1992-07-12', 2),
                                                                    ('Ngô Thị H', '369852147', '1987-06-18', 3),
                                                                    ('Trương Văn I', '852963741', '1993-04-22', 4),
                                                                    ('Lý Thị K', '258741369', '1997-08-08', 5);


INSERT INTO city (cityName) VALUES
                                ('Hà Nội'),
                                ('Hồ Chí Minh'),
                                ('Đà Nẵng'),
                                ('Hải Phòng'),
                                ('Cần Thơ');

INSERT INTO destination (destinationName, describes, cost, city_id) VALUES
                                                                        ('Phú Quốc', 'Đảo ngọc nổi tiếng với bãi biển Bãi Dài và khu nghỉ dưỡng sang trọng.', 1500000, 5),
                                                                        ('Hội An', 'Phố cổ Hội An - Di sản văn hóa thế giới với kiến trúc cổ kính và món ăn đặc trưng.', 800000, 3),
                                                                        ('Đà Lạt', 'Thành phố ngàn hoa nổi tiếng với khí hậu mát mẻ quanh năm và cảnh quan thiên nhiên đặc biệt.', 1000000, 4),
                                                                        ('Vũng Tàu', 'Thành phố biển gần TP.HCM với bãi biển đẹp và các khu vui chơi giải trí.', 600000, 2),
                                                                        ('Sa Pa', 'Thị trấn núi cao nổi tiếng với cảnh sắc thiên nhiên hùng vĩ và văn hóa độc đáo của các dân tộc.', 1200000, 1);


INSERT INTO categorytour (categoryCode, categoryName) VALUES
                                                          ('AD', 'Adventure Tour'),
                                                          ('CT', 'City Tour');

INSERT INTO ordertour (tour_id, clients_id, statuss) VALUES
                                                         (13, 11, 'Confirmed'),
                                                         (14, 12, 'Pending'),
                                                         (13, 13, 'Confirmed'),
                                                         (14, 14, 'Cancelled'),
                                                         (13, 15, 'Confirmed'),
                                                         (14, 16, 'Confirmed'),
                                                         (13, 17, 'Pending'),
                                                         (14, 18, 'Confirmed'),
                                                         (13, 19, 'Confirmed'),
                                                         (14, 20, 'Pending');

INSERT INTO tour (tourCode, category_id, dateStart, dateEnd, destination_id) VALUES
                                                                                 ('TOUR001', 1, '2024-08-01', '2024-08-07', 16),
                                                                                 ('TOUR002', 2, '2024-08-10', '2024-08-15', 16);



SELECT COUNT(tour.tour_id) as number_tour,city.cityName as city
FROM
    tour
        INNER JOIN Destination ON Destination.Destination_id = tour.Destination_id
        INNER JOIN City ON City.city_id = Destination.city_id
GROUP BY city;

-- Tính số tour có ngày bắt đầu trong tháng 3 năm 2020 ( dùng count)
SELECT * FROM tour WHERE datestart BETWEEN '2024-07-01' AND '2024-09-30';
