
CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(256),
    date_of_birth DATE
);

CREATE TABLE treaments (
    id SERIAL PRIMARY KEY,
    type VARCHAR(256),
    name VARCHAR(256)
);

CREATE TABLE medical_histories (
    id SERIAL PRIMARY KEY,
    admitted_at TIMESTAMP,
   patient_id INT,
   status VARCHAR(256),
   CONSTRAINT fk_patient FOREIGN KEY(patient_id) REFERENCES patients(id)  
);


