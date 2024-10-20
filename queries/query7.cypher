
// What listener made the biggest number of rates
MATCH (n)-[r:RATES]->(o)
RETURN n.name, COUNT(*) AS number_of_rates
ORDER BY number_of_rates DESC
