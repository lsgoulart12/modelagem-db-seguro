-- ============================================================================
-- PROJETO: MODELAGEM DE BANCO DE DADOS SEGURO (RBAC & AUDITORIA)
-- OBJETIVO: Demonstrar controle de acessos e trilha de auditoria de segurança.
-- ============================================================================

-- 1. Criação da Tabela de Funções/Cargos (Roles)
CREATE TABLE funcoes (
    id_funcao INT PRIMARY KEY AUTO_INCREMENT,
    nome_funcao VARCHAR(50) NOT NULL UNIQUE,
    descricao VARCHAR(255)
);

-- 2. Criação da Tabela de Usuários (Users)
CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome_completo VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha_hash VARCHAR(255) NOT NULL, -- Armazenamento seguro de credenciais
    id_funcao INT,
    status_conta VARCHAR(20) DEFAULT 'Ativo',
    FOREIGN KEY (id_funcao) REFERENCES funcoes(id_funcao)
);

-- 3. Criação da Tabela de Logs de Auditoria (Security Audit Log)
CREATE TABLE logs_auditoria (
    id_log INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    acao_realizada VARCHAR(100) NOT NULL,
    tabela_afetada VARCHAR(50),
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    endereco_ip VARCHAR(45) NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- ============================================================================
-- INSERÇÃO DE DADOS PARA TESTE (MOCK DATA)
-- ============================================================================

INSERT INTO funcoes (nome_funcao, descricao) VALUES 
('Administrador', 'Acesso total ao sistema e configuracoes'),
('Operador', 'Acesso a leitura e modificacoes operacionais'),
('Auditor', 'Acesso exclusivo de leitura para relatorios de seguranca');

INSERT INTO usuarios (nome_completo, email, senha_hash, id_funcao) VALUES 
('Lais Goulart', 'lais@empresa.com', '$2b$12$K39daF82ka93...', 1),
('Carlos Silva', 'carlos@empresa.com', '$2b$12$Pq93kaLpa239...', 2);

INSERT INTO logs_auditoria (id_usuario, acao_realizada, tabela_afetada, endereco_ip) VALUES 
(1, 'LOGIN_SUCESSO', 'usuarios', '192.168.1.10'),
(2, 'FALHA_LOGIN_SENHA_INCORRETA', 'usuarios', '192.168.1.55'),
(1, 'ALTERACAO_PERMISSAO', 'funcoes', '192.168.1.10');

-- ============================================================================
-- QUERIES DE AUDITORIA DE SEGURANÇA (EXEMPLOS PRÁTICOS)
-- ============================================================================

-- Query: Identificar quem realizou acoes criticas no sistema e quando
SELECT 
    l.data_hora AS 'Data_Hora',
    u.nome_completo AS 'Usuario',
    l.acao_realizada AS 'Acao',
    l.endereco_ip AS 'IP_Origem'
FROM logs_auditoria l
JOIN usuarios u ON l.id_usuario = u.id_usuario
ORDER BY l.data_hora DESC;
