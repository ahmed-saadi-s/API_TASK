-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 14 أغسطس 2024 الساعة 17:13
-- إصدار الخادم: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `residential_partners`
--

-- --------------------------------------------------------

--
-- بنية الجدول `ads`
--

CREATE TABLE `ads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `ad_type` enum('roommate','place') NOT NULL,
  `residence_type` enum('apartment','house','shared','studio') NOT NULL,
  `budget` decimal(10,2) NOT NULL,
  `availability_date` date NOT NULL,
  `location_description` varchar(255) DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `room_size` decimal(8,2) DEFAULT NULL,
  `number_of_rooms` int(11) DEFAULT NULL,
  `number_of_bathrooms` int(11) DEFAULT NULL,
  `furnished` tinyint(1) DEFAULT NULL,
  `smoking_allowed` tinyint(1) DEFAULT NULL,
  `pets_allowed` tinyint(1) DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `contact_phone` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('open','closed') NOT NULL DEFAULT 'open',
  `partner_age_min` int(11) DEFAULT NULL,
  `partner_age_max` int(11) DEFAULT NULL,
  `partner_gender` enum('male','female','any') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `ads`
--

INSERT INTO `ads` (`id`, `user_id`, `title`, `ad_type`, `residence_type`, `budget`, `availability_date`, `location_description`, `country_id`, `city_id`, `room_size`, `number_of_rooms`, `number_of_bathrooms`, `furnished`, `smoking_allowed`, `pets_allowed`, `contact_email`, `notes`, `contact_phone`, `created_at`, `updated_at`, `status`, `partner_age_min`, `partner_age_max`, `partner_gender`) VALUES
(77, 12, 'Ad 1', 'place', 'house', 300.00, '2024-07-24', NULL, 1, 1, NULL, NULL, NULL, 1, 0, 1, 'test@gmail.com', '123', '930752001', '2024-07-24 10:48:24', '2024-07-24 10:48:24', 'open', NULL, NULL, NULL),
(78, 12, 'Ad 2', 'place', 'house', 300.00, '2024-07-24', NULL, 1, 4, NULL, NULL, NULL, 1, 0, 1, 'test@gmail.com', '123', '930752001', '2024-07-24 10:48:31', '2024-07-24 10:48:31', 'open', NULL, NULL, NULL),
(79, 12, 'Ad 3', 'place', 'apartment', 300.00, '2024-07-24', NULL, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, 'test@gmail.com', NULL, '930752001', '2024-07-24 10:48:42', '2024-07-24 10:48:42', 'open', NULL, NULL, NULL),
(80, 12, 'Ad 4', 'place', 'apartment', 300.00, '2024-07-24', NULL, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, 'test@gmail.com', '123', '930752001', '2024-07-24 10:48:49', '2024-07-24 10:48:49', 'open', NULL, NULL, NULL),
(81, 12, 'Ad 5', 'place', 'apartment', 300.00, '2024-07-24', NULL, 1, 4, NULL, NULL, NULL, NULL, 1, 0, 'test@gmail.com', NULL, '930752001', '2024-07-24 10:49:13', '2024-07-24 10:49:13', 'open', NULL, NULL, NULL),
(82, 13, 'Ad 1', 'roommate', 'house', 300.00, '2024-07-24', 'bla', 1, 7, 28.00, 2, 2, 1, 1, 1, 'test@gmail.com', '123', '930752001', '2024-07-24 11:00:18', '2024-07-24 11:00:18', 'open', NULL, NULL, NULL),
(83, 13, 'Ad 2', 'roommate', 'house', 300.00, '2024-07-24', 'bla', 1, 2, 28.00, 2, 2, 1, 0, 1, 'test@gmail.com', '123', '930752001', '2024-07-24 11:00:24', '2024-07-24 11:00:24', 'open', NULL, NULL, NULL),
(84, 13, 'Ad 3', 'roommate', 'house', 300.00, '2024-07-24', 'bla', 1, 2, 28.00, 2, 2, 1, 1, 1, 'test@gmail.com', '123', '930752001', '2024-07-24 11:01:26', '2024-07-24 11:01:26', 'open', NULL, NULL, NULL),
(85, 13, 'Ad 4', 'roommate', 'house', 300.00, '2024-07-24', 'bla', 1, 2, 28.00, 2, 2, 1, 1, 1, 'test@gmail.com', '123', '930752001', '2024-07-24 11:01:36', '2024-07-24 11:01:36', 'open', NULL, NULL, NULL),
(86, 45, 'APi', 'place', 'house', 1000.00, '2020-02-02', 'nvm', 1, 4, 21.00, NULL, 2, 1, 1, 1, 'email@gmail.com', 'no', '1234567891', '2024-08-14 11:53:20', '2024-08-14 11:53:20', 'open', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `ad_images`
--

CREATE TABLE `ad_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ad_id` bigint(20) UNSIGNED NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `ad_images`
--

INSERT INTO `ad_images` (`id`, `ad_id`, `image_path`, `created_at`, `updated_at`) VALUES
(64, 82, 'ads_images/1721829618_logo.png', '2024-07-24 11:00:18', '2024-07-24 11:00:18'),
(65, 83, 'ads_images/1721829624_male-avatar-portrait-of-a-young-man-with-a-beard-illustration-of-male-character-in-modern-color-style-vector.png', '2024-07-24 11:00:24', '2024-07-24 11:00:24'),
(66, 84, 'ads_images/1721829686_b06bef9a5f8153a24f4abb07cbc2c11e.jpg', '2024-07-24 11:01:26', '2024-07-24 11:01:26'),
(67, 85, 'ads_images/1721829696_—Pngtree—arabic people character avatar ilustration_6551088.png', '2024-07-24 11:01:36', '2024-07-24 11:01:36'),
(68, 85, 'ads_images/1721829696_avatar-generations_prsz.jpg', '2024-07-24 11:01:36', '2024-07-24 11:01:36'),
(69, 85, 'ads_images/1721829696_male-avatar-portrait-of-a-young-man-with-a-beard-illustration-of-male-character-in-modern-color-style-vector.jpg', '2024-07-24 11:01:36', '2024-07-24 11:01:36'),
(70, 86, 'ads_images/1723647200_avatar-generations_prsz.jpg', '2024-08-14 11:53:20', '2024-08-14 11:53:20'),
(71, 86, 'ads_images/1723647200_b06bef9a5f8153a24f4abb07cbc2c11e.jpg', '2024-08-14 11:53:20', '2024-08-14 11:53:20');

-- --------------------------------------------------------

--
-- بنية الجدول `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `cities`
--

