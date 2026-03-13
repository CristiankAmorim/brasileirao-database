CREATE TABLE Time(
id_time SERIAL PRIMARY KEY,
nome VARCHAR(150) NOT NULL
);

CREATE TABLE Posicao_Principal(
id_posicao SERIAL PRIMARY KEY,
nome VARCHAR(150)
);

CREATE TABLE Jogador(
id_jogador SERIAL PRIMARY KEY,
nome VARCHAR(150) NOT NULL,
numero_da_camisa INT NOT NULL,
idade INT NOT NULL,
altura FLOAT NOT NULL,
peso FLOAT NOT NULL,
id_time INT REFERENCES Time(id_time)
);

CREATE TABLE Tecnico(
id_tecnico SERIAL PRIMARY KEY,
nome VARCHAR(150) NOT NULL,
idade INT NOT NULL
);

CREATE TABLE Patrocinador(
id_patrocinador SERIAL PRIMARY KEY,
nome VARCHAR(250) NOT NULL
);

CREATE TABLE Time_Patrocinador(
id_time INT REFERENCES Time(id_time),
id_patrocinador INT REFERENCES Patrocinador(id_patrocinador)
);

INSERT INTO Time(nome)
VALUES('Grêmio'),
      ('Flamengo'),
 ('Corinthians'),
 ('Bahia');

-- INSERT no time do Grêmio
INSERT INTO Jogador(nome, numero_da_camisa, idade, altura, peso, id_time)
VALUES('Tiago Volpi', 1, 34, 1.89, 84, 1),
      ('Carlos Vinícius', 95, 30, 1.90, 86, 1),
 ('Franco Cristaldo', 10, 29, 1.75, 74, 1),
 ('Marlon', 23, 28, 1.73, 68, 1),
 ('Walter Kannemann', 4, 34, 1.83, 77, 1),
 ('Arthur', 29, 29, 1.72, 73, 1),
 ('Gustavo Martins', 53, 23, 1.91, 70, 1),
 ('Gustavo Cuéllar', 6, 33, 1.75, 74, 1),
 ('Francis Amuzu', 9, 26, 1.70, 65, 1),
 ('João Lucas', 2, 27, 1.81, 72, 1),
 ('Alysson', 47, 19, 1.84, 77, 1);

-- INSERT no time do Flamengo
INSERT INTO Jogador(nome, numero_da_camisa, idade, altura, peso, id_time)
VALUES('Rossi', 1, 30, 1.93, 92, 2),
      ('Alex Sandro', 26, 34, 1.81, 80, 2),
 ('Léo Ortiz', 3, 29, 1.85, 80, 2),
 ('Léo Pereira', 4, 29, 1.88, 84, 2),
 ('Varela', 2, 32, 1.71, 73, 2),
 ('Jorginho', 21, 33, 1.80, 65, 2),
 ('Erick Pulgar', 5, 31, 1.87, 78, 2),
 ('Arrascaeta', 10, 31, 1.73, 73, 2),
 ('Samuel Lino', 16, 25, 1.78, 69, 2),
 ('Luiz Araújo', 7, 29, 1.75, 70, 2),
 ('Pedro', 9, 28, 1.86, 78, 2);

-- INSERT no time do Corinthians
INSERT INTO Jogador(nome, numero_da_camisa, idade, altura, peso, id_time)
VALUES('Hugo Souza', 1, 26, 1.99, 95, 3),
      ('Matheuzinho', 2, 25, 1.76, 73, 3),
 ('Bidu', 21, 26, 1.72, 72, 3),
 ('Gustavo Henrique', 13, 32, 1.96, 89, 3),
 ('João Pedro Tchoca', 47, 21, 1.93, 82, 3),
 ('André Carrillo', 19, 34, 1.80, 72, 3),
 ('José Martines', 70, 31, 1.80, 72, 3),
 ('Rodrigo Garro', 8, 27, 1.74, 70, 3),
 ('Yuri Alberto', 9, 24, 1.83, 78, 3),
 ('Ángel Romero', 11, 33, 1.75, 72, 3),
 ('Menphis Depay', 10, 31, 1.78, 78, 3);

-- INSERT no time do Bahia
INSERT INTO Jogador(nome, numero_da_camisa, idade, altura, peso, id_time)
VALUES('Ronaldo', 96, 29, 1.94, 86, 4),
      ('Luciano Juba', 46, 26, 1.76, 70, 4),
 ('Ramos Mingo', 21, 23, 1.85, 77, 4),
 ('David Duarte', 33, 30, 1.92, 89, 4),
 ('Santiago Arias', 13, 33, 1.78, 72, 4),
 ('Caio Alexandre', 19, 26, 1.75, 68, 4),
 ('Jean Lucas', 6, 27, 1.81, 78, 4),
 ('Erick', 14, 28, 1.76, 67, 4),
 ('Ademir', 7, 30, 1.72, 65, 4),
 ('Erick Pulga', 16, 25, 1.69, 70, 4),
 ('Willian José', 12, 33, 1.89, 93, 4);

ALTER TABLE Jogador ADD COLUMN id_posicao INT REFERENCES Posicao_Principal(id_posicao);

INSERT INTO Posicao_Principal(nome)
VALUES('Goleiro'),
      ('Zagueiro'),
      ('Lateral Esquerdo'),
      ('Lateral Direito'),
      ('Volante'),
      ('Meio Campo'),
      ('Ponta Esquerda'),
      ('Ponta Direita'),
      ('Centro Avante');

