DROP DATABASE TravelOnTheGo;
CREATE DATABASE TravelOnTheGo;
USE TravelOnTheGo;

CREATE TABLE PASSENGER
(Passenger_name varchar(50),
Category varchar(15),
Gender varchar(1),
Boarding_City varchar(25),
Destination_City varchar(25),
Distance int,
Bus_Type varchar(10)
);


CREATE TABLE PRICE
(
Bus_Type varchar(10),
Distance int,
Price int
);
INSERT INTO PASSENGER (Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type) VALUES ('Sejal', 'AC', 'F', 'Bengaluru', 'Chennai', 350, 'Sleeper');
INSERT INTO PASSENGER (Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type) VALUES ('Anmol', 'Non-AC' ,'M','Mumbai', 'Hyderabad', 700, 'Sitting');
INSERT INTO PASSENGER (Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type) VALUES ('Pallavi', 'AC', 'F', 'Panaji', 'Bengaluru', 600, 'Sleeper');
INSERT INTO PASSENGER (Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type) VALUES ('Khusboo', 'AC', 'F', 'Chennai', 'Mumbai', 1500, 'Sleeper');
INSERT INTO PASSENGER (Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type) VALUES ('Udit', 'Non-AC', 'M', 'Trivandrum', 'panaji', 1000, 'Sleeper');
INSERT INTO PASSENGER (Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type) VALUES ('Ankur', 'AC', 'M' ,'Nagpur', 'Hyderabad', 500 ,'Sitting');
INSERT INTO PASSENGER (Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type) VALUES ('Hemant', 'Non-AC' ,'M', 'panaji', 'Mumbai', 700 ,'Sleeper');
INSERT INTO PASSENGER (Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type) VALUES ('Manish', 'Non-AC', 'M', 'Hyderabad', 'Bengaluru', 500 ,'Sitting');
INSERT INTO PASSENGER (Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type) VALUES ('Piyush', 'AC', 'M', 'Pune', 'Nagpur', 700, 'Sitting');

INSERT INTO PRICE (Bus_Type, Distance, Price) VALUES ('Sleeper', 350, 770);
INSERT INTO PRICE (Bus_Type, Distance, Price) VALUES ('Sleeper', 500, 1100);
INSERT INTO PRICE (Bus_Type, Distance, Price) VALUES ('Sleeper', 600, 1320);
INSERT INTO PRICE (Bus_Type, Distance, Price) VALUES ('Sleeper', 700, 1540);
INSERT INTO PRICE (Bus_Type, Distance, Price) VALUES ('Sleeper', 1000, 2200);
INSERT INTO PRICE (Bus_Type, Distance, Price) VALUES ('Sleeper', 1200, 2640);
INSERT INTO PRICE (Bus_Type, Distance, Price) VALUES ('Sleeper', 350, 434);
INSERT INTO PRICE (Bus_Type, Distance, Price) VALUES ('Sitting', 500, 620);
INSERT INTO PRICE (Bus_Type, Distance, Price) VALUES ('Sitting', 500, 620);
INSERT INTO PRICE (Bus_Type, Distance, Price) VALUES ('Sitting', 600, 744);
INSERT INTO PRICE (Bus_Type, Distance, Price) VALUES ('Sitting', 700, 868);
INSERT INTO PRICE (Bus_Type, Distance, Price) VALUES ('Sitting', 1000, 1240);
INSERT INTO PRICE (Bus_Type, Distance, Price) VALUES ('Sitting', 1200, 1488);
INSERT INTO PRICE (Bus_Type, Distance, Price) VALUES ('Sitting', 1500, 1860);

SELECT  GENDER,COUNT(*)
FROM PASSENGER 
WHERE DISTANCE >=600 
GROUP BY GENDER;
SELECT min(price) FROM PRICE
WHERE bus_type='Sleeper';

SELECT * FROM PASSENGER
WHERE passenger_name like 'S%';

SELECT psng.passenger_name, psng.Boarding_city,psng.Destination_city,psng.category, psng.Bus_type
, max(prc.price)
FROM passenger psng 
INNER JOIN price prc
USING (bus_type, distance)
group by psng.passenger_name, psng.Boarding_city,psng.Destination_city,psng.category, psng.Bus_type ;

SELECT psng.passenger_name, psng.Boarding_city,psng.Destination_city,psng.category, psng.Bus_type
, prc.price
FROM passenger psng 
INNER JOIN price prc
USING (bus_type, distance)
where psng.distance=1000
and psng.Bus_type='Sitting' ;


SELECT psng.passenger_name, psng.Boarding_city,psng.Destination_city,psng.category, prc.Bus_type
, prc.price
FROM passenger psng 
INNER JOIN price prc
USING (distance)
where 
 ( (psng.Boarding_city='Bengaluru' and psng.Destination_city='Panaji')
or (psng.Boarding_city='Panaji' and psng.Destination_city='Bengaluru') ) ;


SELECT distinct(distance)
from passenger  ;



select psng.passenger_name, (psng.distance/(SELECT sum(distance) from passenger))*100 dist_percent
from passenger psng;

select prc.distance ,prc.price ,
case 
when prc.price >1000 then 'expensive' 
when (prc.price >500 and prc.price<1000) then 'average cost'
else 'cheap' end  prc_category 
from price prc;
