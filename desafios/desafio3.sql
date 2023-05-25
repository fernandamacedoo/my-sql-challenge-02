-- Crie uma `QUERY` que deverá ter apenas três colunas:

-- 1. A primeira coluna deve possuir o alias "pessoa_usuaria" e exibir o nome da pessoa usuária.

-- 2. A segunda coluna deve possuir o alias "musicas_ouvidas" e exibir a quantidade de músicas ouvida pela pessoa com base no seu histórico de reprodução.

-- 3. A terceira coluna deve possuir o alias "total_minutos" e exibir a soma dos minutos ouvidos pela pessoa usuária com base no seu histórico de reprodução.

-- Os resultados devem estar agrupados pelo nome da pessoa usuária e ordenados em ordem alfabética.

SELECT 
    pu.pessoa_usuaria_nome AS pessoa_usuaria,
    COUNT(hr.cancao_id) AS musicas_ouvidas,
    ROUND(SUM(c.duracao_segundos) / 60, 2) AS total_minutos
FROM
    pessoas_usuarias AS pu
        INNER JOIN
    historico_de_reproducao AS hr ON pu.pessoa_usuaria_id = hr.pessoa_usuaria_id
        INNER JOIN
    cancoes AS c ON c.cancao_id = hr.cancao_id
GROUP BY pu.pessoa_usuaria_nome
ORDER BY pu.pessoa_usuaria_nome;