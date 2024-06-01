/* LEIA ME */

/* ESTE É UM PROJETO FEITO POR ARIELI LEANDRO GUTIERRES, A IDEIA PRINCIPAL DESTE BANCO DE DADOS É TREINAR E MELHORAR
MEUS CONHECIMENTOS EM SQL. ESTE É UM BANCO DE DADOS PARA AUTOMATIZAR O SERVIÇO DE UMA OFICINA,
AUTOMATIZANDO A ENTRADA DE CLIENTES USUAIS E NOVOS CLIENTES. A PRINCIPAL TABELA É A DE CLIENTES E A TABELA DE CARROS,
A MAIORIA DAS TABELAS REFERENCIAN TANTO A TABELA DE CLIENTES COMO A TABELA DE CARROS, UTILIZANDO A CHAVE PRIMÁRIA
IDCLIENTE E IDCARRO E AS CHAVES ESTRANGEIRAS ID_CLIENTE E ID_CARRO, SENDO TODO O BANDO DE DADOS UM RELACIONAMENTO 1 X 1,
(NESTE BANCO DE DADOS O CLIENTE TEM SOMENTE UM CARRO, UM TELEFONE, E O CARRO TEM SOMENTE UMA COR E UM SERVIÇO MECÂNICO FEITO). */

/* QUANTO Á INFORMAÇÕES DE CLIENTES, TELEFONES E AS PLACAS DE CARROS, TODAS AS INFORMAÇÕES CONTIDAS NESTE BANCO DE DADOS
É TOTALMENTE IRREAIS, NÃO REFERENCIANDO A NENHUMA PESSOA REAL. TODOS OS NOMES NA TABELA DE CLIENTES FORAM CRIADOS A PARTIR
DE UMA INTELIGÊNCIA ARTIFICIAL E ESCOLHIDOS MANUALMENTE, JÁ O CPF DOS CLIENTES FORAM PERMUTAÇÕES ARITMÉTICAS FEITAS A PARTIR
DE COMBINAÇÕES DE DÍGITOS, GARANTINDO QUE NENHUM NÚMERO FAÇA REFENRÊNCIA AO CPF DE UMA PESSOA REAL, ASSIM COMO AS INFORMAÇÕES
DE TELEFONE E PLACAS DE CARROS. */



CREATE DATABASE OFICINA;
USE OFICINA;


/* CRIAÇÃO DA TABELA DE CLIENTES */


CREATE TABLE CLIENTE (
IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
NOME VARCHAR(30) NOT NULL,
CPF VARCHAR(11) NOT NULL,
SEXO ENUM('M', 'F') NOT NULL
);


/* CRIAÇÃO DA TABELA DOS TELEFONES DOS CLIENTES */


CREATE TABLE TELEFONE (
IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
TIPO ENUM('CELULAR', 'RESIDENCIAL', 'COMERCIAL'),
DDD CHAR(2),
TELEFONE VARCHAR(9),
ID_CLIENTE INT UNIQUE,
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE)
);

/* PRIMEIROS REGISTROS NA TABELA DE CLIENTES. TODOS OS NOMES DE CLIENTES E NÚMEROS DE CPF NÃO REFERENCIAM Á PESSOAS REAIS
OS NOMES FORAM GERADOS ALEATORIAMENTE POR UMA INTELIGÊNCIA ARTIFICIAL E OS DÍGITOS DE CPF FORAM GERADOS ATRAVÉS DE PERMUTAÇÕES 
ARITMÉTICAS GARANTINDO QUE NÃO REFERENCIEM Á UMA PESSOA REAL */


DESC CLIENTE;
INSERT INTO CLIENTE VALUES
(NULL, 'Eduarda',       '87654324689', 'F'),
(NULL, 'Ana', 	        '76567890987', 'F'),
(NULL, 'Roberto',       '87654321234', 'M'),
(NULL, 'Makeylla',      '89898765434', 'F'),
(NULL, 'Matheus',	    '87987654211', 'M'),
(NULL, 'Carlos', 	    '54345654321', 'M'),
(NULL, 'Lara',  	    '76654323157', 'F'),
(NULL, 'Daniel',   	    '76535676543', 'M'),
(NULL, 'Paula',	  	    '84345678765', 'F'),
(NULL, 'Rafael',        '87654323456', 'M'),
(NULL, 'Luan',	        '98765432345', 'M'),
(NULL, 'Emmanuelly',    '09876543234', 'F'),
(NULL, 'Sara',		    '98765432345', 'F'),
(NULL, 'Anderson',      '98765434654', 'M'),
(NULL, 'Carlos Daniel', '87654327654', 'M');
SELECT * FROM CLIENTE;

