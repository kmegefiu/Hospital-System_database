drop table if exists Employee;
drop table if exists room;
drop table if exists record;
drop table if exists treatment;
drop table if exists nurses;
drop table if exists receptionists;
drop table if exists doctors;
drop table if exists patient;


CREATE TABLE room
(
  roomNumber INT NOT NULL,
  roomType VARCHAR(15) NOT NULL,
  period_days INT NOT NULL,
  PRIMARY KEY (roomNumber)
);

CREATE TABLE record
(
  patient_id INT NOT NULL,
  doctor_id INT NOT NULL,
  recordNumber INT NOT NULL,
  appointment_date DATE NOT NULL,
  roomNumber INT NOT NULL,
  emergencyRoom BOOLEAN NOT NULL,
  observation_notes VARCHAR(250) NOT NULL,

  PRIMARY KEY (patient_id),
  UNIQUE (recordNumber),
  UNIQUE (doctor_id),
  UNIQUE (roomNumber)
);


CREATE TABLE treatment
(
  billedTreatment FLOAT NOT NULL,
  code INT NOT NULL,
  price FLOAT NOT NULL,
  description VARCHAR(70) NOT NULL,
  quantity INT NOT NULL,
  treatment_id INT NOT NULL,
  patient_id INT NOT NULL,
  PRIMARY KEY (treatment_id),
  UNIQUE (code),
  UNIQUE (patient_id)
);

CREATE TABLE Employee
(

  fname VARCHAR(25) NOT NULL,
  lname VARCHAR(25) NOT NULL,
  ssn VARCHAR(11) NOT NULL,
  employee_id INT NOT NULL,
  birth_date DATE NOT NULL,
  gender CHAR(1) NOT NULL,
  salary FLOAT NOT NULL,
  streetNumber VARCHAR(20) NOT NULL,
  city VARCHAR(10) NOT NULL,
  state VARCHAR(10) NOT NULL,
  zipcode INT NOT NULL,
  phoneNumber VARCHAR(14) NOT NULL,

  
  PRIMARY KEY (employee_id),
  UNIQUE (ssn)
);

CREATE TABLE nurses
(
  nurse_id INT NOT NULL,
  PRIMARY KEY (nurse_id),
  PRIMARY KEY (nurse_id) REFERENCES Employee(employee_id),
  UNIQUE (nurse_id)
);

CREATE TABLE doctors
(
 
  doctor_id INT NOT NULL,
  specialty VARCHAR(25) NOT NULL,
  employee_id INT NOT NULL,
  PRIMARY KEY (employee_id),
  FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
  UNIQUE (doctor_id)
);

CREATE TABLE receptionists
(
  receptionists_id INT NOT NULL,
  PRIMARY KEY (receptionists_id),
  FOREIGN KEY (receptionists_id) REFERENCES Employee(employee_id),
  UNIQUE (receptionists_id)
);

/*CREATE TABLE governs
(
  roomNumber INT NOT NULL,
  employee_id INT NOT NULL,
  PRIMARY KEY (roomNumber, employee_id),
  FOREIGN KEY (roomNumber) REFERENCES room(roomNumber),
  FOREIGN KEY (employee_id) REFERENCES nurses(employee_id)
);

CREATE TABLE go_to/attends
(
  employee_id INT NOT NULL,
  roomNumber INT NOT NULL,
  PRIMARY KEY (employee_id, roomNumber),
  FOREIGN KEY (employee_id) REFERENCES doctors(employee_id),
  FOREIGN KEY (roomNumber) REFERENCES room(roomNumber)
);

CREATE TABLE Manages
(
  patient_id INT NOT NULL,
  employee_id INT NOT NULL,
  PRIMARY KEY (patient_id, employee_id),
  FOREIGN KEY (patient_id) REFERENCES record(patient_id),
  FOREIGN KEY (employee_id) REFERENCES receptionists(employee_id)
);

CREATE TABLE recommends/gives
(
  employee_id INT NOT NULL,
  treatment_id INT NOT NULL,
  PRIMARY KEY (employee_id, treatment_id),
  FOREIGN KEY (employee_id) REFERENCES doctors(employee_id),
  FOREIGN KEY (treatment_id) REFERENCES treatment(treatment_id)
);

*/

