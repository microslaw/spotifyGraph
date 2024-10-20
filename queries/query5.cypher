// What genre has the best average rating
MATCH (n)-[r:RATES]->(m)
RETURN m.genre, AVG(toInteger(r.rating)) AS average_rating
ORDER BY average_rating DESC
