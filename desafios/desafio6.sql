-- Tendo como base o valor dos planos e o plano que cada pessoa usuária cadastrada possui no banco, queremos algumas informações sobre o faturamento da empresa. Crie uma `QUERY` que deve exibir quatro dados:

-- 1. A primeira coluna deve ter o alias "faturamento_minimo" e exibir o menor valor de plano existente para uma pessoa usuária.

-- 2. A segunda coluna deve ter o alias "faturamento_maximo" e exibir o maior valor de plano existente para uma pessoa usuária.

-- 3. A terceira coluna deve ter o alias "faturamento_medio" e exibir o valor médio dos planos possuídos por pessoas usuárias até o momento.

-- 4. Por fim, a quarta coluna deve ter o alias "faturamento_total" e exibir o valor total obtido com os planos possuídos por pessoas usuárias.

-- Para cada um desses dados, por se tratarem de valores monetários, deve-se arredondar o faturamento usando apenas duas casas decimais.


SELECT 
    FORMAT(MIN(valor), 2) AS faturamento_minimo,
    FORMAT(MAX(valor), 2) AS faturamento_maximo,
    FORMAT(AVG(valor), 2) AS faturamento_medio,
    FORMAT(SUM(valor), 2) AS faturamento_total
FROM
    planos AS p
        INNER JOIN
    pessoas_usuarias AS pu ON pu.plano_id = p.plano_id;