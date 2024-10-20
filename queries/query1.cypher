// Which songs have the best average rating
MATCH (n)-[r:RATES]->(m)
RETURN m.title, AVG(toInteger(r.rating)) AS avg_rating
ORDER BY avg_rating DESC