/* QUERY DE INFORMAÇÕES RESUMIDAS DOS CLIENTES, SEUS TELEFONES E SEUS RESPECTIVOS VEÍCULOS */

SELECT NOME, CPF, SEXO, DDD, TELEFONE, MARCA, PLACA 
FROM CLIENTE INNER JOIN TELEFONE ON IDCLIENTE = ID_CLIENTE
INNER JOIN CARRO ON IDCLIENTE = CARRO.ID_CLIENTE;


/* CRIAÇÃO DA TABELA CARRO */

CREATE TABLE CARRO (
IDCARRO INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
MARCA VARCHAR(30),
MODELO VARCHAR(30),
PLACA VARCHAR(6),
ID_CLIENTE INT UNIQUE,
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE)
);


/* CRIAÇÃO DA TABELA COR, REFERENCIANDO A COR DO CARRO DA TABELA DE CARROS */


CREATE TABLE COR (
IDCOR INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
COR VARCHAR(50),
TEXTURA VARCHAR(50),
ID_CARRO INT UNIQUE,
FOREIGN KEY(ID_CARRO) REFERENCES CARRO(IDCARRO)
);


/* CRIAÇÃO DA TABELA SERVICO */


CREATE TABLE SERVICO (
IDSERVICO INT PRIMARY KEY AUTO_INCREMENT,
DATA_ENTRADA DATE,
DATA_SAIDA DATE,
VALOR INT,
DESCRICAO VARCHAR(60),
ID_CARRO INT UNIQUE,
FOREIGN KEY(ID_CARRO) REFERENCES CARRO(IDCARRO)
);

SHOW TABLES;


/* QUERY QUE RETORNA SOMENTE O NOME DOS CLIENTES E SEUS CARROS REFERENTES AO SERVICO MECÂNICO FEITO */

SELECT NOME, MARCA, MODELO, VALOR, DESCRICAO 
FROM CLIENTE INNER JOIN CARRO ON IDCLIENTE = ID_CLIENTE
INNER JOIN SERVICO ON ID_CARRO = IDCARRO;

DESC CLIENTE;
DESC CARRO;
DESC TELEFONE;
DESC COR;
DESC SERVICO;

/* INSERINDO O RESTANTE DE DADOS SOBRE OS CLIENTES, TODOS OS NOMES DE CLIENTES E NÚMEROS DE CPF NÃO REFERENCIAM Á PESSOAS REAIS
OS NOMES FORAM GERADOS ALEATORIAMENTE POR UMA INTELIGÊNCIA ARTIFICIAL E OS DÍGITOS DE CPF FORAM GERADOS ATRAVÉS DE PERMUTAÇÕES 
ARITMÉTICAS GARANTINDO QUE NÃO REFERENCIEM Á UMA PESSOA REAL */


