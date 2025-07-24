-- Criando tabela principal (Fato Projetos)
CREATE TABLE fato_projetos (
    id_projeto SERIAL PRIMARY KEY,
    nome_projeto TEXT,
    regiao TEXT,
    pais TEXT,
    bloco TEXT,
    campo TEXT,
    operador TEXT,
    tipo TEXT,
    status TEXT,
    profundidade_m NUMERIC,
    latitude NUMERIC,
    longitude NUMERIC,
    distancia_costa_km NUMERIC
);

-- Criando dimensão Dutos
CREATE TABLE dim_dutos (
    id_duto SERIAL PRIMARY KEY,
    id_projeto INT REFERENCES fato_projetos(id_projeto),
    nome_duto TEXT,
    funcao TEXT,
    tipo_duto TEXT,
    status TEXT,
    diametro_polegada NUMERIC,
    comprimento_km NUMERIC,
    ano_instalacao INT
);

-- Criando dimensão Subsea Trees
CREATE TABLE dim_subsea_trees (
    id_tree SERIAL PRIMARY KEY,
    id_projeto INT REFERENCES fato_projetos(id_projeto),
    status TEXT,
    ano_instalacao INT
);

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';