CREATE TABLE patient
(
  fname VARCHAR(25) NOT NULL,
  lname VARCHAR(25) NOT NULL,
  ssn VARCHAR(11) NOT NULL,
  patient_id INT NOT NULL,
  dateOfBirth DATE NOT NULL,
  streetNumber VARCHAR(25) NOT NULL,
  city VARCHAR(10) NOT NULL,
  state VARCHAR(10) NOT NULL,
  zipcode INT NOT NULL,
  phone VARCHAR(14) NOT NULL,
  dateAdmitted DATE NOT NULL,
  dateDischarge DATE NOT NULL,
  gender CHAR(1) NOT NULL,

  treatment_id INT NOT NULL,

  PRIMARY KEY (patient_id),
  FOREIGN KEY (treatment_id) REFERENCES treatment(treatment_id),
  UNIQUE (ssn)
);

/*CREATE TABLE has
(
  patient_id INT NOT NULL,
  patient_id INT NOT NULL,
  PRIMARY KEY (patient_id, patient_id),
  FOREIGN KEY (patient_id) REFERENCES record(patient_id),
  FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);

CREATE TABLE assigned_to
(
  roomNumber INT NOT NULL,
  patient_id INT NOT NULL,
  PRIMARY KEY (roomNumber, patient_id),
  FOREIGN KEY (roomNumber) REFERENCES room(roomNumber),
  FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);*/

insert into Employee (fname, lname, ssn, employee_id, birth_date, gender, salary, streetNumber, city, state, zipcode, phone) values ('Brenn', 'Rowney', '864-78-0415', 108402789, '6/1/2021', 'F', 48996.12, '680', 'Miami', 'Florida', 33196, '305-509-2519');
insert into Employee (fname, lname, ssn, employee_id, birth_date, gender, salary, streetNumber, city, state, zipcode, phone) values ('Wade', 'Richarz', '555-47-8836', 358650610, '1/3/2022', 'M', 51133.06, '53837', 'Bradenton', 'Florida', 34205, '941-934-8190');
insert into Employee (fname, lname, ssn, employee_id, birth_date, gender, salary, streetNumber, city, state, zipcode, phone) values ('Jeremiah', 'Haskins', '242-28-1377', 932917011, '12/31/2021', 'M', 71938.00, '46267', 'Ocala', 'Florida', 34479, '352-640-0269');
insert into Employee (fname, lname, ssn, employee_id, birth_date, gender, salary, streetNumber, city, state, zipcode, phone) values ('Koral', 'Goade', '215-44-5874', 528270550, '2/4/2022', 'F', 89111.94, '66', 'Pensacola', 'Florida', 32520, '850-541-4349');
insert into Employee (fname, lname, ssn, employee_id, birth_date, gender, salary, streetNumber, city, state, zipcode, phone) values ('Duncan', 'Hulburt', '236-31-3542', 588035312, '6/19/2021', 'M', 87194.74, '3566', 'Homestead', 'Florida', 33034, '786-785-6768');
insert into Employee (fname, lname, ssn, employee_id, birth_date, gender, salary, streetNumber, city, state, zipcode, phone) values ('Concordia', 'Boyde', '331-13-8233', 922279939, '10/26/2021', 'F', 185336.44, '25', 'Orlando', 'Florida', 32825, '321-451-4947');
insert into Employee (fname, lname, ssn, employee_id, birth_date, gender, salary, streetNumber, city, state, zipcode, phone) values ('Hedvig', 'Clixby', '614-57-9880', 402611692, '9/24/2021', 'F', 187834.75, '709', 'Bradenton', 'Florida', 34210, '941-404-8013');
insert into Employee (fname, lname, ssn, employee_id, birth_date, gender, salary, streetNumber, city, state, zipcode, phone) values ('Sallyanne', 'Veighey', '180-51-5395', 718167980, '10/14/2021', 'F', 170187.92, '6036', 'Largo', 'Florida', 33777, '727-944-8850');
insert into Employee (fname, lname, ssn, employee_id, birth_date, gender, salary, streetNumber, city, state, zipcode, phone) values ('Putnam', 'Marrett', '697-38-7551', 151562799, '1/22/2022', 'M', 181979.45, '1055', 'Fort Myers', 'Florida', 33994, '239-487-4995');
insert into Employee (fname, lname, ssn, employee_id, birth_date, gender, salary, streetNumber, city, state, zipcode, phone) values ('Wye', 'Moreing', '330-60-4109', 409609857, '10/15/2021', 'M', 180812.43, '8', 'Sarasota', 'Florida', 34233, '941-529-9563');
insert into Employee (fname, lname, ssn, employee_id, birth_date, gender, salary, streetNumber, city, state, zipcode, phone) values ('Daryl', 'Rosenfield', '503-42-5835', 227214823, '7/20/2021', 'M', 177191.98, '44020', 'Tallahassee', 'Florida', 32399, '850-762-3660');
insert into Employee (fname, lname, ssn, employee_id, birth_date, gender, salary, streetNumber, city, state, zipcode, phone) values ('Cati', 'Whitewood', '146-53-2725', 596955022, '2/18/2022', 'F', 201643.77, '408', 'Saint Petersburg', 'Florida', 33731, '727-358-3915');
insert into Employee (fname, lname, ssn, employee_id, birth_date, gender, salary, streetNumber, city, state, zipcode, phone) values ('Kathi', 'Petrushka', '105-99-7694', 046092428, '5/30/2021', 'F', 209525.66, '05744', 'Naples', 'Florida', 34108, '941-994-0133');
insert into Employee (fname, lname, ssn, employee_id, birth_date, gender, salary, streetNumber, city, state, zipcode, phone) values ('Gonzalo', 'Hucquart', '528-77-9590', 539239430, '6/20/2021', 'M', 263611.43, '395', 'Largo', 'Florida', 33777, '727-388-2897');
insert into Employee (fname, lname, ssn, employee_id, birth_date, gender, salary, streetNumber, city, state, zipcode, phone) values ('Gasper', 'Anthes', '876-95-5701', 204168896, '12/5/2021', 'M', 129162.35, '0803', 'Clearwater', 'Florida', 34620, '727-654-8853');
insert into Employee (fname, lname, ssn, employee_id, birth_date, gender, salary, streetNumber, city, state, zipcode, phone) values ('Elyse', 'Kleinzweig', '421-74-6450', 038926491, '12/4/2021', 'F', 75102.95, '744', 'Gainesville', 'Florida', 32627, '352-588-3965');
insert into Employee (fname, lname, ssn, employee_id, birth_date, gender, salary, streetNumber, city, state, zipcode, phone) values ('Kirbee', 'Prescott', '506-40-5441', 784024473, '11/7/2021', 'F', 70134.54, '20286', 'Kissimmee', 'Florida', 34745, '407-908-7590');
insert into Employee (fname, lname, ssn, employee_id, birth_date, gender, salary, streetNumber, city, state, zipcode, phone) values ('Feodora', 'Paolillo', '211-20-5385', 946204063, '11/22/2021', 'F', 78291.24, '64', 'Fort Pierce', 'Florida', 34981, '772-907-9828');
insert into Employee (fname, lname, ssn, employee_id, birth_date, gender, salary, streetNumber, city, state, zipcode, phone) values ('Amabelle', 'Lugg', '291-70-0993', 517157700, '2/14/2022', 'F', 84930.57, '039', 'Jacksonville', 'Florida', 32230, '904-867-4940');
insert into Employee (fname, lname, ssn, employee_id, birth_date, gender, salary, streetNumber, city, state, zipcode, phone) values ('Lorant', 'Angeau', '851-77-2188', 746421579, '2/7/2022', 'M', 93379.51, '41853', 'Miami', 'Florida', 33245, '786-633-8302');



