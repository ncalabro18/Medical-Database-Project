
-- Nicholas Calabro - Database I Project
-- December 11, 2025

-- 1.  Total visits per doctor– Find how many visits each doctor handled.

SELECT COUNT(d.docid) as c, docname FROM Doctors d JOIN Visits v ON d.docid = v.docid GROUP BY d.docid, docname ORDER BY c;


-- 2.  Top 5 patients by total bill amount– Identify which patients owe or paid the most.

SELECT * FROM (SELECT * FROM ( SELECT SUM(b.amount_total) as total, p.pname FROM Patients p JOIN Bills b ON p.pid = b.pid GROUP BY p.pname) ORDER BY total DESC) WHERE ROWNUM <= 5;


-- 3.  Most common diagnosis– Which diagnosis appears most frequently in the dataset?

SELECT diag.diagname, count(diag.diagname) as c FROM Diagnoses diag GROUP BY diag.diagname ORDER BY c DESC;


-- 4.  Visits per city– Find the number of visits grouped by patients’ city.

SELECT p.city, COUNT(v.vid) as c FROM Visits v JOIN Patients p ON (p.pid = v.pid) GROUP BY p.city ORDER BY c DESC;


-- 5.  Average bill per doctor– Compute the average amount due per doctor across visits. NOTE: I am assuming this means total bill, not whats left to pay by the Patient

SELECT d.docname, AVG(b.amount_total) as average FROM Bills b JOIN Doctors d ON  (d.docid = b.docid) JOIN Visits v ON (v.docid = b.docid) GROUP BY d.docid, d.docname ORDER BY average DESC;


-- 6.  Patients who had unpaid bills– List patients whose bills remain unpaid.

SELECT p.pname FROM Patients p JOIN Bills b ON (b.pid = p.pid AND b.status = 'Unpaid');


-- 7.  Doctors with patients diagnosed with Diabetes– Find doctors who treated at least one diabetic patient.

SELECT doc.docname FROM Diagnoses diag JOIN Visits v ON (diag.vid = v.vid) JOIN Doctors doc ON (v.docid = doc.docid AND diag.diagname = 'Diabetes');


-- 8.  Average total bill amount by payment status– Compare average bill amounts among payment statuses (Paid, Unpaid, Pending).

SELECT b.status, AVG(b.amount_total) FROM Bills b GROUP BY b.status;


-- 9.  List visits and their diagnoses– Display each visit with patient name, doctor, and diagnosis name.

SELECT p.pname, doc.docname, diag.diagname FROM Visits v JOIN Patients p ON (p.pid = v.pid) JOIN Doctors doc ON (v.docid = doc.docid) JOIN Diagnoses diag ON (diag.vid = v.vid);


-- 10. Top doctors by total billed revenue– Rank doctors by total revenue gen erated.

SELECT d.docname, sum(b.amount_total) as total FROM Doctors d JOIN Bills b ON (b.docid = d.docid) GROUP BY d.docid, d.docname ORDER BY total DESC;


