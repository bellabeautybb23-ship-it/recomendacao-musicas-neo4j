# Algoritmo de Recomendação de Músicas com Base em Grafos

Projeto de Desafio da DIO - Banco de Dados em Grafos com Neo4j

## Contexto do Problema

Aplicativos como Spotify e Deezer precisam recomendar músicas que o usuário ainda não ouviu, mas que tem grande chance de gostar.

Em um banco relacional isso é complexo, cheio de JOINs. Em um banco de grafos, isso é natural: a recomendação é apenas um caminho no grafo.

A lógica usada é Filtragem Colaborativa:
"Se você e outra pessoa ouviram as mesmas músicas, e essa pessoa ouviu uma música nova, provavelmente você também vai gostar dela."

## Por que Grafos?

1. Relacionamento é dado: O OUVIU já é a conexão
2. Performance: Encontrar "amigos de amigos" em grafo é mais rápido que em SQL
3. Visual: Dá pra ver o grafo e entender a recomendação

## Modelo do Grafo

Nós:
- Usuario {id, nome, cidade}
- Musica {id, titulo, ano}
- Artista {nome}
- Genero {nome}

Relacionamentos:
- (Usuario)-[:OUVIU]->(Musica)
- (Musica)-[:DE_ARTISTA]->(Artista)
- (Musica)-[:DO_GENERO]->(Genero)
- (Usuario)-[:CURTIU]->(Musica)

## Como Executar

1. Abra o Neo4j Browser
2. Rode o arquivo cypher/01-criar-grafo.cypher
3. Rode o arquivo cypher/02-queries-recomendacao.cypher

## Pergunta de Negócio

Recomendar músicas para a Ana (id:1)

MATCH (eu:Usuario {id:1})-[:OUVIU]->(m:Musica)<-[:OUVIU]-(outro:Usuario)-[:OUVIU]->(recomendada:Musica)
WHERE NOT (eu)-[:OUVIU]->(recomendada)
RETURN recomendada.titulo AS Recomendacao, COUNT(*) AS Forca
ORDER BY Forca DESC;

## Autor

Feito para o Desafio de Projeto da DIO.