DESC CLIENTE;
INSERT INTO CLIENTE(IDCLIENTE, NOME, CPF, SEXO) VALUES
(NULL, 'Ana Maria', 	'77788896543', 'F'),
(NULL, 'Carla', 		'88987890909', 'F'),
(NULL, 'Silvanna', 		'11111111111', 'F'),
(NULL, 'Kharlla',		'77777777777', 'F'),
(NULL, 'Luccas', 		'99999999999', 'M'),
(NULL, 'Lucca', 		'12222121212', 'M'),
(NULL, 'Luciana', 		'66666666666', 'F'),
(NULL, 'Luciano',		'33333333333', 'M'),
(NULL, 'Luísa', 		'88888888888', 'F'),
(NULL, 'Luanna',		'44444444444', 'F'),
(NULL, 'Juliana Costa', '76767676767', 'F'),
(NULL, 'Júlia Silva',	'22222222222', 'F'),
(NULL, 'Bianca Bastos', '98989898989', 'F'),
(NULL, 'Gabriella', 	'44443444444', 'F'),
(NULL, 'Gabrielly',		'75757575757', 'F'),
(NULL, 'Gabriell', 		'55555555555', 'M'),
(NULL, 'Elton', 		'85236841265', 'M'),
(NULL, 'Lucas Costa',   '41264125156', 'M'),
(NULL, 'Felippe', 		'98765432123', 'M'),
(NULL, 'Fhiliphe', 		'98765432456', 'M'),
(NULL, 'Bruno Souza', 	'87787787878', 'M'),
(NULL, 'Bruna',			'12121212121', 'F'),
(NULL, 'Gustavo', 		'34343434343', 'M'),
(NULL, 'Giulia',		'65656565655', 'F'),
(NULL, 'Giovana',		'99999899999', 'F'),
(NULL, 'Giovanna',		'44445444444', 'F'),
(NULL, 'Fátima', 		'00000000001', 'F'),
(NULL, 'Fernanda Lima', '97965423164', 'F'),
(NULL, 'Fernanda',		'22222222212', 'F'),
(NULL, 'Fernando',		'55555555554', 'M'),
(NULL, 'Solocis',		'87412398412', 'M'),
(NULL, 'Melissa', 		'52365451212', 'F'),
(NULL, 'Melinda',		'42698412365', 'F'),
(NULL, 'Maria souzza',	'11111111311', 'F'),
(NULL, 'Mariana Lizz',  '64123641236', 'F'),
(NULL, 'Mariana Ruiz',  '54126984123', 'F'),
(NULL, 'Tatianna', 		'36541365232', 'F'),
(NULL, 'Aurora', 		'66666646666', 'F'),
(NULL, 'Lorrana', 		'87654323456', 'F'),
(NULL, 'Lorena', 		'98765432345', 'F'),
(NULL, 'Luíza', 		'77777777432', 'F'),
(NULL, 'Gilmar', 		'54125412441', 'M'),
(NULL, 'Lucas Matheus', '85412369854', 'M'),
(NULL, 'Lucinda',		'11112356722', 'F'),
(NULL, 'Flora',			'99876545676', 'F'),
(NULL, 'Giana',			'13245165442', 'F');

/* INSERINDO TODOS OS DADOS REFERENTES AOS CARROS DE TODOS OS CLIENTES */

