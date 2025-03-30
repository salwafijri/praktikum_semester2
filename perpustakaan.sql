-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Mar 2025 pada 12.00
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` varchar(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jurusan` varchar(20) DEFAULT 'Umum',
  `tgl_daftar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nama`, `jurusan`, `tgl_daftar`) VALUES
('A001', 'Salwa', 'Teknik Informatika', '2023-01-10'),
('A002', 'Nawang', 'Teknik Mesin', '2023-01-12'),
('A003', 'Rahma', 'Teknik Elektro', '2023-01-14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota2`
--

CREATE TABLE `anggota2` (
  `id_anggota` varchar(10) NOT NULL,
  `nama_anggota` varchar(50) NOT NULL,
  `jurusan_anggota` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `anggota2`
--

INSERT INTO `anggota2` (`id_anggota`, `nama_anggota`, `jurusan_anggota`) VALUES
('A001', 'Salwa', 'Teknik Informatika'),
('A002', 'Nawang', 'Teknik Mesin'),
('A003', 'Rahma', 'Teknik Elektro');

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id_buku` varchar(10) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `penerbit` varchar(50) DEFAULT NULL,
  `tahun_terbit` int(11) DEFAULT NULL CHECK (`tahun_terbit` between 1900 and 2025),
  `id_penerbit` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id_buku`, `judul`, `penerbit`, `tahun_terbit`, `id_penerbit`) VALUES
('B001', 'Basis Data', 'Penerbit 1', 2020, 'P001'),
('B002', 'Algoritma Pemrograman', 'Penerbit 2', 2021, 'P002'),
('B003', 'Jaringan Komputer', 'Penerbit 3', 2019, 'P003'),
('B004', 'Kelistrikan', 'Penerbit 4', 2022, 'P004'),
('B005', 'Analisis dan Desain Sistem', 'Penerbit 5', 2023, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku2`
--

CREATE TABLE `buku2` (
  `id_buku` varchar(10) NOT NULL,
  `judul_buku` varchar(100) NOT NULL,
  `id_penerbit` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `buku2`
--

INSERT INTO `buku2` (`id_buku`, `judul_buku`, `id_penerbit`) VALUES
('B001', 'Basis Data', 'P001'),
('B002', 'Algoritma Pemrograman', 'P002'),
('B003', 'Jaringan Komputer', 'P003');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `id_anggota` varchar(10) DEFAULT NULL,
  `id_buku` varchar(10) DEFAULT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `denda` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`id_peminjaman`, `id_anggota`, `id_buku`, `tgl_pinjam`, `tgl_kembali`, `denda`) VALUES
(1, 'A001', 'B001', '2023-03-01', '2023-03-10', 10000),
(2, 'A002', 'B002', '2023-03-04', '2023-03-15', 14000),
(3, 'A003', 'B003', '2023-03-05', NULL, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman2`
--

CREATE TABLE `peminjaman2` (
  `id_transaksi` int(11) NOT NULL,
  `id_anggota` varchar(10) DEFAULT NULL,
  `id_buku` varchar(10) DEFAULT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `denda` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `peminjaman2`
--

INSERT INTO `peminjaman2` (`id_transaksi`, `id_anggota`, `id_buku`, `tgl_pinjam`, `tgl_kembali`, `denda`) VALUES
(1, 'A001', 'B001', '2023-03-01', '2023-03-10', 10000),
(2, 'A002', 'B002', '2023-03-04', '2023-03-15', 14000),
(3, 'A003', 'B003', '2023-03-05', NULL, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penerbit`
--

CREATE TABLE `penerbit` (
  `id_penerbit` varchar(10) NOT NULL,
  `nama_penerbit` varchar(100) NOT NULL,
  `alamat` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penerbit`
--

INSERT INTO `penerbit` (`id_penerbit`, `nama_penerbit`, `alamat`) VALUES
('P001', 'Penerbit 1', 'Jl. Tuguran'),
('P002', 'Penerbit 2', 'Jl. Potrobangsan'),
('P003', 'Penerbit 3', 'Jl. Raya Tidar'),
('P004', 'Penerbit 4', 'Jl. Jeruk');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penerbit2`
--

CREATE TABLE `penerbit2` (
  `id_penerbit` varchar(10) NOT NULL,
  `nama_penerbit` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penerbit2`
--

INSERT INTO `penerbit2` (`id_penerbit`, `nama_penerbit`) VALUES
('P001', 'Penerbit 1'),
('P002', 'Penerbit 2'),
('P003', 'Penerbit 3'),
('P004', 'Penerbit 4');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indeks untuk tabel `anggota2`
--
ALTER TABLE `anggota2`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`),
  ADD KEY `id_penerbit` (`id_penerbit`);

--
-- Indeks untuk tabel `buku2`
--
ALTER TABLE `buku2`
  ADD PRIMARY KEY (`id_buku`),
  ADD KEY `id_penerbit` (`id_penerbit`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `id_anggota` (`id_anggota`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indeks untuk tabel `peminjaman2`
--
ALTER TABLE `peminjaman2`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_anggota` (`id_anggota`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indeks untuk tabel `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`id_penerbit`);

--
-- Indeks untuk tabel `penerbit2`
--
ALTER TABLE `penerbit2`
  ADD PRIMARY KEY (`id_penerbit`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `peminjaman2`
--
ALTER TABLE `peminjaman2`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`id_penerbit`) REFERENCES `penerbit` (`id_penerbit`);

--
-- Ketidakleluasaan untuk tabel `buku2`
--
ALTER TABLE `buku2`
  ADD CONSTRAINT `buku2_ibfk_1` FOREIGN KEY (`id_penerbit`) REFERENCES `penerbit2` (`id_penerbit`);

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`),
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);

--
-- Ketidakleluasaan untuk tabel `peminjaman2`
--
ALTER TABLE `peminjaman2`
  ADD CONSTRAINT `peminjaman2_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota2` (`id_anggota`),
  ADD CONSTRAINT `peminjaman2_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku2` (`id_buku`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
