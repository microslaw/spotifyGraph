// What artist has written the biggest number of songs
MATCH (n)-[r:WRITTEN]->(m)
RETURN n.name, COUNT(*) AS number_of_songs
ORDER BY COUNT(*) DESC
LIMIT 3
