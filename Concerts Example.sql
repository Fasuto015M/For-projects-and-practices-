Create table if not exists Concierto("Id"int not null, "Clase" varchar(10),
"Costo"int,"Pingreso"varchar(10));

Create table if not exists Asistentes("Id"int not null, "Profesion" varchar(40),
"Cantidad"int,"Fecha"date,"Boleto" varchar(10),"Pingreso"varchar(10));

insert into Asistentes("Id","Profesion","Cantidad","Fecha","Boleto","Pingreso")
values
(01,'Auxiliar_admin',2,'08/20/25','A1','Gate_01'),
(02,'Informal',2,'07/20/25','B1','Gate_02'),
(03,'Abogado',4,'05/20/25','C1','Gate_00'),
(04,'Ingeniero',2,'08/20/25','A1','Gate_01'),
(05,'Contador',2,'08/20/25','A1','Gate_01'),
(06,'Informal',2,'07/20/25','B1','Gate_02'),
(07,'Informal',1,'08/20/25','A1','Gate_01'),
(08,'Contador',2,'05/20/25','C1','Gate_00'),
(09,'Abogado',1,'08/20/25','A1','Gate_01'),
(00,'Auxiliar_admin',2,'07/20/25','B1','Gate_02'),
(11,'Informal',2,'08/20/25','A1','Gate_01'),
(12,'Abogado',2,'07/20/25','B1','Gate_02'),
(13,'Auxiliar_admin',2,'08/20/25','A1','Gate_01'),
(14,'Ingeniero',1,'05/20/25','C1','Gate_00'),
(15,'Auxiliar_admin',2,'08/20/25','A1','Gate_01'),
(16,'Abogado',3,'07/20/25','B1','Gate_02'),
(17,'Auxiliar_admin',2,'05/20/25','C1','Gate_00'),
(18,'Ingeniero',2,'05/20/25','C1','Gate_00'),
(19,'Auxiliar_admin',2,'08/20/25','A1','Gate_01'),
(20,'Abogado',3,'07/20/25','B1','Gate_02'),
(21,'Auxiliar_admin',2,'05/20/25','C1','Gate_00'),
(22,'Informal',1,'05/20/25','C1','Gate_00'),
(23,'Ingeniero',2,'08/20/25','A1','Gate_01'),
(24,'Abogado',3,'08/20/25','A1','Gate_01'),
(25,'Auxiliar_admin',2,'07/20/25','B1','Gate_02'),
(26,'Ingeniero',2,'08/20/25','A1','Gate_01'),
(27,'Abogado',3,'05/20/25','C1','Gate_00'),
(28,'Auxiliar_admin',2,'08/20/25','B1','Gate_02');

insert into Concierto("Id","Clase","Costo","Pingreso")
values
(01,'A1',200,'Gate_01'),
(02,'B1',200,'Gate_02'),
(03,'C1',200,'Gate_00'),
(04,'B1',200,'Gate_02'),
(05,'B1',200,'Gate_02'),
(06,'A1',200,'Gate_01'),
(07,'C1',200,'Gate_00'),
(08,'A1',200,'Gate_01'),
(09,'A1',200,'Gate_01'),
(10,'C1',200,'Gate_00'),
(11,'A1',200,'Gate_01'),
(12,'C1',200,'Gate_00'),
(13,'B1',200,'Gate_02'),
(14,'A1',200,'Gate_01'),
(15,'C1',200,'Gate_00'),
(16,'A1',200,'Gate_01'),
(17,'A1',200,'Gate_01'),
(18,'C1',200,'Gate_00'),
(19,'B1',200,'Gate_02'),
(20,'A1',200,'Gate_01'),
(21,'C1',200,'Gate_00'),
(22,'B1',200,'Gate_02'),
(23,'B1',200,'Gate_02'),
(24,'A1',200,'Gate_01'),
(25,'C1',200,'Gate_00'),
(26,'A1',200,'Gate_01'),
(27,'B1',200,'Gate_02'),
(28,'A1',200,'Gate_01');

Select * from Asistentes limit 5;

-- Ingreso total 
select 
sum(A."Cantidad"* C."Costo") as Ganancia_total,
sum(A."Cantidad") as Boletos_totales
from Concierto C inner join Asistentes A on C."Clase" = A."Boleto"

-- Ingreso por Profesion 
select 
sum(A."Cantidad"* C."Costo") as Ganancia_total,
sum(A."Cantidad") as Boletos_totales, A."Profesion"
from Concierto C inner join Asistentes A on C."Clase" = A."Boleto"
group by A."Profesion" order by A."Profesion" asc;

-- Acceso al concierto
select 
sum(A."Cantidad"* C."Costo") as Ganancia_total,
sum(A."Cantidad") as Boletos_totales, C."Pingreso" as puerta_ingreso
from Concierto C inner join Asistentes A on C."Clase" = A."Boleto"
group by C."Pingreso" order by Ganancia_total desc;

-- Por fecha de compra 
select 
sum(A."Cantidad") as Total, A."Fecha", sum(A."Cantidad"* C."Costo") as Ganancias
from Asistentes A inner join Concierto C on C."Clase" = A."Boleto" 
Group by A."Fecha" order by "Fecha" Asc;

-- con fecha exacta 5/20/2025
select 
sum(A."Cantidad") as Total_boletos, A."Profesion", sum(A."Cantidad"* C."Costo") as Ganancias, A."Boleto"||' '|| C."Pingreso" as NºEntrada
from Asistentes A inner join Concierto C on C."Clase" = A."Boleto"
where A."Fecha" ='05/20/2025'
Group by A."Fecha", A."Profesion",A."Boleto", C."Pingreso" order by "Fecha" Asc;
