drop database formula_1;
create database formula_1;

use formula_1;

create table tb_formula1 
(
	ano_temporada 	int not null,
    dt_inicio 		date not null,
    dt_final 		date not null,
	primary key ( ano_temporada )
);


create table  tb_paises 
(
   code_pais  	varchar(3) not null,
   nome       	varchar(100) not null,
   primary key ( code_pais )
);


create table  tb_estado
(
   id_estado	int not null,
   nome       	varchar(100) not null,
   code_pais  	varchar(3) not null,
   primary key ( id_estado ),
   foreign key ( code_pais ) references tb_paises (code_pais)
);


create table  tb_cidade 
(
   id_cidade	int not null,
   nome       	varchar(100) not null,
   id_estado	int not null,
   primary key ( id_cidade ),
   foreign key ( id_estado ) references tb_estado (id_estado)
);


create table tb_circuito
(
	id_circuito 	int not null,
	nome			varchar (100) not null,
    estilo			varchar (50) not null,
    direção			varchar (40) not null,
    id_cidade 		int not null,
    primary key ( id_circuito ),
    foreign key ( id_cidade ) references tb_cidade (id_cidade)
);


create table tb_equipe
(
	code_equipe 	varchar (3) not null,
	nome 			varchar (60) not null,
    	motor 			varchar (50) not null,
    	sede 			varchar (45) not null,
    primary key ( code_equipe )
);




create table tb_treino
(
	id_treino		int not null,
    sessao		 	varchar(30) not null,
    dia_treino 		varchar (20) not null,
	dt_treino		date not null,
    hr_treino		time not null,
    id_circuito		int not null,
    primary key ( id_treino ),
    foreign key ( id_circuito ) references tb_circuito (id_circuito)
);




create table tb_piloto
(
	code_piloto 	varchar (20) not null,
	nome 			varchar (80) not null,
    nacionalidade 	varchar (30) not null,
    idade 			int not null,
    dt_nascimento 	date not null,
    code_equipe 	varchar (3) not null,
    primary key ( code_piloto ),
	foreign key ( code_equipe ) references tb_equipe (code_equipe)
);



create table tb_grande_premio
(
	gp_nome 			varchar (50) not null,
    dia_gp 				varchar (20) not null,
    data_gp 			date not null,
    horario_gp			time not null,
    qtd_voltas 			int not null,
    id_circuito 		int not null,
    ano_temporada	 	int not null,
    primary key ( gp_nome ),
	foreign key ( id_circuito ) references tb_circuito (id_circuito),
	foreign key ( ano_temporada ) references tb_formula1 (ano_temporada)
);



create table rl_classificacao_gp
(
	gp_nome			varchar (50) not null,
    code_piloto 	varchar (20) not null,
    posicao 		int not null,
    tempo 			varchar (30) not null,
    pontuacao 		int not null,
    primary key ( gp_nome, code_piloto ),
    foreign key ( gp_nome ) references tb_grande_premio (gp_nome),
    foreign key ( code_piloto ) references tb_piloto (code_piloto)
);


create table rl_classificacao_equipe
(
    ano_temporada 	int not null,
    code_equipe		varchar (3) not null,
    posicao 		int not null,
    pontos	 		int not null,
    vitorias 		int not null,
    podios 			int not null,
    primary key ( code_equipe, ano_temporada ),
    foreign key ( code_equipe ) references tb_equipe (code_equipe),
    foreign key ( ano_temporada ) references tb_formula1 (ano_temporada)
);



create table rl_classificacao_piloto
(
    ano_temporada 	int not null,
    code_piloto 	varchar (20) not null,
    posicao 		int not null,
    pontos	 		int not null,
    vitorias 		int not null,
    podios 			int not null,
    primary key ( code_piloto, ano_temporada ),
    foreign key ( code_piloto ) references tb_piloto (code_piloto),
    foreign key ( ano_temporada ) references tb_formula1 (ano_temporada)
);


create table rl_grid_gp
(
    id_treino 		int not null,
    code_piloto 	varchar (20) not null,
    tempo 			time not null,
    primary key ( code_piloto, id_treino ),
    foreign key ( code_piloto ) references tb_piloto (code_piloto),
    foreign key ( id_treino ) references tb_treino (id_treino)
);


/*INSERINDO DADOS NAS TABELAS*/
use formula_1;

select * from tb_formula1;
insert into tb_formula1 values
(2023, '2023-03-05', '2023-11-26');


