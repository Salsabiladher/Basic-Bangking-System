-- DLL (Data Definition Language)
-- Membuat tabel customer, account, and transaction. 
CREATE TABLE nasabah(
  customer_id SERIAL PRIMARY KEY,  
  customer_name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  phone BIGINT NOT NULL,
  current_situation VARCHAR(225) NOT NULL,
  name_mother VARCHAR(255) NOT NULL,
  date_birth DATE NOT NULL,
  email VARCHAR(255) NOT NULL
);

CREATE TABLE akun(
  account_id SERIAL PRIMARY KEY, 
  type_account VARCHAR(255) NOT NULL,
  debit DECIMAL(10, 2)
  );

CREATE TABLE transaksi (
  transaction_id SERIAL PRIMARY KEY,
  type_transaction VARCHAR(255) NOT NULL,
  total_transaction INTEGER,
  date_transaction DATE NOT NULL,
  account_id INTEGER,
  customer_id INTEGER
);

-- Membuat indeks pada account_id di tabel transaksi
CREATE INDEX idx_transaksi_account_id ON transaksi (account_id);

-- Membuat indeks pada customer_id di tabel transaksi
CREATE INDEX idx_transaksi_customer_id ON transaksi (customer_id);


-- DML (Data Manipulation Language) or CRUD 

-- 1. Insert Data ke tabel (1 baris)
-- Insert data ke tabel nasabah
INSERT INTO nasabah (customer_id, customer_name, address, phone, date_birth, current_situation, name_mother, email)
VALUES (10012, 'Mark Lee', 'Jalan Tukad Yeh Aya, Denpasar', 85123456789, '1997-02-14', 'Student', 'Debora Lee', 'marklee@gmail.com');
-- Insert data ke tabel akun
INSERT INTO akun (account_id, type_account, debit)
VALUES (6012, 'Prioritas', 125000);
-- Insert data ke tabel transaksi
INSERT INTO transaksi (transaction_id, type_transaction, total_transaction, date_transaction, account_id, customer_id)
VALUES (10001, 'Deposit', 500000, '2023-10-16', 6012, 10012);

-- 2. Update data nasabah, akun dan transaksi
-- Mengubah nama nasabah
UPDATE nasabah SET customer_name = 'Markie Lee' WHERE customer_id = 10012;
-- Mengubah status pekerjaan pelanggan nasabah 
UPDATE nasabah SET current_situation = 'Student Collage'WHERE customer_id = 10012;
-- Mengubah 
UPDATE akun SET type_account = 'Prioritas' WHERE account_id = 6012;
-- Mengubah 
UPDATE transaksi SET type_transaction = 'Withdrawal' WHERE account_id = 6012;

-- 3. Insert data ke tabel nasabah, akun, dan transaksi
-- Insert data baru ke tabel nasabah
INSERT INTO nasabah (customer_id, customer_name, address, phone, date_birth, current_situation, name_mother, email)
VALUES 
  (10013, 'Na Jaemin', 'Jalan Raya Bedugul, Tabanan', 81234567890, '1995-05-20', 'Employee', 'Lee Soomin', 'jaeminna13@gmail.com'),
  (10014, 'Krystal Jung', 'Jalan Putra Yudha, Bangli', 1234567890, '1994-08-12', 'Master Student', 'Na Yoona', 'jungkrystal12@gmail.com'),
  (10015, 'Daniel Lee', 'Cheongpa-ro 6-gil, Yongsan-gu, South Korea', 9876543210, '2007-03-10', 'Student', 'Park Emma', 'lee_daniel1004@gmail.com'),
  (10016, 'Lee Johoney', 'Hapjeong-dong, Mapo-gu, Seoul', 6543219870, '2008-06-10', 'Student', 'Im Yuna', 'joohoney@yahoo.com');

-- Insert data baru ke tabel akun
INSERT INTO akun (account_id, type_account, debit)
VALUES 
  (60013, 'Debitur', 150000),
  (60014, 'Prioritas', 75000),
  (60015, 'Penyimpan', 500000),
  (60016, 'Penyimpan', 250000);

-- Insert data baru ke tabel transaksi
INSERT INTO transaksi (transaction_id, type_transaction, total_transaction, date_transaction, account_id, customer_id)
VALUES 
  (0002, 'Withdrawal', 100000, '2023-10-17', 60013, 10013),
  (0003, 'Deposit', 200000, '2023-10-17', 60014, 10014),
  (0004, 'Withdrawal', 50000, '2023-10-18', 60015, 10015),
  (0005, 'Deposit', 1000000, '2023-10-18', 60016, 10016);

-- 4. Insert data ke tabel nasabah, akun, dan transaksi
-- Hapus data dari tabel transaksi terlebih dahulu
DELETE FROM transaksi WHERE account_id IN (SELECT account_id FROM akun WHERE customer_id = 10015);
-- Kemudian, hapus data dari tabel akun
DELETE FROM transaksi WHERE customer_id = 10015;
-- Terakhir, hapus data dari tabel nasabah
DELETE FROM nasabah WHERE customer_id = 10015;

-- 4. Read data dari tabel nasabah, akun, dan transaksi
-- Melihat semua tabel nasabah 
SELECT*FROM nasabah;
-- Melihat tabel nasabah dimana customer_id  10014
SELECT*FROM nasabah WHERE customer_id = 10014;
-- Melihat kolom account_id dan debit dari tabel akun
SELECT account_id, debit FROM akun;
-- Melihat kolom account_id dan debit dari tabel akun dimana account_id 60014
SELECT account_id, debit FROM akun WHERE account_id = 60014;
-- Melihat nilai unik pada kolom transaction_id dari tabel transaksi dimana account_id = 60013
SELECT DISTINCT transaction_id FROM transaksi WHERE account_id = 60013;