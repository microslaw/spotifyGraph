// Which user has the most followers
MATCH (n)-[r:FOLLOWS]->(m)
RETURN m.name, COUNT(*) AS number_of_followers
ORDER BY COUNT(*) DESC