select * from tb_paises;
insert into tb_paises (code_pais, nome) values
	('BAH', 'Bahrein'),
	('SAU', 'Arábia Saudita'),
	('AUS', 'Austrália'),
	('AZE', 'Azerbaijão'),
	('USA', 'Estados Unidos'),
	('ITA', 'Itália'),
	('MCO', 'Mônaco'),
	('ESP', 'Espanha'),
	('CAN', 'Canadá'),
	('AUT', 'Áustria'),
	('GBR', 'Reino Unido'),
	('HUN', 'Hungria'),
	('BEL', 'Bélgica'),
	('NLD', 'Holanda'),
	('SGP', 'Singapura'),
	('JPN', 'Japão'),
	('QAT', 'Catar'),
	('MEX', 'México'),
	('BRA', 'Brasil'),
	('ARE', 'Emirados Árabes Unidos');



select * from tb_estado;
insert into tb_estado (id_estado, nome, code_pais) values
	(1,'Sakhir','BAH'),
	(2,'Jidá','SAU'),
	(3,'Victória','AUS'),
	(4,'Baku','AZE'),
	(5,'Flórida','USA'),
	(6,'Emília-Romanha','ITA'),
	(7,'Santa Catarina','MCO'),
	(8,'Barcelona','ESP'),
	(9,'Quebec','CAN'),
	(10,'Estíria','AUT'),
	(11,'Inglaterra','GBR'),
	(12,'Mogyoród','HUN'),
	(13,'Stavelot','BEL'),
	(14,'Zandvoort','NLD'),
	(15,'Lombardia','ITA'),
	(16,'Singapura','SGP'),
	(17,'Suzuka','JPN'),
	(18,'Al Daayen','QAT'),
	(19,'Texas','USA'),
	(20,'Distrito Federal','MEX'),
	(21,'São Paulo','BRA'),
	(22,'Nevadas','USA'),
	(23,'Abu Dhabi','ARE');



select * from tb_cidade;
insert into tb_cidade (id_cidade, nome, id_estado) values
(1, 'Sakhir', 1),
(2, 'Jidá', 2),
(3, 'Melbourne', 3),
(4, 'Baku', 4),
(5, 'Miami', 5),
(6, 'Ímola', 6),
(7, 'Monte Carlo', 7),
(8, 'Montmeló', 8),
(9, 'Montreal', 9),
(10, 'Spielberg', 10),
(11, 'Silverstone', 11),
(12, 'Mogyoród', 12),
(13, 'Stavelot', 13),
(14, 'Zandvoort', 14),
(15, 'Monza', 15),
(16, 'Singapura', 16),
(17, 'Suzuka', 17),
(18, 'Lusail', 18),
(19, 'Austin', 19),
(20, 'Cidade do México', 20),
(21, 'São Paulo', 21),
(22, 'Las Vegas', 22),
(23, 'Abu Dhabi', 23);

			

select * from tb_circuito;
insert into tb_circuito (id_circuito, nome, estilo, direção, id_cidade) values
(1,	'Circuito Internacional do Bahrein', 'Autódromo', 'Horário', 1),
(2,	'Circuito Urbano de Jidá', 'Circuito de rua', 'Anti-horário',	2),
(3,	'Circuito de Albert Park', 'Circuito de rua', 'Horário', 3),
(4,	'Circuito Urbano de Baku', 'Circuito de rua', 'Anti-horário',	4),
(5,	'Autódromo Internacional de Miami',	'Circuito de rua', 'Anti-horário',	5),
(6,	'Autódromo Enzo e Dino Ferrari', 'Autódromo',	'Anti-horário',	6),
(7,	'Circuito de Mônaco', 'Circuito de rua',	'Horário',	7),
(8,	'Circuito de Barcelona-Catalunha', 'Autódromo', 'Horário', 8),
(9,	'Circuito Gilles Villeneuve', 'Circuito de rua',	'Horário', 9),
(10, 'Red Bull Ring', 'Autódromo', 'Horário', 10),
(11, 'Circuito de Silverstone', 'Autódromo',	'Horário', 11),
(12, 'Hungaroring', 'Autódromo', 'Horário',	12),
(13, 'Circuito de Spa-Francorchamps', 'Autódromo', 'Horário', 13),
(14, 'Circuito de Zandvoort', 'Autódromo', 'Horário', 14),
(15, 'Autodromo Nazionale Monza', 'Autódromo', 'Horário', 15),
(16, 'Circuito Urbano de Marina Bay', 'Circuito de rua', 'Anti-horário', 16),
(17, 'Circuito de Suzuka', 'Autódromo', 'Horário / Anti-horário', 17),
(18, 'Circuito Internacional de Losail', 'Autódromo', 'Horário', 18),
(19, 'Circuito das Américas', 'Autódromo',	'Anti-horário', 19),
(20, 'Autódromo Hermanos Rodríguez', 'Autódromo',	'Horário', 20),
(21, 'Autódromo de Interlagos', 'Autódromo', 'Anti-horário',	21),
(22, 'Circuito Caesars Palace',	'Circuito de rua', 'Anti-horário', 22),
(23, 'Circuito de Yas Marina', 'Autódromo',	'Horário', 23);



