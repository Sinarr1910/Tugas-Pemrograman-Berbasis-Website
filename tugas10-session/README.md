# Tugas Bab X — Proteksi Halaman & Logout (Session PHP)

Project ini melanjutkan studi kasus **Toko Buku Online** (Bab IX) dengan
menambahkan **proteksi session** di semua halaman/fitur dan **halaman logout**,
sesuai instruksi tugas:

> - Silahkan anda lakukan proteksi pada semua halaman semua fitur program yang anda buat.
> - Buat halaman logout, dan setelah logout mengarahkan ke form login.

## Apa yang ditambahkan/diubah

1. **`cek_session.php`** (baru)
   File proteksi terpusat. Berisi `session_start()` + pengecekan
   `$_SESSION['login_Un51k4']`. Jika belum login, otomatis di-redirect ke
   `login.php`. File ini di-`include` di **baris paling atas** setiap halaman
   dan setiap file prosesor fitur (index, tambah buku, hapus, edit, transaksi,
   lihat transaksi) — sehingga tidak perlu menulis ulang kode proteksi di
   setiap file (DRY).

2. **`logout.php`** (baru)
   Menjalankan `session_unset()` dan `session_destroy()`, lalu
   `header("Location: login.php?...")` agar pengguna diarahkan kembali ke
   form login setelah logout.

3. **`nav.php`** (diubah)
   Ditambahkan sapaan nama pengguna yang sedang login dan link **Logout**.

4. **Semua file fitur** (`index.php`, `proses_index.php`, `tambah_buku.php`,
   `proses_tambah_buku.php`, `proses_hapus.php`, `form_edit.php`,
   `proses_edit.php`, `transaksi.php`, `proses_transaksi.php`,
   `lihat_transaksi.php`) kini diawali dengan `include 'cek_session.php';`.

5. **`login.php`**, **`proses_login.php`** — sama seperti contoh di buku
   (tidak diproteksi, karena justru harus bisa diakses tanpa login).

## Cara menjalankan (XAMPP / Laragon)

1. Import `database.sql` ke MySQL/MariaDB (membuat tabel `pengguna` di
   database `pemrograman_web_contoh`). Pastikan tabel `Buku`, `Pelanggan`,
   `Pesanan`, `Detail_Pesanan` dari Bab IX juga sudah ada di database yang
   sama.
2. Letakkan seluruh folder ini di `htdocs` (XAMPP) atau folder project Laragon.
3. Buka `http://localhost/toko_buku_online/login.php`
4. Login dengan akun contoh:
   - Username: `admin`
   - Password: `admin123`
5. Coba akses `index.php` langsung tanpa login (atau setelah klik **Logout**)
   — Anda akan otomatis diarahkan ke `login.php` dengan pesan
   "Mengakses fitur harus login dulu bro."

## Catatan

Pola penyimpanan password di sini **plain text**, mengikuti contoh persis
yang ada di buku ajar (Bab X bagian B). Untuk implementasi nyata/production,
sebaiknya password di-hash menggunakan `password_hash()` dan diverifikasi
dengan `password_verify()`.
