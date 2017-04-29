CREATE TABLE Banco (
 nomeBanco VARCHAR(100),
 agencia INT,
 numConta INT,
 nome VARCHAR(100)
);


CREATE TABLE Conta (
 agencia INT NOT NULL,
 numConta INT NOT NULL,
 nome VARCHAR(100) NOT NULL
);

ALTER TABLE Conta ADD CONSTRAINT PK_Conta PRIMARY KEY (agencia,numConta,nome);


CREATE TABLE Pessoa (
 nome VARCHAR(100) NOT NULL
);

ALTER TABLE Pessoa ADD CONSTRAINT PK_Pessoa PRIMARY KEY (nome);


CREATE TABLE Boleto (
 agencia INT NOT NULL,
 numConta INT NOT NULL,
 nome VARCHAR(100) NOT NULL,
 valorBoleto FLOAT(10),
 observacoes VARCHAR(100),
 linhaDigitavel INT,
 dataVencimento DATE,
 CpfCnpjPagador INT,
 dataPagamento DATE,
 valorPago FLOAT(10)
);

ALTER TABLE Boleto ADD CONSTRAINT PK_Boleto PRIMARY KEY (agencia,numConta,nome);


CREATE TABLE Endereco (
 logradouro VARCHAR(100) NOT NULL,
 numero INT NOT NULL,
 nome VARCHAR(100) NOT NULL,
 complemento VARCHAR(100),
 bairro VARCHAR(100),
 cidade VARCHAR(100),
 estado VARCHAR(100)
);

ALTER TABLE Endereco ADD CONSTRAINT PK_Endereco PRIMARY KEY (logradouro,numero,nome);


CREATE TABLE Fisica (
 CPF INT NOT NULL,
 nome VARCHAR(100) NOT NULL
);

ALTER TABLE Fisica ADD CONSTRAINT PK_Fisica PRIMARY KEY (CPF,nome);


CREATE TABLE Juridica (
 CNPJ INT NOT NULL,
 nome VARCHAR(100) NOT NULL
);

ALTER TABLE Juridica ADD CONSTRAINT PK_Juridica PRIMARY KEY (CNPJ,nome);


ALTER TABLE Banco ADD CONSTRAINT FK_Banco_0 FOREIGN KEY (agencia,numConta,nome) REFERENCES Conta (agencia,numConta,nome);


ALTER TABLE Conta ADD CONSTRAINT FK_Conta_0 FOREIGN KEY (nome) REFERENCES Pessoa (nome);


ALTER TABLE Boleto ADD CONSTRAINT FK_Boleto_0 FOREIGN KEY (agencia,numConta,nome) REFERENCES Conta (agencia,numConta,nome);


ALTER TABLE Endereco ADD CONSTRAINT FK_Endereco_0 FOREIGN KEY (nome) REFERENCES Pessoa (nome);


ALTER TABLE Fisica ADD CONSTRAINT FK_Fisica_0 FOREIGN KEY (nome) REFERENCES Pessoa (nome);


ALTER TABLE Juridica ADD CONSTRAINT FK_Juridica_0 FOREIGN KEY (nome) REFERENCES Pessoa (nome);


