-- Criação do Banco de Dados Mercearia.
CREATE DATABASE MERCEARIA;

-- Criação da tabela Fornecedor e seus atributos.
CREATE TABLE FORNECEDOR (
    	NOME_MARCA VARCHAR(50) NOT NULL,
    	TELEFONE_FR VARCHAR(12) NOT NULL,
    	CNPJ VARCHAR(14) NOT NULL,
	CONSTRAINT PK_NOME_MARCA PRIMARY KEY (NOME_MARCA)
	
);
-- Criação da tabela Produto e seus atributos. 
CREATE TABLE PRODUTO (
	NOME_PD VARCHAR(50) NOT NULL,
	NOME_MARCA VARCHAR(50) NOT NULL,
    	VALIDADE DATE NOT NULL,
    	QUANTIDADE INT NULL,
    	CONSTRAINT PK_NOME_PD PRIMARY KEY (NOME_PD),
	CONSTRAINT FK_NOME_MARCA FOREIGN KEY (NOME_MARCA) REFERENCES FORNECEDOR (NOME_MARCA)

);
-- Criação da tabela Produto e seus atributos.
CREATE TABLE ENCOMENDA (
	CODIGO_EN INT NOT NULL,
	NOME_MARCA VARCHAR(50) NOT NULL,
	NOME_PD VARCHAR(50) NOT NULL,
	QUANTIDADE_EN INT NULL,
	DATA_PEDIDO DATE NOT NULL,
	DATA_ENVIO DATE NULL,
	CONSTRAINT PK_CODIGO_EN PRIMARY KEY (CODIGO_EN),
	CONSTRAINT FK_NOME_MARCA FOREIGN KEY (NOME_MARCA) REFERENCES FORNECEDOR (NOME_MARCA),
	CONSTRAINT FK_NOME_PD FOREIGN KEY (NOME_PD) REFERENCES PRODUTO (NOME_PD)
);
-- Criação da tabela Danificado e seus atributos.
CREATE TABLE DANIFICADO (
	DNFCD_CODIGO INT NOT NULL,
	NOME_MARCA VARCHAR(50) NOT NULL,
	NOME_PD VARCHAR(50) NOT NULL,
	DESCRICAO VARCHAR(100) NULL,
	CONSTRAINT PK_DNFCD_PRODUTO PRIMARY KEY (DNFCD_CODIGO),
	CONSTRAINT FK_NOME_MARCA FOREIGN KEY (NOME_MARCA) REFERENCES FORNECEDOR (NOME_MARCA),
	CONSTRAINT FK_NOME_PD FOREIGN KEY (NOME_PD) REFERENCES PRODUTO (NOME_PD)
);
-- Criação da tabela Fora de Validade e seus atributos.
CREATE TABLE VALIDADE_OUT (
	VLDD_CODIGO INT NOT NULL,
	NOME_PD VARCHAR(50) NOT NULL,
	VALIDADE DATE NOT NULL,
	CONSTRAINT PK_VLDD_CODIGO PRIMARY KEY (VLDD_CODIGO),
	CONSTRAINT FK_NOME_PD FOREIGN KEY (NOME_PD) REFERENCES PRODUTO (NOME_PD)
);
