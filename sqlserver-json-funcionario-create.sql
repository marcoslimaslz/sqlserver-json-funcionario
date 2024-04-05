IF OBJECT_ID('dbo.Colaborador', 'U') IS NULL
BEGIN
	create table Colaborador (
		Id smallint identity(1,1), 
		Nome varchar(100) not null, 
		DataAdimissao date not null, 
		Celular varchar(11) not null,
		Email varchar(100) null,
		Salário numeric(15,2) not null,
		UltimoAcesso nvarchar(max)
	);
	alter table Colaborador add constraint PK_Colaborador primary key (Id);

	insert into Colaborador (Nome,DataAdimissao,Celular,Email,Salário,UltimoAcesso) values 
	('José Ferreira da Silva', '20190315','27995826142','jose.silva@email.com.br',3500.00,
		'{"dataHora": "2021-09-09T18:56:34.686Z","tema": "dark","token": "eyhdl8gd0w23.bdfdvw!0dfg"}'),
	('Flávia Oliveira', '20190823','27984516320','floliveiraa@email.com',5150.43,
		'{"dataHora": "2021-10-01T13:27:15.569Z","token": "eyhdl8bdfdvw.!0df$gd0w23"}')
END
ELSE
BEGIN
    PRINT 'A tabela Colaborador existe.';
END

IF OBJECT_ID('dbo.Dependente', 'U') IS NULL
BEGIN
	create table Dependente (
		Id int identity(1,1) not null,
		ColaboradorId smallint not null, 
		Nome varchar(100) not null
	);
	alter table Dependente add constraint PK_Dependente primary key (Id);
	alter table Dependente add constraint FK_Dependente_Colaborador foreign key (ColaboradorId) references Colaborador(Id);

	insert into Dependente values 
	(1,'Ricardo Garcia da Silva'),
	(1,'Júlia Garcia da Silva')
END
ELSE
BEGIN
    PRINT 'A tabela Dependente existe.';
END

