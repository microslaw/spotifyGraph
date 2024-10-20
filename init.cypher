MATCH (n) DETACH DELETE n;

LOAD CSV WITH HEADERS FROM "file:///data/person.csv" AS person
CREATE (p:PERSON {
    index: person.index,
    day_of_birth: person.day_of_birth,
    gender: person.gender,
    name: person.name,
    surname: person.surname});

LOAD CSV WITH HEADERS FROM "file:///data/artists.csv" AS artists
MATCH (p:PERSON {index: artists.index})
SET p:ARTIST, p.nickname = artists.nickname;

LOAD CSV WITH HEADERS FROM "file:///data/songs.csv" AS songs
CREATE(s:SONG {
    index: songs.index,
    title: songs.title,
    genre: songs.genre,
    duration: songs.duration,
    release_date: timestamp(songs.release_date)});


LOAD CSV WITH HEADERS FROM "file:///data/follows.csv" AS follows
MATCH (follower:PERSON {index: follows.id_follower}), (followed:PERSON {index: follows.id_followed})
CREATE (follower)-[:FOLLOWS {since: timestamp(follows.since)}]->(followed);

LOAD CSV WITH HEADERS FROM "file:///data/rates.csv" AS rates
MATCH (person:PERSON {index: rates.id_person}), (song:SONG {index: rates.id_song})
CREATE (person)-[:RATES {rating: toInteger(rates.rate), timestamp:timestamp(rates.timestamp)}]->(song);


LOAD CSV WITH HEADERS FROM "file:///data/written.csv" AS written
MATCH (artist:ARTIST {index: written.id_artist}), (song:SONG {index: written.id_song})
CREATE (artist)-[:WRITTEN]->(song);

MATCH (n)-[:WRITTEN]->(m),
        (n)-[rates:RATES]->(m)
DELETE rates;

MATCH (person)-[rates:RATES]->(song)
WHERE song.since > rates.timestamp
SET rates.timestamp = song.since;

MATCH (n)
REMOVE n.index
RETURN n