insert into nurses (nurse_id) values (746421579);
insert into nurses (nurse_id) values (517157700);
insert into nurses (nurse_id) values (946204063);
insert into nurses (nurse_id) values (784024473);
insert into nurses (nurse_id) values (038926491);
insert into nurses (nurse_id) values (588035312);
insert into nurses (nurse_id) values (528270550);
insert into nurses (nurse_id) values (932917011);

insert into receptionists (receptionists_id) values (358650610);
insert into receptionists (receptionists_id) values (108402789);


insert into room (roomNumber, roomType, period_days) values (372, 'double', 14);
insert into room (roomNumber, roomType, period_days) values (457, 'single', 28);
insert into room (roomNumber, roomType, period_days) values (475, 'single', 24);
insert into room (roomNumber, roomType, period_days) values (462, 'double', 25);
insert into room (roomNumber, roomType, period_days) values (532, 'double', 16);
insert into room (roomNumber, roomType, period_days) values (534, 'double', 16);
insert into room (roomNumber, roomType, period_days) values (506, 'double', 18);
insert into room (roomNumber, roomType, period_days) values (485, 'single', 28);
insert into room (roomNumber, roomType, period_days) values (487, 'single', 13);
insert into room (roomNumber, roomType, period_days) values (457, 'single', 26);
insert into room (roomNumber, roomType, period_days) values (538, 'double', 28);
insert into room (roomNumber, roomType, period_days) values (359, 'single', 23);
insert into room (roomNumber, roomType, period_days) values (347, 'single', 25);
insert into room (roomNumber, roomType, period_days) values (518, 'double', 16);
insert into room (roomNumber, roomType, period_days) values (403, 'single', 19);


