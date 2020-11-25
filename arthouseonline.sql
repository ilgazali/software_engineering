-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 04 Haz 2020, 22:41:01
-- Sunucu sürümü: 10.4.11-MariaDB
-- PHP Sürümü: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `arthouseonline`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ders`
--

CREATE TABLE `ders` (
  `dersid` int(10) UNSIGNED NOT NULL,
  `dersadi` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aciklama` varchar(1500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kursid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `ders`
--

INSERT INTO `ders` (`dersid`, `dersadi`, `aciklama`, `kursid`) VALUES
(4, 'dersss bir basic', 'basic', 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategoris`
--

CREATE TABLE `kategoris` (
  `kategoriid` int(10) UNSIGNED NOT NULL,
  `kategoriadi` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parentid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `kategoris`
--

INSERT INTO `kategoris` (`kategoriid`, `kategoriadi`, `parentid`) VALUES
(1, 'Dans', 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2020_05_28_192618_create_trainees_table', 1),
(4, '2020_05_28_193955_create_trainers_table', 1),
(5, '2020_05_28_194104_create_sepets_table', 1),
(6, '2020_05_28_195028_create_kategoris_table', 1),
(11, '2020_05_28_191010_create_online_kurs_table', 2),
(12, '2020_05_28_195050_create_sepeteeklenenlers_table', 2),
(13, '2020_06_04_174328_create_ders_table', 3),
(14, '2020_06_04_185501_create_satinalims_table', 4);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `online_kurs`
--

CREATE TABLE `online_kurs` (
  `kursid` int(10) UNSIGNED NOT NULL,
  `kursadi` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aciklama` varchar(1500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `egitmenid` int(10) UNSIGNED NOT NULL,
  `kategoriid` int(10) UNSIGNED NOT NULL,
  `fiyat` double(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `online_kurs`
--

INSERT INTO `online_kurs` (`kursid`, `kursadi`, `aciklama`, `egitmenid`, `kategoriid`, `fiyat`) VALUES
(1, 'salsa', 'salsa ders', 1, 1, 22.00),
(2, 'Salssaa', 'asdasd', 1, 1, 23.00),
(3, 'Laravel', 'asasdfas', 1, 1, 12.00);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `satinalims`
--

CREATE TABLE `satinalims` (
  `kursiyerid` int(10) UNSIGNED NOT NULL,
  `kursid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `satinalims`
--

INSERT INTO `satinalims` (`kursiyerid`, `kursid`) VALUES
(1, 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sepeteeklenenlers`
--

CREATE TABLE `sepeteeklenenlers` (
  `sepetid` int(10) UNSIGNED NOT NULL,
  `kursid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sepets`
--

CREATE TABLE `sepets` (
  `sepetid` int(10) UNSIGNED NOT NULL,
  `kursiyerid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `trainees`
--

CREATE TABLE `trainees` (
  `kursiyerid` int(10) UNSIGNED NOT NULL,
  `kullaniciadi` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sifre` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefon` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `trainees`
--

INSERT INTO `trainees` (`kursiyerid`, `kullaniciadi`, `sifre`, `email`, `telefon`) VALUES
(1, 'merve', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'merve@cavli.com', 123);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `trainers`
--

CREATE TABLE `trainers` (
  `egitmenid` int(10) UNSIGNED NOT NULL,
  `kullaniciadi` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sifre` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefon` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `trainers`
--

INSERT INTO `trainers` (`egitmenid`, `kullaniciadi`, `sifre`, `email`, `telefon`) VALUES
(1, 'merve', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'merve@cavli.com', 123123);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `ders`
--
ALTER TABLE `ders`
  ADD PRIMARY KEY (`dersid`),
  ADD KEY `ders_kursid_foreign` (`kursid`);

--
-- Tablo için indeksler `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `kategoris`
--
ALTER TABLE `kategoris`
  ADD PRIMARY KEY (`kategoriid`);

--
-- Tablo için indeksler `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `online_kurs`
--
ALTER TABLE `online_kurs`
  ADD PRIMARY KEY (`kursid`),
  ADD KEY `online_kurs_egitmenid_foreign` (`egitmenid`),
  ADD KEY `online_kurs_kategoriid_foreign` (`kategoriid`);

--
-- Tablo için indeksler `satinalims`
--
ALTER TABLE `satinalims`
  ADD UNIQUE KEY `prim` (`kursiyerid`,`kursid`),
  ADD KEY `satinalims_kursid_foreign` (`kursid`);

--
-- Tablo için indeksler `sepeteeklenenlers`
--
ALTER TABLE `sepeteeklenenlers`
  ADD UNIQUE KEY `sepeteeklenenlers_sepetid_kursid_unique` (`sepetid`,`kursid`),
  ADD KEY `sepeteeklenenlers_kursid_foreign` (`kursid`);

--
-- Tablo için indeksler `sepets`
--
ALTER TABLE `sepets`
  ADD PRIMARY KEY (`sepetid`),
  ADD KEY `sepets_kursiyerid_foreign` (`kursiyerid`);

--
-- Tablo için indeksler `trainees`
--
ALTER TABLE `trainees`
  ADD PRIMARY KEY (`kursiyerid`),
  ADD UNIQUE KEY `trainees_email_unique` (`email`),
  ADD UNIQUE KEY `trainees_kullaniciadi_unique` (`kullaniciadi`);

--
-- Tablo için indeksler `trainers`
--
ALTER TABLE `trainers`
  ADD PRIMARY KEY (`egitmenid`),
  ADD UNIQUE KEY `trainers_email_unique` (`email`),
  ADD UNIQUE KEY `trainers_kullaniciadi_unique` (`kullaniciadi`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `ders`
--
ALTER TABLE `ders`
  MODIFY `dersid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `kategoris`
--
ALTER TABLE `kategoris`
  MODIFY `kategoriid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Tablo için AUTO_INCREMENT değeri `online_kurs`
--
ALTER TABLE `online_kurs`
  MODIFY `kursid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `sepets`
--
ALTER TABLE `sepets`
  MODIFY `sepetid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `trainees`
--
ALTER TABLE `trainees`
  MODIFY `kursiyerid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `trainers`
--
ALTER TABLE `trainers`
  MODIFY `egitmenid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `ders`
--
ALTER TABLE `ders`
  ADD CONSTRAINT `ders_kursid_foreign` FOREIGN KEY (`kursid`) REFERENCES `online_kurs` (`kursid`);

--
-- Tablo kısıtlamaları `online_kurs`
--
ALTER TABLE `online_kurs`
  ADD CONSTRAINT `online_kurs_egitmenid_foreign` FOREIGN KEY (`egitmenid`) REFERENCES `trainers` (`egitmenid`),
  ADD CONSTRAINT `online_kurs_kategoriid_foreign` FOREIGN KEY (`kategoriid`) REFERENCES `kategoris` (`kategoriid`);

--
-- Tablo kısıtlamaları `satinalims`
--
ALTER TABLE `satinalims`
  ADD CONSTRAINT `satinalims_kursid_foreign` FOREIGN KEY (`kursid`) REFERENCES `online_kurs` (`kursid`),
  ADD CONSTRAINT `satinalims_kursiyerid_foreign` FOREIGN KEY (`kursiyerid`) REFERENCES `trainees` (`kursiyerid`);

--
-- Tablo kısıtlamaları `sepeteeklenenlers`
--
ALTER TABLE `sepeteeklenenlers`
  ADD CONSTRAINT `sepeteeklenenlers_kursid_foreign` FOREIGN KEY (`kursid`) REFERENCES `online_kurs` (`kursid`),
  ADD CONSTRAINT `sepeteeklenenlers_sepetid_foreign` FOREIGN KEY (`sepetid`) REFERENCES `sepets` (`sepetid`);

--
-- Tablo kısıtlamaları `sepets`
--
ALTER TABLE `sepets`
  ADD CONSTRAINT `sepets_kursiyerid_foreign` FOREIGN KEY (`kursiyerid`) REFERENCES `trainees` (`kursiyerid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
