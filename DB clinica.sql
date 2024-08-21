CREATE DATABASE clinica;
USE clinica;

#CRIANDO AS TABELAS

CREATE TABLE especialidades 
(
    id_especialidade int(10) ZEROFILL NOT NULL,
    nome VARCHAR(80) NOT NULL,
    descricao VARCHAR(500),
    medico_id int(10) ZEROFILL NOT NULL,
    PRIMARY KEY (id_especialidade)
);

CREATE TABLE medico 
(
    id_medico int(10) ZEROFILL NOT NULL,
    nome VARCHAR(80) NOT NULL,
    especialidade_id int(10) ZEROFILL NOT NULL,
    telefone CHAR(11) NOT NULL,
    email VARCHAR(64),
    PRIMARY KEY (id_medico),
    FOREIGN KEY (especialidade_id) REFERENCES especialidades(id_especialidade)
);

CREATE TABLE paciente
(
    id_paciente int(10) ZEROFILL NOT NULL,
    nome VARCHAR(80) NOT NULL,
    telefone CHAR(11) NOT NULL,
    CPF CHAR(11) NOT NULL UNIQUE,
    consulta_id int(10) ZEROFILL,
    PRIMARY KEY (id_paciente)
);

CREATE TABLE consulta
(
    id_consulta int(10) ZEROFILL NOT NULL,
    medico_id int(10) ZEROFILL NOT NULL,
    paciente_id int(10) ZEROFILL NOT NULL,
    valor_consulta bigint NOT NULL,
    data date,
    PRIMARY KEY (id_consulta),
    FOREIGN KEY (medico_id) REFERENCES medico(id_medico),
    FOREIGN KEY (paciente_id) REFERENCES paciente(id_paciente)
);

#INSERINDO VALORES

INSERT INTO especialidades VALUES
(1,'Oftalmologia','prevenir e tratar problemas dos olhos e estruturas anexas','1'),

(2,'Neurologia','trata doenças no cérebro e medula espinhal, nervos periféricos e músculos','2'),

(3,'Fisioterapia','busca prevenir, tratar e reabilitar disfunções e lesões do movimento humano','3'),

(4,'Endocrinologia','trata do sistema endócrino, suas doenças e suas secreções específicas conhecidas como hormônios','4'),

(5,'Hematologia','estuda e trata doenças do sangue e de órgãos hematopoéticos, onde se formam as células do sangue','5');

INSERT INTO medico VALUES
(1,'Laura Lavinia','1','83929530853','dralauramed@gmail.com'),
(2,'Kaio Vinícios','2','83938801801','drkaiomed@gmail.com'),
(3,'Liz Andrade','3','98924316962','dralizmed@gmail.com'),
(4,'Lídia Vieira','4','64926751534','dralidiamed@gmail.com'),
(5,'Violet Evergarden','5','43926566433','dravioletmed@gmail.com');

INSERT INTO paciente VALUES
(1,'Lucas Rodrigo','83922160602','29280161474','1'),
(2,'Emilly Luna','96926684083','64804815260','2'),
(3,'Kyrea Soares','69936393687','30705238202','3'),
(4,'Victor Eduardo','67938017915','33206014158','4'),
(5,'Maria Nicolly','18922058524','97500931867','5');

INSERT INTO consulta VALUES
(1,'0000000001','0000000001','1000','2024-08-20'),
(2,'0000000002','0000000002','2000','2024-09-25'),
(3,'0000000003','0000000003','2850','2024-07-07'),
(4,'0000000004','0000000004','1485','2024-03-20'),
(5,'0000000005','0000000005','3600','2024-10-12');

#REALIZANDO UM SELECT

SELECT nome FROM medico WHERE telefone LIKE '83%' ORDER BY nome DESC;

#REALIZANDO SELECT COM FUNÇÕES DE AGREGAÇÃO 

SELECT MIN(valor_consulta) FROM consulta;
SELECT MAX(valor_consulta) FROM consulta;
SELECT SUM(valor_consulta) FROM consulta;
SELECT AVG(valor_consulta) FROM consulta;

#ATUALIZANDO UM DADO 

UPDATE consulta
SET data = '2024-07-10'
WHERE consulta.id_consulta = 0000000005;


