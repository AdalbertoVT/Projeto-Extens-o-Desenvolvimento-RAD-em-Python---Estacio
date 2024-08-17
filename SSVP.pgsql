-- Criação da tabela pessoa_responsavel
CREATE TABLE IF NOT EXISTS pessoa_responsavel (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    contato VARCHAR(20) NOT NULL,
    data_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

 CREATE TABLE IF NOT EXISTS pessoa (
                    id SERIAL PRIMARY KEY,
                    nome VARCHAR(255) NOT NULL,
                    endereco TEXT NOT NULL,
                    num_membros INT NOT NULL,
                    cpf VARCHAR(14) NOT NULL,
                    contato VARCHAR(20),
                    id_responsavel INT REFERENCES pessoa_responsavel(id),
                    data_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                    data_distribuicao TIMESTAMP,
                    cestas_recebidas INT DEFAULT 0,
                    alimentos_distribuidos TEXT
                );

-- Criação da tabela de estoque
CREATE TABLE IF NOT EXISTS estoque (
    id SERIAL PRIMARY KEY,
    alimento VARCHAR(255) NOT NULL,
    quantidade INT NOT NULL
);

-- Criação da tabela distribuicao_cestas
CREATE TABLE IF NOT EXISTS distribuicao_cestas (
    id SERIAL PRIMARY KEY,
    pessoa_id INT REFERENCES pessoa(id),
    data_distribuicao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    alimentos TEXT NOT NULL
);
