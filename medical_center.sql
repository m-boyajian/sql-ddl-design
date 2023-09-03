CREATE TABLE "diagnoses"(
    "id" SERIAL NOT NULL,
    "disease_id" INTEGER NULL,
    "summary" TEXT NOT NULL,
    "visit_id" INTEGER NOT NULL
);
ALTER TABLE
    "diagnoses" ADD PRIMARY KEY("id");
CREATE TABLE "diseases"(
    "id" SERIAL NOT NULL,
    "name" TEXT NULL,
    "summary" TEXT NULL
);
ALTER TABLE
    "diseases" ADD PRIMARY KEY("id");
CREATE TABLE "doctors"(
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "practice" TEXT NOT NULL
);
ALTER TABLE
    "doctors" ADD PRIMARY KEY("id");
CREATE TABLE "visits"(
    "id" SERIAL NOT NULL,
    "date" DATE NOT NULL,
    "patient_id" INTEGER NOT NULL,
    "doctor_id" INTEGER NOT NULL
);
ALTER TABLE
    "visits" ADD PRIMARY KEY("id");
CREATE TABLE "patients"(
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "birthdate" DATE NOT NULL,
    "insurance" TEXT NOT NULL
);
ALTER TABLE
    "patients" ADD PRIMARY KEY("id");
ALTER TABLE
    "visits" ADD CONSTRAINT "visits_patient_id_foreign" FOREIGN KEY("patient_id") REFERENCES "patients"("id");
ALTER TABLE
    "diagnoses" ADD CONSTRAINT "diagnoses_visit_id_foreign" FOREIGN KEY("visit_id") REFERENCES "visits"("id");
ALTER TABLE
    "diagnoses" ADD CONSTRAINT "diagnoses_disease_id_foreign" FOREIGN KEY("disease_id") REFERENCES "diseases"("id");
ALTER TABLE
    "visits" ADD CONSTRAINT "visits_doctor_id_foreign" FOREIGN KEY("doctor_id") REFERENCES "doctors"("id");