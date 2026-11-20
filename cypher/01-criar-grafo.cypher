// Limpa tudo antes de criar
MATCH (n) DETACH DELETE n;

// Cria Usuarios
CREATE (:Usuario {id: 1, nome: 'Ana', cidade: 'Montes Claros'});
CREATE (:Usuario {id: 2, nome: 'Joao', cidade: 'Belo Horizonte'});
CREATE (:Usuario {id: 3, nome: 'Maria', cidade: 'Sao Paulo'});

// Cria Musicas
CREATE (:Musica {id: 101, titulo: 'Evidencias', ano: 1990});
CREATE (:Musica {id: 102, titulo: 'Boate Azul', ano: 1991});
CREATE (:Musica {id: 103, titulo: 'Ai Se Eu Te Pego', ano: 2011});

// Cria Artistas e Generos
CREATE (:Artista {nome: 'Chitaozinho e Xororo'});
CREATE (:Artista {nome: 'Bruno e Marrone'});
CREATE (:Genero {nome: 'Sertanejo'});

// Conexoes DE_ARTISTA e DO_GENERO
MATCH (m:Musica {id: 101}), (a:Artista) WHERE a.nome = 'Chitaozinho e Xororo' CREATE (m)-[:DE_ARTISTA]->(a);
MATCH (m:Musica {id: 102}), (a:Artista) WHERE a.nome = 'Bruno e Marrone' CREATE (m)-[:DE_ARTISTA]->(a);
MATCH (m:Musica), (g:Genero {nome: 'Sertanejo'}) CREATE (m)-[:DO_GENERO]->(g);

// Conexoes OUVIU - A BASE DA RECOMENDACAO
MATCH (u:Usuario {id: 1}), (m:Musica {id: 101}) CREATE (u)-[:OUVIU {vezes: 15}]->(m);
MATCH (u:Usuario {id: 1}), (m:Musica {id: 102}) CREATE (u)-[:OUVIU {vezes: 10}]->(m);
MATCH (u:Usuario {id: 2}), (m:Musica {id: 101}) CREATE (u)-[:OUVIU {vezes: 20}]->(m);
MATCH (u:Usuario {id: 2}), (m:Musica {id: 103}) CREATE (u)-[:OUVIU {vezes: 5}]->(m);
MATCH (u:Usuario {id: 3}), (m:Musica {id: 102}) CREATE (u)-[:OUVIU {vezes: 12}]->(m);
MATCH (u:Usuario {id: 3}), (m:Musica {id: 103}) CREATE (u)-[:OUVIU {vezes: 8}]->(m);
