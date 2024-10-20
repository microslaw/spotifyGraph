
// What is the standard deviation and average rate of songs
MATCH (n)-[r:RATES]->(m)
RETURN stDev(toInteger(r.rating)) AS standard_deviation_of_rate, AVG(toInteger(r.rating)) AS average_rate
