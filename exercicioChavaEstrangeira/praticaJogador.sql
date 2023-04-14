CREATE DATABASE bdPraticaJogador;
USE bdPraticaJogador;

CREATE TABLE tbTime (
	idTime INT PRIMARY KEY AUTO_INCREMENT,
    nomeTime VARCHAR (45),
    nomeTecnico VARCHAR(45),
    dataFormacao DATE
);

CREATE TABLE tbJogador (
	idJogador INT PRIMARY KEY AUTO_INCREMENT,
    nomeJogador VARCHAR(45),
    posicaoJogador VARCHAR(45),
	salario DECIMAL CHECK (salario > 0),
	fkJogadorConselheiro INT,
					FOREIGN KEY(fkJogadorConselheiro ) 
                    REFERENCES tbJogador(idJogador)
);

CREATE TABLE tbSeguidor(
	fkJogador INT,
				FOREIGN KEY(fkJogador) 
                REFERENCES tbJogador(idJogador),
	idSeguidor INT,
    PRIMARY KEY(fkJogador, idSeguidor),
    nickname VARCHAR(45),
    sexo CHAR(1) CHECK(sexo IN ('m','f','n'))
);
-- (NULL, "","","")
INSERT INTO tbTime VALUES (NULL, "São Paulo","FGFHT","1980-11-20"),
						  (NULL, "Palmeiras","dgdgd","1950-05-16"),
                          (NULL, "fdsxfgdfg","thyrhr","1590-05-20");
                          
INSERT INTO tbJogador VALUES (NULL, "Daniel dias","Goleiro",1500, null);
INSERT INTO tbJogador VALUES (NULL, "João de Paula","Zagueiro",1500, 1),
							 (NULL, "Bruno dias","Atacante",1500, 1),
                             (NULL, "Samuel Oliveira","Atacante",1500, 1);
 
 DESC tbSeguidor;
INSERT INTO tbSeguidor VALUES (1, 1, "HJHJHJHJ", "m"),
							  (1, 2, "KLKLKLKLK", "f"),
                              (2, 3, "WSFWESTHJ", "m"),
                              (2, 4, "ÇAÇAÇAÇAAJ", "f"),
                              (3, 5, "LALALALA", "m"),
                              (3, 6, "PAPAPAAPA", "f"),
                              (4, 7, "LALAPAPA", "m"),
                              (4, 8, "LAPALAALAPAL", "f");
                              
SELECT * FROM tbTime;
SELECT * FROM tbJogador;
SELECT * FROM tbSeguidor;
                              
--   Exibir apenas os nomes dos times e dos técnicos de todos os times 
-- cujo nome começa com uma determinada letra      
SELECT * FROM tbTime WHERE nomeTecnico LIKE 'F%';  

--  Exibir todos os dados dos jogadores em ordem decrescente pela posição
SELECT * FROM tbJogador ORDER BY posicaoJogador DESC;   

SELECT * FROM tbJogador WHERE posicaoJogador = "ATACANTE";    
  
--  Exibir os dados dos times em que o técnico 
-- tenha a 2a letra de trás para frente igual a uma determinada letra.            
SELECT * FROM tbTime WHERE nomeTecnico LIKE '%H_';

-- Exibir os dados dos times em ordem crescente pelo nome do técnico.
  SELECT * FROM tbTime ORDER BY nomeTecnico ASC;  
  
  -- Exibir os dados dos times em ordem decrescente pela data de fundação do time.