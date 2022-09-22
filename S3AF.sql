# Deletando base de dados caso exista alguma com esse nome
drop database if exists Empresa;
# Criando base de dados
create database Empresa;



create table Empresa.Departamento(
	idDepartamento int primary key,
    nome varchar(45)
);


 create table Empresa.Colaborador(
	idColaborador int primary key auto_increment,
    nome varchar(150),
    enderecoLogradouro varchar(150),
    enderedcoBairro varchar(45),
    enderecoCidade varchar(45),
	cargaHoraria int,
    numeroMesa int,
    idDepartamento int,
    foreign key (idDepartamento) references Empresa.Departamento(idDepartamento)
);   