# Criação da base de dados
drop database if exists LojaVinho;
create database LojaVinho;

# Criação das tabelas
use LojaVinho;
create table Regiao(
	codRegiao bigint not null primary key,
    nomeRegiao varchar(100) not null,
    descricaoRegiao text
);

create table Vinicula(
	codVinicula bigint not null primary key,
    nomeVinicula varchar(100) not null,
    descricaoVinicula text,
    telefoneVinicula varchar(15),
    emailVinicula varchar(30),
    codRegiao bigint not null ,
    foreign key (codRegiao) references Regiao(codRegiao)
);
    
create table Vinho (
	codVinho bigint not null primary key,
    nomeVinho varchar(50) not null,
    tipoVinho varchar(30) not null,
    anoVinho int not null,
    descricaoVinho text,
    codVinicula bigint not null ,
    foreign key (codVinicula) references Vinicula(codVinicula)
);

# Inserção de dados nas tabelas
insert into Regiao values
	(51,"Santa Catarina", "Serra Catarinense"),
	(52,"Bahia","Vale do São Francisco"),
	(53,"Rio Grande do Sul", "Serra Gaúcha"),
    (54,"Estados Unidos", "Montanhas Californianas"),
    (55,"Acre","Floresta Amazônica");

insert into Vinicula values
	(99,"Vinícola Abreu Garcia Vinhos de Altitude","Localizada na Serra Catarinense, em Campo Belo do Sul, a Vinícola Abreu Garcia produz seus vinhos de altitude nas regiões mais altas do estado. Embora a empresa tenha sido fundada em 2006, já apresenta uma tradição consolidada, com mais de onze premiações nacionais e internacionais.","33333333","contato@vinicula99.com",51),
	(98,"Vinícola Terranova","A Vinícola Terranova faz parte da Miolo Wine Group e está localizada no Vale do São Francisco, na Bahia. O estado é, no momento, o único lugar no mundo capaz de realizar mais de uma safra por ano, podendo chegar a três. O clima quente da região permite a criação de vinhos encorporados e com alta estrutura aromática.","44444444","contato@vinicula98.com",52),
	(97,"Vinícola Luiz Argenta","Localizada em Flores da Cunha, no Rio Grande do Sul, esta vinícola conta com uma arquitetura moderna e diferenciada, além de suas paisagens de tirar o fôlego. O empreendimento foi fundado em 2009 por Deunir e Neco Argenta, filhos de Luiz Argenta, a quem dedicaram o nome da empresa.","55555555","contato@vinicula97.com",53),
	(96,"Vinícola Miolo","A Vinícola Miolo é um complexo enoturístico localizado no Vale dos Vinhedos, em Bento Gonçalves, no Rio Grande do Sul. O passeio pela propriedade inclui visita aos tanques, barricas e caves de espumantes utilizados na elaboração dos vinhos. ","66666666","contato@vinicula96.com",53),
	(95,"Casa Valduga","Outra opção vinícola no sul do Brasil é a Casa Valduga, que foi o primeiro complexo enoturístico nacional, iniciando suas atividades em 1992. Localizada no Vale dos Vinhedos, no Rio Grande do Sul, oferece um roteiro que inclui visita aos vinhedos e caves subterrâneas, além de experiências gastronômicas no restaurante Maria Valduga.","77777777","contato@vinicula95.com",53),
	(94,"Família Salton","Localizada em Bento Gonçalves, a cidade do vinho no Rio Grande do Sul, a Vinícola Salton conta com diferentes modalidades de visitação e é um prato cheio para quem gosta de história e tradição. Com mais de 100 anos de existência, a empresa produz alguns dos vinhos e espumantes mais vendidos no Brasil.","88888888","contato@vinicula94.com",53),
	(93,"Vinícola Lidio Carraro","A vinícola Lidio Carraro teve início com a implantação dos vinhedos em duas regiões do Rio Grande do Sul, em 1998: Vale dos Vinhedos (Bento Gonçalves) e Serra do Sudeste (Encruzilhada do Sul). Tal implementação ocorreu mediante um estudo climático minucioso, com estudo de clones e mapeamento de solos. Na época, foi um processo pioneiro no país.","99999999","contato@vinicula93.com",53);

insert into Vinho values
	(1,"Carménère","Seco","2019","Originária de Bordeaux, na França, a uva Carménère é uma das mais conhecidas na produção de vinhos tintos.  É amplamente cultivada no Chile e origina vinhos encorpados, com aromas vegetais e de frutas pretas, característicos da casta.",99),
    (2,"Syrah","Suave","2018","A uva Syrah apresenta cor intensa nos vinhos e é proveniente do Vale do Rhône, na França. O nome do vale é uma referência ao Rio Rhône, que banha a região e tem papel importantíssimo na produção de vinhos franceses brancos, rosés e tintos. Dividido em duas sub-regiões, Norte e Sul, o Vale do Rhône é repleto de vinícolas ao longo de sua extensão.",98),
    (3,"Tempranillo","Seco","2017","A uva Tempranillo leva este nome por conta de seu amadurecimento antecipado – em espanhol, temprano. Espanha é, inclusive, o país referência da casta, com grande comercialização de vinhos da categoria que, embora com sabor frutado, tem aroma de ervas. Além disso, é adaptável aos mais diferentes climas, evidenciando seu forte sabor nos vinhos.",97),
    (4,"Malbec","Suave","2016","Com sabor macio e aromático, a cepa Malbec é de origem francesa, mas bastante cultivada em solo argentino. A cor vermelha púrpura está presente na coloração dos vinhos feitos com a uva. Exemplares da categoria possuem alto potencial de guarda e harmonizam bem com a culinária regional da Argentina.",96),
    (5,"Merlot","Seco","2015","Uma das uvas mais utilizadas para a produção de vinho no mundo, a Merlot é menos ácida, tem aroma perfumado e, em locais mais quentes, com quantidade de sol mais intensa, se desenvolve melhor.",95),
    (6,"Chardonnay","Suave","2014","Presente na produção de vinhos brancos, o tipo de uva Chardonnay também faz bastante sucesso nas prateleiras de vinhos pelo mundo. Pode ter aromas de frutas cítricas e especiarias.",94),
    (7,"Sauvignon Blanc","Seco","2013","De origem francesa, a presença da casta Sauvignon Blanc nos vinhos brancos apresenta muito frescor, que pode variar em aromas tropicais (abacaxi e maracujá) nas regiões mais quentes, e aromas cítricos (limão siciliano e laranja) em localidades mais frias.",93);

# Consulta    
select Vinho.nomeVinho, Vinho.anoVinho, Vinicula.nomeVinicula, Regiao.nomeRegiao
from Vinho
left join Vinicula
on Vinicula.codVinicula = Vinho.codVinicula
left join Regiao
on Vinicula.codRegiao = Regiao.codRegiao;

# Permissões
drop user if exists Somellier@"localhost";
create user Somellier@"localhost" with max_connections_per_hour 40;
grant select on LojaVinho.Vinho to Somellier@localhost;
grant select(codVinicula,nomeVinicula) on LojaVinho.Vinicula to Somellier@localhost;