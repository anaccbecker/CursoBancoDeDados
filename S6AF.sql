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
# Permissões
drop user if exists gerente@"localhost";
create user gerente@"localhost" identified by "G3r3Nt3";
grant select, update, insert, delete on Empresa.* to gerente@localhost;

drop user if exists logistica@"localhost";
create user logistica@"localhost" identified by "L0g1sT1c2";
grant select(nome, numeroMesa, cargaHoraria) on Empresa.Colaborador to logistica@localhost;