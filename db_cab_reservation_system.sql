CREATE DATABASE IF NOT EXISTS db_cab_reservation_system;
USE db_cab_reservation_system;

DROP TABLE IF EXISTS tbl_booking_detail;
CREATE TABLE IF NOT EXISTS tbl_booking_detail (
  ID int(11) NOT NULL AUTO_INCREMENT,
  UserID int(11) DEFAULT NULL,
  SOURCE int(11) DEFAULT NULL,
  DESTINATION int(11) DEFAULT NULL,
  Status varchar(100) DEFAULT NULL,
  TOT_AMT decimal(10,2) DEFAULT 0.00,
  Payment_Status varchar(100) DEFAULT NULL,
  Book_Date date DEFAULT NULL,
  PRIMARY KEY (ID)
);

INSERT INTO tbl_booking_detail (ID, UserID, SOURCE, DESTINATION, Status, TOT_AMT, Payment_Status, Book_Date) VALUES
(1, 7, 1, 2, 'Accept', '50000.00', 'PAID', '2023-04-20'),
(2, 7, 3, 2, 'Cancel', '37500.00', NULL, '2023-04-20'),
(3, 7, 1, 2, 'Reject', '50000.00', NULL, '2023-04-20'),
(4, 2, 7, 10, 'Accept', '67875.00', 'PAID', '2023-04-26');


DROP TABLE IF EXISTS tbl_cab_det;
CREATE TABLE IF NOT EXISTS tbl_cab_det (
  ID int(11) NOT NULL AUTO_INCREMENT,
  ImagePath varchar(200) DEFAULT NULL,
  VehicleName varchar(100) DEFAULT NULL,
  Description varchar(300) DEFAULT NULL,
  RATE_PER_KM decimal(10,2) DEFAULT 0.00,
  PRIMARY KEY (ID)
);


INSERT INTO tbl_cab_det (ID, ImagePath, VehicleName, Description, RATE_PER_KM) VALUES
(1, '/Images/Vehicle/ic_auto.png', 'Auto', 'Get an auto at your doorstep', '50.00'),
(2, '/Images/Vehicle/ic_mini.png', 'Mini', 'Comfy hatchbacks at pocket-friendly fares', '75.00'),
(3, '/Images/Vehicle/ic_prime.png', 'Prime Sedan', 'Sedans with free wifi and top drivers', '100.00'),
(4, '/Images/Vehicle/ic_suv.png', 'Prime SUV', 'SUVs with free wifi and top drivers', '125.00');

DROP TABLE IF EXISTS tbl_city;
CREATE TABLE IF NOT EXISTS tbl_city (
  ID int(11) NOT NULL AUTO_INCREMENT,
  CITY varchar(100) DEFAULT NULL,
  PRIMARY KEY (ID)
);

INSERT INTO tbl_city (ID, CITY) VALUES
(1, 'New York'),
(2, 'Los Angeles'),
(3, 'Chicago'),
(4, 'Houston'),
(5, 'Philadelphia'),
(6, 'Phoenix'),
(7, 'San Antonio'),
(8, 'San Diego'),
(9, 'Dallas'),
(10, 'San Jose');

DROP TABLE IF EXISTS tbl_distance;
CREATE TABLE IF NOT EXISTS tbl_distance (
  ID int(11) NOT NULL AUTO_INCREMENT,
  SOURCE int(11) DEFAULT NULL,
  DESTINATION int(11) DEFAULT NULL,
  DISTANCE decimal(10,2) DEFAULT 0.00,
  PRIMARY KEY (ID)
);

