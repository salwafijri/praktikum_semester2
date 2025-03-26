-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Mar 2025 pada 13.58
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
-- Database: `week06`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `ambil_mk`
--

CREATE TABLE `ambil_mk` (
  `nim` int(3) NOT NULL,
  `kd_mk` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `ambil_mk`
--

INSERT INTO `ambil_mk` (`nim`, `kd_mk`) VALUES
(101, 'PTI447'),
(103, 'TIK333'),
(104, 'PTI333'),
(104, 'PTI777'),
(105, 'PTI123'),
(107, 'PTI777');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `kode_dos` int(2) NOT NULL,
  `nama_dos` varchar(100) NOT NULL,
  `alamat_dos` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`kode_dos`, `nama_dos`, `alamat_dos`) VALUES
(10, 'Suharto', 'Jl. Jombang'),
(11, 'Martono', 'Jl. Kalpataru'),
(12, 'Rahmawati', 'Jl. Jakarta'),
(13, 'Bambang', 'Jl. Bandung'),
(14, 'Nurul', 'Jl. Raya Tidar'),
(23, 'Sumari', 'Jl. Tuguran'),
(33, 'Bunga', 'Jl. Melati'),
(99, 'Beni', 'Jl. Perintis');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan`
--

CREATE TABLE `jurusan` (
  `kode_jur` char(3) NOT NULL,
  `nama_jur` varchar(50) NOT NULL,
  `kode_dos` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jurusan`
--

INSERT INTO `jurusan` (`kode_jur`, `nama_jur`, `kode_dos`) VALUES
('TE', 'Teknik Elektro', 10),
('TM', 'Teknik Mesin', 13),
('TS', 'Teknik Sipil', 23);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NIM` int(3) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jk` enum('L','P') NOT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`NIM`, `nama`, `jk`, `alamat`) VALUES
(101, 'Arif', 'L', 'Jl. Kenangan'),
(102, 'Budi', 'L', 'Jl. Jombang'),
(103, 'Wati', 'P', 'Jl. surabaya'),
(104, 'Ika', 'P', 'Jl. Jombang'),
(105, 'Tono', 'L', 'Jl. Jakarta'),
(106, 'Iwan', 'L', 'Jl. Bandung'),
(107, 'Sari', 'P', 'Jl. Malang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `matakuliah`
--

CREATE TABLE `matakuliah` (
  `kd_mk` char(6) NOT NULL,
  `nama_mk` varchar(50) NOT NULL,
  `sks` int(1) NOT NULL,
  `semester` int(2) NOT NULL,
  `kode_dos` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `matakuliah`
--

INSERT INTO `matakuliah` (`kd_mk`, `nama_mk`, `sks`, `semester`, `kode_dos`) VALUES
('PTI123', 'Grafika Multimedia', 3, 5, 12),
('PTI333', 'Basis Data Terdistribusi', 3, 5, 10),
('PTI447', 'Praktikum Basis Data', 1, 3, 11),
('PTI777', 'Sistem Informasi', 2, 3, 99),
('TIK123', 'Jaringan Komputer', 2, 5, 33),
('TIK333', 'Sistem Operasi', 3, 5, 10),
('TIK342', 'Praktikum Basis Data', 1, 3, 11);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `ambil_mk`
--
ALTER TABLE `ambil_mk`
  ADD PRIMARY KEY (`nim`,`kd_mk`),
  ADD KEY `kd_mk` (`kd_mk`);

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`kode_dos`);

--
-- Indeks untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`kode_jur`),
  ADD KEY `kode_dos` (`kode_dos`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`NIM`);

--
-- Indeks untuk tabel `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`kd_mk`),
  ADD KEY `kode_dos` (`kode_dos`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `ambil_mk`
--
ALTER TABLE `ambil_mk`
  ADD CONSTRAINT `ambil_mk_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`NIM`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ambil_mk_ibfk_2` FOREIGN KEY (`kd_mk`) REFERENCES `matakuliah` (`kd_mk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD CONSTRAINT `jurusan_ibfk_1` FOREIGN KEY (`kode_dos`) REFERENCES `dosen` (`kode_dos`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD CONSTRAINT `matakuliah_ibfk_1` FOREIGN KEY (`kode_dos`) REFERENCES `dosen` (`kode_dos`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
