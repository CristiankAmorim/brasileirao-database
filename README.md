# ⚽ Brasileirão Database

Projeto de banco de dados relacional desenvolvido para modelar informações relacionadas a clubes, jogadores, técnicos e patrocinadores do **Campeonato Brasileiro**.

O objetivo deste projeto é praticar conceitos fundamentais de **SQL**, incluindo criação de tabelas, relacionamento entre entidades e consultas para análise de dados.

---

# 🗄️ Estrutura do Banco de Dados

O banco foi modelado utilizando um conjunto de tabelas que representam os principais elementos de um clube de futebol.

## Principais Entidades

### 🏟️ Time

Armazena os clubes participantes.

| Campo   | Tipo        |
| ------- | ----------- |
| id_time | SERIAL (PK) |
| nome    | VARCHAR     |

---

### 👤 Jogador

Guarda as informações dos jogadores pertencentes a um time.

| Campo            | Tipo        |
| ---------------- | ----------- |
| id_jogador       | SERIAL (PK) |
| nome             | VARCHAR     |
| numero_da_camisa | INT         |
| idade            | INT         |
| altura           | FLOAT       |
| peso             | FLOAT       |
| id_time          | FK          |

---

### 🎯 Posição

Define a posição principal do jogador em campo.

| Campo      | Tipo        |
| ---------- | ----------- |
| id_posicao | SERIAL (PK) |
| nome       | VARCHAR     |

---

### 🧑‍💼 Técnico

Informações sobre os técnicos dos times.

| Campo      | Tipo        |
| ---------- | ----------- |
| id_tecnico | SERIAL (PK) |
| nome       | VARCHAR     |
| idade      | INT         |

---

### 💼 Patrocinador

Empresas que patrocinam os clubes.

| Campo           | Tipo        |
| --------------- | ----------- |
| id_patrocinador | SERIAL (PK) |
| nome            | VARCHAR     |

---

### 🤝 Time_Patrocinador

Tabela associativa que representa o relacionamento entre **times e patrocinadores**.

| Campo           | Tipo |
| --------------- | ---- |
| id_time         | FK   |
| id_patrocinador | FK   |

---

# 📊 Operações SQL Utilizadas

Os scripts DML demonstram diversos conceitos importantes de SQL:

### 🔎 Consultas básicas

```sql
SELECT * FROM Jogador;
SELECT * FROM Patrocinador;
```

---

### 🚫 Uso de NOT

Selecionar jogadores que **não são goleiros**:

```sql
SELECT Jogador.nome AS Jogador, Posicao.nome AS Posicao
FROM Jogador
JOIN Posicao ON Jogador.id_posicao = Posicao.id_posicao
WHERE NOT Posicao.id_posicao = 1;
```

---

### 🔄 Ordenação com ORDER BY

Ordenar jogadores por idade:

```sql
SELECT Jogador.nome, Jogador.idade
FROM Jogador
ORDER BY idade DESC;
```

---

### 📈 Agrupamento com GROUP BY

Contar quantidade de jogadores por idade:

```sql
SELECT Jogador.idade, COUNT(Jogador.idade) AS Quantidade_de_Jogadores
FROM Jogador
GROUP BY idade;
```

---

# 🧠 Conceitos Aplicados

Neste projeto foram praticados conceitos importantes de **banco de dados relacional**:

* Modelagem de entidades
* Chaves primárias e estrangeiras
* Relacionamentos entre tabelas
* Normalização básica
* Consultas SQL
* JOIN entre tabelas
* Ordenação de resultados
* Agrupamentos com `GROUP BY`
* Uso de operadores como `NOT`

---

# ⚙️ Tecnologias Utilizadas

* SQL
* PostgreSQL (estrutura compatível com SERIAL e FK)
* Modelagem relacional de banco de dados

---

# 🚀 Como executar o projeto

1. Criar um banco de dados no seu SGBD (PostgreSQL recomendado).

2. Executar o script de criação das tabelas:

```sql
Comandos DDL Brasileirao Database.sql
```

3. Executar o script de manipulação e consultas:

```sql
Comandos DML Brasileirao Database.sql
```

---


# 📌 Objetivo do Projeto

Este projeto foi criado com fins **educacionais e de portfólio**, com o objetivo de reforçar habilidades em:

* SQL
* Estruturação de banco de dados
* Organização de dados relacionais
* Escrita de consultas eficientes
