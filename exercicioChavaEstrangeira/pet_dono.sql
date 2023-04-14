CREATE DATABASE bdPetShop;
USE bdPetShop;
-- - Criar as tabelas equivalentes à modelagem. 
CREATE TABLE tbDono (
	idDono INT PRIMARY KEY AUTO_INCREMENT,
    nomeDono VARCHAR(45),
    endereco VARCHAR(50),
    telefoneFixo VARCHAR(50),
    telefoneCelular VARCHAR(50)
);
CREATE TABLE tbPet (
	idPet INT PRIMARY KEY AUTO_INCREMENT,
    nomePet VARCHAR(45),
    pesoPet VARCHAR(45),
    tipoPet VARCHAR(45),
    racaPet VARCHAR(45),
    fkDono INT,
    FOREIGN KEY (fkDono) REFERENCES tbDono(idDono)
)AUTO_INCREMENT = 101;

DESC tbDono;

SELECT * FROM tbPet;
-- -Inserir dados nas tabelas, de forma que exista mais de um tipo de animal diferente, e que
-- exista algum cliente com mais de um pet cadastrado. 
INSERT INTO tbDono VALUES (NULL, "Daniel Dias", "Rua abs, N° 200", "12345678910", "123456789"),
						  (NULL, "Bruna Souza", "Rua janelas, N° 1000","10987456321", "987456321"),
                          (NULL, "Bianca Carneiro", "Rua das flores, N° 500", "4545454454", "12548794");
    
INSERT INTO tbDono VALUES (NULL, "Daniela Dias", "Rua guerra, N° 250", "12555555110", "45654789"),
						  (NULL, "Rosa Rosalinda", "Rua da paz, N° 690","1094524521", "945245256321"),
                          (NULL, "Bianca Buarque", "Rua da pomba, N° 580", "454244354242454", "5478424553578");
DESC tbPet;
INSERT INTO tbPet VALUES (NULL, "Pipoca", "8 - Quilos", "Cachorro", "Dogue alemão", 1),
						 (NULL, "Melo", "10 - Quilos", "Cachorro","Golden retriever", 1),
                         (NULL, "Livia", "5 - Quilos", "Cobra", "Mamba-Negra", 1),
                         (NULL, "Lara", "9 - Quilos", "Gato", "Ashera", 2),
                         (NULL, "Dumbo", "1 - Tonelada", "Elefante", "Loxodonta africana", 2),
                         (NULL, "Babi", "30 - Quilos", "Cavalo","Campolina",3);
                         
INSERT INTO tbPet VALUES (NULL, "Paçoca", "8 - Quilos", "Cachorro", "Dogue alemão", 3),
						 (NULL, "Midinho", "10 - Quilos", "Cachorro","Golden retriever", 2);

-- - Exibir todos os dados de cada tabela criada, separadamente.
select * from tbDono;
SELECT * FROM tbPet;

-- - Altere o tamanho da coluna nome do cliente.
alter table tbDono modify nomeDono varchar(55);

-- Exibir os dados de todos os pets que são de um determinado tipo (por exemplo: cachorro).
SELECT * FROM tbPet WHERE tipoPet LIKE '%Cachorro%';

-- - Exibir apenas os nomes e os pesos dos pets.
SELECT nomePet, pesoPet FROM tbPet;

-- Exibir os dados dos pets ordenados em ordem crescente pelo nome
SELECT * FROM tbPet ORDER BY nomePet ASC;

-- Exibir os dados dos clientes ordenados em ordem decrescente pelo bairro ( irei fazer pela rua)
SELECT * FROM tbDono ORDER BY endereco DESC;

-- Exibir os dados dos pets cujo nome comece com uma determinada letra.	
SELECT * FROM tbPet WHERE nomePet LIKE 'P%';

-- Exibir os dados dos clientes que tenham um determinado sobrenome.
SELECT * FROM tbDono WHERE nomeDono LIKE '%_Dias';

-- Alterar o telefone de um determinado cliente.
UPDATE tbDono SET telefoneFixo = "4544879879454" WHERE idDono = 3;

-- - Exibir os dados dos clientes para verificar se alterou.
SELECT * FROM tbDono;
SELECT * FROM tbPet;
-- - Exibir os dados dos pets e dos seus respectivos donos
SELECT * FROM tbPet JOIN tbDono ON fkDono = idDono;

-- Exibir os dados dos pets e dos seus respectivos donos, mas somente de um determinado
-- cliente (informar o nome do cliente na consulta).
SELECT * FROM tbPet JOIN tbDono ON fkDono = idDono WHERE idDono = 1;

-- Exibir os dados dos pets e dos seus respectivos donos, mas somente de um determinado
-- cliente (informar um dos telefones do cliente na consulta).

SELECT idDono, nomeDono, endereco,telefoneCelular FROM tbPet JOIN tbDono ON fkDono = idDono WHERE idDono = 1;

-- Excluir algum pet.
DELETE FROM tbPet WHERE idPet = 102;

-- - Exibir os dados dos pets para verificar se excluiu.
SELECT * FROM tbPet;

-- Excluir as tabelas.
DROP TABLE tbPet;
DROP TABLE tbDono;