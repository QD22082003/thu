  -- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               11.1.2-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for qlda
CREATE DATABASE IF NOT EXISTS `qlda` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `qlda`;

-- Dumping structure for table qlda.chitiethoadon
CREATE TABLE IF NOT EXISTS `chitiethoadon` (
  `MaHD` int(11) NOT NULL,
  `MaSP` int(11) NOT NULL,
  `SLDat` int(11) DEFAULT NULL,
  `ThanhTien` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaHD`,`MaSP`),
  KEY `MaSP` (`MaSP`),
  CONSTRAINT `chitiethoadon_ibfk_1` FOREIGN KEY (`MaHD`) REFERENCES `hoadon` (`MaHD`),
  CONSTRAINT `chitiethoadon_ibfk_2` FOREIGN KEY (`MaSP`) REFERENCES `sanpham` (`MaSP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qlda.chitiethoadon: ~0 rows (approximately)

-- Dumping structure for table qlda.chitietphieudathang
CREATE TABLE IF NOT EXISTS `chitietphieudathang` (
  `MaPD` int(11) NOT NULL,
  `MaSP` int(11) NOT NULL,
  `SLDat` int(11) DEFAULT NULL,
  `DonGia` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaPD`,`MaSP`),
  KEY `MaSP` (`MaSP`),
  CONSTRAINT `chitietphieudathang_ibfk_1` FOREIGN KEY (`MaPD`) REFERENCES `phieudathang` (`MaPD`),
  CONSTRAINT `chitietphieudathang_ibfk_2` FOREIGN KEY (`MaSP`) REFERENCES `sanpham` (`MaSP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qlda.chitietphieudathang: ~0 rows (approximately)

-- Dumping structure for table qlda.chitietphieugiao
CREATE TABLE IF NOT EXISTS `chitietphieugiao` (
  `MaPG` int(11) NOT NULL,
  `MaSP` int(11) NOT NULL,
  `SLDat` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaPG`,`MaSP`),
  KEY `MaSP` (`MaSP`),
  CONSTRAINT `chitietphieugiao_ibfk_1` FOREIGN KEY (`MaPG`) REFERENCES `phieugiao` (`MaPG`),
  CONSTRAINT `chitietphieugiao_ibfk_2` FOREIGN KEY (`MaSP`) REFERENCES `sanpham` (`MaSP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qlda.chitietphieugiao: ~0 rows (approximately)

-- Dumping structure for table qlda.chitietphieunhap
CREATE TABLE IF NOT EXISTS `chitietphieunhap` (
  `MaPN` int(11) NOT NULL,
  `MaSP` int(11) NOT NULL,
  `SLNhap` int(11) DEFAULT NULL,
  `DonGia` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaPN`,`MaSP`),
  KEY `MaSP` (`MaSP`),
  CONSTRAINT `chitietphieunhap_ibfk_1` FOREIGN KEY (`MaPN`) REFERENCES `phieunhap` (`MaPN`),
  CONSTRAINT `chitietphieunhap_ibfk_2` FOREIGN KEY (`MaSP`) REFERENCES `sanpham` (`MaSP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qlda.chitietphieunhap: ~0 rows (approximately)

-- Dumping structure for table qlda.dang_ky
CREATE TABLE IF NOT EXISTS `dang_ky` (
  `USERNAME` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `PW` varchar(50) NOT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `SDT` int(11) DEFAULT NULL,
  PRIMARY KEY (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qlda.dang_ky: ~0 rows (approximately)

-- Dumping structure for table qlda.hoadon
CREATE TABLE IF NOT EXISTS `hoadon` (
  `MaHD` int(11) NOT NULL AUTO_INCREMENT,
  `MaNV` int(11) DEFAULT NULL,
  `MaKH` int(11) DEFAULT NULL,
  `MaPD` int(11) DEFAULT NULL,
  `ThanhTien` int(11) DEFAULT NULL,
  `NgayMH` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`MaHD`),
  UNIQUE KEY `MaPD` (`MaPD`),
  KEY `MaNV` (`MaNV`),
  KEY `MaKH` (`MaKH`),
  CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`),
  CONSTRAINT `hoadon_ibfk_2` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`),
  CONSTRAINT `hoadon_ibfk_3` FOREIGN KEY (`MaPD`) REFERENCES `phieudathang` (`MaPD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qlda.hoadon: ~0 rows (approximately)

-- Dumping structure for table qlda.khachhang
CREATE TABLE IF NOT EXISTS `khachhang` (
  `MaKH` int(11) NOT NULL AUTO_INCREMENT,
  `TenKH` varchar(50) DEFAULT NULL,
  `SDTKH` varchar(15) DEFAULT NULL,
  `DiaChi` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`MaKH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qlda.khachhang: ~0 rows (approximately)

-- Dumping structure for table qlda.nhanvien
CREATE TABLE IF NOT EXISTS `nhanvien` (
  `MaNV` int(11) NOT NULL AUTO_INCREMENT,
  `TenNV` varchar(50) DEFAULT NULL,
  `TenTK` varchar(50) NOT NULL,
  `SDTNV` varchar(15) DEFAULT NULL,
  `DiaChiNV` varchar(100) DEFAULT NULL,
  `CCCD` varchar(20) NOT NULL,
  `ChucVu` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MaNV`),
  UNIQUE KEY `TenTK` (`TenTK`),
  UNIQUE KEY `CCCD` (`CCCD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qlda.nhanvien: ~0 rows (approximately)

-- Dumping structure for table qlda.phieuchi
CREATE TABLE IF NOT EXISTS `phieuchi` (
  `MaPC` int(11) NOT NULL AUTO_INCREMENT,
  `MaPN` int(11) DEFAULT NULL,
  `NgayCT` timestamp NULL DEFAULT current_timestamp(),
  `SoTienChi` int(11) DEFAULT NULL,
  `TenNCC` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MaPC`),
  KEY `MaPN` (`MaPN`),
  CONSTRAINT `phieuchi_ibfk_1` FOREIGN KEY (`MaPN`) REFERENCES `phieunhap` (`MaPN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qlda.phieuchi: ~0 rows (approximately)

-- Dumping structure for table qlda.phieudathang
CREATE TABLE IF NOT EXISTS `phieudathang` (
  `MaPD` int(11) NOT NULL AUTO_INCREMENT,
  `MaNV` int(11) DEFAULT NULL,
  `MaKH` int(11) DEFAULT NULL,
  `NgayDH` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`MaPD`),
  KEY `MaNV` (`MaNV`),
  KEY `MaKH` (`MaKH`),
  CONSTRAINT `phieudathang_ibfk_1` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`),
  CONSTRAINT `phieudathang_ibfk_2` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qlda.phieudathang: ~0 rows (approximately)

-- Dumping structure for table qlda.phieudoi
CREATE TABLE IF NOT EXISTS `phieudoi` (
  `MaDoi` int(11) NOT NULL,
  `MaHD` int(11) DEFAULT NULL,
  `MaKH` int(11) DEFAULT NULL,
  `MaNV` int(11) DEFAULT NULL,
  `MaSP` int(11) DEFAULT NULL,
  `NgayDoiHang` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`MaDoi`),
  UNIQUE KEY `MaHD` (`MaHD`),
  KEY `MaNV` (`MaNV`),
  KEY `MaKH` (`MaKH`),
  KEY `MaSP` (`MaSP`),
  CONSTRAINT `phieudoi_ibfk_1` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`),
  CONSTRAINT `phieudoi_ibfk_2` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`),
  CONSTRAINT `phieudoi_ibfk_3` FOREIGN KEY (`MaHD`) REFERENCES `hoadon` (`MaHD`),
  CONSTRAINT `phieudoi_ibfk_4` FOREIGN KEY (`MaSP`) REFERENCES `sanpham` (`MaSP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qlda.phieudoi: ~0 rows (approximately)

-- Dumping structure for table qlda.phieugiao
CREATE TABLE IF NOT EXISTS `phieugiao` (
  `MaPG` int(11) NOT NULL AUTO_INCREMENT,
  `MaKH` int(11) DEFAULT NULL,
  `MaHD` int(11) DEFAULT NULL,
  `NgayGiaoHang` date DEFAULT NULL,
  PRIMARY KEY (`MaPG`),
  UNIQUE KEY `MaHD` (`MaHD`),
  KEY `MaKH` (`MaKH`),
  CONSTRAINT `phieugiao_ibfk_1` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`),
  CONSTRAINT `phieugiao_ibfk_2` FOREIGN KEY (`MaHD`) REFERENCES `hoadon` (`MaHD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qlda.phieugiao: ~0 rows (approximately)

-- Dumping structure for table qlda.phieunhap
CREATE TABLE IF NOT EXISTS `phieunhap` (
  `MaPN` int(11) NOT NULL AUTO_INCREMENT,
  `MaNV` int(11) DEFAULT NULL,
  `TenNCC` varchar(50) DEFAULT NULL,
  `DiaChiNCC` varchar(100) DEFAULT NULL,
  `NgayNK` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`MaPN`),
  KEY `MaNV` (`MaNV`),
  CONSTRAINT `phieunhap_ibfk_1` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qlda.phieunhap: ~0 rows (approximately)

-- Dumping structure for table qlda.phieutra
CREATE TABLE IF NOT EXISTS `phieutra` (
  `MaTra` int(11) NOT NULL AUTO_INCREMENT,
  `MaKH` int(11) DEFAULT NULL,
  `MaHD` int(11) DEFAULT NULL,
  `MaSP` int(11) DEFAULT NULL,
  `MaNV` int(11) DEFAULT NULL,
  `NgayTraHang` date DEFAULT NULL,
  PRIMARY KEY (`MaTra`),
  UNIQUE KEY `MaHD` (`MaHD`),
  KEY `MaNV` (`MaNV`),
  KEY `MaKH` (`MaKH`),
  KEY `MaSP` (`MaSP`),
  CONSTRAINT `phieutra_ibfk_1` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`),
  CONSTRAINT `phieutra_ibfk_2` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`),
  CONSTRAINT `phieutra_ibfk_3` FOREIGN KEY (`MaHD`) REFERENCES `hoadon` (`MaHD`),
  CONSTRAINT `phieutra_ibfk_4` FOREIGN KEY (`MaSP`) REFERENCES `sanpham` (`MaSP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qlda.phieutra: ~0 rows (approximately)

-- Dumping structure for table qlda.sanpham
CREATE TABLE IF NOT EXISTS `sanpham` (
  `MaSP` int(11) NOT NULL AUTO_INCREMENT,
  `TenSP` varchar(50) DEFAULT NULL,
  `HinhAnh` varchar(1000) DEFAULT NULL,
  `SoLuong` int(11) DEFAULT NULL,
  `DonGia` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaSP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qlda.sanpham: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
