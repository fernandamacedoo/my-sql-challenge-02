-- Estamos fazendo um estudo das músicas mais tocadas e precisamos saber quais são as duas músicas mais tocadas no momento. Crie uma `QUERY` que possua duas colunas:

-- 1. A primeira coluna deve possuir o alias "cancao" e exibir o nome da canção.

-- 2. A segunda coluna deve possuir o alias "reproducoes" e exibir a quantidade de pessoas que já escutaram a canção em questão.

-- Seu resultado deve estar ordenado em ordem decrescente, baseando-se no número de reproduções. Em caso de empate, ordene os resultados pelo nome da canção em ordem alfabética. Queremos apenas o top 2 de músicas mais tocadas.

SELECT 
    c.cancao_nome AS cancao, COUNT(hr.cancao_id) AS reproducoes
FROM
    historico_de_reproducao AS hr
        INNER JOIN
    cancoes AS c ON hr.cancao_id = c.cancao_id
GROUP BY cancao
ORDER BY reproducoes DESC , cancao
LIMIT 2;