insert into record (patient_id, doctor_id, recordNumber, appointment_date, roomNum, emergencyRoom, observation_notes) values (63478, 204168896, 912994, '11/28/2021', 372, false, 'Choledochlith/ac gb-obst');
insert into record (patient_id, doctor_id, recordNumber, appointment_date, roomNum, emergencyRoom, observation_notes) values (66983, 539239430, 964290, '2/19/2022', 457, true, 'Adverse food react NEC');
insert into record (patient_id, doctor_id, recordNumber, appointment_date, roomNum, emergencyRoom, observation_notes) values (63830, 046092428, 946147, '11/13/2021', 475, true, 'Cong foot deform NEC');
insert into record (patient_id, doctor_id, recordNumber, appointment_date, roomNum, emergencyRoom, observation_notes) values (63178, 596955022, 918767, '12/17/2021', 462, false, 'Hebephrenia-subchronic');
insert into record (patient_id, doctor_id, recordNumber, appointment_date, roomNum, emergencyRoom, observation_notes) values (66386, 227214823, 972096, '12/31/2021', 532, false, 'Primary hyperparathyroid');
insert into record (patient_id, doctor_id, recordNumber, appointment_date, roomNum, emergencyRoom, observation_notes) values (65045, 409609857, 946409, '3/9/2022', 534, false, 'Ac duod ulc hem/perf-obs');
insert into record (patient_id, doctor_id, recordNumber, appointment_date, roomNum, emergencyRoom, observation_notes) values (64844, 151562799, 982442, '12/30/2021', 506, false, 'Hodgkins paragran abdom');
insert into record (patient_id, doctor_id, recordNumber, appointment_date, roomNum, emergencyRoom, observation_notes) values (65253, 718167980, 946984, '7/29/2021', 485, false, 'Sweat gland disorder NEC');
insert into record (patient_id, doctor_id, recordNumber, appointment_date, roomNum, emergencyRoom, observation_notes) values (65815, 402611692, 921088, '3/16/2022', 487, true, 'Cong factor viii diord');
insert into record (patient_id, doctor_id, recordNumber, appointment_date, roomNum, emergencyRoom, observation_notes) values (65115, 922279939, 955584, '2/15/2022', 457, false, 'Miliary TB NEC-histo dx');
insert into record (patient_id, doctor_id, recordNumber, appointment_date, roomNum, emergencyRoom, observation_notes) values (62122, 204168896, 934970, '1/24/2022', 538, false, 'Dis urea cycle metabol');
insert into record (patient_id, doctor_id, recordNumber, appointment_date, roomNum, emergencyRoom, observation_notes) values (65760, 539239430, 980513, '9/4/2021', 359, true, 'Poison-piped gas');
insert into record (patient_id, doctor_id, recordNumber, appointment_date, roomNum, emergencyRoom, observation_notes) values (60824, 046092428, 946840, '1/28/2022', 347, false, 'Adv eff nerve-block anes');
insert into record (patient_id, doctor_id, recordNumber, appointment_date, roomNum, emergencyRoom, observation_notes) values (62428, 596955022, 961816, '9/20/2021', 518, false, 'Reticulosarcoma abdom');
insert into record (patient_id, doctor_id, recordNumber, appointment_date, roomNum, emergencyRoom, observation_notes) values (61255, 409609857, 916892, '10/28/2021', 403, true, 'Brain hem opn w/o coma');


insert into doctors  (doctor_id , specialty) values (204168896, 'internist');
insert into doctors  (doctor_id , specialty) values (539239430, 'cardiologist');
insert into doctors  (doctor_id , specialty) values (046092428, 'pulmonologist');
insert into doctors  (doctor_id , specialty) values (596955022, 'nephrologist');
insert into doctors  (doctor_id , specialty) values (227214823, 'ENT');
insert into doctors  (doctor_id , specialty) values (409609857, 'neurologist');
insert into doctors  (doctor_id , specialty) values (151562799, 'neurologist');
insert into doctors  (doctor_id , specialty) values (718167980, 'endocrinologist');
insert into doctors  (doctor_id , specialty) values (402611692, 'neurologist');
insert into doctors  (doctor_id , specialty) values (922279939, 'neurologist');


