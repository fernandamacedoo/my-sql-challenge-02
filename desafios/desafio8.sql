-- Mostre uma relação dos álbuns produzidos por uma pessoa artista específica, neste caso `"Elis Regina"`.
-- Para isto crie uma `QUERY` que o retorno deve exibir as seguintes colunas:

-- 1. O nome da pessoa artista, com o alias "artista".

-- 2. O nome do álbum, com o alias "album".

-- Os resultados devem ser ordenados pelo nome do álbum em ordem alfabética.

SELECT 
    art.artista_nome AS artista, alb.album_nome AS album
FROM
    artistas AS art
        INNER JOIN
    albuns AS alb ON art.artista_id = alb.artista_id
WHERE
    art.artista_nome = 'Elis Regina'
ORDER BY album;