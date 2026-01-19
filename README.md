# 🍜 Sistem Penjualan (POS) Soto Lorang

> **Final Project Mata Kuliah Pemrograman Basis Data**
> **Universitas Duta Bangsa Surakarta**

<p align="center">
  <img src="https://github.com/user-attachments/assets/e0df7185-446a-4e5b-bd33-9502da7d5788" alt="Poster Soto Lorang" width="600">
</p>

Repository ini berisi rancangan dan implementasi basis data untuk sistem kasir (Point of Sales) pada UMKM **Soto Lorang**. Proyek ini bertujuan untuk mentransformasi sistem pencatatan manual (nota kertas) menjadi sistem basis data terkomputerisasi yang terintegrasi.

## 👥 Anggota Kelompok
| Nama | NIM |
| :--- | :--- |
| **Amanda Fitri Honestya** | 240103154 |
| **Anjel Dina Erawati** | 240103155 |
| **Aulia Athifa Zahra** | 240103156 |
| **Nayla Putri Salsabila** | 240103172 |

## 📖 Latar Belakang Masalah
Sebelum adanya sistem ini, Soto Lorang menghadapi kendala operasional yang signifikan.

**Masalah Utama:**
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

## 🗂️ Struktur Tabel Database
<img width="1353" height="643" alt="Screenshot 2026-01-18 142926" src="https://github.com/user-attachments/assets/504570de-278d-4fed-97d7-d3d66ecead44" />

Sistem ini terdiri dari 5 tabel utama yang saling berelasi:

1.  **`pelanggan`**
    * Menyimpan data identitas pelanggan yang terdaftar.
    * *Atribut:* ID, Nama, Alamat, No Telepon.
2.  **`kasir`**
    * Menyimpan data otentikasi petugas kasir (Username/Password) dan shift kerja.
    * *Atribut:* ID, Nama Kasir, Username, Password, Shift.
3.  **`produk`**
    * Menyimpan daftar menu makanan/minuman beserta harga satuan dan stok tersedia.
    * *Atribut:* ID, Nama Produk, Kategori, Harga, Stok.
4.  **`transaksi`**
    * Menyimpan data *header* nota (informasi umum setiap transaksi).
    * *Atribut:* No Nota (PK), Waktu, Total Bayar, Bayar Tunai, Kembalian.
5.  **`detail_transaksi`**
    * Menyimpan rincian item menu yang dibeli dalam satu nomor nota.
    * *Atribut:* ID Detail, Jumlah Beli, Subtotal Harga.
6.  **`view_laporan_penjualan`** (View / Tabel Virtual)
    * Merupakan tabel virtual yang menggabungkan data `transaksi`, `pelanggan`, dan `kasir` untuk keperluan rekapitulasi yang lebih cepat.
    * *Fungsi:* Memudahkan pemilik melihat riwayat penjualan lengkap tanpa perlu melakukan *query join* manual berulang kali.
    * *Data yang Ditampilkan:* No Nota, Tanggal Transaksi, Nama Kasir, Nama Pelanggan, dan Total Nominal Transaksi.

## 📸 Bukti Implementasi Query (Demo)
Berikut adalah bukti bahwa logika database berjalan dengan baik menggunakan query SQL yang kompleks.

**Laporan Detail Transaksi (JOIN Query):**
Query ini menggabungkan tabel `transaksi`, `kasir`, dan `produk` untuk menghasilkan struk belanja yang detail.

<img width="817" height="196" alt="Screenshot 2026-01-18 153051" src="https://github.com/user-attachments/assets/ccf47ee7-e15b-432d-a2ee-448f955d2f79" />

> **Keterangan:** Screenshot di atas membuktikan bahwa sistem berhasil melakukan **JOIN antar tabel**. Data yang ditampilkan bukan lagi kode angka (ID), melainkan nama kasir dan nama produk yang mudah dibaca.

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
*Dibuat untuk memenuhi Tugas Akhir Semester - Dosen Pengampu: Ridwan Dwi Irawan, S.Kom., M.Kom.*
