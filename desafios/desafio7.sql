-- Mostre uma relação de todos os álbuns produzidos por cada pessoa artista, ordenada pela quantidade de seguidores que ela possui, de acordo com os detalhes a seguir. Para tal, crie uma `QUERY` com as seguintes colunas:

-- 1. A primeira coluna deve exibir o nome da pessoa artista, com o alias "artista".

-- 2. A segunda coluna deve exibir o nome do álbum, com o alias "album".

-- 3. A terceira coluna deve exibir a quantidade de pessoas seguidoras que aquela pessoa artista possui e deve possuir o alias "pessoas_seguidoras".

-- Seus resultados devem estar ordenados de forma decrescente, baseando-se no número de pessoas seguidoras. Em caso de empate no número de pessoas, ordene os resultados pelo nome da pessoa artista em ordem alfabética e caso existam artistas com o mesmo nome, ordene os resultados pelo nome do álbum alfabeticamente.

SELECT 
    art.artista_nome AS artista,
    alb.album_nome AS album,
    COUNT(sa.pessoa_usuaria_id) AS pessoas_seguidoras
FROM
    artistas AS art
        INNER JOIN
    albuns AS alb ON art.artista_id = alb.artista_id
        INNER JOIN
    seguindo_artistas AS sa ON sa.artista_id = art.artista_id
GROUP BY artista , album
ORDER BY pessoas_seguidoras DESC , artista , album;