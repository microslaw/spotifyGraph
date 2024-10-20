// What is the correlation between the listener's and the artist's gender
MATCH (n)-[r:RATES]->(m), (o)-[w: WRITTEN]->(m)
RETURN n.gender AS listener_gender, o.gender AS artists_gender, COUNT(*) AS number_of_occurences
ORDER BY COUNT(*) DESC
