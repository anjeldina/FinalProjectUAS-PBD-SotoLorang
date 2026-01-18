-- =============================================================
-- FINAL PROJECT PEMROGRAMAN BASIS DATA
-- JUDUL: SISTEM PENJUALAN SOTO LORANG
-- =============================================================

-- =============================================================
-- 1. PERSIAPAN DATABASE
-- =============================================================
DROP DATABASE IF EXISTS db_soto_lorang;
CREATE DATABASE db_soto_lorang;
USE db_soto_lorang;

-- =============================================================
-- 2. DDL (DATA DEFINITION LANGUAGE)
-- =============================================================

CREATE TABLE pelanggan (
    id_pelanggan INT AUTO_INCREMENT PRIMARY KEY,
    nama_pelanggan VARCHAR(100) NOT NULL,
    alamat VARCHAR(255),
    no_telp VARCHAR(15)
);

CREATE TABLE kasir (
    id_kasir INT AUTO_INCREMENT PRIMARY KEY,
    nama_kasir VARCHAR(100) NOT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL,
    shift_kerja ENUM('Pagi', 'Siang', 'Malam')
);

CREATE TABLE produk (
    id_produk INT AUTO_INCREMENT PRIMARY KEY,
    nama_produk VARCHAR(100) NOT NULL,
    kategori ENUM('Makanan', 'Minuman', 'Sate/Lauk'),
    harga_satuan DECIMAL(10,2) NOT NULL,
    stok INT DEFAULT 0
);

CREATE TABLE transaksi (
    no_nota VARCHAR(20) PRIMARY KEY,
    waktu_transaksi DATETIME NOT NULL,
    id_pelanggan INT,
    id_kasir INT,
    total_bayar DECIMAL(10,2),
    bayar_tunai DECIMAL(10,2),
    kembalian DECIMAL(10,2),
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan) ON DELETE SET NULL,
    FOREIGN KEY (id_kasir) REFERENCES kasir(id_kasir) ON DELETE SET NULL
);

CREATE TABLE detail_transaksi (
    id_detail INT AUTO_INCREMENT PRIMARY KEY,
    no_nota VARCHAR(20),
    id_produk INT,
    jumlah_beli INT NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (no_nota) REFERENCES transaksi(no_nota) ON DELETE CASCADE,
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk) ON DELETE RESTRICT
);

-- =============================================================
-- 3. DML (DATA MANIPULATION LANGUAGE)
-- =============================================================

INSERT INTO pelanggan VALUES
(NULL,'Budi Santoso','Jl. Laweyan No.10','08123456789'),
(NULL,'Siti Aminah','Jl. Slamet Riyadi No.45','08987654321');

INSERT INTO kasir VALUES
(NULL,'Syakira','syakira01','pass123','Pagi'),
(NULL,'Xaviera','xaviera02','pass456','Malam');

INSERT INTO produk VALUES
(NULL,'Soto Ayam Campur','Makanan',9000,50),
(NULL,'Teh Manis','Minuman',3000,100),
(NULL,'Sundukan Telur Puyuh','Sate/Lauk',4000,30),
(NULL,'Sundukan Jerohan','Sate/Lauk',4000,30),
(NULL,'Tahu Walik','Sate/Lauk',2000,50),
(NULL,'Es Jeruk','Minuman',4000,50);

-- =============================================================
-- 4. TCL (TRANSACTION CONTROL LANGUAGE)
-- =============================================================
START TRANSACTION;

INSERT INTO transaksi VALUES
('CS/18/251016/0076','2025-10-16 10:03:00',1,1,22000,50000,28000);

INSERT INTO detail_transaksi VALUES
(NULL,'CS/18/251016/0076',1,1,9000),
(NULL,'CS/18/251016/0076',2,1,3000),
(NULL,'CS/18/251016/0076',3,1,4000),
(NULL,'CS/18/251016/0076',4,1,4000),
(NULL,'CS/18/251016/0076',5,1,2000);

COMMIT;

-- =============================================================
-- 5. QUERY JOIN
-- =============================================================
SELECT 
    t.no_nota,
    t.waktu_transaksi,
    k.nama_kasir,
    p.nama_produk,
    p.harga_satuan,
    d.jumlah_beli,
    d.subtotal
FROM transaksi t
JOIN kasir k ON t.id_kasir = k.id_kasir
JOIN detail_transaksi d ON t.no_nota = d.no_nota
JOIN produk p ON d.id_produk = p.id_produk;

-- =============================================================
-- 6. GROUP BY & AGREGASI
-- =============================================================
SELECT 
    k.nama_kasir,
    COUNT(t.no_nota) AS jumlah_transaksi,
    SUM(t.total_bayar) AS total_pendapatan
FROM transaksi t
JOIN kasir k ON t.id_kasir = k.id_kasir
GROUP BY k.nama_kasir;

-- =============================================================
-- 7. HAVING
-- =============================================================
SELECT 
    p.nama_produk,
    SUM(d.jumlah_beli) AS total_terjual
FROM detail_transaksi d
JOIN produk p ON d.id_produk = p.id_produk
GROUP BY p.nama_produk
HAVING SUM(d.jumlah_beli) >= 1;

-- =============================================================
-- 8. SUBQUERY
-- =============================================================
SELECT nama_produk, harga_satuan
FROM produk
WHERE harga_satuan > (
    SELECT AVG(harga_satuan) FROM produk
);

-- =============================================================
-- 9. VIEW
-- =============================================================
CREATE VIEW view_laporan_penjualan AS
SELECT 
    t.no_nota,
    t.waktu_transaksi,
    k.nama_kasir,
    SUM(d.subtotal) AS total_bayar
FROM transaksi t
JOIN kasir k ON t.id_kasir = k.id_kasir
JOIN detail_transaksi d ON t.no_nota = d.no_nota
GROUP BY t.no_nota, t.waktu_transaksi, k.nama_kasir;

-- Menampilkan VIEW
SELECT * FROM view_laporan_penjualan;
