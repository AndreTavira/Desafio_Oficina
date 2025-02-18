
-- Recuperar todas as ordens de serviço com seus clientes e veículos
SELECT os.idOrdem_Servico, os.Data_Emissao, c.Nome AS Cliente, v.Placa AS Veiculo, os.Status
FROM Ordem_Servico os
JOIN Cliente c ON os.Cliente_idCliente = c.idCliente
JOIN Veiculo v ON os.Veiculo_idVeiculo = v.idVeiculo;

-- Quantidade de serviços prestados por cada mecânico
SELECT m.Nome, COUNT(*) AS Qtd_Servicos
FROM Equipe_has_Mecanico em
JOIN Mecanico m ON em.Mecanico_idMecanico = m.idMecanico
JOIN Equipe e ON em.Equipe_idEquipe = e.idEquipe
JOIN Ordem_Servico os ON e.idEquipe = os.idOrdem_Servico
GROUP BY m.Nome HAVING COUNT(*) > 0;

-- Total gasto por cliente em ordens de serviço concluídas
SELECT c.Nome, SUM(os.Valor_Total) AS Total_Gasto
FROM Ordem_Servico os
JOIN Cliente c ON os.Cliente_idCliente = c.idCliente
WHERE os.Status = 'Concluída'
GROUP BY c.Nome
ORDER BY Total_Gasto DESC;
