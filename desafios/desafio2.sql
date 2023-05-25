-- Crie uma `QUERY` que exiba três colunas:

-- 1. A primeira coluna deve exibir a quantidade total de canções. Dê a essa coluna o alias "cancoes".

-- 2. A segunda coluna deve exibir a quantidade total de artistas e deverá ter o alias "artistas".

-- 3. A terceira coluna deve exibir a quantidade de álbuns e deverá ter o alias "albuns".

SELECT 
    (SELECT 
            COUNT(*)
        FROM
            cancoes) AS cancoes,
    (SELECT 
            COUNT(*)
        FROM
            artistas) AS artistas,
    (SELECT 
            COUNT(*)
        FROM
            albuns) AS albuns;