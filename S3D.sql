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

# por que definir as foreign keys como primary keys?
# quando as foreign keys são definidas como primary keys a linha fica sólida
# tem a ver com a cardinalidade