INSERT INTO CARRO(IDCARRO, MARCA, MODELO, PLACA, ID_CLIENTE) VALUES
(NULL, 'Ford',		    'Mustang',        'XXXXXX', 1),
(NULL, 'Toyota',	    'Camry',	      'XZXXXX', 2),
(NULL, 'Chevrolet',     'Corvette',       'ZZXXXX', 3),
(NULL, 'Honda',		    'Civic',	      'CCCCCC', 4),
(NULL, 'BMW', 	   	    '3 Series',       'VVVVVV', 5),
(NULL, 'Volkswagem',    'Golf',	          'YYYYYY', 6),
(NULL, 'Mercedes-Benz', 'C-Class', 		  'YZZZZZ', 7),
(NULL, 'Audi',			'A4',			  'VCVVCV', 8),
(NULL, 'Nissan',		'Altima',		  '1EEEEE', 9),
(NULL, 'Tesla', 		'Model S',		  '3RRRRR', 10),
(NULL, 'Subaru',		'Outback',		  'DDDDDD', 11),
(NULL, 'Hyundai',		'Sonata',		  'TTTTTT', 12),
(NULL, 'Jeep', 			'Wrangler',		  'AAAAAA', 13),
(NULL, 'Kia',			'Soul',			  'UYYYYY', 14),
(NULL, 'Ford',			'F-150',		  'WWWWWW', 15),
(NULL, 'Toyota',		'Prius',		  'QQQQQQ', 16),
(NULL, 'Chevrolet',     'Silverado',	  'PPPPPP', 17),
(NULL, 'Honda',			'Accord',	      'AAAAAA', 18),
(NULL, 'BMW',			'5 Series', 	  'MQMMMM', 19),
(NULL, 'Volkswagen',	'Passat',		  'APAPAP', 20),
(NULL, 'Mercedes-Benz',	'E-Class',		  'LLLLLL', 21),
(NULL, 'Audi',			'Q5',			  'BBBBBB', 22),
(NULL, 'Nissan',		'Rogue', 		  'CCCBCC', 23),
(NULL, 'Tesla', 		'Model 3',		  'DDEDDD', 24),
(NULL, 'Subaru',		'Forester',		  'EEEEEE', 25),
(NULL, 'Hyundai',		'Tucson',	   	  'FFFFFF', 26),
(NULL, 'Jeep',			'Grand Cherokee', 'GGGGGG', 27),
(NULL, 'Kia',			'Sportage',		  'HHHHHH', 28),
(NULL, 'Ford',			'Explorer',		  'IIIIII', 29),
(NULL, 'Toyota', 		'RAV4',			  'JJJJJJ', 30),
(NULL, 'Chevrolet',     'Equinox',		  'KKKKKK', 31),
(NULL, 'Honda',			'CR-V',			  'LLLLMM', 32),
(NULL, 'BMW',			'X3',			  'MMMMMN', 33),
(NULL, 'Volkswagen',	'Tiguan',		  'NNNNNN', 34),
(NULL, 'Mercedes-Benz', 'GLE',			  'OOOOOO', 35),
(NULL, 'Audi',			'A6',			  'PPPPQP', 36),
(NULL, 'Nissan',		'Pathfinder',     'QQQQQP', 37),
(NULL, 'Tesla',			'Model X', 		  'RRRRRR', 38),
(NULL, 'Subaru',		'Impreza',        'SSSSSS', 39),
(NULL, 'Hyundai',		'Elantra',		  'TTTTTU', 40),
(NULL, 'Jeep',          'Cherokee',		  'UUUUUU', 41),
(NULL, 'Kia',			'Optima',		  'VVVVVW', 42),
(NULL, 'Ford',			'Escape',		  'WWWWXW', 43),
(NULL, 'Toyota',		'Highlander',	  'XXX1XX', 44),
(NULL, 'Chevrolet',     'Traverse',		  'YYY1YY', 45),
(NULL, 'Honda',         'Pilot',		  'XTYXTY', 46),
(NULL, 'BMW',			'X5',			  'KJGFVJ', 47),
(NULL, 'Volkswagen',    'Atlas',		  'KHGFHH', 48),
(NULL, 'Mercedes-Benz', 'GLC', 			  'K53HFD', 49),
(NULL, 'Audi',          'Q7',			  'LJHGHJ', 50),
(NULL, 'Nissan',        'Murano',		  'GFDDFG', 51),
(NULL, 'Tesla',         'Model Y',        'HHDSTY', 52),
(NULL, 'Subaru',        'Legacy',         'KHGFDF', 53),
(NULL, 'Hyundai',       'Santa Fe',       'GFDSWE', 54),
(NULL, 'Jeep',          'Compass',        'KKHGD4', 55),
(NULL, 'Kia',           'Sorento',        'KJHGDE', 56),
(NULL, 'Ford',          'Edge',           'AEWGFR', 57),
(NULL, 'Toyota',        '4Runner',        'LPUGSV', 58),
(NULL, 'Chevrolet',     'Blazer',         'OUYTRE', 59),
(NULL, 'Honda',         'Odyssey',        'BVCXSA', 60),
(NULL, 'BMW',		    '7 Series',       'WDRGBG', 61);


/* COMEÇANDO A INSERIR OS PRIMEIROS DADOS DA TABELA DE SERVICO */