select * from tb_equipe;
insert into tb_equipe (code_equipe, nome, motor, sede) values
('RED', 'Red Bull Racing', 'Red Bull', 'Áustria e Reino Unido'),
('AST', 'Aston Martin Racing', 'Mercedes', 'Reino Unido'),
('MER', 'Mercedes', 'Mercedes', 'Alemanha e Reino Unido'),
('FER', 'Ferrari',	'Ferrari', 'Itália'),
('ALP', 'Alpine', 'Renault', 'França'),
('ALR', 'Alfa Romeo', 'Ferrari', 'Suíça'),
('HAS', 'Haas F1 Team', 'Ferrari', 'Reino Unido e Estados Unidos'),
('WIL', 'Williams', 'Mercedes', 'Reino Unido'),
('ALT', 'AlphaTauri', 'Red Bull', 'Itália'),
('MCL', 'McLaren', 'Mercedes', 'Reino Unido');




select * from tb_piloto order by code_equipe;
insert into tb_piloto (code_piloto, nome, nacionalidade, idade, dt_nascimento, code_equipe) values
('Perez',	'Sergio Perez', 'Méxicano', '33', '1990-01-26', 'RED'),
('Verstappen',	'Max Verstappen', 'Holandês', '25', '1997-09-30', 'RED'),
('Alonso',	'Fernando Alonso', 'Espanhol',	'41', '1981-07-29',	'AST'),
('Stroll', 'Lance Stroll', 'Canadense', '24',	'1998-10-29', 'AST'),
('Russell',	'George Russell', 'Britânico',	'25', '1998-02-15',	'MER'),
('Hamilton',	'Lewis Hamilton',  'Britânico', '38', '1985-01-07',	'MER'),
('Sainz',	'Carlos Sainz', 'Espanhol', '28', '1994-09-01',	'FER'),
('Leclerc',	'Charles Leclerc', 'Monegasmo', '25', '1997-10-16',	'FER'),
('Ocon',	'Esteban Ocon', 'Francês',	'26', '1996-09-17',	'ALP'),
('Gasly', 'Pierre Gasly', 'Francês',	'27', '1996-02-07',	'ALP'),
('Zhou', 'Guanyu Zhou', 'Chines', '23', '1999-05-30', 'ALR'),
('Bottas', 'Valtteri Bottas', 'Finlandês', '33', '1989-08-28', 'ALR'),
('Hulkenberg', 'Nico Hülkenberg', 'Alemao', '35', '1987-08-19', 'HAS'),
('Magnussen', 'Kevin Magnussen', 'Dinamarquês', '30', '1992-10-05', 'HAS'),
('Albon', 'Alexander Albon', 'Tailandês', '27', '1996-03-23', 'WIL'),
('Sargeant', 'Logan Sargeant', 'Estadunidense', '22', '2000-12-31',	'WIL'),
('Vries', 'Nyck de Vries', 'Holandês', '28', '1995-02-06', 'ALT'),
('Tsunoda', 'Yuki Tsunoda', 'Japonês', '22', '2000-05-11',	'ALT'),
('Piastri', 'Oscar Piastri', 'Australiano', '21', '2001-04-06', 'MCL'),
('Norris', 'Lando Norris', 'Britânico', '23', '1999-11-13', 'MCL');




select * from tb_treino;
insert into tb_treino (id_treino, sessao, dia_treino, dt_treino, hr_treino, id_circuito) values
(1, 'TL3', 'Sábado', '2023-03-04', '12:00', 1);



select * from rl_grid_gp order by tempo;
insert into rl_grid_gp (id_treino, code_piloto, tempo) values
(1, 'Verstappen', '1:28:35'),
(1, 'Perez', '1:28:38'),
(1, 'Leclerc', '1:28:40'),
(1, 'Sainz', '1:28:41'),
(1, 'Alonso', '1:28:43'),
(1, 'Russell', '1:29:07'),
(1, 'Hamilton', '1:29:22'),
(1, 'Stroll', '1:29:24'),
(1, 'Ocon', '1:29:35'),
(1, 'Hulkenberg', '1:29:45'),
(1, 'Norris', '1:29:46'),
(1, 'Bottas', '1:28:42'),
(1, 'Zhou', '1:29:51'),
(1, 'Tsunoda', '1:30:01'),
(1, 'Albon', '1:32:25'),
(1, 'Sargeant', '1:33:05'),
(1, 'Magnussen', '1:35:05'),
(1, 'Piastri', '1:41:24'),
(1, 'Vries', '1:41:44'),
(1, 'Gasly', '2:08:51');



