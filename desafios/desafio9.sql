-- Crie uma `QUERY` que exibe a quantidade de músicas que estão presentes atualmente no histórico de reprodução de uma pessoa usuária específica. Para este caso queremos saber quantas músicas estão no histórico da usuária `"Barbara Liskov"` e a consulta deve retornar a seguinte coluna:

-- 1. O valor da quantidade, com o alias "musicas_no_historico".

SELECT 
    COUNT(*) AS musicas_no_historico
FROM
    historico_de_reproducao AS hr
        INNER JOIN
    pessoas_usuarias AS pu ON pu.pessoa_usuaria_id = hr.pessoa_usuaria_id
WHERE
    pu.pessoa_usuaria_nome = 'Barbara Liskov';