INSERT INTO SERVICO(IDSERVICO, DATA_ENTRADA, DATA_SAIDA, VALOR, DESCRICAO, ID_CARRO) VALUES
(NULL, '2024-01-14', '2024-01-16', 89, 'Troca de óleo', 					 1),
(NULL, '2024-01-21', '2024-01-24', 55, 'Calibragem de Pneu',	    		 2),
(NULL, '2024-01-01', '2024-01-03', 150, 'Troca do motor',           		 3),
(NULL, '2024-01-05', '2024-01-09', 89,  'Conserto do Retrovisor',   		 4),
(NULL, '2024-01-25', '2024-01-28', 87,  'Troca de lâmpada',         		 5),
(NULL, '2024-01-01', '2024-01-05', 89, 'Troca de óleo',         	         6),
(NULL, '2024-01-05', '2024-01-05', 87, 'Troca de lâmpada',     			     8),
(NULL, '2024-01-07', '2024-01-08', 129 , 'Troca de dois pneus',       		 7),
(NULL, '2024-01-08', '2024-01-10', 258, 'Troca dos quatro pneus',           11),
(NULL, '2024-01-10', '2024-01-12', 360, 'Troca do sistema de frenagem',      9),
(NULL, '2024-01-15', '2024-01-19', 400, 'Troca do sistema de resfriamento', 10),
(NULL, '2024-01-25', '2024-01-29',  150, 'Troca do motor', 					12),
(NULL, '2024-01-29', '2024-01-31',  220, 'Troca da bateria', 				13),
(NULL, '2024-02-01', '2024-02-02',  150, 'Troca do motor',				    14),
(NULL, '2024-02-03', '2024-02-03',  89, 'Troca de óleo',                    15),
(NULL, '2024-02-03', '2024-02-03',  89, 'Troca de óleo',                    16),
(NULL, '2024-02-03', '2024-02-03',  150, 'Troca do motor',                  17),
(NULL, '2024-02-03', '2024-02-03',  220, 'Troca da bateria',                18),
(NULL, '2024-02-05', '2024-02-06',  89, 'Troca de óleo',                    19),
(NULL, '2024-02-05', '2024-02-06',  220, 'Troca da bateria',                20),
(NULL, '2024-02-08', '2024-02-09',  89, 'Troca de óleo',                    21),
(NULL, '2024-02-09', '2024-02-10',  150, 'Troca do motor',                  22);

SHOW TABLES; 

/* INSERINDO OS DADOS REFERENTE A COR E A TEXTURA DOS CARROS, REFERENCIANDO O ID DO CARRO */

DESC COR;
INSERT INTO COR(IDCOR, COR, TEXTURA, ID_CARRO) 
VALUES
(NULL, 'Amarelo', 		     'Liso', 			 1),
(NULL, 'Roxo',			     'Metalizado',		 2),
(NULL, 'Verde',			     'Fosco',			 3),
(NULL, 'Preto',			     'Metalizado',		 4),
(NULL, 'Cinza',		         'Fosco',			 5),
(NULL, 'Laranja', 		     'Metalizada',		 6),
(NULL, 'Marron',		     'Aveludada',		 7),
(NULL, 'Vermelho', 		     'Metalizado',		 8),
(NULL, 'Ciano',			     'Metalizado',  	 9),
(NULL, 'Azul-Marinho',       'Liso',		    10),
(NULL, 'Azul-Bebê',		     'Aveludado',	    11),
(NULL, 'Verde Escuro',	     'Liso',		    12),
(NULL, 'Magenta',		     'Fosco',			13),
(NULL, 'Verde-Petróleo',      'Liso',			14),
(NULL, 'Rosa Claro', 	      'Aveludado',		15),
(NULL, 'Rosa Pink',		      'Liso',			16),
(NULL, 'Vermelho Carmin',     'Metalizado', 	17),
(NULL, 'Vermelho Escarlatte', 'Metalizado', 	18),
(NULL, 'Dourado',			  'Metalizado',		19),
(NULL, 'Violeta',			  'Liso',			20),
(NULL, 'Vermelho',			  'Liso',			21),
(NULL, 'Mocca', 			  'Fosco',			22),
(NULL, 'Turquesa',			  'Liso',			23),
(NULL, 'Branco',			  'Metalizado',		24),
(NULL, 'Índigo', 			  'Liso',			25),
(NULL, 'Lavanda',			  'Metalizado',		26),
(NULL, 'Verde-Oliva',		  'Liso',			27),
(NULL, 'Bege',				  'Metalizado',		28),
(NULL, 'Borgonha',			  'Liso',			29),
(NULL, 'Caramelo',			  'Fosco',			30),
(NULL, 'Cereja',			  'Metalizado',		31),
(NULL, 'Champanhe',		      'Liso',			32),
(NULL, 'Âmbar',				  'Metalizado',		33),
(NULL, 'Coral',				  'Liso', 			34),
(NULL, 'Bronze',			  'Metalizado', 	35),
(NULL, 'Verde-Água',		  'Liso',			36),
(NULL, 'Esmeralda',			  'Metalizado',		37),
(NULL, 'Fúcsia',			  'Metalizado',		38),
(NULL, 'Jade',				  'Metalizado',     39),
(NULL, 'Pérola',			  'Metalizado',		40),
(NULL, 'Rubi', 				  'Liso',			41),
(NULL, 'Rubi',				  'Metalizado',		42),
(NULL, 'Salmão',			  'Liso',			43),
(NULL, 'Platina',			  'Metalizado',		44),
(NULL, 'Bordô',				  'Metalizado',		45),
(NULL, 'Canela',			  'Fosco',			46),
(NULL, 'Zafira',			  'Metalizado',		47),
(NULL, 'Celeste',			  'Metalizado',		48),
(NULL, 'Azul-Celeste',		  'Metalizado',		49),
(NULL, 'Verde-Musgo',		  'Fosco',			50),
(NULL, 'Verde-Musgo',		  'Metalizado',		51),
(NULL, 'Vinho',			      'Metalizado',		52),
(NULL, 'Terracota',			  'Liso',			53),
(NULL, 'Terracota', 		  'Metalizado',		54),
(NULL, 'Sépia',				  'Fosco',			55),
(NULL, 'Vermelho Carmin',     'Fosco',			56),
(NULL, 'Vermelho', 			  'Liso',			57),
(NULL, 'Sépia',				  'Metalizado',		58),
(NULL, 'Violeta',			  'Metalizado',		59),
(NULL, 'Verde Escuro',		  'Fosco',			60),
(NULL, 'Preto',				  'Fosco',			61);

