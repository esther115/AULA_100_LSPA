-- Criação do banco de dados ibge_lspa--
create database ibge_lspa;

-- Ativação do banco de dados ibge_lspa--
use ibge_lspa;

-- Criando a tabela produtos--
create table produtos(
cod_produto INT,
nome_produto VARCHAR(45),
primary key (cod_produto)
);

-- Criando a tabela safra--
create table safra(
cod_safra INT,
cod_produto INT,
volume INT,
ano INT,
mes INT,
primary key (cod_safra),
foreign key (cod_produto) references produtos (cod_produto)
);

-- Selecionando a tabela produtos--
select*from produtos;

-- Selecionando a tabela safra--
select*from safra;

-- Selecionando todos os produtos e suas safras correspondentes--
select p.cod_produto,p.nome_produto,s.cod_safra from produtos p inner join safra s on p.cod_produto=p.cod_produto;

-- Selecionando o nome do produto, volume e ano da safra para um produto específico--
select p.nome_produto,s.volume,s.ano from produtos p inner join safra s on p.cod_produto=p.cod_produto where p.cod_produto=4;

-- Calculando o volume total de safras para cada produto--
select p.cod_produto,p.nome_produto, sum(s.volume) as volume_total from produtos p inner join safra s on p.cod_produto=s.cod_produto group by p.cod_produto,p.nome_produto; 

-- Selecionando os produtos que tiveram safras no ano de 2023--
select p.nome_produto, s.ano from produtos p inner join safra s on p.cod_produto=s.cod_produto where s.ano=2023;

-- Selecionando o nome do produto e o volume médio das safras para rodutos com volume médio superior a 100 milhões de toneladas
select p.nome_produto, avg(s.volume) as volume_medio from produtos p inner join safra s on p.cod_produto=s.cod_produto group by p.nome_produto having avg (s.volume) > 100000000;

-- Selecionado os produtos e suas safras ordenados pelo ano e mês da safra--
select p.nome_produto,s.cod_safra, s.ano,s.mes from produtos p inner join safra s on p.cod_produto=s.cod_produto order by s.ano,s.mes;

-- Selecionando o total de volume de safras agrupados por produtos no ano de 2023--
select p.cod_produto,p.nome_produto, sum(s.volume) as volume_total from produtos p inner join safra s on p.cod_produto=s.cod_produto group by s.ano=2023;

-- Selecionando volume de safras do produto com código 2 no ano de 2023 no mês de Junho--
select p.cod_produto,p.nome_produto, sum(s.volume) as volume_total from produtos p inner join safra s on p.cod_produto=s.cod_produto where p.cod_produto=2 and s.ano=2023 and s.mes=6;

SELECT * FROM produtos p INNER JOIN safra s ON p.cod_produto = s.cod_produto;
