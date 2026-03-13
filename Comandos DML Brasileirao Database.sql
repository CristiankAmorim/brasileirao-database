SELECT * FROM Jogador;
SELECT * FROM Patrocinador;
SELECT * FROM Posição;

-- SELECT COM NOT / Selecionar os jogadores que não são goleiros
SELECT Jogador.nome AS Jogador, Posicao.nome AS Posicao
FROM Jogador
JOIN Posicao ON Jogador.id_posicao = Posicao.id_posicao
WHERE NOT Posicao.id_posicao = 1;

-- SELECT COM NOT / Selecionar jogadores que não têm idade maior que 30
SELECT Jogador.nome AS Jogador, Jogador.idade
FROM Jogador
WHERE NOT idade > 30;

-- ORDER BY / Ordena os jogadores por ordem alfabética da posição
SELECT Jogador.nome AS Jogador, Posicao.nome AS Posicao
FROM Jogador
JOIN Posicao ON Jogador.id_posicao = Posicao.id_posicao
ORDER BY Posicao.nome;

-- ORDER BY / Ordena os jogadores do mais velho para o mais novo
SELECT Jogador.nome AS Jogador, Jogador.idade
FROM Jogador
ORDER BY idade DESC;

-- GROUP BY COM COUNT / Conta a quantidade de jogadores por idade
SELECT Jogador.idade, COUNT(Jogador.idade) AS Quantidade_de_Jogadores
FROM Jogador
GROUP BY idade;

-- GROUP BY COM COUNT / Conta a quantidade de jogadores por posição
SELECT Posicao.nome AS Posicao, COUNT(Jogador.id_posicao) AS Quantidade_de_Jogadores
FROM Jogador
JOIN Posicao ON Jogador.id_posicao = Posicao.id_posicao
GROUP BY Posicao.id_posicao;

-- GROUP BY COM SUM / Soma a idade de todos os jogadores por time
SELECT Time.nome AS Time, SUM(Jogador.idade) AS Soma_da_Idade_dos_Jogadores
FROM Jogador
JOIN Time ON Jogador.id_time = Time.id_time
GROUP BY Time.id_time;

-- GROUP BY COM SUM / Soma o peso total de cada time
SELECT Time.nome AS Time, SUM(Jogador.peso) AS Soma_dos_Pesos_dos_Jogadores
FROM Jogador
JOIN Time ON Jogador.id_time = Time.id_time
GROUP BY Time.id_time
ORDER BY Soma_dos_Pesos_dos_Jogadores;

-- GROUP BY COM AVG / Retornar a média de idade de cada time
SELECT Time.nome AS Time, ROUND(AVG(Jogador.idade), 2) AS Media_de_Idade
FROM Jogador
JOIN Time ON Jogador.id_time = Time.id_time
GROUP BY Time.id_time;

-- GROUP BY COM AVG / Retornar a média de peso de cada time
SELECT Time.nome AS Time, ROUND(CAST(AVG(Jogador.peso) AS NUMERIC), 2) AS Media_de_Peso
FROM Jogador
JOIN Time ON Jogador.id_time = Time.id_time
GROUP BY Time.id_time;

-- DELETE
DELETE FROM Jogador
WHERE id_jogador = 30;

DELETE FROM Jogador
WHERE nome = 'João Lucas';

-- GROUP BY COM MIN E MAX / Retorna a menor e maior idade de cada time
SELECT Time.nome AS Time, MIN(Jogador.idade) AS Menor_idade_do_Time,
MAX(Jogador.idade) AS Maior_idade_do_Time
FROM Jogador
JOIN Time ON Jogador.id_time = Time.id_time
GROUP BY Time.id_time;

-- Retorna o maior e menor peso de cada time
SELECT Time.nome AS Time, MAX(Jogador.peso) AS Maior_Peso,
MIN(Jogador.peso) AS Menor_Peso
FROM Jogador
JOIN Time ON Jogador.id_time = Time.id_time
GROUP BY Time.id_time;

-- SELECT COM AND
SELECT Jogador.nome AS Jogador FROM Jogador
WHERE altura > 1.85 AND peso > 80;

SELECT Jogador.nome AS Jogador FROM Jogador
WHERE idade < 30 AND id_posicao = 6;

-- SELECT COM OR
SELECT Jogador.nome AS Jogador FROM Jogador
WHERE peso < 78 OR altura > 1.90;

SELECT Jogador.nome AS Jogador FROM Jogador
WHERE idade < 30 OR id_posicao = 6;
 
-- JOIN passando por três tabelas
SELECT Jogador.nome AS jogador, Time.nome AS Time, Posicao
FROM Jogador
JOIN Time ON Jogador.id_time = Time.id_time
JOIN Posicao ON Jogador.id_posicao = Posicao.id_posicao
WHERE Posicao.id_posicao = 9;