select * from tb_grande_premio order by data_gp;
insert into tb_grande_premio (gp_nome, dia_gp, data_gp, horario_gp, qtd_voltas, id_circuito, ano_temporada) values
('GP do Bahrein', 'Domingo', '2023-03-05', '12:00', 57, 1, 2023),
('GP da Arábia Saudita', 'Domingo', '2023-03-19', '14:00', 50, 2, 2023),
('GP da Austrália', 'Domingo', '2023-04-02', '02:00', 58, 3, 2023),
('GP do Azerbaijão', 'Domingo', '2023-04-30', '21:00', 50, 4, 2023),
('GP de Miami', 'Domingo', '2023-05-07', '21:00', 50, 5, 2023),
('GP da Emília-Romanha', 'Domingo', '2023-05-21', '21:00', 50, 6, 2023),
('GP de Mônaco', 'Domingo', '2023-05-28', '21:00', 50, 7, 2023),
('GP da Espanha', 'Domingo', '2023-06-04', '21:00', 50, 8, 2023),
('GP do Canadá', 'Domingo', '2023-06-18', '21:00', 50, 9, 2023),
('GP da Áustria', 'Domingo', '2023-07-02', '21:00', 50, 10, 2023),
('GP da Inglaterra', 'Domingo', '2023-07-09', '21:00', 50, 11, 2023),
('GP da Hungria', 'Domingo', '2023-07-23', '21:00', 50, 12, 2023),
('GP da Bélgica', 'Domingo', '2023-07-30', '21:00', 50, 13, 2023),
('GP da Holanda', 'Domingo', '2023-08-27', '21:00', 50, 14, 2023),
('GP da Itália', 'Domingo', '2023-09-03', '21:00', 50, 15, 2023),
('GP de Singapura', 'Domingo', '2023-09-17', '21:00', 50, 16, 2023),
('GP do Japão', 'Domingo', '2023-09-24', '21:00', 50, 17, 2023),
('GP do Catar', 'Domingo', '2023-10-08', '21:00', 50, 18, 2023),
('GP dos EUA', 'Domingo', '2023-10-22', '21:00', 50, 19, 2023),
('GP da Cidade do México', 'Domingo', '2023-10-29', '21:00', 50, 20, 2023),
('GP de São Paulo', 'Domingo', '2023-11-05', '21:00', 50, 21, 2023),
('GP de Las Vegas', 'Domingo', '2023-11-19', '21:00', 50, 22, 2023),
('GP de Abu Dhabi', 'Domingo', '2023-11-26', '21:00', 50, 23, 2023);

delete from rl_classificacao_gp where gp_nome = 'GP do Bahrein';
select * from rl_classificacao_gp order by gp_nome desc, posicao;
insert into rl_classificacao_gp (gp_nome, code_piloto, posicao, tempo, pontuacao) values
('GP da Austrália', 'Verstappen', 1, '2:32:38.371', 25),
('GP da Austrália', 'Hamilton', 2, '+0.179s', 18),
('GP da Austrália', 'Alonso', 3,'+0.769s', 15),
('GP da Austrália', 'Stroll', 4,'+3.082s', 12),
('GP da Austrália', 'Perez', 5,'+3.320s', 11),
('GP da Austrália', 'Norris', 6,'+3.701s', 8),
('GP da Austrália', 'Hulkenberg', 7,'+4.939s', 6),
('GP da Austrália', 'Piastri', 8 ,' +5.382s', 4),
('GP da Austrália', 'Zhou', 9, '+5.713s.', 2) ,
('GP da Austrália', 'Tsunoda', 10, '+6.052s', 1),
('GP da Austrália', 'Bottas', 11,'+6.513s', 0),
('GP da Austrália', 'Sainz', 12,'+6.594s', 0),
('GP da Austrália', 'Gasly',13 ,'Não concluiu', 0),
('GP da Austrália', 'Ocon', 14,'Não concluiu', 0),
('GP da Austrália', 'Vries', 15,'Não concluiu', 0),
('GP da Austrália', 'Sargeant', 16,'Não concluiu', 0),
('GP da Austrália', 'Magnussen', 17,'Não concluiu', 0),
('GP da Austrália', 'Russell', 18,'Não concluiu', 0),
('GP da Austrália', 'Albon', 19,'Não concluiu', 0),
('GP da Austrália', 'Leclerc', 20,'Não concluiu', 0);




