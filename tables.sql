
DROP TABLE Diagnoses;
DROP TABLE Visits;
DROP TABLE Bills;
DROP TABLE Doctors;
DROP TABLE Patients;


CREATE TABLE Patients(pid INT, pname VARCHAR(32), city VARCHAR(32), primary key (pid));


CREATE TABLE Doctors(docid INT, docname VARCHAR(32), primary key (docid));


CREATE TABLE Bills(bid INT, amount_due FLOAT, amount_total FLOAT, pid INT, docid INT, status VARCHAR(8),
	primary key (bid),
	foreign key (pid) references Patients,
	foreign key (docid) references Doctors);


CREATE TABLE Visits(vid INT, pid INT, bid INT, docid INT,
	primary key (vid),
	foreign key (pid) references Patients,
	foreign key (bid) references Bills,
	foreign key (docid) references Doctors);


CREATE TABLE Diagnoses(diagname VARCHAR(32), vid INT,
	primary key (diagname, vid),
	foreign key (vid) references Visits);

-- Data, AI generated until EOF. Some edge cases not included here
INSERT INTO Patients VALUES (1, 'Alice Brown', 'New York');
INSERT INTO Patients VALUES (2, 'Bob Smith', 'Chicago');
INSERT INTO Patients VALUES (3, 'Cathy Turner', 'Miami');
INSERT INTO Patients VALUES (4, 'David Lee', 'Seattle');
INSERT INTO Doctors VALUES (101, 'Dr. Adams');
INSERT INTO Doctors VALUES (102, 'Dr. Johnson');
INSERT INTO Doctors VALUES (103, 'Dr. Lee');
INSERT INTO Bills VALUES (201, 50, 100, 1, 101, 'Paid');
INSERT INTO Bills VALUES (202, 30, 80, 2, 102, 'Pending');
INSERT INTO Bills VALUES (203, 40, 90, 3, 103, 'Unpaid');
INSERT INTO Bills VALUES (204, 20, 60, 4, 101, 'Paid');
INSERT INTO Visits VALUES (301, 1, 201, 101);
INSERT INTO Visits VALUES (302, 2, 202, 102);
INSERT INTO Visits VALUES (303, 3, 203, 103);
INSERT INTO Visits VALUES (304, 4, 204, 101);
INSERT INTO Diagnoses VALUES ('Flu', 301);
INSERT INTO Diagnoses VALUES ('Diabetes', 301);
INSERT INTO Diagnoses VALUES ('Cold', 302);
INSERT INTO Diagnoses VALUES ('Diabetes', 303);
INSERT INTO Diagnoses VALUES ('Hypertension', 304);
INSERT INTO Diagnoses VALUES ('Allergy', 304);
