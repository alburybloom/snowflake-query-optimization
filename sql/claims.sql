-- DDL
CREATE TABLE IF NOT EXISTS healthcare_claims (
    claim_id STRING, patient_id STRING,
    diagnosis_code STRING, procedure_code STRING,
    total_cost FLOAT, claim_date DATE
);

-- Example optimized aggregation (with clustering keys in a real Snowflake env)
-- ALTER TABLE healthcare_claims CLUSTER BY (claim_date);

SELECT patient_id, SUM(total_cost) AS total_spent
FROM healthcare_claims
WHERE claim_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY patient_id
ORDER BY total_spent DESC;