INSERT INTO `cities` (`id`, `name`, `country_id`, `created_at`, `updated_at`) VALUES
(1, 'دبي', 1, NULL, NULL),
(2, 'أبوظبي', 1, NULL, NULL),
(3, 'الشارقة', 1, NULL, NULL),
(4, 'عجمان', 1, NULL, NULL),
(5, 'رأس الخيمة', 1, NULL, NULL),
(6, 'الفجيرة', 1, NULL, NULL),
(7, 'أم القيوين', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `countries`
--

INSERT INTO `countries` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'الإمارات العربية المتحدة', NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2024_07_14_105304_create_countries_table', 1),
(2, '2024_07_14_104438_create_cities_table', 2),
(3, '2024_07_14_104629_create_account_types_table', 3),
(4, '0001_01_01_000000_create_users_table', 4),
(5, '2024_07_14_105834_create_ads_type_table', 5),
(6, '2024_07_14_105851_create_resedence_type_table', 6),
(7, '2024_07_14_105821_create_ads_table', 7),
(8, '0001_01_01_000001_create_cache_table', 8),
(9, '0001_01_01_000002_create_jobs_table', 8),
(10, '2024_07_18_094003_add_profile_picture_to_users_table', 9),
(11, '2024_07_18_125138_create_ads_table', 10),
(12, '2024_07_18_131311_modify_account_type_in_users_table', 11),
(13, '2024_07_21_074903_create_ad_images_table', 12),
(14, '2024_07_21_102121_update_ads_table_for_new_structure', 13),
(15, '2024_07_21_110518_update_description_column_in_ads_table', 14),
(16, '2024_07_21_115919_rename_location_to_location_description_and_make_nullable', 15),
(17, '2024_07_21_120605_rename_description_to_notes_in_your_table_name', 16),
(18, '2024_07_22_081139_remove_preferences_from_ads_table', 17),
(19, '2024_08_12_093856_create_personal_access_tokens_table', 18);

-- --------------------------------------------------------

--
-- بنية الجدول `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 19, 'Api Token of ', 'e3ace927b2caa0c9dc26957f891762d228bd03621631717442f6796daf731b94', '[\"*\"]', NULL, NULL, '2024-08-12 07:48:50', '2024-08-12 07:48:50'),
(2, 'App\\Models\\User', 20, 'Api Token of ', '9c8df62bb8dd2b5ee0d028205f5c9624f8555eacdd83c31e01f625d323102495', '[\"*\"]', NULL, NULL, '2024-08-12 07:50:23', '2024-08-12 07:50:23'),
(3, 'App\\Models\\User', 21, 'Api Token of ', '0be6a015c949b94a9fff8bb98981eecc7f84f433976023539b66bf765d0b6653', '[\"*\"]', NULL, NULL, '2024-08-12 07:50:53', '2024-08-12 07:50:53'),
(4, 'App\\Models\\User', 22, 'Api Token of ', 'eafcd7a4dfc9c7b50492515d192bdcb10397dd5321fcfdcfca3aac3619c5423a', '[\"*\"]', NULL, NULL, '2024-08-12 07:51:56', '2024-08-12 07:51:56'),
(5, 'App\\Models\\User', 23, 'Api Token of ', 'e036fac2c0f363bb28177e73648c775e91366bd61c4dd7f2ffe393b9e4940547', '[\"*\"]', NULL, NULL, '2024-08-12 07:54:12', '2024-08-12 07:54:12'),
(6, 'App\\Models\\User', 23, 'Api Token of 23', 'd6b65d13d21a83ebb82023c54f1d06ff5e97be8e0d8f6250b48ac2c8d4447a05', '[\"*\"]', NULL, NULL, '2024-08-12 08:27:39', '2024-08-12 08:27:39'),
(7, 'App\\Models\\User', 24, 'Api Token of 24', 'cc846b08fed7790ca7a2cdadac6173d7d9541a8ef6192e395379faa292985181', '[\"*\"]', NULL, NULL, '2024-08-12 08:55:25', '2024-08-12 08:55:25'),
(8, 'App\\Models\\User', 24, 'Api Token of 24', '3baa94c928a1567d393007cee1353ed23e09bdac628c945b0d1bfa266806154c', '[\"*\"]', NULL, NULL, '2024-08-12 08:56:13', '2024-08-12 08:56:13'),
(9, 'App\\Models\\User', 25, 'Api Token of 25', 'd9a921096e3c89aecd09a27d127da2b416716ed3e931bab2036d67e00315f598', '[\"*\"]', NULL, NULL, '2024-08-12 08:57:21', '2024-08-12 08:57:21'),
(10, 'App\\Models\\User', 25, 'Api Token of 25', '6e0ccab42aaee20df741c9ccce986ec09cbf2770ce1d0b8c286ed99a1c7d479f', '[\"*\"]', NULL, NULL, '2024-08-12 08:58:29', '2024-08-12 08:58:29'),
(11, 'App\\Models\\User', 26, 'Api Token of 26', 'fcdc9d4800c83fdc51c0b375f1b724bd0a672b042eb05a3520e224aea8ebf1c9', '[\"*\"]', NULL, NULL, '2024-08-12 09:10:39', '2024-08-12 09:10:39'),
(12, 'App\\Models\\User', 26, 'Api Token of 26', 'df3ea4866a960f83c773cb9c77efdafe599596b3b4d2563ae4b93d567a72ab03', '[\"*\"]', NULL, NULL, '2024-08-12 09:11:16', '2024-08-12 09:11:16'),
(13, 'App\\Models\\User', 27, 'Api Token of 27', '4cf21514c637cee5cf12c8a8c3d67343141cf874dbfae47cb6bf54975ce11d79', '[\"*\"]', NULL, NULL, '2024-08-12 09:16:09', '2024-08-12 09:16:09'),
(14, 'App\\Models\\User', 27, 'Api Token of 27', '6edfceeffc569442b0860632f1f0939f9109a62bb763c2a6647b12cad00da3fd', '[\"*\"]', NULL, NULL, '2024-08-12 09:16:15', '2024-08-12 09:16:15'),
(15, 'App\\Models\\User', 28, 'Api Token of 28', 'ccf2c856e49fb823eb8348efa7db8340d5c56958907e614e4c8a33510425013a', '[\"*\"]', NULL, NULL, '2024-08-12 09:18:48', '2024-08-12 09:18:48'),
(16, 'App\\Models\\User', 29, 'Api Token of 29', 'ad6feb158a95eae729c48cce0d9c4d5f0ff1fd3ad43b8f4683ae546c099121dc', '[\"*\"]', NULL, NULL, '2024-08-12 09:20:43', '2024-08-12 09:20:43'),
(17, 'App\\Models\\User', 27, 'Api Token of ', 'cffc2b1c46a8ad9536b3428b4a054ffbd0b266cc5d5a7ef853a14b1075bb6dfd', '[\"*\"]', NULL, NULL, '2024-08-12 09:21:20', '2024-08-12 09:21:20'),
(18, 'App\\Models\\User', 29, 'Api Token of ', '4904327c169c162be3f202aa74ec0d0b451a1d9a60436d6e379905b37bf67179', '[\"*\"]', NULL, NULL, '2024-08-12 09:21:29', '2024-08-12 09:21:29'),
(19, 'App\\Models\\User', 30, 'Api Token of 30', '6a4ae184bfe7fa34e00861335eb6bd20b7e817043b419299ba47e3efe87a5f0d', '[\"*\"]', NULL, NULL, '2024-08-12 09:22:13', '2024-08-12 09:22:13'),
(20, 'App\\Models\\User', 29, 'Api Token of ', '1e2a55f7f1c712a9222f20de5b3414644577db92dfd868b65cf71dc61f97cb49', '[\"*\"]', NULL, NULL, '2024-08-12 10:42:48', '2024-08-12 10:42:48'),
(24, 'App\\Models\\User', 29, 'Api Token of ', 'ceae1f0ca478921d354622c842c313425f5f198a5c659a625da98a55f79c4fb9', '[\"*\"]', NULL, NULL, '2024-08-13 03:36:39', '2024-08-13 03:36:39'),
(30, 'App\\Models\\User', 29, 'Api Token of ', '25107c3576497d2e8471e26339bb20707bf73c813768213d6dbe6cc31fe0487f', '[\"*\"]', NULL, NULL, '2024-08-13 04:11:40', '2024-08-13 04:11:40'),
(31, 'App\\Models\\User', 29, 'Api Token of ', '788da389648125263dc743c02f1a5783f604de8d0339f7eb3f39e8841ed8fc1c', '[\"*\"]', '2024-08-13 05:53:58', NULL, '2024-08-13 04:13:51', '2024-08-13 05:53:58'),
(32, 'App\\Models\\User', 31, 'Api Token of 31', '5cb1e931a8422eb9b949229ff6e5cdf84de4fa384e4ad163df579bb48d1d5e11', '[\"*\"]', '2024-08-14 07:59:18', NULL, '2024-08-13 04:40:49', '2024-08-14 07:59:18'),
(35, 'App\\Models\\User', 29, 'Api Token of ', 'f91e431244baa70968dd0c6829b7fabcafbdbe6ebdd812a56adea0a9079cf188', '[\"*\"]', NULL, NULL, '2024-08-13 06:00:30', '2024-08-13 06:00:30'),
(39, 'App\\Models\\User', 29, 'Api Token of ', '6e0a7e2a397637afca1561e7f818eea217313e8e2d21c8212def317a68992956', '[\"*\"]', NULL, NULL, '2024-08-13 08:37:55', '2024-08-13 08:37:55'),
(40, 'App\\Models\\User', 29, 'Api Token of ', '8b5b3cc1725eb2bda1474142532d43c3fa7d9007e74bdeafae91afcc57505697', '[\"*\"]', '2024-08-13 09:02:10', NULL, '2024-08-13 08:43:42', '2024-08-13 09:02:10'),
(41, 'App\\Models\\User', 29, 'Api Token of ', '811abd271ab7683650a1dacaa5e72838e2fb031869d78be9dfad2aad1fa0364a', '[\"*\"]', '2024-08-13 09:14:19', NULL, '2024-08-13 09:01:50', '2024-08-13 09:14:19'),
(42, 'App\\Models\\User', 29, 'Api Token of ', '8c6224e16d766637360ec5c624e033236a14943e3c5926ebcebed0dd14ef890c', '[\"*\"]', NULL, NULL, '2024-08-13 10:22:01', '2024-08-13 10:22:01'),
(43, 'App\\Models\\User', 29, 'Api Token of ', '49148288691fe45a10d5c2a8bc386831011daf0aec41cceefa8ca08049b14392', '[\"*\"]', NULL, NULL, '2024-08-13 10:27:06', '2024-08-13 10:27:06'),
(44, 'App\\Models\\User', 29, 'Api Token of ', '1512353fba97907e087265db8b64c994fab19e373ba1a13997d6909e25bd1c04', '[\"*\"]', NULL, NULL, '2024-08-13 10:32:19', '2024-08-13 10:32:19'),
(45, 'App\\Models\\User', 29, 'Api Token of ', '63558233ec6a607d98b7b73715f4525f5f9b39ce852e2ead10d69af02cef11ba', '[\"*\"]', '2024-08-14 08:15:05', NULL, '2024-08-13 10:45:49', '2024-08-14 08:15:05'),
(46, 'App\\Models\\User', 29, 'Api Token of ', 'f08856adda7752ad6a03baf2ae29756055531b2ec32bad68bb13adc79515173c', '[\"*\"]', NULL, NULL, '2024-08-14 05:19:56', '2024-08-14 05:19:56'),
(47, 'App\\Models\\User', 29, 'Api Token of ', 'a97aec34da9b10bd0c3ae911c70c97a4f719b881e4a2ea2c78a2ad7dad9094f0', '[\"*\"]', NULL, NULL, '2024-08-14 05:21:33', '2024-08-14 05:21:33'),
(48, 'App\\Models\\User', 29, 'Api Token of ', '52f80a4c7e9b6a080abe10dec21c8a55f6b199598997d26d1c3accef50933606', '[\"*\"]', NULL, NULL, '2024-08-14 05:22:32', '2024-08-14 05:22:32'),
(49, 'App\\Models\\User', 29, 'Api Token of ', 'd83dfeaa4a0e33f3cf1271a91e51d189d11acea1f4aad94bd485f0a6cc6239a6', '[\"*\"]', NULL, NULL, '2024-08-14 05:24:50', '2024-08-14 05:24:50'),
(50, 'App\\Models\\User', 29, 'Api Token of ', 'e8d755b4da604d6a864d41617c3dad312902c4207665cb048906cbf09de6e1d1', '[\"*\"]', NULL, NULL, '2024-08-14 05:33:00', '2024-08-14 05:33:00'),
(51, 'App\\Models\\User', 29, 'Api Token of ', 'a09d7423e13ddb0369065645c75dec98d9e3e7098111a598ba191ca808906125', '[\"*\"]', NULL, NULL, '2024-08-14 05:34:53', '2024-08-14 05:34:53'),
(52, 'App\\Models\\User', 29, 'Api Token of ', 'f71c1ff77c8ef2003dfa8ed2f37ed61dfd9d113b3f0229fcabcf804cb8a2e8d5', '[\"*\"]', '2024-08-14 10:03:48', NULL, '2024-08-14 05:36:13', '2024-08-14 10:03:48'),
(53, 'App\\Models\\User', 35, 'API Token of ', '8514d29feb6c41840546e7292c99c5734d33a0e315c770d2787751b47cb6ac8d', '[\"*\"]', NULL, NULL, '2024-08-14 06:55:09', '2024-08-14 06:55:09'),
(54, 'App\\Models\\User', 36, 'API Token of ', 'e4ab644c15a63524319c4bc53a6d6c64ea6b3432b23f011d3bb003d4b5f2b540', '[\"*\"]', NULL, NULL, '2024-08-14 06:57:44', '2024-08-14 06:57:44'),
(55, 'App\\Models\\User', 37, 'API Token of ', 'd349dddeee3160a847f04d778565953c5e4309b8fe56351af30465c60ce428c6', '[\"*\"]', NULL, NULL, '2024-08-14 06:58:14', '2024-08-14 06:58:14'),
(56, 'App\\Models\\User', 39, 'API Token of ', '78f1e2b4d788de38ecc91f6a0346981ed088d2f5f74435897e45016543859c67', '[\"*\"]', NULL, NULL, '2024-08-14 06:59:43', '2024-08-14 06:59:43'),
(57, 'App\\Models\\User', 40, 'API Token of ', 'c728fc727fd819e5528c610170ce41e143b5604464bf9e653a746f5d2d5fb573', '[\"*\"]', NULL, NULL, '2024-08-14 07:00:04', '2024-08-14 07:00:04'),
(58, 'App\\Models\\User', 41, 'API Token of ', '9a4a04b89636075f6ec5bc3a8763a7d4c749b352443581834e1deb0debaa1cb9', '[\"*\"]', NULL, NULL, '2024-08-14 07:00:26', '2024-08-14 07:00:26'),
(59, 'App\\Models\\User', 42, 'API Token of ', 'bce18ab4deeb5bb8d4751e9d1cb9cbd7126bb141729880158d5c6a1e26b2e33b', '[\"*\"]', NULL, NULL, '2024-08-14 07:04:49', '2024-08-14 07:04:49'),
(60, 'App\\Models\\User', 43, 'API Token of ', '08aa50571a6f4be7e7fc19ca445d76286a358a25ac90030cdc2689711750a38f', '[\"*\"]', NULL, NULL, '2024-08-14 07:06:02', '2024-08-14 07:06:02'),
(61, 'App\\Models\\User', 43, 'Api Token of ', 'e5306f7c305fe258e4ae30edabf3400eec6c24d9bf2ed72c4fc8aae277d1be6a', '[\"*\"]', NULL, NULL, '2024-08-14 07:18:04', '2024-08-14 07:18:04'),
(62, 'App\\Models\\User', 43, 'Api Token of ', 'c4906c9336b631d3e755bb87b8090e360b8edca2265d03d91ac74c161247fbce', '[\"*\"]', NULL, NULL, '2024-08-14 07:19:07', '2024-08-14 07:19:07'),
(63, 'App\\Models\\User', 43, 'Api Token of ', '1a80c70382c6274af63fdd5f2118da350f5366de9b42d17a180fe6d6bbd9aa06', '[\"*\"]', NULL, NULL, '2024-08-14 07:19:16', '2024-08-14 07:19:16'),
(64, 'App\\Models\\User', 43, 'Api Token of ', '194250d11bffea424c1234ff62beee4ad538453b54fa15b73b176f3ee4352c50', '[\"*\"]', NULL, NULL, '2024-08-14 07:20:12', '2024-08-14 07:20:12'),
(65, 'App\\Models\\User', 44, 'API Token of ', '8875de6e49b4314d9f18a1707092f2fdfd38c3a7b5dc6ed2de750b666551a74c', '[\"*\"]', NULL, NULL, '2024-08-14 07:23:54', '2024-08-14 07:23:54'),
(66, 'App\\Models\\User', 45, 'API Token of 45', '22c3f5ccc71b003e6135483f60a742b9e9b20d06b8dea1b56d56fc0ec4a1af48', '[\"*\"]', NULL, NULL, '2024-08-14 07:34:18', '2024-08-14 07:34:18'),
(67, 'App\\Models\\User', 43, 'Api Token of ', 'b692e2e0deda296fa8d7748d0f724f3569f327fd7d310131816910de7a0c522a', '[\"*\"]', NULL, NULL, '2024-08-14 07:34:34', '2024-08-14 07:34:34'),
(68, 'App\\Models\\User', 45, 'Api Token of ', 'd4c71db0816aed079be22b21a0fe63988f5822bc9fe1085f5a5cc1ba65c85ff2', '[\"*\"]', NULL, NULL, '2024-08-14 07:34:43', '2024-08-14 07:34:43'),
(70, 'App\\Models\\User', 45, 'Api Token of ', '027c0ad3484166b021830df553ebe84e0f2e1cb7d9c0f1c034af24b5880b7567', '[\"*\"]', '2024-08-14 08:47:43', NULL, '2024-08-14 07:59:46', '2024-08-14 08:47:43'),
(71, 'App\\Models\\User', 45, 'Api Token of ', 'a63d6888d97f72ab92ea626e6ac7917da54d1505c2a87016b0e6f5eb1377a699', '[\"*\"]', '2024-08-14 12:04:58', NULL, '2024-08-14 10:28:18', '2024-08-14 12:04:58'),
(72, 'App\\Models\\User', 46, 'API Token of 46', '0b56a2b2c60e5220a219eb16df14eebb36b83f63957c30b7e846fbc9fd8cfc5c', '[\"*\"]', NULL, NULL, '2024-08-14 11:53:50', '2024-08-14 11:53:50'),
(73, 'App\\Models\\User', 47, 'API Token of 47', '50d1d22922753945e7a978b8f589ec082714bfa8831e82e515d8794d25a85ba0', '[\"*\"]', NULL, NULL, '2024-08-14 11:54:01', '2024-08-14 11:54:01'),
(74, 'App\\Models\\User', 47, 'Api Token of ', 'e33efd3fae7fe8fdec04dbae5c0a72fdc516d65d98d904d5b7cd14259264b292', '[\"*\"]', '2024-08-14 12:04:48', NULL, '2024-08-14 11:54:08', '2024-08-14 12:04:48');

-- --------------------------------------------------------

--
-- بنية الجدول `residence_type`
--

CREATE TABLE `residence_type` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `residence_type`
--

INSERT INTO `residence_type` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'شقة', 'شقة سكنية في مبنى متعدد الطوابق', NULL, NULL),
(2, 'غرفة', 'غرفة مستقلة', NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('k1Y6nKykQQQppNqEbGNxlEXjEajfsO2AeQljsSdN', 32, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiNWZ3VkNvNUtzUjY5bGRJcVlPVGxMMlJsRnVaU25EVFJBWm9lYkVnRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6Mjg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZHMvNzciO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTozMjt9', 1723636361),
('OiRUfc7jfsx9qXPjW3IzhNvZRCTJ7USHAUuHWK7c', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaEhCQ0NtM1JTODZ4bzVKR3gya0UzUG1uSmE4NjFXOWkzdzg3dkIzTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1723624487),
('pucbihdv19QSEzszco1wNypxktbXO6BoUKbhoR2c', NULL, '127.0.0.1', 'PostmanRuntime/7.41.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNklaQWZCdTR0bFNYY0o2QWRZUHpPb1VFSmtsWUdPYUJCcXJkOHZkQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1723647086),
('qWzEKJpXYa3UGZMI0JoOh86JLfJUH5xUYUPgCr5g', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVlJFTEdQVmN0U3J6YlpqMHpXSkVmMDJLQnN6VG1UdFlBaWdnaFJLeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jaXRpZXMvMSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1723464908),
('ZqcJ0bXGeEyoBgXHCXb6VhVw0dJL5zjQUmNJyyQq', NULL, '127.0.0.1', 'PostmanRuntime/7.41.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ2E1amF3ZlpBZUt1aHNaWTJVaFJTWUNCYlF5Q0VCQm51MGtBWE1NViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1723539184);

-- --------------------------------------------------------

--
-- بنية الجدول `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `account_type` enum('seeking_room','seeking_roommate') NOT NULL DEFAULT 'seeking_room',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `job` varchar(255) DEFAULT NULL,
  `marital_status` enum('single','married','divorced','widowed') DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `account_type`, `email_verified_at`, `password`, `phone_number`, `birthday`, `gender`, `nationality`, `country_id`, `city_id`, `job`, `marital_status`, `profile_picture`, `remember_token`, `created_at`, `updated_at`) VALUES
