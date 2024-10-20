
// What artist has the best average rate for their songs?
MATCH (n)-[r:RATES]->(o), (m)-[w:WRITTEN]->(o)
RETURN m.nickname, AVG(toInteger(r.rating)) AS average_rating
ORDER BY average_rating DESC
