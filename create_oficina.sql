CREATE DATABASE oficina;
USE oficina;

-- Tabela Cliente
CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Telefone VARCHAR(45),
    Endereco VARCHAR(255)
);

-- Tabela Veículo
CREATE TABLE Veiculo (
    idVeiculo INT AUTO_INCREMENT PRIMARY KEY,
    Placa VARCHAR(45) UNIQUE NOT NULL,
    Modelo VARCHAR(255) NOT NULL,
    Marca VARCHAR(255) NOT NULL,
    Ano_Fabricacao INT NOT NULL,
    Cliente_idCliente INT NOT NULL,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente) ON DELETE CASCADE
);

-- Tabela Mecânico
CREATE TABLE Mecanico (
    idMecanico INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Endereco VARCHAR(255),
    Especialidade VARCHAR(255) NOT NULL
);

-- Tabela Serviço
CREATE TABLE Servico (
    idServico INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(255) NOT NULL,
    Valor_Servico DECIMAL(10,2) NOT NULL
);

-- Tabela Equipe
CREATE TABLE Equipe (
    idEquipe INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL
);

-- Tabela Ordem de Serviço
CREATE TABLE Ordem_Servico (
    idOrdem_Servico INT AUTO_INCREMENT PRIMARY KEY,
    Data_Emissao DATE NOT NULL,
    Data_Conclusao DATE,
    Valor_Total DECIMAL(10,2),
    Status ENUM('Aberto', 'Em andamento', 'Concluído', 'Cancelado') DEFAULT 'Aberto',
    Veiculo_idVeiculo INT NOT NULL,
    Cliente_idCliente INT NOT NULL,
    FOREIGN KEY (Veiculo_idVeiculo) REFERENCES Veiculo(idVeiculo) ON DELETE CASCADE,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente) ON DELETE CASCADE
);

-- Tabela Peça
CREATE TABLE Peca (
    idPeca INT AUTO_INCREMENT PRIMARY KEY,
    Nome_Peca VARCHAR(255) NOT NULL,
    Valor_Peca DECIMAL(10,2) NOT NULL
);

-- Relacionamento entre Peça e Ordem de Serviço (M:N)
CREATE TABLE Ordem_Servico_Peca (
    Ordem_Servico_idOrdem_Servico INT,
    Peca_idPeca INT,
    Quantidade INT DEFAULT 1,
    PRIMARY KEY (Ordem_Servico_idOrdem_Servico, Peca_idPeca),
    FOREIGN KEY (Ordem_Servico_idOrdem_Servico) REFERENCES Ordem_Servico(idOrdem_Servico) ON DELETE CASCADE,
    FOREIGN KEY (Peca_idPeca) REFERENCES Peca(idPeca) ON DELETE CASCADE
);

-- Relacionamento entre Ordem de Serviço e Serviço (M:N)
CREATE TABLE Ordem_Servico_Servico (
    Ordem_Servico_idOrdem_Servico INT,
    Servico_idServico INT,
    PRIMARY KEY (Ordem_Servico_idOrdem_Servico, Servico_idServico),
    FOREIGN KEY (Ordem_Servico_idOrdem_Servico) REFERENCES Ordem_Servico(idOrdem_Servico) ON DELETE CASCADE,
    FOREIGN KEY (Servico_idServico) REFERENCES Servico(idServico) ON DELETE CASCADE
);

-- Relacionamento entre Equipe e Ordem de Serviço (1:N)
CREATE TABLE Equipe_Ordem_Servico (
    Equipe_idEquipe INT,
    Ordem_Servico_idOrdem_Servico INT,
    PRIMARY KEY (Equipe_idEquipe, Ordem_Servico_idOrdem_Servico),
    FOREIGN KEY (Equipe_idEquipe) REFERENCES Equipe(idEquipe) ON DELETE CASCADE,
    FOREIGN KEY (Ordem_Servico_idOrdem_Servico) REFERENCES Ordem_Servico(idOrdem_Servico) ON DELETE CASCADE
);

-- Relacionamento entre Equipe e Mecânico (M:N)
CREATE TABLE Equipe_has_Mecanico (
    Equipe_idEquipe INT,
    Mecanico_idMecanico INT,
    PRIMARY KEY (Equipe_idEquipe, Mecanico_idMecanico),
    FOREIGN KEY (Equipe_idEquipe) REFERENCES Equipe(idEquipe) ON DELETE CASCADE,
    FOREIGN KEY (Mecanico_idMecanico) REFERENCES Mecanico(idMecanico) ON DELETE CASCADE
);

-- Tabela de Referência de Mão de Obra
CREATE TABLE Referencia_Mao_de_Obra (
    idReferencia_Mao_de_Obra INT AUTO_INCREMENT PRIMARY KEY,
    Servico VARCHAR(255) NOT NULL,
    Valor_Hora DECIMAL(10,2) NOT NULL,
    Especialidade VARCHAR(255) NOT NULL
);

-- Relacionamento entre Referência de Mão de Obra e Serviço (M:N)
CREATE TABLE Referencia_Mao_de_Obra_has_Servico (
    Referencia_Mao_de_Obra_idReferencia_Mao_de_Obra INT,
    Servico_idServico INT,
    PRIMARY KEY (Referencia_Mao_de_Obra_idReferencia_Mao_de_Obra, Servico_idServico),
    FOREIGN KEY (Referencia_Mao_de_Obra_idReferencia_Mao_de_Obra) REFERENCES Referencia_Mao_de_Obra(idReferencia_Mao_de_Obra) ON DELETE CASCADE,
    FOREIGN KEY (Servico_idServico) REFERENCES Servico(idServico) ON DELETE CASCADE
);
