-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
DROP DATABASE medical_center;
CREATE DATABASE medical_center;
\c medical_center;

CREATE TABLE medical_center (
    center_id PRIMARYKEY   NOT NULL,
    name TEXT   NOT NULL,
    location TEXT   NOT NULL,
    phone_number INTEGER   NOT NULL
);

CREATE TABLE doctors (
    doctor_id PRIMARY KEY   NOT NULL,
    name TEXT   NOT NULL,
    specialty TEXT   NOT NULL,
    phone_number INTEGER   NOT NULL,
    email TEXT   NOT NULL,
    center_id FOREIGN KEY   NOT NULL
);

CREATE TABLE patients (
    patient_id PRIMARY KEY   NOT NULL,
    name TEXT   NOT NULL,
    phone_number INTEGER   NOT NULL,
    email TEXT   NOT NULL,
    date_of_birth DATE   NOT NULL,
    address TEXT   NOT NULL,
    center_id FOREIGN KEY   NOT NULL
);

CREATE TABLE visits (
    visit_id PRIMARY KEY   NOT NULL,
    doctor_id FOREIGN KEY   NOT NULL,
    patient_id FOREIGN KEY   NOT NULL,
    visit_date DATE   NOT NULL,
    diagnosis TEXT   NOT NULL
);

CREATE TABLE diseases (
    disease_id PRIMARY KEY   NOT NULL,
    name TEXT   NOT NULL
);

CREATE TABLE patient_diseases (
    id PRIMARYKEY   NOT NULL,
    patient_id FOREIGN KEY   NOT NULL,
    disease_id FOREIGN KEY   NOT NULL
);

ALTER TABLE doctors ADD CONSTRAINT fk_doctors_center_id FOREIGN KEY(center_id)
REFERENCES medical_center (center_id);

ALTER TABLE patients ADD CONSTRAINT fk_patients_center_id FOREIGN KEY(center_id)
REFERENCES medical_center (center_id);

ALTER TABLE visits ADD CONSTRAINT fk_visits_doctor_id FOREIGN KEY(doctor_id)
REFERENCES doctors (doctor_id);

ALTER TABLE visits ADD CONSTRAINT fk_visits_patient_id FOREIGN KEY(patient_id)
REFERENCES patients (patient_id);

ALTER TABLE patient_diseases ADD CONSTRAINT fk_patient_diseases_id FOREIGN KEY(id)
REFERENCES patients (patient_id);

ALTER TABLE patient_diseases ADD CONSTRAINT fk_patient_diseases_patient_id FOREIGN KEY(patient_id)
REFERENCES diseases (disease_id);

