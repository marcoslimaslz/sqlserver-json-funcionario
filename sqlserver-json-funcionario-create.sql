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
END
ELSE
BEGIN
    PRINT 'A tabela existe.';
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
END
ELSE
BEGIN
    PRINT 'A tabela existe.';
END
