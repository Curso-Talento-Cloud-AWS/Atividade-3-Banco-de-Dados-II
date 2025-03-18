-- Cria o banco de dados
CREATE DATABASE IF NOT EXISTS Mercadinho;
USE Mercadinho;

-- Cria a tabela de produtos
CREATE TABLE IF NOT EXISTS produtos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Quantidade INT NOT NULL,
    Data_de_Validade DATE NOT NULL,
    Data_Compra DATE NOT NULL
);

-- Inserir Produtos na tabela
INSERT INTO produtos (Nome, Quantidade, Data_de_Validade, Data_Compra) VALUES
('Arroz', 10, '2023-12-31', '2023-03-20'),
('Feijão', 15, '2023-11-30', '2023-03-20'),
('Macarrão', 20, '2023-10-15', '2023-03-20'),
('Óleo', 8, '2023-09-10', '2023-03-21'),
('Açúcar', 25, '2024-01-15', '2023-03-21'),
('Sal', 30, '2023-12-01', '2023-03-21'),
('Farinha', 12, '2023-10-05', '2023-03-22'),
('Café', 18, '2023-11-20', '2023-03-22'),
('Leite', 22, '2023-08-15', '2023-03-22'),
('Manteiga', 5, '2023-09-25', '2023-03-23'),
('Biscoito', 40, '2023-12-20', '2023-03-23'),
('Chocolate', 7, '2023-10-30', '2023-03-23'),
('Refrigerante', 50, '2024-02-10', '2023-03-24'),
('Suco', 35, '2023-12-05', '2023-03-24'),
('Água', 100, '2025-01-01', '2023-03-24'),
('Sabonete', 20, '2024-03-15', '2023-03-25'),
('Detergente', 10, '2023-09-05', '2023-03-25'),
('Shampoo', 14, '2023-11-10', '2023-03-25'),
('Papel Higiênico', 60, '2024-05-15', '2023-03-26'),
('Sabão em Pó', 18, '2023-10-10', '2023-03-26');

-- relatório de quantidade de produtos comprados por dia
DELIMITER //
CREATE PROCEDURE relatorio_diario(IN data_especifica DATE)
BEGIN
    SELECT 
        Data_Compra, 
        SUM(Quantidade) AS total_produtos_comprados
    FROM produtos
    WHERE Data_Compra = data_especifica
    GROUP BY Data_Compra;
END //
DELIMITER ;

CALL relatorio_diario('2023-03-24');