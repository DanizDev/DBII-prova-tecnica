CREATE DATABASE lojaPascotto;

USE lojaPascotto;

CREATE TABLE produtos(
	idProduto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR (255) NOT NULL,
    preco DOUBLE NOT NULL,
    qtdEstoque DOUBLE NOT NULL,
	id_Fornecedor INT,
    FOREIGN KEY (id_Fornecedor) REFERENCES fornecedores(idFornecedor)
);

CREATE TABLE fornecedores(
	idFornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR (255) NOT NULL,
    CNPJ VARCHAR (255) NOT NULL,
    telefone VARCHAR (255) NOT NULL,
    CPF DOUBLE NOT NULL
);



CREATE TABLE funcionario(
	idFuncionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cargo VARCHAR (255) NOT NULL,
    salario DOUBLE NOT NULL
);

CREATE TABLE pedidos(
	idPedido INT AUTO_INCREMENT PRIMARY KEY,
    dataPedido DATE NOT NULL,
    quantidade DOUBLE NOT NULL,
    id_Funcionario INT,
    id_Produto INT,
    FOREIGN KEY (id_Funcionario) REFERENCES funcionario(idFuncionario),
    FOREIGN KEY (id_Produto) REFERENCES produtos(idProduto)
);

ALTER TABLE fornecedores ADD COLUMN email VARCHAR (255); 
SELECT * FROM fornecedores;

CREATE TABLE categorias(
	idCategoria INT AUTO_INCREMENT PRIMARY KEY,
    nomeCategoria VARCHAR (255) NOT NULL
);

ALTER TABLE pedidos ADD COLUMN id_Categoria INT;
ALTER TABLE pedidos ADD FOREIGN KEY (id_Categoria) REFERENCES categorias(idCategoria);
SELECT * FROM categorias;

SELECT * FROM pedidos;

INSERT INTO produtos(nome, preco,qtdEstoque) VALUES 
('Gin de 10','10','5'),
('Celular', '1000','10');

INSERT INTO fornecedores(nome, telefone, CNPJ, CPF) VALUES 
('Cleiton','11-11111-1111','111-111-111-11','111.111.111-0'),
('Daniel', '22-22222-2222','222-222-222-22','222-222-222-1');

INSERT INTO funcionario(nome, cargo,salario) VALUES 
('Daniel','DEV','1000'),
('Cleiton', 'Suporte','2000');

INSERT INTO pedidos(dataPedido, quantidade) VALUES 
('09-10-2000','10'),
('10-10-2001', '1000');

INSERT INTO categorias(nomeCategoria) VALUES 
('Cleiton'),
('Tecnologia');

SELECT * FROM produtos;
SELECT * FROM categorias;
SELECT * FROM funcionario;
SELECT * FROM pedidos;
SELECT * FROM fornecedores;

UPDATE funcionario SET salario = 2000 WHERE idFuncionario = 1;


SELECT produtos.nome, fornecedores.nome
FROM fornecedores 
INNER JOIN produtos ON produtos.idProduto = fornecedores.idFornecedor;