/* INSERINDO OS DADOS QUE FALTAVAM NA TABELA DE SERVIÇOS FEITOS NOS CARROS, REFERENTE AO ID DO CARRO */

INSERT INTO SERVICO(IDSERVICO, DATA_ENTRADA, DATA_SAIDA, VALOR, DESCRICAO, ID_CARRO) VALUES
(NULL, '2024-01-14', '2024-01-16', 89, 'Troca de óleo', 					 23),
(NULL, '2024-01-21', '2024-01-24', 55, 'Calibragem de Pneu',	    		 24),
(NULL, '2024-01-01', '2024-01-03', 150, 'Troca do motor',           		 25),
(NULL, '2024-01-05', '2024-01-09', 89,  'Conserto do Retrovisor',   		 26),
(NULL, '2024-01-25', '2024-01-28', 87,  'Troca de lâmpada',         		 27),
(NULL, '2024-01-01', '2024-01-05', 89, 'Troca de óleo',         	         28),
(NULL, '2024-01-05', '2024-01-05', 87, 'Troca de lâmpada',     			     29),
(NULL, '2024-01-07', '2024-01-08', 129 , 'Troca de dois pneus',       		 30),
(NULL, '2024-01-08', '2024-01-10', 258, 'Troca dos quatro pneus',            31),
(NULL, '2024-01-10', '2024-01-12', 360, 'Troca do sistema de frenagem',      32),
(NULL, '2024-01-15', '2024-01-19', 400, 'Troca do sistema de resfriamento',  33),
(NULL, '2024-01-25', '2024-01-29',  150, 'Troca do motor', 					 34),
(NULL, '2024-01-29', '2024-01-31',  220, 'Troca da bateria', 				 35),
(NULL, '2024-02-01', '2024-02-02',  150, 'Troca do motor',				     36),
(NULL, '2024-02-03', '2024-02-03',  89, 'Troca de óleo',                     37),
(NULL, '2024-02-03', '2024-02-03',  89, 'Troca de óleo',                     38),
(NULL, '2024-02-03', '2024-02-03',  150, 'Troca do motor',                   39),
(NULL, '2024-02-03', '2024-02-03',  220, 'Troca da bateria',                 40),
(NULL, '2024-02-05', '2024-02-06',  89, 'Troca de óleo',                     41),
(NULL, '2024-02-05', '2024-02-06',  220, 'Troca da bateria',                 42),
(NULL, '2024-02-08', '2024-02-09',  89, 'Troca de óleo',                     43),
(NULL, '2024-02-09', '2024-02-10',  150, 'Troca do motor',                   44),
(NULL, '2024-01-14', '2024-01-16', 89, 'Troca de óleo', 					 45),
(NULL, '2024-01-21', '2024-01-24', 55, 'Calibragem de Pneu',	    		 46),
(NULL, '2024-01-01', '2024-01-03', 150, 'Troca do motor',           		 47),
(NULL, '2024-01-05', '2024-01-09', 89,  'Conserto do Retrovisor',   		 48),
(NULL, '2024-01-25', '2024-01-28', 87,  'Troca de lâmpada',         		 49),
(NULL, '2024-01-01', '2024-01-05', 89, 'Troca de óleo',         	         50),
(NULL, '2024-01-05', '2024-01-05', 87, 'Troca de lâmpada',     			     51),
(NULL, '2024-01-07', '2024-01-08', 129 , 'Troca de dois pneus',       		 52),
(NULL, '2024-01-08', '2024-01-10', 258, 'Troca dos quatro pneus',            53),
(NULL, '2024-01-10', '2024-01-12', 360, 'Troca do sistema de frenagem',      54),
(NULL, '2024-01-15', '2024-01-19', 400, 'Troca do sistema de resfriamento',  55),
(NULL, '2024-01-25', '2024-01-29',  150, 'Troca do motor', 					 56),
(NULL, '2024-01-29', '2024-01-31',  220, 'Troca da bateria', 				 57),
(NULL, '2024-02-01', '2024-02-02',  150, 'Troca do motor',				     58),
(NULL, '2024-02-03', '2024-02-03',  89, 'Troca de óleo',                     59),
(NULL, '2024-02-03', '2024-02-03',  89, 'Troca de óleo',                     60),
(NULL, '2024-02-03', '2024-02-03',  150, 'Troca do motor',                   61);

