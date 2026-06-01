-- Todas as tentativas
SELECT * FROM tentativas_login;

-- Falhas de login
SELECT
    usuarios.nome,
    tentativas_login.ip_address,
    tentativas_login.status_login,
    tentativas_login.data_tentativa
FROM tentativas_login
INNER JOIN usuarios
ON usuarios.id_usuario = tentativas_login.id_usuario
WHERE status_login = 'FALHA';

-- Possível brute force
SELECT
    ip_address,
    COUNT(*) AS total_falhas
FROM tentativas_login
WHERE status_login = 'FALHA'
GROUP BY ip_address
HAVING COUNT(*) >= 2;

-- Usuários com mais falhas
SELECT
    usuarios.nome,
    COUNT(*) AS total_falhas
FROM tentativas_login
INNER JOIN usuarios
ON usuarios.id_usuario = tentativas_login.id_usuario
WHERE status_login = 'FALHA'
GROUP BY usuarios.nome
ORDER BY total_falhas DESC;

-- View de falhas
CREATE VIEW vw_falhas_login AS
SELECT
    usuarios.nome,
    tentativas_login.ip_address,
    tentativas_login.data_tentativa
FROM tentativas_login
INNER JOIN usuarios
ON usuarios.id_usuario = tentativas_login.id_usuario
WHERE status_login = 'FALHA';