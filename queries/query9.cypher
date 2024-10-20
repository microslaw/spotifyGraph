
// What is the highest rate made
MATCH (n)-[r:RATES]->(m)
RETURN MAX(r.rating) AS maximum_rate
