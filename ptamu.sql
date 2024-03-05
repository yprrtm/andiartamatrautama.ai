-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2023 at 06:30 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ptamu`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `idcart` int(11) NOT NULL,
  `orderid` varchar(100) NOT NULL,
  `userid` int(11) NOT NULL,
  `tglorder` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(10) NOT NULL DEFAULT 'Cart'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`idcart`, `orderid`, `userid`, `tglorder`, `status`) VALUES
(10, '15wKVT0nej25Y', 2, '2020-03-16 12:10:42', 'Selesai'),
(11, '15Swf8Ye0Fm.M', 2, '2020-03-16 12:17:34', 'Cart'),
(12, '15PzF03ejd8W2', 1, '2020-05-13 02:40:48', 'Selesai'),
(13, '16LErVXjZROlU', 3, '2022-11-18 00:23:33', 'Selesai'),
(14, '168L5tZIQGi/6', 4, '2022-11-18 11:47:21', 'Cart');

-- --------------------------------------------------------

--
-- Table structure for table `detailorder`
--

CREATE TABLE `detailorder` (
  `detailid` int(11) NOT NULL,
  `orderid` varchar(100) NOT NULL,
  `idproduk` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detailorder`
--

INSERT INTO `detailorder` (`detailid`, `orderid`, `idproduk`, `qty`) VALUES
(13, '15wKVT0nej25Y', 1, 100),
(16, '168L5tZIQGi/6', 1, 3),
(17, '16LErVXjZROlU', 18, 4);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `idkategori` int(11) NOT NULL,
  `namakategori` varchar(20) NOT NULL,
  `tgldibuat` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`idkategori`, `namakategori`, `tgldibuat`) VALUES
(1, 'Bunga Tangkai', '2019-12-20 07:28:34'),
(2, 'Bunga Papan', '2019-12-20 07:34:17'),
(3, 'Bunga Hidup', '2020-03-16 12:15:40'),
(4, 'Bunga Tulip', '2022-11-18 12:44:07'),
(5, 'Labotarium', '2022-12-17 15:27:39');

-- --------------------------------------------------------

--
-- Table structure for table `konfirmasi`
--

