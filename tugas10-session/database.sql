CREATE DATABASE IF NOT EXISTS pemrograman_web_contoh;
USE pemrograman_web_contoh;


CREATE TABLE IF NOT EXISTS pengguna (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(50) NOT NULL,
    katasandi VARCHAR(255) NOT NULL
);


CREATE TABLE IF NOT EXISTS buku (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Judul VARCHAR(255) NOT NULL,
    Penulis VARCHAR(255) NOT NULL,
    Tahun_Terbit INT NOT NULL,
    Harga DECIMAL(10,2) NOT NULL,
    stok INT NOT NULL
);


CREATE TABLE IF NOT EXISTS pelanggan (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nama VARCHAR(255) NOT NULL,
    Alamat VARCHAR(255),
    Email VARCHAR(255),
    Telepon VARCHAR(20)
);


CREATE TABLE IF NOT EXISTS pesanan (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Tanggal_Pesanan DATE NOT NULL,
    Pelanggan_ID INT NOT NULL,
    Total_Harga DECIMAL(10,2) NOT NULL DEFAULT 0,
    FOREIGN KEY (Pelanggan_ID) REFERENCES pelanggan(ID)
);


CREATE TABLE IF NOT EXISTS detail_pesanan (
    Pesanan_ID INT NOT NULL,
    Buku_ID INT NOT NULL,
    Kuantitas INT NOT NULL,
    Harga_Per_Satuan DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (Pesanan_ID) REFERENCES pesanan(ID),
    FOREIGN KEY (Buku_ID) REFERENCES buku(ID)
);


CREATE TABLE IF NOT EXISTS pengguna (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(50) NOT NULL,
    katasandi VARCHAR(255) NOT NULL
);


INSERT INTO pengguna (nama, katasandi) VALUES ('spontan', 'uhuy');


INSERT INTO buku (Judul, Penulis, Tahun_Terbit, Harga, stok) VALUES
('Pemrograman Berbasis Website', 'sucipto rohman', 2023, 85000.00, 20),
('Belajar MySQL Dasar', 'gunawan', 2021, 65000.00, 15);

INSERT INTO pelanggan (Nama, Alamat, Email, Telepon) VALUES
('Tatavian', 'Jl. Citra Kebun Mas No. 1', 'viantata@mail.com', '081234567890'),
('Ramadhan', 'Jl. Borneo No. 5', 'dhan123@mail.com', '081298765432');