/* INSERINDO TODOS OS DADOS DA TABELA TELEFONE */

DESC TELEFONE;
INSERT INTO TELEFONE(IDTELEFONE, TIPO, DDD, TELEFONE, ID_CLIENTE) VALUES
(NULL, 'CELULAR', 	  44,		'525254698',	  1),
(NULL, 'CELULAR', 	  43, 	    '789654123', 	  2),
(NULL, 'CELULAR', 	  44,		'545464646',	  3),
(NULL, 'COMERCIAL',   41,		'34325169',		  4),
(NULL, 'CELULAR', 	  41,		'696987541',	  5),
(NULL, 'CELULAR',	  43,		'757575757',	  6),
(NULL, 'CELULAR',	  44,		'111111111',	  7),
(NULL, 'CELULAR',	  41,		'101010101',	  8),
(NULL, 'CELULAR',	  42,		'000000000',	  9),
(NULL, 'CELULAR',     41,		'000000000',     10),
(NULL, 'CELULAR',	  48,		'000000000',	 11),
(NULL, 'CELULAR',     49,       '121010101',     12),
(NULL, 'CELULAR',     41,		'687841265',	 13),
(NULL, 'CELULAR',     42, 		'365412365',     14),
(NULL, 'CELULAR',     41,       '987412465',     15),
(NULL, 'CELULAR',     43, 		'541254123',     16),
(NULL, 'CELULAR',     44,       '651235463',	 17),
(NULL, 'CELULAR',     45,       '000000000',     18),
(NULL, 'CELULAR',     43,		'642642566',     19),
(NULL, 'CELULAR',     44,       '356565666',	 20),
(NULL, 'CELULAR',     47,		'351779873',     21),
(NULL, 'CELULAR',     41,		'646548528',	 22),
(NULL, 'CELULAR',     41,       '984123565',     23),
(NULL, 'CELULAR',     48,		'542654126',     24),
(NULL, 'CELULAR',	  49,       '984566566',     25),
(NULL, 'CELULAR',     41,       '987456523',	 26),
(NULL, 'CELULAR',     42,		'654126546',     27),
(NULL, 'CELULAR',     43,		'654326524',	 28),
(NULL, 'CELULAR',	  44,       '321456246',     29),
(NULL, 'CELULAR',     41,       '321456666',	 30),
(NULL, 'CELULAR',     42,		'362465655',     31),
(NULL, 'CELULAR',     41,       '875222246',     32),
(NULL, 'CELULAR',     43,       '222222222',     33),
(NULL, 'CELULAR',     44,       '333333333',     34),
(NULL, 'CELULAR',     41,       '444444444',     35),
(NULL, 'CELULAR',     43,       '555555555',     36),
(NULL, 'CELULAR',     48,		'666666669',     37),
(NULL, 'CELULAR',     41,       '777777777',     38),
(NULL, 'CELULAR',     42,       '888888888',     39),
(NULL, 'CELULAR',     43,       '999999999',	 40),
(NULL, 'CELULAR',     44,       '141414141',     41),
(NULL, 'CELULAR',     48,       '643526586',     42),
(NULL, 'CELULAR',     49,       '712425136',     43),
(NULL, 'CELULAR',     41,       '323232323',     44),
(NULL, 'CELULAR',     42,		'857548547',     45),
(NULL, 'CELULAR',     41,       '545546556',     46),
(NULL, 'CELULAR',     43,       '874747474',     47),
(NULL, 'CELULAR',     47,       '000000000',     48),
(NULL, 'CELULAR',     47,       '444444444',     49),
(NULL, 'CELULAR',     41,       '878787888',	 50),
(NULL, 'CELULAR',     42, 		'757563215',     51),
(NULL, 'CELULAR',     43,       '130101010',     52),
(NULL, 'CELULAR',     51,       '000000000',     53),
(NULL, 'CELULAR',     52,       '001010000',     54),
(NULL, 'CELULAR',     53,       '005000200',     55),
(NULL, 'CELULAR',     49,       '020022000',     56),
(NULL, 'CELULAR',     47,       '000005000',     57),
(NULL, 'CELULAR',     53,       '000000000',     58),
(NULL, 'CELULAR',     51,       '999999999',     59),
(NULL, 'CELULAR',     43,       '090000000',     60),
(NULL, 'CELULAR',     41,       '808080800',     61);


