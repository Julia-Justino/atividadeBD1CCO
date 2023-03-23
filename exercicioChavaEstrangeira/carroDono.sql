CREATE DATABASE bdCarros;
USE bdCarros;

CREATE TABLE tbDono(
	idDono INT PRIMARY KEY AUTO_INCREMENT,
    nomeDono VARCHAR(45),
    dataNascimento DATETIME,
    salarioDono DECIMAL
);
SELECT * FROM tbDono;

CREATE TABLE tbCarros(
	idCarro INT PRIMARY KEY AUTO_INCREMENT,
    modeloCarro VARCHAR(45),
    placaCarro CHAR(7),
    anoFabricacao YEAR,
    fkDono INT,
		FOREIGN KEY(fkDono) REFERENCES tbDono(idDono)
)AUTO_INCREMENT = 101;
SELECT * FROM tbCarros;

INSERT INTO tbDono VALUES (NULL, 'Luana Dias', '2004-02-12', 2200),
						  (NULL, 'João Vitor', '2000-03-10', 1500),
                          (NULL, 'Diego Gomes', '2005-05-12', 5000);
                          
INSERT INTO  tbcarros  VALUES   (NULL, 'UNO','12345ABC','2012',1 ),
								(NULL, 'Siena','ABCDE12','2015',1),
                                (NULL, 'HB20','EFGHIJ9','2020',2),
                                (NULL, 'Corsa Sedan','NMOP569','2009',2),
                                (NULL, 'City','12546L2','2023',3 );
                                
SELECT * FROM tbDono ORDER BY dataNascimento DESC;
SELECT * FROM tbCarros WHERE placaCarro LIKE '%2';
SELECT * FROM tbCarros WHERE modeloCarro = 'UNO';
DESC tbCarros;
ALTER TABLE tbCarros MODIFY modeloCarro VARCHAR (50);
DESC tbCarros;
select * from Aluno, Curso where fkCurso = idCurso; 
SELECT * FROM tbCarros, tbDono WHERE fkDono = idDono AND fkDono = 2;
SELECT * FROM tbCarros, tbDono WHERE fkDono = idDono AND nomeDono = 'Luana Dias';
SELECT * FROM tbCarros, tbDono WHERE fkDono = idDono AND modeloCarro = 'City';
SELECT * FROM tbCarros, tbDono WHERE fkDono = idDono AND placaCarro LIKE '1%';

DROP TABLE tbCarros;
DROP TABLE tbDono;