(12, 'Ahmed', 'Saadi', 'ahmadsade011@gmail.com', 'seeking_roommate', NULL, '$2y$12$RRv79j0.t5NHs.4sdQHAEOpsd3ZBP7FfBhuwh/KRO5FuZmjqHMl5i', '930752001', '2000-07-11', 'male', 'Syrian', 1, 4, 'IT', 'married', 'profile_pictures/1721830117.jpg', NULL, '2024-07-18 10:39:23', '2024-07-25 05:48:32'),
(13, 'Ahmed', 'Saadi', 'ahmadsade0111@gmail.com', 'seeking_room', NULL, '$2y$12$RRv79j0.t5NHs.4sdQHAEOpsd3ZBP7FfBhuwh/KRO5FuZmjqHMl5i', '930752001', '2000-02-02', 'female', 'Syrian', 1, 2, 'sadsad', 'married', 'profile_pictures/1721830117.jpg\n', NULL, '2024-07-18 10:54:07', '2024-07-24 10:55:41'),
(14, 'Ahmed', 'Saadi', 'test@gmail.com', 'seeking_roommate', NULL, '$2y$12$/bC4yHEaIu/LfEV3r7Y5pOHVU9Ea5y7RvharlZICvbsvvr2OqIQWC', '930752001', '2024-07-25', 'female', 'dasdasdasd', 1, 1, 'dasdasdasd', 'single', NULL, NULL, '2024-07-25 05:04:30', '2024-07-25 06:02:43'),
(15, 'Ahmed', 'Saadi', 'api@gmail.com', 'seeking_room', NULL, '$2y$12$LopUwFaDKlUWNWqShBFUVu5z8/upMr1j8BqpPGcp9UUkKvzEwnMUC', '930752001', '2024-08-05', 'male', 'syrian', 1, 2, 'sa', 'single', NULL, NULL, '2024-08-12 06:15:08', '2024-08-12 06:15:08'),
(16, 'Ahmed', 'Api', 'ahmadapi@gmail.com', 'seeking_room', NULL, '$2y$12$Ao2YiO1PInr2qGu9ykm2vOlwCLsbLL6nlgUOxdjlr6uURHbRO9aYu', '6987456320', NULL, 'male', 'syrian', 1, 1, 'no job', 'single', NULL, NULL, '2024-08-12 07:33:02', '2024-08-12 07:33:02'),
(17, 'Ahmed', 'Api', 'ahmadapi1@gmail.com', 'seeking_room', NULL, '$2y$12$a9yXZZLZQBXxQ8nhg2duyOMhZjWISNB6UXM2A1AVfNApdb4zWWub2', '6987456320', NULL, 'male', 'syrian', 1, 1, 'no job', 'single', NULL, NULL, '2024-08-12 07:34:09', '2024-08-12 07:34:09'),
(18, 'Ahmed', 'Api', 'ahmadapi1@gmail.co2m', 'seeking_room', NULL, '$2y$12$DUTfv8Swu02g8.5dj8.7w.TJJf29BEVoQmIW9D/s50ooaEU4Iv.Ry', '6987456320', NULL, 'male', 'syrian', 1, 1, 'no job', 'single', NULL, NULL, '2024-08-12 07:48:00', '2024-08-12 07:48:00'),
(19, 'Ahmed', 'Api', 'ahmadapi1@gmail.co22m', 'seeking_room', NULL, '$2y$12$DbEX27nm8C0YT4L4VdLNRuL/WfLWn168wqmAjyL4BfNEb7TRCMG6i', '6987456320', NULL, 'male', 'syrian', 1, 1, 'no job', 'single', NULL, NULL, '2024-08-12 07:48:50', '2024-08-12 07:48:50'),
(20, 'Ahmed', 'Api', 'ahmadapi1@gmail.co22m2', 'seeking_room', NULL, '$2y$12$hu6bcpvhUYcWtwz5pyLHAu5lz9OB6DhfW67wLfLCBN1I5MmdhO9i2', '6987456320', NULL, 'male', 'syrian', 1, 1, 'no job', 'single', NULL, NULL, '2024-08-12 07:50:23', '2024-08-12 07:50:23'),
(21, 'Ahmed', 'Api', 'ahmadapi1@gmail.co222m2', 'seeking_room', NULL, '$2y$12$u/2flbxKh48lHhD5mgnWquBxJpgxGHefuQQl9HrA3BUufZYCpHerW', '6987456320', NULL, 'male', 'syrian', 1, 1, 'no job', 'single', NULL, NULL, '2024-08-12 07:50:53', '2024-08-12 07:50:53'),
(22, 'Ahmed', 'Api', 'ahma2dapi1@gmail.co222m2', 'seeking_room', NULL, '$2y$12$nhkOdD9ZYuyz/oE5ExD22Oq/YqJTnbvfDrl8ZHU2w.NPf.O4q/Ka.', '6987456320', NULL, 'male', 'syrian', 1, 1, 'no job', 'single', NULL, NULL, '2024-08-12 07:51:56', '2024-08-12 07:51:56'),
(23, 'Ahmed', 'Api', 'ahma2dapi1@gmail.co2222m2', 'seeking_room', NULL, '$2y$12$2cgvzCc7WRH58UUFDw9ZDeFFT10A0cPfG0HsQvyvAuk2gMBZILcWa', '6987456320', NULL, 'male', 'syrian', 1, 1, 'no job', 'single', NULL, NULL, '2024-08-12 07:54:12', '2024-08-12 07:54:12'),
(24, 'Ahmed', 'Api', 'ds@gmail.co2222m2', 'seeking_room', NULL, '$2y$12$JYWIbDkZHAYX0.DPmjoTbOVAiTxCLdxxuCQWIF3bdPenpiedTvmKW', '6987456320', NULL, 'male', 'syrian', 1, 1, 'no job', 'single', NULL, NULL, '2024-08-12 08:55:25', '2024-08-12 08:55:25'),
(25, 'Ahmed', 'Api', 'ssad@gmail.com', 'seeking_room', NULL, '$2y$12$FxeyqGlsgJUKD2VuzALGcOrX9ApSRNRXsz6DcgvpCSIYK17dIBJSq', '6987456320', NULL, 'male', 'syrian', 1, 1, 'no job', 'single', NULL, NULL, '2024-08-12 08:57:21', '2024-08-12 08:57:21'),
(26, 'Ahmed', 'Api', 'ds@gmail.com', 'seeking_room', NULL, '$2y$12$2TsqIf6JbUykLZ9vBoJBx.0NQLbcwMU.PaOgi18QR6Sd9Fn74NjDy', '6987456320', NULL, 'male', 'syrian', 1, 1, 'no job', 'single', NULL, NULL, '2024-08-12 09:10:39', '2024-08-12 09:10:39'),
(27, 'Ahmed', 'Api', 'ds@gmail.co00m', 'seeking_room', NULL, '$2y$12$mPH0pOt9T8kz.fU/6y2LrOSObOq5meXOQc0P1kCGYyijlHYAXIoOS', '6987456320', NULL, 'male', 'syrian', 1, 1, 'no job', 'single', NULL, NULL, '2024-08-12 09:16:09', '2024-08-12 09:16:09'),
(28, 'Ahmed', 'Api', 'ds@g2mail.co00m', 'seeking_room', NULL, '$2y$12$aJA2f4xpgHkhSiRg5EHEl.dLpwgpqiMAd/oi8Ggyf1fsmWvyIRFdy', '6987456320', NULL, 'male', 'syrian', 1, 1, 'no job', 'single', NULL, NULL, '2024-08-12 09:18:48', '2024-08-12 09:18:48'),
(29, 'Ahmed', 'Api', '123@g2mail.co00m', 'seeking_room', NULL, '$2y$12$bANF8E9mbaCW8btvR01rM.rLZzaBtqvVp2CDq1lkkCjO2nCJHLEqa', '6987456320', '2000-02-02', 'male', 'syrian', 1, 1, 'no job', 'single', NULL, NULL, '2024-08-12 09:20:43', '2024-08-12 09:20:43'),
(30, 'Ahmed', 'Api', 'sdas@gmail.com', 'seeking_room', NULL, '$2y$12$F/bmA7Ba4V.cJT2lCeaW1OlSpndnBOec/H5BRoLCPy3hXEzBzHf46', '6987456320', '2010-02-02', 'male', 'syrian', 1, 1, 'no job', 'single', NULL, NULL, '2024-08-12 09:22:13', '2024-08-12 09:22:13'),
(31, 'Ali', 'MMM', '123@gmail.com', 'seeking_room', NULL, '$2y$12$io.lwZNAhblG2Uceek3x4OEq12tz3L64Vl4HNeHcUO0ZZo.ioXbbe', '6987456320', '2010-02-02', 'male', 'syrian', 1, 5, 'no job', 'single', 'profile_pictures/1723544728.jpg', NULL, '2024-08-13 04:40:49', '2024-08-14 07:59:18'),
(32, 'Ahmed', 'Saadi', 'api43211@gmail.com', 'seeking_room', NULL, '$2y$12$LwHDVsBOr7OmgRbCwhGE6eVfoTyI4acBNoR/RzLrOZyIZjEh.xob6', '930752001', '2024-08-28', 'male', 'syrian', 1, 6, 'sa', 'divorced', NULL, NULL, '2024-08-14 06:20:46', '2024-08-14 06:20:46'),
(33, 'Ahmed', 'Api', '321@gmail.com', 'seeking_room', NULL, '$2y$12$XmHhUUJF4QPJJWByot.PFuQTSaSlGiXAsOXmpCQiKLlxZ02JpKtdC', '6987456320', '2010-02-02', 'male', 'syrian', 1, 1, 'no job', 'single', NULL, NULL, '2024-08-14 06:53:24', '2024-08-14 06:53:24'),
(34, 'Ahmed', 'Api', '3221@gmail.com', 'seeking_room', NULL, '$2y$12$bnu1c7Rpg6n/q3qmXPd1rO.HhUNl.p03KHoTB4O/5Vo0vCMVoAyFW', '6987456320', '2010-02-02', 'male', 'syrian', 1, 1, 'no job', 'single', NULL, NULL, '2024-08-14 06:54:36', '2024-08-14 06:54:36'),
(35, 'Ahmed', 'Api', '232131@gmail.com', 'seeking_room', NULL, '$2y$12$YpVJcYSwfQNA/aCrEXomruIR4w4WKoIz0b1EtvTltxJf6AXJx3H.O', '6987456320', '2010-02-02', 'male', 'syrian', 1, 1, 'no job', 'single', NULL, NULL, '2024-08-14 06:55:09', '2024-08-14 06:55:09'),
(36, 'Ahmed', 'Api', '12@gmail.com', 'seeking_room', NULL, '$2y$12$rE41k.Za3Os62FsVII3PgusWnsH3Xd0IMqwMsrBCPzUldS32AG1Bq', '6987456320', '2010-02-02', 'male', 'syrian', 1, 1, 'no job', 'single', NULL, NULL, '2024-08-14 06:57:44', '2024-08-14 06:57:44'),
(37, 'Ahmed', 'Api', '125@gmail.com', 'seeking_room', NULL, '$2y$12$Qs2utDsbl4JSX0ojJGFEBuAhplQe.3uMkPgR.ODhD4GLIw.eyPw/e', '6987456320', '2010-02-02', 'male', 'syrian', 1, 2, 'no job', 'single', NULL, NULL, '2024-08-14 06:58:14', '2024-08-14 06:58:14'),
(38, 'Ahmed', 'Api', '125@gmail.com3', 'seeking_room', NULL, '$2y$12$9S63d1WXJ0uHCKTY78l4YeFCe1RlOqBCKd..hZJR2NRi0F5ClGxDi', '6987456320', '2010-02-02', 'male', 'syrian', 1, 2, 'no job', 'single', NULL, NULL, '2024-08-14 06:59:27', '2024-08-14 06:59:27'),
(39, 'Ahmed', 'Api', '125@gmail.com35', 'seeking_room', NULL, '$2y$12$516XVUdU51nGkNJ5q9B1aOi3c2bXzT9urU/Od.N.NxTW35PxfrteO', '6987456320', '2010-02-02', 'male', 'syrian', 1, 2, 'no job', 'single', NULL, NULL, '2024-08-14 06:59:42', '2024-08-14 06:59:42'),
(40, 'Ahmed', 'Api', '125@gmail.com351', 'seeking_room', NULL, '$2y$12$OfQj7Pf60MhoDu.D/Tm8nu6IFlKz.8SNuya8UwQcodfXqBV7JNF6K', '6987456320', '2010-02-02', 'male', 'syrian', 1, 2, 'no job', 'single', NULL, NULL, '2024-08-14 07:00:04', '2024-08-14 07:00:04'),
(41, 'Ahmed', 'Api', '125@213.com351', 'seeking_room', NULL, '$2y$12$2fJ.fqTNA/zAR7pj2Djnt.1xVlHhs2UsApeaTUcsaZ.QhsPXEhv7q', '6987456320', '2010-02-02', 'male', 'syrian', 1, 2, 'no job', 'single', NULL, NULL, '2024-08-14 07:00:26', '2024-08-14 07:00:26'),
(42, 'Ahmed', 'Api', '125@2213.com351', 'seeking_room', NULL, '$2y$12$uFA/laM1gM6RKxk1jGwhFuRVthYpttJTpB1cBeqVTPY7/j3lQPwTG', '6987456320', '2010-02-02', 'male', 'syrian', 1, 2, 'no job', 'single', NULL, NULL, '2024-08-14 07:04:49', '2024-08-14 07:04:49'),
(43, 'Ahmed', 'Api', '125@2213.com351ص', 'seeking_room', NULL, '$2y$12$P7XMsCurCKwX5h25CriDmO12aoi.sTy8OelmwyDz2nZcu1f9sd6Fi', '6987456320', '2010-02-02', 'male', 'syrian', 1, 2, 'no job', 'single', NULL, NULL, '2024-08-14 07:06:02', '2024-08-14 07:06:02'),
(44, 'Ahmed', 'Api', 'test123@gmail.com', 'seeking_room', NULL, '$2y$12$5E/8WmsFUCcZ3hYnwkPWWOj/ZvRfCVU3dcd9pQco.SHHvUffRVlyy', '6987456320', '2010-02-02', 'male', 'syrian', 1, 2, 'no job', 'single', NULL, NULL, '2024-08-14 07:23:54', '2024-08-14 07:23:54'),
(45, 'Ahmed', 'Api', 'tes2t123@gmail.com', 'seeking_room', NULL, '$2y$12$yM7mfG8CZwxp9/LBs3R39OOdQqKffPSlZ9c.aS777X33cJ0t8qLNy', '6987456320', '2010-02-02', 'male', 'syrian', 1, 5, 'no job', 'single', 'profile_pictures/1723636063.jpg', NULL, '2024-08-14 07:34:18', '2024-08-14 08:47:43'),
(46, 'Ahmed', 'Api', 'tes2t123@gmail.com1', 'seeking_room', NULL, '$2y$12$jWsu3wQa3a9/FbH1N3Kl0.U.4M.rG8XS4S5nwDls.3584mChDl6DS', '6987456320', '2010-02-02', 'male', 'syrian', 1, 2, 'no job', 'single', NULL, NULL, '2024-08-14 11:53:50', '2024-08-14 11:53:50'),
(47, 'Ahmed', 'Api', 'tes2t123@gmail.com12', 'seeking_roommate', NULL, '$2y$12$BtTYzSey4MQtiljL9g2NYuRWKCFiNt5/tSewOyCebXuMS0K/YG3P2', '6987456320', '2010-02-02', 'male', 'syrian', 1, 2, 'no job', 'single', NULL, NULL, '2024-08-14 11:54:01', '2024-08-14 11:54:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ads_user_id_foreign` (`user_id`),
  ADD KEY `ads_country_id_foreign` (`country_id`),
  ADD KEY `ads_city_id_foreign` (`city_id`);

--
-- Indexes for table `ad_images`
--
ALTER TABLE `ad_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ad_images_ad_id_foreign` (`ad_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_country_id_foreign` (`country_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `residence_type`
--
ALTER TABLE `residence_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_country_id_foreign` (`country_id`),
  ADD KEY `users_city_id_foreign` (`city_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `ad_images`
--
ALTER TABLE `ad_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `residence_type`
--
ALTER TABLE `residence_type`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- قيود الجداول المُلقاة.
--

--
-- قيود الجداول `ads`
--
ALTER TABLE `ads`
  ADD CONSTRAINT `ads_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ads_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- قيود الجداول `ad_images`
--
ALTER TABLE `ad_images`
  ADD CONSTRAINT `ad_images_ad_id_foreign` FOREIGN KEY (`ad_id`) REFERENCES `ads` (`id`) ON DELETE CASCADE;

--
-- قيود الجداول `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE;

--
-- قيود الجداول `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
