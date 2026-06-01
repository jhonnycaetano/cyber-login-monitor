CREATE DATABASE cyber_monitor;

USE cyber_monitor;

CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    senha VARCHAR(100),
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tentativas_login (
    id_tentativa INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    ip_address VARCHAR(45),
    status_login VARCHAR(20),
    data_tentativa TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (id_usuario)
    REFERENCES usuarios(id_usuario)
);