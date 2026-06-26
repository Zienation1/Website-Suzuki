-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Jun 2026 pada 03.43
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
-- Database: `db_suzuki`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `nama_lengkap`) VALUES
(1, 'admin', 'admin123', 'Tim Digital Marketing');

-- --------------------------------------------------------

--
-- Struktur dari tabel `motors`
--

CREATE TABLE `motors` (
  `id` int(11) NOT NULL,
  `nama_motor` varchar(100) NOT NULL,
  `tipe` enum('Matic','Sport','Adventure') NOT NULL,
  `mesin` varchar(100) DEFAULT NULL,
  `transmisi` varchar(100) DEFAULT NULL,
  `konsumsi_bbm` varchar(100) DEFAULT NULL,
  `berat` varchar(50) DEFAULT NULL,
  `keunggulan` text DEFAULT NULL,
  `harga` int(11) NOT NULL,
  `gambar_motor` varchar(255) DEFAULT NULL,
  `pilihan_warna` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `link_youtube` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `motors`
--

INSERT INTO `motors` (`id`, `nama_motor`, `tipe`, `mesin`, `transmisi`, `konsumsi_bbm`, `berat`, `keunggulan`, `harga`, `gambar_motor`, `pilihan_warna`, `updated_at`, `link_youtube`) VALUES
(1, 'Suzuki Burgman Street 125Ex', 'Matic', '125cc', 'Automatic CVT', '52,6km/L', '111 kg', '• Ruang pijakan kaki luas\r\n• Desain elegan dan modern\r\n• Menggunakan Engine Auto Stop-Start and Silent Startrer System\r\n• Bagasi berkapasitas 21.5 liter\r\n• Rich Compartmets with USB Outlet\r\n• Mesin Irit dengan Teknologi SEP-α\r\n• Menggunakan digital spedometer\r\n• Lampu LED\r\n', 28350000, 'Burgman.png', '#04396c,#000000,#424242,#ffffff', '2026-06-23 04:14:05', 'https://youtu.be/_H4q08qg1Rs?si=WaA3ELIgxfdhMQ8b'),
(2, 'Suzuki Satria Pro', 'Sport', '150cc', '6 percepatan', '42 km/liter', '112 kg', 'Teknologi Keyless Modern\r\nSuzuki Ride Connect\r\nFitur ABS (Anti-lock Braking System)\r\nDilengkapi USB Outlet\r\nSuzuki Clutch Assist System (kopling lebih halus)\r\nMenggunkan Digital Speedometer', 36100000, 'Satria Pro.png', '#9A2538,#2F5FB8,#F4F4F4', '2026-06-23 08:38:04', 'https://youtu.be/FkfkAA6lI4c?si=HDl3jK58fBdrdV7H'),
(3, 'Suzuki Address FI', 'Matic', '113cc', 'Automatic CVT', '45 km/liter', '95 kg', 'Ruang Penyimpanan di depan yang lapang\r\nPijakan kaki yang luas\r\nPengaman kunci dengan kunci pembuka jok\r\nKapasitas bagasi 20.6L\r\nKonsumsi Bahan Bakar Irit', 22800000, 'Address fi.png', '#F7F7F7,#050505,#B0B0B0', '2026-06-23 08:40:37', 'https://youtu.be/4YMgmbTJ560?si=ZgZF3P5oiF69u10m'),
(4, 'Suzuki GSX-R150', 'Sport', '150cc', '6-speed, return', '38 km/L', '131 kg', 'LCD speedometer backlight\r\nSistem Key-less\r\nSpeedometer LCD digital\r\nEasy start system\r\nHazard lamp', 40850000, 'GSX-R.png', '#0C8DBB,#000000,#DE0A26', '2026-06-23 08:47:42', 'https://youtu.be/lvxEHYFhdh8?si=q4-IksuzdY_pRUJm'),
(5, 'Suzuki Access 125', 'Matic', '125cc, Air-Cooled', 'Automatic CVT', '57,3 km/L', '106 kg', 'Cover full tank\r\nBagasi berkapasitas 24.4L\r\nMenggunakan panel speedometer analog dengan odometer digital\r\nPijakan Kaki Luas dan Nyaman\r\nEasy Start System\r\nMemiliki 2 Kompartemen Penyimpanan\r\nLampu Full LED Premium\r\nDilengkapi USB Outlet', 27300000, 'Access.png', '#8ED9D5,#34353A,#EFE4C8', '2026-06-23 08:48:28', 'https://youtu.be/IeTl7BzySm0?si=CWBJJX_uvcHV5C9P'),
(6, 'Suzuki VStrom 250 SX', 'Adventure', '250cc', '6 Speed, MT', '31 km/L', '167 kg', 'Knuckle Covers memberikan perlindungan ekstra pada tangan\r\nGround clearance mencapai 205 mm\r\nCocok untuk touring\r\nEngine Under Cowling\r\nUSB Outlet untuk mengisi daya smartphone\r\nLED Highlight', 63750000, 'V-Strom.png', '#FFD514,#306EE2,#383838,#FFFFFF', '2026-06-23 08:51:48', 'https://youtu.be/OKMo0qi31Gg?si=6klcMvhK2vmnh0hk'),
(7, 'Suzuki Nex II Standart', 'Matic', '110cc, Air-Cooled', 'Automatic CVT', '44 km/L', '112 kg', 'Easy Start System\r\nKompartemen Penyimpanan Praktis\r\nSuzuki Eco Performance (SEP) yang memberikan efisiensi bahan bakar', 21470000, 'NexStandart-Grey.png', '#31465D,#2065B3,#000000', '2026-06-23 04:03:43', 'https://youtu.be/hPDhjhxhJi0?si=AcJg-T7okGLQl-rQ'),
(8, 'Suzuki GSX-S150', 'Sport', '147,3cc', '6-speed, return', '41 km/L', '130 kg', 'Desain Naked Sport Modern\r\nPetal Disc Brake\r\nLamp Ring\r\nShutter Key\r\nHazard Lamp\r\nSpeedometer LCD digital\r\nEasy Start System', 34050000, 'GSX-S.png', '#1F1F1F,#006BC8', '2026-06-23 04:04:03', 'https://youtu.be/Yu2oTYX5dZo?si=IvmElqeoiX50lthd'),
(9, 'Suzuki Nex Crossover', 'Matic', '110cc, Air-Cooled', 'Automatic CVT', '44 km/L', '114kg', 'Menggunakan Naked Handle Bar yang Sporty\r\nMenggunakan digital speedometer\r\nPijakan kaki yang luas\r\nEasy Start System\r\nMenggunakan rem cakram pada bagian depan\r\nSuspensi Nyaman\r\nMesin Suzuki Eco Performance (SEP) yang Irit dan Responsif', 22720000, 'Next Crossover.png', '#E30613,#1A1A1A,#1D70B8', '2026-06-23 04:04:37', 'https://youtu.be/KIPYIgodEYA?si=IaQDdPVUCGAwNn3r');

-- --------------------------------------------------------

--
-- Struktur dari tabel `motor_variants`
--

CREATE TABLE `motor_variants` (
  `variant_id` int(11) NOT NULL,
  `motor_id` int(11) NOT NULL,
  `color_name` varchar(50) NOT NULL,
  `color_hex` varchar(10) NOT NULL,
  `variant_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `motor_variants`
--

INSERT INTO `motor_variants` (`variant_id`, `motor_id`, `color_name`, `color_hex`, `variant_image`) VALUES
(1, 1, 'Biru', '#04396c', 'Burgman.png'),
(2, 1, 'Hitam', '#000000', 'Burgman 3.png'),
(3, 1, 'Abu-abu', '#424242', 'Burgman 2.png'),
(6, 2, 'Hitam', '#000000', 'Satria Pro.png'),
(7, 3, 'Abu-abu', '#555555', 'AddressAbu.png\r\n'),
(8, 3, 'Hitam', '#000000', 'AddressHitam.png'),
(9, 3, 'Putih', '#ffffff', 'AddressPutih.png'),
(10, 4, 'Titan Black', '#1A1A1A', 'GSXR-HITAM.png'),
(11, 4, 'Met. Tritone Blue', '#0047AB', 'GSXR-BIRU.png'),
(12, 4, 'Stronger Red', '#CC0000', 'GSXR-MERAH.png'),
(15, 5, 'Tosca/Light Blue', '#8ED9D5', 'AccessHijau.png'),
(16, 5, 'Dark Grey/Charcoal', '#34353A', 'AccessHitam.png'),
(17, 5, 'Cream/Beige', '#EFE4C8', 'AccessPutih.png'),
(18, 6, 'Champion Yellow', '#FFD514', 'VstromKuning.png'),
(19, 6, 'Pearl Blaze Orange', '#306EE2', 'VstromBiru.png'),
(20, 6, 'Matte Black', '#383838', 'VstromHitam.png'),
(21, 6, 'Pearl Mirage White', '#FFFFFF', 'VstromPutih.png'),
(22, 7, 'Matte Stellar Blue', '#31465D', 'NexStandartBiruTua.png'),
(23, 7, 'Solid Blue', '#2065B3', 'NexStandartBiru.png'),
(24, 7, 'Solid Black', '#000000', 'NexStandartHitam.png'),
(25, 8, 'Titan Black', '#1F1F1F', 'GSXS-HITAM.png'),
(26, 8, 'Met. Triton Blue', '#006BC8', 'GSXS-BIRU.png'),
(27, 9, 'Stronger Red', '#E30613', 'CrossoverMerah.png'),
(28, 9, 'Solid Black', '#1A1A1A', 'CrossoverHitam.png'),
(29, 9, 'Stellar Blue', '#1D70B8', 'CrossoverBiru.png');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `motors`
--
ALTER TABLE `motors`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `motor_variants`
--
ALTER TABLE `motor_variants`
  ADD PRIMARY KEY (`variant_id`),
  ADD KEY `motor_id` (`motor_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `motors`
--
ALTER TABLE `motors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `motor_variants`
--
ALTER TABLE `motor_variants`
  MODIFY `variant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `motor_variants`
--
ALTER TABLE `motor_variants`
  ADD CONSTRAINT `motor_variants_ibfk_1` FOREIGN KEY (`motor_id`) REFERENCES `motors` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
