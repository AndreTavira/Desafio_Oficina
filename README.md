# Desafio_Oficina
O sistema da oficina foi pensado para organizar tudo de forma simples, com foco em clientes, veículos e ordens de serviço. Cada cliente pode ter um ou mais veículos, e sempre que um deles chega à oficina, é gerada uma ordem de serviço (OS). Essa ordem pode incluir diversos serviços, como troca de óleo ou revisão do motor, e também o custo das peças necessárias, que vão compor o valor final da OS. O preço de cada serviço é calculado com base numa tabela que define quanto custa cada hora de trabalho, levando em conta a especialidade do mecânico.

Cada OS é atribuída a uma equipe de mecânicos, que trabalha junto para avaliar, realizar e finalizar os serviços necessários. A equipe é formada por vários mecânicos, e cada um tem uma especialidade específica. Além disso, cada ordem de serviço tem um status (como "Em andamento", "Concluída" ou "Cancelada") e uma data de conclusão, que é registrada no sistema para controle.

Com esse modelo, o sistema facilita o gerenciamento das ordens de serviço, conectando clientes, veículos, mecânicos, serviços e peças de forma organizada, e ajudando a calcular os custos e acompanhar o andamento dos trabalhos na oficina.
📌 Sistema de Gestão para Oficina Mecânica

📖 Sobre o Projeto

Este sistema foi desenvolvido para gerenciar uma oficina mecânica, permitindo o cadastro e controle de clientes, veículos, mecânicos, serviços, peças e ordens de serviço. Com ele, é possível administrar melhor os processos internos e obter informações detalhadas por meio de consultas SQL otimizadas.

🛠 Tecnologias Utilizadas

Banco de Dados: MySQL

Linguagem SQL para criação de tabelas, inserção de dados e consultas complexas

Diagramação: Modelo relacional baseado em esquema conceitual

📋 Estrutura do Banco de Dados

O banco de dados contém as seguintes tabelas principais:

Cliente: Armazena informações dos clientes

Veículo: Registra os veículos vinculados a clientes

Mecânico: Guarda dados dos mecânicos da oficina

Equipe: Define grupos de mecânicos

Serviço: Contém os serviços oferecidos

Peça: Lista as peças disponíveis e seus valores

Ordem de Serviço: Registra os serviços realizados em cada veículo

🔍 Funcionalidades Principais

Cadastro de clientes e veículos

Registro de mecânicos e equipes

Associação de mecânicos a equipes

Emissão e acompanhamento de ordens de serviço

Cálculo de valor total de cada serviço

Controle de peças utilizadas

🚀 Como Utilizar

Criar o Banco de Dados

CREATE DATABASE oficina_mecanica;
USE oficina_mecanica;

Executar o Script de Criação de Tabelas

Popular o Banco com Dados de Teste

Executar as Queries para Análise de Dados

📜 Licença

Este projeto é de código aberto e pode ser utilizado para fins acadêmicos e profissionais.
