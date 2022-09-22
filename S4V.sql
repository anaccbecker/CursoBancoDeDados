# Deletando base de dados caso exista alguma com esse nome
drop database if exists Imobiliaria;
# Criando base de dados
create database Imobiliaria;
# Opcional para não precisar colocar Imobiliaria no create table
#use Imobiliaria;
# Criando a tabela
create table Imobiliaria.Condominio(
	idCondominio int primary key,
	sigla varchar(45) not null,
	nome varchar(45),
	sindico varchar(45),
	telefone varchar(45),
	enderecoLogradouro varchar(45),
	enderecoBairro varchar(45),
	enderecoNumero varchar (45)
);

create table Imobiliaria.Cliente(
	idCliente int primary key,
	nome varchar(45),
	cpf varchar(11) not null
);

create table Imobiliaria.Contrato(
	idContrato int,
    dataInicio date,
    dataTermino date,
    valor decimal (8,2),
    numero int not null,
    diaVencimento int,
    idCliente int,
    primary key (idContrato),
    foreign key (idCliente) references Imobiliaria.Cliente(idCliente)
);
    
create table Imobiliaria.Boleto(
	idBoleto int,
    dataPgto date not null,
    mesRef date,
    valoPago decimal(8,2),
    nrCodigoBarras int,
    idContrato int,
    primary key (idBoleto),
    foreign key (idContrato) references Imobiliaria.Contrato(idContrato)
);

create table Imobiliaria.Loja(
	idLoja int,
    numero int not null,
    metragem decimal(8,2),
    descricao varchar(45),
    idCondominio int,
    idContrato int,
    primary key(idLoja, idCondominio),
    foreign key(idContrato) references Imobiliaria.Contrato(idContrato),
    foreign key(idCondominio) references Imobiliaria.Condominio(idCondominio)
);

# Semana 4 - Inserindo dados

# Inserindo uma linha completa
insert into Imobiliaria.Condominio values(
	1,"CL","Legal","Ana","4199999999","Rua da Paz", "Centro", "35"
);

# Inserindo mais de uma linha e colunas específicas
insert into Imobiliaria.Condominio(idCondominio, sigla, nome) values
	(2,"AB","UHU"),
    (3,"GE","TERMO");

# Mostra tabela
select * from imobiliaria.condominio;

insert into Imobiliaria.Cliente(idCliente, cpf, nome) values
	(1,78654798731,"Gustavo");
    
select * from imobiliaria.Cliente;

insert into Imobiliaria.Contrato(idContrato, valor, numero, idCliente) values
	(1,500,1,1);

select * from imobiliaria.contrato;

# Modificando registros
update imobiliaria.condominio set sindico = "Gustavo Estevam" where idCondominio =3;
select * from imobiliaria.condominio;

# Deletando registros
delete from  imobiliaria.condominio where idCondominio =2;
select * from imobiliaria.condominio;

# Buscas no banco de dados
select * from imobiliaria.condominio;
select * from imobiliaria.condominio where idCondominio =3;
select sindico from imobiliaria.condominio where idCondominio =3;