CREATE TABLE `konfirmasi` (
  `idkonfirmasi` int(11) NOT NULL,
  `orderid` varchar(100) NOT NULL,
  `userid` int(11) NOT NULL,
  `payment` varchar(10) NOT NULL,
  `namarekening` varchar(25) NOT NULL,
  `tglbayar` date NOT NULL,
  `tglsubmit` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `userid` int(11) NOT NULL,
  `namalengkap` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(150) NOT NULL,
  `notelp` varchar(15) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `tgljoin` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` varchar(7) NOT NULL DEFAULT 'Member',
  `lastlogin` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`userid`, `namalengkap`, `email`, `password`, `notelp`, `alamat`, `tgljoin`, `role`, `lastlogin`) VALUES
(1, 'Admin', 'admin', 'admin', '01234567890', 'Indonesia', '2020-03-16 11:31:17', 'Admin', NULL),
(2, 'Guest', 'guest', '$2y$10$xXEMgj5pMT9EE0QAx3QW8uEn155Je.FHH5SuIATxVheOt0Z4rhK6K', '01234567890', 'Indonesia', '2020-03-16 11:30:40', 'Member', NULL),
(3, 'Yoga pratama', 'yprtm@gmail.com', '$2y$10$gCjexiPd4l8DMAMNC5w8gu9ZRYRiTO1fTP9fJYGcIUU5VxeuFc7jy', '089633447461', 'jl.kebagusan', '2022-11-18 00:23:04', 'Admin', NULL),
(4, 'lolita', 'lolita@gmail.com', '$2y$10$5y28iQdBHc3J3pd0MLVdEeUyaOwJmGi2v36OK5TlWmcfE08I/aK1e', '0896455412', 'jll.magalang', '2022-11-18 11:46:42', 'Member', NULL),
(5, 'Maria', 'maria@gmail.com', '$2y$10$5OD78.5L6yjoxoqPuf6nA.eOikpkf.0dfq5doi.A/j5OHsWr0J15G', '0888778454', 'jlkembangan', '2022-12-15 23:40:02', 'Member', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `no` int(11) NOT NULL,
  `metode` varchar(25) NOT NULL,
  `norek` varchar(25) NOT NULL,
  `logo` text DEFAULT NULL,
  `an` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`no`, `metode`, `norek`, `logo`, `an`) VALUES
(1, 'Bank BCA', '13131231231', 'images/bca.jpg', '2022PT Andiarta Mart'),
(2, 'Bank Mandiri', '943248844843', 'images/mandiri.jpg', 'PT Andiarta Mart'),
(3, 'DANA', '0882313132123', 'images/dana.png', 'PT Andiarta Mart'),
(4, 'Go - Pay', '156515156156156156', 'images/go0-pay.png', 'Yoga Pratama');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `idproduk` int(11) NOT NULL,
  `idkategori` int(11) NOT NULL,
  `namaproduk` varchar(30) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `deskripsi` varchar(200) NOT NULL,
  `rate` int(11) NOT NULL,
  `hargabefore` int(11) NOT NULL,
  `hargaafter` int(11) NOT NULL,
  `tgldibuat` timestamp NOT NULL DEFAULT current_timestamp(),
  `visit` int(11) NOT NULL,
  `stock` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`idproduk`, `idkategori`, `namaproduk`, `gambar`, `deskripsi`, `rate`, `hargabefore`, `hargaafter`, `tgldibuat`, `visit`, `stock`) VALUES
(1, 1, 'Mawar Merah', 'produk/7443a12318c5f4f29059d243fd14f447.png', 'Setangkai mawar merah', 5, 23000, 19000, '2019-12-20 09:10:26', 5, 212),
(10, 3, 'Trackpad', 'produk/16fkCKrIlzdpY.png', 'Baru', 4, 23000, 20000, '2022-11-28 22:04:35', 1, 20),
(11, 3, 'Screen', 'produk/16Bu8U2I2NJaM.png', 'Baru', 4, 32000, 30000, '2022-11-28 22:35:19', 1, 21),
(17, 5, 'Hematology Analyzer', 'produk/16mu4CcoKCzPQ.jpg', 'Hematology Analyzer merupakan alat laboratorium yang digunakan untuk mengukur dan menghitung jumlah sel darah.', 4, 70000000, 63000000, '2022-12-17 15:32:06', 5, 0),
(18, 5, 'Infus Pump', 'produk/16IQWwSGOr3Vo.jpg', 'dipakai untuk mencari tahu penyebab keluhan nyeri di bagian dada, jantung berdebar-debar, dan kesulitan bernapas', 5, 30000000, 28000000, '2022-12-17 15:34:39', 25, 0),
(19, 5, 'Alat Rekam Jantung EKG', 'produk/162365pszQPqM.jpg', 'umumnya dipakai untuk mencari tahu penyebab keluhan nyeri di bagian dada, jantung berdebar-debar, dan kesulitan bernapas', 5, 33000000, 30000000, '2022-12-17 15:36:17', 19, 0),
(20, 2, 'Kantong', 'produk/16hwldXO7ZYdw.jpg', 'Baru', 4, 800000, 500000, '2022-12-29 08:39:57', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `visitations`
--

CREATE TABLE `visitations` (
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `page_id` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `visitations`
--

INSERT INTO `visitations` (`created_at`, `page_id`) VALUES
('2023-01-08 15:49:02', 'kategori'),
('2023-01-08 15:49:40', 'index'),
('2023-01-08 15:49:43', 'produk-18'),
('2023-01-08 17:10:10', 'index'),
('2023-01-08 17:13:27', 'produk'),
('2023-01-08 17:13:37', 'produk'),
('2023-01-08 17:13:38', 'produk'),
('2023-01-08 17:13:39', 'produk'),
('2023-01-08 17:13:40', 'produk'),
('2023-01-08 17:13:41', 'produk'),
('2023-01-08 17:23:18', 'index'),
('2023-01-08 17:23:53', 'index'),
('2023-01-08 17:23:54', 'index'),
('2023-01-09 15:48:55', 'daftarorde'),
('2023-01-11 15:44:33', 'index'),
('2023-01-12 15:46:52', 'index'),
('2023-01-12 15:49:37', 'produk-1'),
('2023-01-12 17:24:37', 'index'),
('2023-01-19 15:47:00', 'index'),
('2023-02-01 15:48:47', 'cart'),
('2023-02-08 17:26:25', 'index');

-- --------------------------------------------------------

--
-- Table structure for table `v_count`
--

CREATE TABLE `v_count` (
  `idv_count` int(5) NOT NULL,
  `Senin` int(5) NOT NULL DEFAULT current_timestamp(),
  `Selasa` int(5) NOT NULL DEFAULT current_timestamp(),
  `Rabu` int(5) NOT NULL DEFAULT current_timestamp(),
  `Kamis` int(5) NOT NULL DEFAULT current_timestamp(),
  `Jumat` int(5) NOT NULL DEFAULT current_timestamp(),
  `Sabtu` int(5) NOT NULL DEFAULT current_timestamp(),
  `Minggu` int(5) NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`idcart`),
  ADD UNIQUE KEY `orderid` (`orderid`),
  ADD KEY `orderid_2` (`orderid`);

--
-- Indexes for table `detailorder`
--
ALTER TABLE `detailorder`
  ADD PRIMARY KEY (`detailid`),
  ADD KEY `orderid` (`orderid`),
  ADD KEY `idproduk` (`idproduk`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`idkategori`);

--
-- Indexes for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD PRIMARY KEY (`idkonfirmasi`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`idproduk`),
  ADD KEY `idkategori` (`idkategori`);

--
-- Indexes for table `visitations`
--
ALTER TABLE `visitations`
  ADD PRIMARY KEY (`created_at`,`page_id`);

--
-- Indexes for table `v_count`
--
ALTER TABLE `v_count`
  ADD PRIMARY KEY (`idv_count`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `idcart` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `detailorder`
--
ALTER TABLE `detailorder`
  MODIFY `detailid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `idkategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  MODIFY `idkonfirmasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `idproduk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `v_count`
--
ALTER TABLE `v_count`
  MODIFY `idv_count` int(5) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detailorder`
--
ALTER TABLE `detailorder`
  ADD CONSTRAINT `idproduk` FOREIGN KEY (`idproduk`) REFERENCES `produk` (`idproduk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderid` FOREIGN KEY (`orderid`) REFERENCES `cart` (`orderid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `login` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `idkategori` FOREIGN KEY (`idkategori`) REFERENCES `kategori` (`idkategori`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