insert into treatment (billedTreatment, code, price, description, quantity, treatment_id, patient_number) values (12158.87, 74094, 123.51, 'LEVAQUIN', 1, 40327, 63478);
insert into treatment (billedTreatment, code, price, description, quantity, treatment_id, patient_number) values (20126.01, 77043, 112.44, 'POLY-TUSSIN', 2, 41641, 66983);
insert into treatment (billedTreatment, code, price, description, quantity, treatment_id, patient_number) values (19685.05, 74012, 85.22, 'Fluvoxamine Maleate', 5, 43519, 63830);
insert into treatment (billedTreatment, code, price, description, quantity, treatment_id, patient_number) values (10719.87, 73272, 168.16, 'Coralite Antibacterial Natural Oat', 5, 42114, 63178);
insert into treatment (billedTreatment, code, price, description, quantity, treatment_id, patient_number) values (8296.65, 70368, 89.87, 'AVONEX', 9, 42256, 66386);
insert into treatment (billedTreatment, code, price, description, quantity, treatment_id, patient_number) values (15889.81, 76410, 149.42, 'Fentanyl Citrate', 10, 44146, 65045);
insert into treatment (billedTreatment, code, price, description, quantity, treatment_id, patient_number) values (8162.75, 75698, 139.23, 'Soothing Moisturizing', 7, 40875, 64844);
insert into treatment (billedTreatment, code, price, description, quantity, treatment_id, patient_number) values (12333.39, 72247, 80.22, 'Redtop Grass, Standardized', 4, 40748, 65253);
insert into treatment (billedTreatment, code, price, description, quantity, treatment_id, patient_number) values (6919.81, 70813, 190.26, 'Alprazolam', 10, 41869, 65815);
insert into treatment (billedTreatment, code, price, description, quantity, treatment_id, patient_number) values (10148.20, 72228, 162.72, 'Healthy Accents Nicotine', 8, 41098, 65115);
insert into treatment (billedTreatment, code, price, description, quantity, treatment_id, patient_number) values (13768.84, 74719, 136.36, 'Levothyroxine Sodium', 1, 43457, 62122);
insert into treatment (billedTreatment, code, price, description, quantity, treatment_id, patient_number) values (7718.23, 76533, 165.42, 'Dysmenorrhea Diarrhea', 3, 44040, 65760);
insert into treatment (billedTreatment, code, price, description, quantity, treatment_id, patient_number) values (16842.44, 73707, 160.44, 'Allergy Relief', 4, 44390, 60824);
insert into treatment (billedTreatment, code, price, description, quantity, treatment_id, patient_number) values (6186.38, 76243, 209.63, 'Frais Hand Sanitizer', 3, 44041, 62428);
insert into treatment (billedTreatment, code, price, description, quantity, treatment_id, patient_number) values (12389.63, 76044, 213.26, 'Topiramate', 6, 42336, 61255);