delete from rl_classificacao_piloto where ano_temporada = 2023;
select ano_temporada, code_piloto, pontos, vitorias, podios from rl_classificacao_piloto order by pontos desc;
insert into rl_classificacao_piloto (ano_temporada, code_piloto, posicao, pontos, vitorias, podios) values
(2023,	'Verstappen', 1, 0, 0,	0),
(2023,	'Perez',	2,	0, 0,	0),
(2023,	'Alonso',	3,	0, 0,	0),
(2023,	'Sainz',	4,	0, 0,	0),
(2023,	'Hamilton',	5,	0, 0,	0),
(2023,	'Stroll',	6,	0, 0,	0),
(2023,	'Russell',	7,	0, 0,	0),
(2023,	'Bottas',	8,	0, 0,	0),
(2023,	'Gasly',	9,	0, 0,	0),
(2023,	'Albon',	10,	0, 0,	0),
(2023,	'Tsunoda',	11,	0, 0,	0),
(2023,	'Sargeant',	12,	0, 0,	0),
(2023,	'Magnussen',	13,	0, 0,	0),
(2023,	'Vries',	14,	0, 0,	0),
(2023,	'Hulkenberg',	15,	0, 0,	0),
(2023,	'Zhou',	16,	0, 0,	0),
(2023,	'Norris',	17,	0, 0,	0),
(2023,	'Ocon',	18,	0, 0,	0),
(2023,	'Leclerc',	19,	0, 0,	0),
(2023,	'Piastri',	20,	0, 0,	0);


delete from rl_classificacao_piloto where ano_temporada = 2023;
select * from rl_classificacao_equipe order by pontos desc;
insert into rl_classificacao_equipe (ano_temporada, code_equipe, posicao, pontos, vitorias, podios) values
(2023,	'RED',	1,	0, 0, 0),
(2023,	'AST',	2,	0,	0, 0),
(2023,	'MER',	3,	0,	0, 0),
(2023,	'FER',	4,	0,	0, 0),
(2023,	'ALP',	5,	0,	0, 0),
(2023,	'ALR',	6,	0,	0, 0),
(2023,	'WIL',	7,	0,	0, 0),
(2023,	'HAS',	8,	0,	0, 0),
(2023,	'ALT',	9,	0,	0, 0),
(2023,	'MCL',	10,	0,	0, 0);



use formula_1;
-- ============================================================
--                        SELECTS
-- ============================================================

select posicao, code_piloto, pontos, vitorias, podios
	from rl_classificacao_piloto 
    order by pontos desc;
    
    
/*SELECIONA TODOS OS DADOS DO GP CADASTRADO*/
select gp.gp_nome 		as 'Grande Prêmio', 
		cl.posicao 		as Posição,
		p.nome 			as Piloto, 
		e.nome 			as Equipe, 
        cl.tempo 		as Tempo, 
		cl.pontuacao 	as Pontos
	from rl_classificacao_gp as cl
	inner join tb_piloto 			as p  	on cl.code_piloto = p.code_piloto
	inner join tb_grande_premio 	as gp 	on gp.gp_nome = cl.gp_nome
    left join tb_equipe 			as e 	on e.code_equipe = p.code_equipe
    where gp.gp_nome = 'GP da Austrália'
    order by posicao;


use formula_1;
/*SELECIONA A TABELA GERAL DE PONTOS DA FORMULA 1 (PILOTOS) */
select rl.ano_temporada as 'Temporada', 
		rl.posicao		as 'Posição',
		p.nome 			as 'Piloto', 
        e.nome 			as 'Equipe', 
        rl.pontos 		as 'Podios', 
        rl.vitorias		as 'Vitorias', 
        rl.podios		as 'Podios'
	from rl_classificacao_piloto as rl
		right join tb_piloto 	as p  	on p.code_piloto = rl.code_piloto
		left join tb_equipe		as e 	on e.code_equipe = p.code_equipe
    order by posicao;
    
/*SELECIONA A TABELA GERAL DE PONTOS DA FORMULA 1 (EQUIPES) */
select rl.ano_temporada as 'Temporada',
		rl.posicao		as 'Posição',
        e.nome 			as 'Equipe',
        rl.pontos		as 'Pontos',
        rl.vitorias		as 'Vitórias',
        rl.podios		as 'Podios'
	from rl_classificacao_equipe as rl
		left join tb_equipe		as e 	on e.code_equipe = rl.code_equipe
    order by pontos desc;
    
    
use formula_1;
/*select que utilizem funções agregadoras COUNT, SUM, MAX, MIN, AVG */

/*SELECIONA A QUANTIDADE DE PILOTO CADASTRADOS*/
select count(code_piloto) as 'numero de pilotos' from tb_piloto;

