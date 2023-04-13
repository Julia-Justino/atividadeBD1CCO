CREATE DATABASE bdGastos;
USE bdGastos;

CREATE TABLE tbPessoa (
	idPessoa INT PRIMARY KEY AUTO_INCREMENT,
    nomePessoa VARCHAR(45),
    dataNascimento date,
    profissaoPessoa VARCHAR(50),
   idiomaPessoa VARCHAR(50) 
);

CREATE TABLE tbGastos(
	idGastos INT PRIMARY KEY AUTO_INCREMENT,
    dataGasto DATE,
    valorGastos DECIMAL,
    descricaoGastos VARCHAR(50),
    fkPessoa INT,
    FOREIGN KEY (fkPessoa) REFERENCES tbPessoa(idPessoa)
);

-- Insira dados nas tabelas
-- Exiba os dados de cada tabela individualmente.

INSERT INTO tbPessoa VALUES (NULL, "Mariana Lopez", "1985-08-20", "Professora","Português"),
							(NULL, "Carla Lopez", "2005-02-17", "Estudante", "Inglês"),
                            (NULL, "Yan Lopez", "1980-01-20", "Médico","Inglês"),
                            (NULL, "Diego Gomes", "2004-08-15", "Técnico em Desenvolvimento de sistemas", "Português");
                            
                            SELECT * FROM tbPessoa;
                            
INSERT INTO tbGastos VALUES (NULL, "23-04-11", 1500, "Novo celular", 4),
							(NULL, "23-02-25", 20, "Almoço",1),
                            (NULL, "23-03-12", 1500, "Almoço", 3),
                            (NULL, "23-04-12", 500, "Livros para faculdade", 2),
                            (NULL, "23-03-12", 500, "Lanche", 3);
                            
                            SELECT * FROM tbGastos;
-- Exiba os dados da tabela Pessoa, mas filtrando por algum dado da tabela (por
-- exemplo, as pessoas de alguma profissão, etc).

SELECT * FROM tbPessoa WHERE idiomaPessoa = 'PORTUGUÊS';

-- Exiba os dados da tabela Gasto, de forma que os gastos mais recentes apareçam primeiro.
SELECT * FROM tbGastos ORDER BY dataGasto DESC;

--  Exiba os dados das pessoas e dos seus gastos correspondentes.
SELECT * FROM tbGastos JOIN tbPessoa ON fkpessoa = idPessoa WHERE idPessoa = 1;

-- Exiba os dados das pessoas e dos seus gastos correspondentes, mas somente de
-- uma determinada data.
SELECT * FROM tbGastos JOIN tbPessoa ON fkpessoa = idPessoa WHERE dataGasto = "2023-02-25";

-- Atualize valores já inseridos na tabela.
UPDATE tbGastos SET descricaoGastos = "Lanche no hospital" WHERE idgastos = 5;

-- Exclua um ou mais registros de alguma tabela.
DELETE FROM tbGastos WHERE idGastos = 2;
