

-- Inserindo Clientes
INSERT INTO Cliente (Nome, Telefone, Endereco) VALUES
('Carlos Silva', '11987654321', 'Rua A, 123'),
('Mariana Souza', '11991234567', 'Av. B, 456'),
('Fernando Lima', '11965478901', 'Rua C, 789');

-- Inserindo Veículos
INSERT INTO Veiculo (Placa, Modelo, Marca, Ano_Fabricacao, Cliente_idCliente) VALUES
('ABC-1234', 'Civic', 'Honda', 2020, 1),
('XYZ-5678', 'Corolla', 'Toyota', 2018, 2),
('LMN-9876', 'Fiesta', 'Ford', 2015, 3);

-- Inserindo Mecânicos
INSERT INTO Mecanico (Nome, Endereco, Especialidade) VALUES
('João Ferreira', 'Rua X, 100', 'Suspensão'),
('Ana Paula', 'Rua Y, 200', 'Motor'),
('Ricardo Santos', 'Rua Z, 300', 'Freios');

-- Inserindo Serviços
INSERT INTO Servico (Descricao, Valor_Servico) VALUES
('Troca de óleo', 150.00),
('Revisão completa', 500.00),
('Alinhamento e balanceamento', 120.00),
('Troca de pastilhas de freio', 200.00);

-- Inserindo Equipes
INSERT INTO Equipe (Nome) VALUES
('Equipe Alpha'),
('Equipe Beta');

-- Inserindo Ordens de Serviço
INSERT INTO Ordem_Servico (Data_Emissao, Data_Conclusao, Valor_Total, Status, Veiculo_idVeiculo, Cliente_idCliente) VALUES
('2024-02-10', '2024-02-11', 650.00, 'Concluído', 1, 1),
('2024-02-12', NULL, 320.00, 'Em andamento', 2, 2),
('2024-02-15', NULL, 500.00, 'Aberto', 3, 3);

-- Inserindo Peças
INSERT INTO Peca (Nome_Peca, Valor_Peca) VALUES
('Óleo sintético 5W30', 80.00),
('Pastilhas de freio', 150.00),
('Filtro de ar', 50.00);

-- Relacionando Peças com Ordens de Serviço
INSERT INTO Ordem_Servico_Peca (Ordem_Servico_idOrdem_Servico, Peca_idPeca, Quantidade) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1);

-- Relacionando Serviços com Ordens de Serviço
INSERT INTO Ordem_Servico_Servico (Ordem_Servico_idOrdem_Servico, Servico_idServico) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4);

-- Relacionando Equipes com Ordens de Serviço
INSERT INTO Equipe_Ordem_Servico (Equipe_idEquipe, Ordem_Servico_idOrdem_Servico) VALUES
(1, 1),
(2, 2),
(1, 3);

-- Relacionando Equipes com Mecânicos
INSERT INTO Equipe_has_Mecanico (Equipe_idEquipe, Mecanico_idMecanico) VALUES
(1, 1),
(1, 2),
(2, 3);

-- Inserindo Referência de Mão de Obra
INSERT INTO Referencia_Mao_de_Obra (Servico, Valor_Hora, Especialidade) VALUES
('Mão de obra geral', 80.00, 'Geral'),
('Mecânico especializado', 120.00, 'Especializado');

-- Relacionando Referência de Mão de Obra com Serviços
INSERT INTO Referencia_Mao_de_Obra_has_Servico (Referencia_Mao_de_Obra_idReferencia_Mao_de_Obra, Servico_idServico) VALUES
(1, 1),
(2, 2),
(2, 3),
(1, 4);