/*SELECIONA A QUANTIDADE DE CIRCUITOS CADASTRADOS*/
select count(id_circuito) as 'quantidade de circuitos' from tb_circuito;

/*SELECIONE OS DADOS DE UM CIRCUITO ESPECIFICO*/
select p.nome as País, e.nome as Estado,
 c.nome as 'Nome do Circuito', c.estilo as Estilo, c.direção as Direção
	from tb_paises as p 
		right join tb_estado as e on p.code_pais = e.code_pais
		inner join tb_cidade as ci on ci.id_estado = e.id_estado
		left join tb_circuito as c on c.id_cidade = ci.id_cidade
    where c.nome like '%Bahrein%';
    
/*SELECIONA A QUANTIDADE DE PILOTOS BRITÂNICOS*/
select count(nacionalidade) as 'qtd de pilotos Britânico' 
	from tb_piloto
		where nacionalidade = 'britânico';

/*SELECIONA O MELHOR TEMPO DO GRID*/

select p.nome, gr.tempo
	from tb_piloto as p
		right join rl_grid_gp as gr on gr.code_piloto = p.code_piloto
	where tempo = (select min(tempo) from rl_grid_gp);
	
    
/*SELECIONA O PILOTO MAIS VELHO*/
select nome, idade
  from tb_piloto 
  where idade = (select max(idade) from tb_piloto);


/*SELECIONA A MÉDIA DE IDADE DE PILOTOS*/
select * from tb_piloto;
select avg(idade) as 'média de Idade'
	from tb_piloto;
    
    
/*SELECIONA O PILOTO COM A MENOR IDADE*/
select nome, idade
  from tb_piloto 
  where idade = (select min(idade) from tb_piloto);
     
/* Select em mais de uma tabela com INNER JOIN, LEFT JOIN, RIGHT JOIN
Clausulas: OR, AND, IN, LIKE,
WHERE, GROUP BY, HAVING, ORDER BY */
    
    
/* SELECIONA O EQUIPES QUE COMEÇAM COM A LETRA 'A e M */
select nome
	from tb_equipe
		where nome like 'a%'
        or nome like 'm%'
        order by nome;
	
/*SELECIONA TODOS OS PILOTOS E SUAS EQUIPES*/
select p.nome, p.nacionalidade, p.idade, e.nome as equipe
	from tb_piloto as p
	left join tb_equipe as e on e.code_equipe = p.code_equipe
	order by e.nome;
        
    
    
 /*SELECIONA OS PILOTOS COM A PONTUACAO MAIOR QUE 10 DO GP DE BAHREIN*/
select gp.gp_nome, cl.posicao, 
p.nome 				as piloto, 
e.nome 				as equipe, 
cl.pontuacao	 	as pontos
	from rl_classificacao_gp as cl
		inner join tb_grande_premio 	as gp 	on gp.gp_nome = cl.gp_nome
		inner join tb_piloto 			as p  	on cl.code_piloto = p.code_piloto
		left join tb_equipe 			as e 	on e.code_equipe = p.code_equipe
    where gp.gp_nome = 'GP da Austrália'
		group by  p.nome, e.nome
		having cl.pontuacao > 11
    order by cl.pontuacao desc;
    
    
 /*SELECIONA OS DADOS DE QUEM FEZ A MAIOR PONTUACAO NA CORRIDA*/
select 	gp.gp_nome 			as 'Grande Prêmio', 
		cl.posicao 			as 'Posição',
        p.nome 				as 'Piloto', 
		e.nome 				as 'Equipe',
		cl.pontuacao 		as 'Pontos'
	from rl_classificacao_gp as cl
	inner join tb_piloto 			as p  	on cl.code_piloto = p.code_piloto
	inner join tb_grande_premio 	as gp 	on gp.gp_nome = cl.gp_nome
    left join tb_equipe 			as e 	on e.code_equipe = p.code_equipe
		where gp.gp_nome like '%Bahrein%' 
        and cl.pontuacao = (select max(pontuacao) as 'maior_pontuação'
		from rl_classificacao_gp)
		order by posicao;


 
 /*SELECIONA OS PILOTOS DA RED BULL E A SOMA DOS PONTOS DA EQUIPE RED BULL*/
use formula_1;    
select * from tb_equipe;
select * from rl_classificacao_gp;

select 
    gp.gp_nome as grande_premio, 
    e.nome as equipe,
    group_concat(p.nome separator ', ') as pilotos,
    sum(cl.pontuacao) as pontos
