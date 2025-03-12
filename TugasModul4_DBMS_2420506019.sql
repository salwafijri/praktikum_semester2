-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Mar 2025 pada 15.52
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
-- Database: `praktikum_sql`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id_mhs` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jurusan` varchar(100) NOT NULL,
  `nama_matkul` varchar(100) NOT NULL,
  `nilai` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`id_mhs`, `nama`, `jurusan`, `nama_matkul`, `nilai`) VALUES
(111, 'Salwa Fijri', 'Teknologi Informasi', 'Basis Data', 90.00),
(111, 'Salwa Fijri', 'Teknologi Informasi', 'Kalkulus', 85.00),
(222, 'Vania Larasati', 'Sistem Informasi', 'Aljabar', 95.00),
(222, 'Vania Larasati', 'Sistem Informasi', 'Basis Data', 95.00),
(222, 'Vania Larasati', 'Sistem Informasi', 'Matematika Komputasi', 85.00),
(333, 'Roni Ardiansyah', 'Sistem Informasi', 'Aljabar', 80.00),
(444, 'Reza Zakaria', 'Teknologi Informasi', 'Kalkulus', 80.00),
(444, 'Reza Zakaria', 'Teknologi Informasi', 'Matematika Komputasi', 80.00),
(555, 'Nana Rania', 'Teknik Sipil', 'Aljabar', 90.00),
(555, 'Nana Rania', 'Teknik Sipil', 'Kalkulus', 75.00);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id_mhs`,`nama_matkul`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
