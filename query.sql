SELECT
    tmp.sigla,
    AVG(CASE WHEN p.departamento = 'LP' THEN tmp.final END) AS LP,
    AVG(CASE WHEN p.departamento = 'CB' THEN tmp.final END) AS CB,
    AVG(CASE WHEN p.departamento = 'SC' THEN tmp.final END) AS SC
FROM
    Persona p,
    (
        SELECT
            n.ci,
            n.sigla,
            n.notaFinal AS final
        FROM
            Nota n
    ) tmp
WHERE
    p.ci = tmp.ci AND tmp.final IS NOT NULL
GROUP BY
    tmp.sigla