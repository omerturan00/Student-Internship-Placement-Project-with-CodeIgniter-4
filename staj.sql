-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 05 Ara 2024, 16:09:44
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `staj`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `grups`
--

CREATE TABLE `grups` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `Created_At` datetime DEFAULT NULL,
  `Created_Admin` int(11) NOT NULL,
  `Updated_Admin` int(11) NOT NULL,
  `Updated_At` datetime DEFAULT NULL,
  `Deleted` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `grups`
--

INSERT INTO `grups` (`Id`, `Name`, `Status`, `Created_At`, `Created_Admin`, `Updated_Admin`, `Updated_At`, `Deleted`) VALUES
(1, 'SüperAdmin', 1, '2024-12-01 17:41:38', 1, 1, '2024-12-01 17:41:44', 'F'),
(2, 'Müdür', 2, '2024-12-01 17:42:07', 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `moduls`
--

CREATE TABLE `moduls` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Seeing` int(11) DEFAULT NULL,
  `Adding` int(11) DEFAULT NULL,
  `Updating` int(11) DEFAULT NULL,
  `Deletion` int(11) DEFAULT NULL,
  `Created_At` datetime DEFAULT NULL,
  `Created_Admin` int(11) DEFAULT NULL,
  `Updated_At` datetime DEFAULT NULL,
  `Updated_Admin` int(11) DEFAULT NULL,
  `Deleted` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `moduls`
--

INSERT INTO `moduls` (`Id`, `Name`, `Seeing`, `Adding`, `Updating`, `Deletion`, `Created_At`, `Created_Admin`, `Updated_At`, `Updated_Admin`, `Deleted`) VALUES
(1, 'Modül', 1, 1, 1, 1, '2024-12-01 16:42:55', 1, '2024-12-01 16:42:59', 1, 'F'),
(2, 'Log', 1, 0, 0, 0, '2024-12-01 16:43:15', 1, '2024-12-01 16:43:21', 1, 'F');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `Id` int(11) NOT NULL,
  `NameSurname` varchar(255) DEFAULT NULL,
  `NickName` varchar(255) NOT NULL DEFAULT '',
  `Password` varchar(255) DEFAULT NULL,
  `Phone` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `Grup_Id` int(11) NOT NULL,
  `Status` int(11) DEFAULT NULL,
  `Description` longtext DEFAULT NULL,
  `Created_At` datetime DEFAULT NULL,
  `Created_Admin` int(11) NOT NULL,
  `Updated_At` datetime DEFAULT NULL,
  `Updated_Admin` int(11) NOT NULL,
  `Deleted` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`Id`, `NameSurname`, `NickName`, `Password`, `Phone`, `Email`, `Image`, `Grup_Id`, `Status`, `Description`, `Created_At`, `Created_Admin`, `Updated_At`, `Updated_Admin`, `Deleted`) VALUES
(1, 'Ömer Turan', 'turanomr00', 'f2212a65abde7863d70a8f6fce20acb4', '05511018507', 'omerturanwd@gmail.com', NULL, 1, 1, 'Süperadmin', '2024-12-01 14:29:15', 1, '2024-12-01 14:29:22', 1, 'F');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user_authority`
--

CREATE TABLE `user_authority` (
  `Id` int(11) NOT NULL,
  `Grup_Id` int(11) DEFAULT NULL,
  `Modul_Id` int(11) DEFAULT NULL,
  `Seeing` int(11) DEFAULT NULL,
  `Adding` int(11) DEFAULT NULL,
  `Updating` int(11) DEFAULT NULL,
  `Deletion` int(11) DEFAULT NULL,
  `Deleted` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `user_authority`
--

INSERT INTO `user_authority` (`Id`, `Grup_Id`, `Modul_Id`, `Seeing`, `Adding`, `Updating`, `Deletion`, `Deleted`) VALUES
(1, 1, 1, 1, 1, 1, 1, 'F'),
(2, 1, 2, 1, 0, 0, 0, 'F');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user_log`
--

CREATE TABLE `user_log` (
  `Id` int(11) NOT NULL,
  `User_Id` int(11) NOT NULL,
  `Modul_Id` int(11) NOT NULL,
  `Process` varchar(255) DEFAULT NULL,
  `Ip` varchar(255) DEFAULT NULL,
  `Date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `grups`
--
ALTER TABLE `grups`
  ADD PRIMARY KEY (`Id`,`Created_Admin`,`Updated_Admin`);

--
-- Tablo için indeksler `moduls`
--
ALTER TABLE `moduls`
  ADD PRIMARY KEY (`Id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`,`Grup_Id`,`Created_Admin`,`Updated_Admin`);

--
-- Tablo için indeksler `user_authority`
--
ALTER TABLE `user_authority`
  ADD PRIMARY KEY (`Id`);

--
-- Tablo için indeksler `user_log`
--
ALTER TABLE `user_log`
  ADD PRIMARY KEY (`Id`,`User_Id`,`Modul_Id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `grups`
--
ALTER TABLE `grups`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `moduls`
--
ALTER TABLE `moduls`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `user_authority`
--
ALTER TABLE `user_authority`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `user_log`
--
ALTER TABLE `user_log`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