from rl_classificacao_gp as cl
inner join tb_piloto p on cl.code_piloto = p.code_piloto
inner join tb_grande_premio gp on gp.gp_nome = cl.gp_nome
left join tb_equipe e on e.code_equipe = p.code_equipe
where e.code_equipe = 'RED'
group by gp.gp_nome, e.nome
order by gp.data_gp;
    
/*SELECIONAR TODOS OS DADOS DOS GRANDE_PREMIO*/
select * from tb_paises;
select * from tb_estado;
select * from tb_cidade;
select * from tb_circuito;
select * from tb_grande_premio;


select 	p.code_pais 		as Sigla,
		p.nome 			as País ,
		e.nome 			as Estado,
		c.nome 			as Cidade,
		ct.nome 		as Circuito,
        ct.estilo 		as Estilo,
        ct.direção		as Direção,
		g.gp_nome 		as Grande_Prêmio,
        g.dia_gp 		as Dia,
        date_format(g.data_gp, '%d/%m/%Y')		as Data,
        g.horario_gp 	as Horario
		from tb_paises 	as p
			left join tb_estado 	as e 	on p.code_pais = e.code_pais
			right join tb_cidade 	as c 	on c.id_estado = e.id_estado
			inner join tb_circuito 	as ct 	on ct.id_cidade = c.id_cidade
			right join tb_grande_premio as g on g.id_circuito = ct.id_circuito
            order by g.data_gp;
            
		
/*Criar um novo usuário para e conceder permissão de select ao banco de dados do seu trabalho em todas as tabelas.*/
use formula_1;
create user 'vinicius'@'localhost' identified by '123456';

grant all privileges on formula_1. * to 'vinicius'@'localhost';

show grants for 'vinicius'@'localhost';


-- ============================================================
--                           VIEWS
-- ============================================================
/* 1 - VIEWS PARA SELECIONAR TODOS OS DADOS DE TODOS OS GRANDE PREMIO*/
select * from dados_grande_premios;

create view dados_grande_premios as
select 	p.code_pais 		as Sigla,
		p.nome 			as País ,
		e.nome 			as Estado,
		c.nome 			as Cidade,
		ct.nome 		as Circuito,
        ct.estilo 		as Estilo,
        ct.direção		as Direção,
		g.gp_nome 		as Grande_Prêmio,
        g.dia_gp 		as Dia,
        date_format(g.data_gp, '%d/%m/%Y')		as Data,
        g.horario_gp 	as Horario
		from tb_paises 	as p
			left join tb_estado 	as e 	on p.code_pais = e.code_pais
			right join tb_cidade 	as c 	on c.id_estado = e.id_estado
			inner join tb_circuito 	as ct 	on ct.id_cidade = c.id_cidade
			right join tb_grande_premio as g on g.id_circuito = ct.id_circuito
            order by g.data_gp;
            
/* 2 - VIEWS PARA SELECIONAR OS DADOS DO GP DE BAHREIN*/
select * from gp_do_bahrein;

create view gp_do_bahrein as
select gp.gp_nome 		as grande_premio, cl.posicao,
		p.nome 			as piloto, 
		e.nome 			as equipe, cl.tempo, 
		cl.pontuacao 	as pontos
	from rl_classificacao_gp as cl
	inner join tb_piloto 			as p  	on cl.code_piloto = p.code_piloto
	inner join tb_grande_premio 	as gp 	on gp.gp_nome = cl.gp_nome
    left join tb_equipe 			as e 	on e.code_equipe = p.code_equipe
    where gp.gp_nome = 'GP do Bahrein'
    order by posicao;
    
    
    
-- ==============================================================
--                          TRIGGERS
-- ==============================================================
/* 1 - TRIGGER QUE ATUALIZA OS PONTOS DOS PILOTOS DA TABELA (RL_CLASSIFICACAO_PILOTO)
CONFORME VOCÊ ATUALIZA A TABELA (RL_CLASSIFICACAO_GP)*/

delimiter $$
drop trigger if exists tr_pontos_pl $$
create trigger tr_pontos_pl after insert on rl_classificacao_gp
for each row
begin
	update rl_classificacao_piloto
		set pontos = pontos + new.pontuacao
	where code_piloto = new.code_piloto and ano_temporada = 2023;
	if(new.pontuacao =  25) then
	update rl_classificacao_piloto
		set vitorias = vitorias +1,
			podios = podios +1
	where code_piloto = new.code_piloto  and ano_temporada = 2023;
    
elseif (new.pontuacao > 14) then
	update rl_classificacao_piloto
		set podios = podios +1
	where code_piloto = new.code_piloto  and ano_temporada = 2023;
	
end if;
end $$
delimiter ;

