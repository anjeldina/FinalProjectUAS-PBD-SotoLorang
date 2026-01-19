# 🍜 Sistem Penjualan (POS) Soto Lorang

> **Final Project Mata Kuliah Pemrograman Basis Data**
> **Universitas Duta Bangsa Surakarta**

Repository ini berisi rancangan dan implementasi basis data untuk sistem kasir (Point of Sales) pada UMKM **Soto Lorang**. Proyek ini bertujuan untuk mentransformasi sistem pencatatan manual (nota kertas) menjadi sistem basis data terkomputerisasi yang terintegrasi.

## 👥 Anggota Kelompok
| Nama | NIM |
| :--- | :--- |
| **Amanda Fitri Honestya** | 240103154 |
| **Anjel Dina Erawati** | 240103155 |
| **Aulia Athifa Zahra** | 240103156 |
| **Nayla Putri Salsabila** | 240103172 |

## 📖 Latar Belakang Masalah
Sebelum adanya sistem ini, Soto Lorang menghadapi kendala:
* Pencatatan transaksi masih manual menggunakan kertas/nota fisik.
* Sering terjadi *human error* (salah hitung) saat rekap pendapatan harian.
* Data stok menu dan data penjualan tidak terintegrasi.
* Sulit melacak riwayat transaksi pelanggan.

## 🚀 Fitur & Solusi Basis Data
Database ini dirancang menggunakan **MySQL** dengan penerapan **Normalisasi (hingga 3NF)** untuk menjamin integritas data. Fitur utamanya meliputi:

1.  **Manajemen Data Master (CRUD):** Pengelolaan data Menu (Produk), Kasir, dan Pelanggan.
2.  **Transaksi Penjualan:** Mencatat detail pesanan, menghitung total bayar, dan kembalian secara otomatis melalui Query.
3.  **Laporan Keuangan:** Menggunakan fungsi agregasi (`SUM`, `COUNT`) untuk melihat total pendapatan harian/bulanan.
4.  **Analisis Menu Terlaris:** Menggunakan fitur `GROUP BY` dan `HAVING` untuk melihat tren penjualan.

## 📂 Struktur Repository
* `/SQL`: Berisi file source code database (`.sql`) yang siap di-import ke MySQL Workbench.
* `/Dokumen`: Berisi Laporan Tugas Akhir (PDF) Bab 1 s.d Bab 4.
* `/Poster`: Berisi file Poster publikasi proyek.

## 🛠️ Teknologi yang Digunakan
* **Database:** MySQL (RDBMS)
* **Tools:** MySQL Workbench 8.0
* **Design:** Canva (untuk Poster) & Microsoft Word (untuk Laporan)

## 💻 Cara Menjalankan (Installation)
1.  Clone atau Download repository ini.
2.  Buka aplikasi **MySQL Workbench**.
3.  Buka file `db_soto_lorang.sql` yang ada di folder `/SQL`.
4.  Jalankan script (klik ikon ⚡ petir) untuk membuat database dan tabel secara otomatis.
5.  Database siap digunakan untuk query transaksi.

---
*Dibuat untuk memenuhi Tugas Akhir Semester - Dosen Pengampu: Bapak Ridwan Dwi Irawan, S.Kom., M.Kom.*