insert into patient (fname, lname, ssn, patient_id, dateOfBirth, age, streetNumber, city, state, zipcode, phone, dateAdmitted, dateDischarge, gender) values ('Hillary', 'Loudwell', '184-69-1854', 63478, '9/15/2021', 24, '927', 'Pensacola', 'Florida', 32526, '850-977-6379', '11/15/2021', '1/14/2022', 'M');
insert into patient (fname, lname, ssn, patient_id, dateOfBirth, age, streetNumber, city, state, zipcode, phone, dateAdmitted, dateDischarge, gender) values ('Russ', 'Gilbey', '695-17-5923', 66983, '8/17/2021', 66, '414', 'Pensacola', 'Florida', 32505, '850-473-4932', '4/5/2022', '12/28/2021', 'M');
insert into patient (fname, lname, ssn, patient_id, dateOfBirth, age, streetNumber, city, state, zipcode, phone, dateAdmitted, dateDischarge, gender) values ('Malachi', 'Isabell', '811-99-5777', 63830, '10/17/2021', 33, '45', 'Tallahassee', 'Florida', 32314, '850-770-6358', '1/26/2022', '1/24/2022', 'M');
insert into patient (fname, lname, ssn, patient_id, dateOfBirth, age, streetNumber, city, state, zipcode, phone, dateAdmitted, dateDischarge, gender) values ('Rudy', 'Makin', '446-98-8215', 63178, '7/21/2021', 37, '4664', 'Gainesville', 'Florida', 32605, '352-789-3096', '11/15/2021', '10/13/2021', 'M');
insert into patient (fname, lname, ssn, patient_id, dateOfBirth, age, streetNumber, city, state, zipcode, phone, dateAdmitted, dateDischarge, gender) values ('Corrina', 'Munns', '504-28-2138', 66386, '11/13/2021', 37, '4188', 'Pensacola', 'Florida', 32590, '850-938-1240', '11/24/2021', '11/24/2021', 'F');
insert into patient (fname, lname, ssn, patient_id, dateOfBirth, age, streetNumber, city, state, zipcode, phone, dateAdmitted, dateDischarge, gender) values ('Romain', 'Couves', '850-57-2942', 65045, '9/29/2021', 41, '423', 'Naples', 'Florida', 33961, '305-339-0689', '9/11/2021', '7/22/2021', 'M');
insert into patient (fname, lname, ssn, patient_id, dateOfBirth, age, streetNumber, city, state, zipcode, phone, dateAdmitted, dateDischarge, gender) values ('Cob', 'Dankov', '402-86-2793', 64844, '8/2/2021', 63, '0945', 'Miami', 'Florida', 33185, '305-734-2597', '7/30/2021', '3/15/2022', 'M');
insert into patient (fname, lname, ssn, patient_id, dateOfBirth, age, streetNumber, city, state, zipcode, phone, dateAdmitted, dateDischarge, gender) values ('Hyacinthe', 'Ruddin', '854-09-1369', 65253, '12/14/2021', 24, '23', 'Palm Bay', 'Florida', 32909, '561-221-7077', '9/18/2021', '3/25/2022', 'F');
insert into patient (fname, lname, ssn, patient_id, dateOfBirth, age, streetNumber, city, state, zipcode, phone, dateAdmitted, dateDischarge, gender) values ('Teriann', 'Martschik', '372-27-0671', 65815, '10/5/2021', 69, '10', 'Miami Beach', 'Florida', 33141, '305-790-4999', '7/17/2021', '4/11/2022', 'F');
insert into patient (fname, lname, ssn, patient_id, dateOfBirth, age, streetNumber, city, state, zipcode, phone, dateAdmitted, dateDischarge, gender) values ('Romeo', 'Janssen', '734-31-3583', 65115, '7/28/2021', 67, '260', 'Sarasota', 'Florida', 34233, '941-810-6182', '11/30/2021', '2/8/2022', 'M');
insert into patient (fname, lname, ssn, patient_id, dateOfBirth, age, streetNumber, city, state, zipcode, phone, dateAdmitted, dateDischarge, gender) values ('Hayes', 'Waldera', '499-80-4866', 62122, '9/15/2021', 25, '4676', 'Jacksonville', 'Florida', 32244, '904-824-7879', '3/18/2022', '4/7/2022', 'M');
insert into patient (fname, lname, ssn, patient_id, dateOfBirth, age, streetNumber, city, state, zipcode, phone, dateAdmitted, dateDischarge, gender) values ('Ted', 'Dyter', '475-93-7102', 65760, '8/27/2021', 43, '3', 'Pompano Beach', 'Florida', 33069, '754-833-5963', '2/22/2022', '10/12/2021', 'F');
insert into patient (fname, lname, ssn, patient_id, dateOfBirth, age, streetNumber, city, state, zipcode, phone, dateAdmitted, dateDischarge, gender) values ('Travis', 'Cristofolini', '280-73-7840', 60824, '10/20/2021', 26, '458', 'Naples', 'Florida', 34102, '941-503-1588', '1/20/2022', '3/5/2022', 'M');
insert into patient (fname, lname, ssn, patient_id, dateOfBirth, age, streetNumber, city, state, zipcode, phone, dateAdmitted, dateDischarge, gender) values ('Ewart', 'Dimitru', '716-44-0546', 62428, '8/13/2021', 50, '726', 'Largo', 'Florida', 33777, '727-625-1160', '2/22/2022', '12/20/2021', 'M');
insert into patient (fname, lname, ssn, patient_id, dateOfBirth, age, streetNumber, city, state, zipcode, phone, dateAdmitted, dateDischarge, gender) values ('Chantalle', 'Yearron', '204-67-5230', 61255, '1/11/2022', 63, '78229', 'Hialeah', 'Florida', 33018, '786-401-7167', '7/29/2021', '3/13/2022', 'F');
