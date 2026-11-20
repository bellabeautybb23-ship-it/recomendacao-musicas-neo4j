// QUERY 1 - Recomendacao para Ana (id: 1) - Filtragem Colaborativa
// "Quem ouviu o mesmo que a Ana, o que mais ouviu?"
MATCH (eu:Usuario {id: 1})-[:OUVIU]->(m:Musica)<-[:OUVIU]-(outro:Usuario)-[:OUVIU]->(recomendada:Musica)
WHERE NOT (eu)-[:OUVIU]->(recomendada)
RETURN recomendada.titulo AS Recomendacao, COUNT(*) AS Forca
ORDER BY Forca DESC;

// QUERY 2 - Ver todo o grafo
MATCH (n) RETURN n;

// QUERY 3 - Musicas mais ouvidas (populares)
MATCH (u:Usuario)-[r:OUVIU]->(m:Musica)
RETURN m.titulo AS Musica, SUM(r.vezes) AS TotalOuvidas
ORDER BY TotalOuvidas DESC;

// QUERY 4 - Recomendacao por Genero
MATCH (eu:Usuario {id: 1})-[:OUVIU]->(m:Musica)-[:DO_GENERO]->(g:Genero)<-[:DO_GENERO]-(recomendada:Musica)
WHERE NOT (eu)-[:OUVIU]->(recomendada)
RETURN DISTINCT recomendada.titulo AS RecomendacaoPorGenero;