/* QUERY QUE UNE TODAS AS TABELAS DO BANCO DE DADOS */

SELECT CLIENTE.NOME,  		 CLIENTE.CPF,         CLIENTE.SEXO,
	   TELEFONE.TIPO, 		 TELEFONE.DDD,        TELEFONE.TELEFONE,
       CARRO.MARCA,   		 CARRO.MODELO,        CARRO.PLACA,
       COR.COR,		  		 COR.TEXTURA,  
       SERVICO.DATA_ENTRADA, SERVICO.DATA_SAIDA,  SERVICO.VALOR,     SERVICO.DESCRICAO
FROM CLIENTE 
INNER JOIN TELEFONE ON IDCLIENTE = ID_CLIENTE
INNER JOIN CARRO ON CARRO.ID_CLIENTE = IDCLIENTE
INNER JOIN COR ON COR.ID_CARRO = CARRO.IDCARRO
INNER JOIN SERVICO ON SERVICO.ID_CARRO = CARRO.IDCARRO;

/* QUERY QUE UNE TODAS AS TABELAS DE INFORMAÇÕES DE CLIENTES MULHERES */

SELECT CLIENTE.NOME,  		 CLIENTE.CPF,         CLIENTE.SEXO,
	   TELEFONE.TIPO, 		 TELEFONE.DDD,        TELEFONE.TELEFONE,
       CARRO.MARCA,   		 CARRO.MODELO,        CARRO.PLACA,
       COR.COR,		  		 COR.TEXTURA,  
       SERVICO.DATA_ENTRADA, SERVICO.DATA_SAIDA,  SERVICO.VALOR,     SERVICO.DESCRICAO
FROM CLIENTE 
INNER JOIN TELEFONE ON IDCLIENTE = ID_CLIENTE
INNER JOIN CARRO ON CARRO.ID_CLIENTE = IDCLIENTE
INNER JOIN COR ON COR.ID_CARRO = CARRO.IDCARRO
INNER JOIN SERVICO ON SERVICO.ID_CARRO = CARRO.IDCARRO 
WHERE SEXO = 'F';

/* QUERY QUE UNE TODAS AS TABELAS DE INFORMAÇÕES DE CLIENTES HOMENS */

SELECT CLIENTE.NOME,  		 CLIENTE.CPF,         CLIENTE.SEXO,
	   TELEFONE.TIPO, 		 TELEFONE.DDD,        TELEFONE.TELEFONE,
       CARRO.MARCA,   		 CARRO.MODELO,        CARRO.PLACA,
       COR.COR,		  		 COR.TEXTURA,  
       SERVICO.DATA_ENTRADA, SERVICO.DATA_SAIDA,  SERVICO.VALOR,     SERVICO.DESCRICAO
FROM CLIENTE 
INNER JOIN TELEFONE ON IDCLIENTE = ID_CLIENTE
INNER JOIN CARRO ON CARRO.ID_CLIENTE = IDCLIENTE
INNER JOIN COR ON COR.ID_CARRO = CARRO.IDCARRO
INNER JOIN SERVICO ON SERVICO.ID_CARRO = CARRO.IDCARRO 
WHERE SEXO = 'M';
