drop database if exists cliente;
create database cliente;
create table cliente.clientes (
	idClientes int primary key,
    nome varchar(45),
    cidade varchar(45)
);

create table cliente.order_(
	idOrder int primary key,
    idClientes int,
    clientDate date,
    foreign key (idClientes) references cliente.clientes(idClientes)
);

insert into cliente.clientes values
	(1, "Carlos", "SJP"),
	(2,	"Jessica", "SP"),
	(3,	"Carol", "RJ"),
	(4,	"Gabriel", "POA"),
	(5,	"Fernando", "CWB");
   
   
insert into cliente.order_ values
    (1,	2,	"2021-05-21"),
    (2,	3,	"2021-05-20"),
    (3,	1,	"2021-05-31"),
    (4,	5,	"2021-04-21"),
    (5,	4,	"2021-03-11"),
    (6,	1,	"2021-03-11");
    
    
select * from cliente.clientes;
select * from cliente.order_;

select cliente.clientes.nome, cliente.clientes.cidade, cliente.order_.idOrder, cliente.order_.clientDate
from cliente.clientes 
left join cliente.order_ 
on cliente.clientes.idClientes = cliente.order_.idClientes

