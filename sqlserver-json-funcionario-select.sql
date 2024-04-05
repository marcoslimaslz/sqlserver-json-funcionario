SELECT 
    c.Id, 
    c.Nome, 
    FORMAT(c.DataAdimissao, 'dd/MM/yyyy') as DataAdimissao, 
    c.Celular, 
    c.Salário as Salario,
    JSON_QUERY(c.UltimoAcesso) as UltimoAcesso,
    Dependentes = (
        SELECT 
            d.Id, 
            d.Nome 
        FROM Dependente d 
        WHERE d.ColaboradorId = c.Id
        FOR JSON PATH
    )
FROM Colaborador c
FOR JSON PATH, ROOT('Colaboradores');
