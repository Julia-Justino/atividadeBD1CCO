CREATE DATABASE bdAluno_projeto;
USE bdAluno_projeto;

CREATE TABLE tbProjeto (
	idProjeto INT PRIMARY KEY AUTO_INCREMENT,
    nomeProjeto VARCHAR(45),
    descricaoProjeto VARCHAR (45)
);

CREATE TABLE tbTelefone (
	idTelefone INT PRIMARY KEY AUTO_INCREMENT,
    numeroTelefone VARCHAR(25),
    operadoraTelefone VARCHAR(25)
);

CREATE TABLE tbAluno (
	idAluno INT PRIMARY KEY AUTO_INCREMENT,
    nomeAluno  VARCHAR(45),
    fkRepresentante INT,
					FOREIGN KEY(fkRepresentante) REFERENCES tbAluno(idAluno),
	fkProjeto INT,
				FOREIGN KEY (fkProjeto) REFERENCES tbProjeto(idProjeto),
	fkTelefone INT,
				FOREIGN KEY(fkTelefone) REFERENCES tbTelefone(idTelefone)
);

CREATE TABLE tbAcon (
	idAcon INT PRIMARY KEY AUTO_INCREMENT,
    nomeAcon VARCHAR(45),
    grauAcon VARCHAR(45),
	fkAluno INT,
			FOREIGN KEY(fkAluno) REFERENCES tbAluno(idAluno),
	fkTelefone INT,
				FOREIGN KEY(fkTelefone) REFERENCES tbTelefone(idTelefone)
);

INSERT INTO tbTelefone VALUES (NULL, "(87) 99184-7013", "Claro"),
							  (NULL, "(71) 98115-2823", "Tim"),
                              (NULL, "(47) 98216-6675", "Tim"),
                              (NULL, "(87) 11184-7013", "Claro"),
							  (NULL, "(71) 22115-2823", "Oi"),
                              (NULL, "(47) 33216-6675", "Tim");
                              
INSERT INTO tbProjeto VALUES (NULL, "VinTech", "Projeto para registrar temperatura"),
							 (NULL, "FrozenTime", "Projeto para registrar temperatura"),
                             (NULL, "COAA", "Projeto para registrar movimento"),
                             (NULL, "Wonti", "Projeto de oportunidades para mulheres");
                             
INSERT INTO tbAluno VALUES  (NULL,"Ana Canoa",null, 1,1);
INSERT INTO tbAluno VALUES  (NULL,"Bruno Canoa",1, 2,2),
							(NULL,"Diego Lopez",1, 3,4);
                            
INSERT INTO tbAcon VALUES (NULL, "Paula Canoa", "Mãe" , 1, 3),
						  (NULL, "Rafael Canoa", "Pai" , 2, 5),
                          (NULL, "Julia Lopez", "Mãe" , 3, 6);

SELECT * FROM tbTelefone;
SELECT * FROM tbProjeto;
SELECT * FROM tbAluno;
SELECT * FROM tbAcon;

-- ) Exibir os dados dos alunos e dos projetos correspondentes.

SELECT * FROM tbAluno JOIN tbProjeto ON fkProjeto = idProjeto;
 
--  Exibir os dados dos alunos e dos seus acompanhantes.
SELECT * FROM tbAluno JOIN tbAcon ON fkAluno= idAluno;

--  Exibir os dados dos alunos e dos seus representantes.
SELECT * FROM tbAluno;

--  Exibir os dados dos alunos e dos projetos correspondentes, mas somente de um 
-- determinado projeto (indicar o nome do projeto na consulta)

SELECT * FROM tbAluno JOIN tbProjeto ON fkProjeto = idProjeto WHERE nomeProjeto = "FrozenTime";

-- Exibir os dados dos alunos, dos projetos correspondentes e dos seus acompanhantes
SELECT * FROM tbAluno JOIN tbProjeto ON fkProjeto = idProjeto
 JOIN tbAcon ON fkAluno= idAluno;

                        
                      
                      
					