UPDATE Jogador SET id_posicao = 1 WHERE id_jogador IN (1, 13, 24, 35);  -- Goleiros
UPDATE Jogador SET id_posicao = 2 WHERE id_jogador IN (5, 7, 15, 16, 27, 28);  -- Zagueiros
UPDATE Jogador SET id_posicao = 3 WHERE id_jogador IN (4, 14, 26, 36);     -- Laterais Esquerdos
UPDATE Jogador SET id_posicao = 4 WHERE id_jogador IN (10, 17, 25, 39);     -- Laterais Direitos
UPDATE Jogador SET id_posicao = 5 WHERE id_jogador IN (8, 18, 19, 30, 40, 41);  -- Volantes
UPDATE Jogador SET id_posicao = 6 WHERE id_jogador IN (3, 6, 20, 21, 29, 31, 42);     -- Meio Campistas
UPDATE Jogador SET id_posicao = 7 WHERE id_jogador IN (34, 44, 9);  -- Pontas Esquerda
UPDATE Jogador SET id_posicao = 8 WHERE id_jogador IN (11, 22, 33, 43);     -- Pontas Direita
UPDATE Jogador SET id_posicao = 9 WHERE id_jogador IN (2, 23, 32, 45);  -- Centro Avante
UPDATE Jogador SET id_posicao = 2 WHERE id_jogador IN (37, 38);  -- Zagueiros restantes

INSERT INTO Tecnico(nome, idade)
VALUES('Mano Menezes', 63),
      ('Filipe Luis', 40),
      ('Dorival Júnior', 63),
      ('Rogério Ceni', 52);

INSERT INTO Patrocinador(nome)
VALUES('Alfa'),
      ('Betano'),
      ('Frimesa'),
      ('Viva Sorte Bet');

INSERT INTO Time_Patrocinador(id_time, id_patrocinador)
VALUES(1, 1),
      (2, 2),
      (3, 3),
      (4, 4);


SELECT * FROM Time;
SELECT * FROM Jogador;
SELECT * FROM Tecnico;
SELECT * FROM Patrocinador;
SELECT * FROM Time_Patrocinador;
SELECT * FROM Posicao_Principal;

ALTER TABLE Time ADD COLUMN id_tecnico INT REFERENCES Tecnico(id_tecnico);

ALTER TABLE Posicao_Principal RENAME TO Posicao;

UPDATE Time SET id_tecnico = 1
WHERE id_time = 1;

UPDATE Time SET id_tecnico = 2
WHERE id_time = 2;

UPDATE Time SET id_tecnico = 3
WHERE id_time = 3;

UPDATE Time SET id_tecnico = 4
WHERE id_time = 4;

SELECT * FROM TIME;
SELECT * FROM TECNICO;

UPDATE Posicao SET nome = 'Centroavante'
WHERE id_posicao = 9;

INSERT INTO Posicao_Principal(nome)
VALUES('Goleiro'),
      ('Zagueiro'),
      ('Lateral Esquerdo'),
      ('Lateral Direito'),
      ('Volante'),
      ('Meio Campo'),
      ('Ponta Esquerda'),
      ('Ponta Direita'),
      ('Centro Avante');

UPDATE Jogador SET id_posicao = 1 WHERE id_jogador IN (1, 13, 24, 35);  -- Goleiros
UPDATE Jogador SET id_posicao = 2 WHERE id_jogador IN (5, 7, 15, 16, 27, 28);  -- Zagueiros
UPDATE Jogador SET id_posicao = 3 WHERE id_jogador IN (4, 14, 26, 36);     -- Laterais Esquerdos
UPDATE Jogador SET id_posicao = 4 WHERE id_jogador IN (10, 17, 25, 39);     -- Laterais Direitos
UPDATE Jogador SET id_posicao = 5 WHERE id_jogador IN (8, 18, 19, 30, 40, 41);  -- Volantes
UPDATE Jogador SET id_posicao = 6 WHERE id_jogador IN (3, 6, 20, 21, 29, 31, 42);     -- Meio Campistas
UPDATE Jogador SET id_posicao = 7 WHERE id_jogador IN (34, 44, 9);  -- Pontas Esquerda
UPDATE Jogador SET id_posicao = 8 WHERE id_jogador IN (11, 22, 33, 43);     -- Pontas Direita
UPDATE Jogador SET id_posicao = 9 WHERE id_jogador IN (2, 23, 32, 45);  -- Centro Avante
UPDATE Jogador SET id_posicao = 2 WHERE id_jogador IN (37, 38);  -- Zagueiros restantes

INSERT INTO Tecnico(nome, idade)
VALUES('Mano Menezes', 63),
      ('Filipe Luis', 40),
      ('Dorival Júnior', 63),
      ('Rogério Ceni', 52);

INSERT INTO Patrocinador(nome)
VALUES('Alfa'),
      ('Betano'),
      ('Frimesa'),
      ('Viva Sorte Bet');

INSERT INTO Time_Patrocinador(id_time, id_patrocinador)
VALUES(1, 1),
      (2, 2),
      (3, 3),
      (4, 4);


SELECT * FROM Time;
SELECT * FROM Jogador;
SELECT * FROM Tecnico;
SELECT * FROM Patrocinador;
SELECT * FROM TIME_PATROCINADOR;
SELECT * FROM Posição;

ALTER TABLE Time ADD COLUMN id_tecnico INT REFERENCES Tecnico(id_tecnico);

UPDATE Time SET id_tecnico = 1
WHERE id_time = 1;

UPDATE Time SET id_tecnico = 2
WHERE id_time = 2;

UPDATE Time SET id_tecnico = 3
WHERE id_time = 3;

UPDATE Time SET id_tecnico = 4
WHERE id_time = 4;

SELECT * FROM TIME;
SELECT * FROM TECNICO;

UPDATE Posicao SET nome = 'Centroavante'
WHERE id_posicao = 9;