INSERT INTO tbl_distance (ID, SOURCE, DESTINATION, DISTANCE) VALUES
(8, 1, 2, '2791.50'),
(9, 1, 3, '790.40'),
(10, 1, 4, '2278.80'),
(11, 1, 5, '162.00'),
(12, 1, 6, '3854.90'),
(13, 1, 7, '2541.90'),
(14, 1, 8, '3927.60'),
(15, 1, 9, '1379.60'),
(16, 1, 10, '4137.40'),
(17, 2, 1, '2791.50'),
(18, 2, 3, '2014.30'),
(19, 2, 4, '339.10'),
(20, 2, 5, '2729.50'),
(21, 2, 6, '3206.40'),
(22, 2, 7, '1506.30'),
(23, 2, 8, '2087.20'),
(24, 2, 9, '1372.10'),
(25, 2, 10, '543.70'),
(26, 3, 1, '790.40'),
(27, 3, 2, '2014.30'),
(28, 3, 4, '1763.70'),
(29, 3, 5, '864.90'),
(30, 3, 6, '1856.90'),
(31, 3, 7, '1016.10'),
(32, 3, 8, '1422.80'),
(33, 3, 9, '1675.60'),
(34, 3, 10, '2046.30'),
(35, 4, 1, '2278.80'),
(36, 4, 2, '339.10'),
(37, 4, 3, '1763.70'),
(38, 4, 5, '2417.90'),
(39, 4, 6, '1198.60'),
(40, 4, 7, '1867.20'),
(41, 4, 8, '1132.80'),
(42, 4, 9, '387.60'),
(43, 4, 10, '1638.80'),
(44, 5, 1, '162.00'),
(45, 5, 2, '2729.50'),
(46, 5, 3, '864.90'),
(47, 5, 4, '2417.90'),
(48, 5, 6, '4011.60'),
(49, 5, 7, '2676.40'),
(50, 5, 8, '4062.10'),
(51, 5, 9, '1504.10'),
(52, 5, 10, '4356.00'),
(53, 6, 1, '3854.90'),
(54, 6, 2, '3206.40'),
(55, 6, 3, '1856.90'),
(56, 6, 4, '1198.60'),
(57, 6, 5, '4011.60'),
(58, 6, 7, '1328.90'),
(59, 6, 8, '782.10'),
(60, 6, 9, '3581.20'),
(61, 6, 10, '92.50'),
(62, 7, 1, '2541.90'),
(63, 7, 2, '1506.30'),
(64, 7, 3, '1016.10'),
(65, 7, 4, '1867.20'),
(66, 7, 5, '2676.40'),
(67, 7, 6, '1328.90'),
(68, 7, 8, '1397.50'),
(69, 7, 9, '2322.90'),
(70, 7, 10, '1357.50'),
(71, 8, 1, '3927.60'),
(72, 8, 2, '2087.20'),
(73, 8, 3, '1422.80'),
(74, 8, 4, '1132.80'),
(75, 8, 5, '4062.10'),
(76, 8, 6, '782.10'),
(77, 8, 7, '1397.50'),
(78, 8, 9, '3290.10'),
(79, 8, 10, '782.10'),
(80, 9, 1, '1379.60'),
(81, 9, 2, '1372.10'),
(82, 9, 3, '1675.60'),
(83, 9, 4, '387.60'),
(84, 9, 5, '1504.10'),
(85, 9, 6, '3581.20'),
(86, 9, 7, '2322.90'),
(87, 9, 8, '3290.10'),
(88, 9, 10, '3674.70'),
(89, 10, 1, '4137.40'),
(90, 10, 2, '543.70'),
(91, 10, 3, '2046.30'),
(92, 10, 4, '1638.80'),
(93, 10, 5, '4356.00'),
(94, 10, 6, '92.50'),
(95, 10, 7, '1357.50'),
(96, 10, 8, '782.10'),
(97, 10, 9, '3674.70');


DROP TABLE IF EXISTS tbl_user_registration;
CREATE TABLE IF NOT EXISTS tbl_user_registration (
  Id int(11) NOT NULL AUTO_INCREMENT,
  UName varchar(100) DEFAULT NULL,
  FirstName varchar(100) DEFAULT NULL,
  LastName varchar(100) DEFAULT NULL,
  Email varchar(200) DEFAULT NULL,
  PhoneNO varchar(100) DEFAULT NULL,
  Password varchar(100) DEFAULT NULL,
  UserRoles varchar(100) DEFAULT NULL,
  VehicleType varchar(150) DEFAULT NULL,
  VehicleNo varchar(150) DEFAULT NULL,
  PRIMARY KEY (Id)
);


INSERT INTO tbl_user_registration (Id, UName, FirstName, LastName, Email, PhoneNO, Password, UserRoles, VehicleType, VehicleNo) VALUES
(1, 'prathima', 'Prathima', 'Chigullapally', 'prathima@gmail.com', '8978787875', 'prathima@123', 'Cab Driver', NULL, NULL),
(2, 'yaser', 'MD', 'Yaser', 'yaser@gmail.com', '876875656', 'yaser@123', 'Passenger', NULL, NULL);
COMMIT;