/* 2 - TRIGGER QUE ATUALIZA OS PONTOS DAS EQUIPES DA TABELA (RL_CLASSIFICACAO_EQUIPE)
CONFORME VOCÊ ATUALIZA A TABELA (RL_CLASSIFICACAO_GP)*/
select * from rl_classificacao_equipe order by posicao;

-- ==============================================================
--                          FUNCTION
-- ==============================================================

/* 1 FUNCTION PARA CALCULAR OS PONTOS DE UMA EQUIPE */

delimiter $$
drop function if exists busca_pontos_eq $$
create function busca_pontos_eq(equipe varchar(3)) returns int
deterministic
begin   
     declare ponto_equipe int;
     select
		sum(cl.pontuacao) 		into ponto_equipe
		from rl_classificacao_gp as cl
			inner join tb_piloto 			as p  	on cl.code_piloto = p.code_piloto
			inner join tb_grande_premio 	as gp 	on gp.gp_nome = cl.gp_nome
			left join tb_equipe 			as e 	on e.code_equipe = p.code_equipe
		where e.code_equipe = equipe;
		return ponto_equipe;
        
END $$
DELIMITER ;
select busca_pontos_eq ('RED') as 'Pontos';
select * from rl_classificacao_piloto order by posicao;



/* 2 FUNCTION PARA CALCULAR AS VITÓRIAS DE UMA EQUIPE */

delimiter $$
drop function if exists busca_vitorias_eq $$
create function busca_vitorias_eq(equipe varchar(3)) returns int
deterministic
begin   
	declare vitorias_equipe int;
	select 
		sum(p.vitorias) 	into vitorias_equipe
		from rl_classificacao_piloto as p
			inner join tb_piloto as pi on pi.code_piloto = p.code_piloto
			left join tb_equipe as e on e.code_equipe = pi.code_equipe
		where e.code_equipe = equipe;
		return  vitorias_equipe;
        
end $$
delimiter ;
select busca_vitorias_eq ('RED') as 'Vitórias da Red Bull';
select * from rl_classificacao_piloto order by posicao;


/* 3 FUNCTION PARA CALCULAR OS PODIOS DE UMA EQUIPE )*/

delimiter $$
drop function if exists busca_podios_eq $$
create function busca_podios_eq(equipe varchar(3)) returns int
deterministic
begin   
	declare podios_equipe int;
	select 
    sum(p.podios) 	into podios_equipe
		from rl_classificacao_piloto as p
			inner join tb_piloto as pi on pi.code_piloto = p.code_piloto
			left join tb_equipe as e on e.code_equipe = pi.code_equipe
		where e.code_equipe = equipe;
		return  podios_equipe;

END $$
DELIMITER ;

select busca_podios_eq ('RED') as 'Podios da Red Bull';
select * from rl_classificacao_piloto order by posicao;


-- ==============================================================
--                        PROCEDURES
-- ==============================================================

/* 1 PROCEDURE PARA ATUALIZAR TODOS OS PONTOS, VITORIAS E PODIOS DE UMA EQUIPE )*/

delimiter $$
drop procedure if exists atualiza_vitorias_eq $$
create procedure atualiza_vitorias_eq (equipe varchar (3))
begin
	declare busca_pontos_eq int;
	declare busca_podios_eq int;
    declare busca_vitorias_eq int;
		set busca_pontos_eq = busca_pontos_eq (equipe);
		set busca_podios_eq = busca_podios_eq (equipe);
        set busca_vitorias_eq = busca_vitorias_eq (equipe);
    update rl_classificacao_equipe 
		set podios = busca_podios_eq,
			vitorias = busca_vitorias_eq,
            pontos = busca_pontos_eq
    where code_equipe = equipe; 
    
end $$
delimiter ;

delete from rl_classificacao_equipe where ano_temporada = '2023';

select * from rl_classificacao_piloto order by posicao;
        
-- RED MER AST FER ALP ALR HAS ALT MCL WIL
call atualiza_vitorias_eq ('RED');
select  ano_temporada, code_equipe, pontos, vitorias, podios from rl_classificacao_equipe order by pontos desc;

/* 2 PROCEDURE PARA INSERIR OS DADOS DE UM GRANDE PREMIO */

delimiter $$
drop procedure if exists insert_treino $$
create procedure insert_treino(id_treino int, sessao varchar(30), dia_treino varchar (20), dt_treino date, hr_treino	time, id_circuito int)
begin
	insert into tb_treino values (id_treino, sessao, dia_treino, dt_treino, hr_treino, id_circuito);
end $$
delimiter ;

select * from tb_treino;
call insert_treino (2, 'TL3', 'Sábado', '2023-03-18', '10:30', 2);

/*(3, 'TL3', 'Sábado', '2023-04-01', '02:00', 3)*/


