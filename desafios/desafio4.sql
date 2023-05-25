-- Crie uma `QUERY` que deve mostrar as pessoas usuárias que estavam ativas a partir do ano de 2021, se baseando na data mais recente no histórico de reprodução.

-- 1. A primeira coluna deve possuir o alias "pessoa_usuaria" e exibir o nome da pessoa usuária.

-- 2. A segunda coluna deve ter o alias "status_pessoa_usuaria" e exibir se a pessoa usuária está ativa ou inativa.

-- O resultado deve estar ordenado em ordem alfabética.

SELECT 
    pu.pessoa_usuaria_nome AS pessoa_usuaria,
    IF(MAX(hr.data_reproducao) >= '2021-01-01',
        'Ativa',
        'Inativa') AS status_pessoa_usuaria
FROM
    pessoas_usuarias AS pu
        INNER JOIN
    historico_de_reproducao AS hr ON pu.pessoa_usuaria_id = hr.pessoa_usuaria_id
GROUP BY pu.pessoa_usuaria_nome
ORDER BY pu.pessoa_usuaria_nome;