-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2021 at 09:21 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `assignment2`
--

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE `friends` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `friends_id` int(11) NOT NULL,
  `status` enum('pending','approve','waiting','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `friends`
--

INSERT INTO `friends` (`id`, `user_id`, `friends_id`, `status`, `created_at`, `updated_at`) VALUES
(15, 4, 9, 'approve', '2021-04-25 12:13:54', '2021-04-25 12:15:50'),
(16, 4, 5, 'waiting', '2021-04-25 12:19:30', '2021-04-25 12:19:30');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2021_04_24_060741_create_friends_table', 2),
(9, '2021_04_25_191001_create_visitors_tables', 3);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('005f90e00d326fec8f4ebc961896616cb1f4276c014edbe652ddae4b70c9f342ea15d6c72e9cff85', 4, 1, NULL, '[]', 0, '2021-04-23 15:22:48', '2021-04-23 15:22:48', '2022-04-23 20:52:48'),
('109471afe176988edadf0ee5dcaa869a1bc4e4338308de22cfc5942b0b4fffc6fff24cab4389eaab', 4, 1, NULL, '[]', 0, '2021-04-23 15:24:56', '2021-04-23 15:24:56', '2022-04-23 20:54:56'),
('12e1627ef0ff0f8dd027d0e1d24d789d9c7adb241dff299ca09ac06ee57edad9f761a9eb1570ca3a', 4, 5, 'myApp', '[]', 0, '2021-04-25 06:24:53', '2021-04-25 06:24:53', '2022-04-25 11:54:53'),
('1998b6ed84663db9d980f02649048b9000c98361367a3777c80cff8f810cd3bb038733e2e2697cb8', 4, 1, NULL, '[]', 0, '2021-04-23 15:22:25', '2021-04-23 15:22:25', '2022-04-23 20:52:25'),
('1d0a6b38f4812420e218c8cabf25f8c07ffdb24ec2c0eecdfc1fa78868d856f0dc5962bf6a49609d', 9, 5, 'myApp', '[]', 0, '2021-04-25 12:12:42', '2021-04-25 12:12:42', '2022-04-25 17:42:42'),
('2fee8f059610fc09d0d8a8ba55c2070e75f1229267a46c8a2924e9c751946c04eb55361e66dc0aa0', 5, 5, 'myApp', '[]', 0, '2021-04-25 12:21:13', '2021-04-25 12:21:13', '2022-04-25 17:51:13'),
('389de1a4a30297fb0eb3332c5d811118ef66fbac7ba78dd0dd28d9d55b433c6604d1e4afa95ce9d9', 4, 3, 'myApp', '[]', 0, '2021-04-24 00:10:27', '2021-04-24 00:10:27', '2022-04-24 05:40:27'),
('439b4daa59ef97ccc140ffbaabbda87cfcf33cc874e0e9b8646d3c7b4c3ab1103d1ab4ee60c28dd7', 4, 3, NULL, '[]', 0, '2021-04-23 23:44:47', '2021-04-23 23:44:47', '2022-04-24 05:14:47'),
('43fbeb7d0788e3cd7d94a3b01e90a2d959f8989cf923bf7d7708e3046be1987bc42ab47ddeba652f', 4, 1, NULL, '[]', 0, '2021-04-23 15:24:59', '2021-04-23 15:24:59', '2022-04-23 20:54:59'),
('47d36cba1d4b01aa76f8d68d976999dabd17345aa9d13910fdac122d0d0dfec5cfc29843c9987421', 4, 5, 'myApp', '[]', 0, '2021-04-25 06:02:37', '2021-04-25 06:02:37', '2022-04-25 11:32:37'),
('4a53a84422729811a0a0d816a79ae20bfeab979c39f307a53e4a6159a81877da4d585d58f9b9b8ca', 6, 5, 'myApp', '[]', 0, '2021-04-25 05:26:38', '2021-04-25 05:26:38', '2022-04-25 10:56:38'),
('4d7ae4f27053627e068f2a605fc03ee48beaa24f2e9e56a02da651ce3187041f69466d617d8d6b56', 4, 1, NULL, '[]', 0, '2021-04-23 15:31:17', '2021-04-23 15:31:17', '2022-04-23 21:01:17'),
('53a4a0065dffedc53e626f3919d22a6f388375dea50167ca6649a3b446d944a51c8e1f96dcf0af92', 4, 5, 'myApp', '[]', 0, '2021-04-25 05:24:10', '2021-04-25 05:24:10', '2022-04-25 10:54:10'),
('594792d1b4e1555e8cacd04bf0a81be1b7c1d28400d4a9269adf29537e133583dabe307b0d1b0877', 7, 5, 'myApp', '[]', 0, '2021-04-24 05:30:09', '2021-04-24 05:30:09', '2022-04-24 11:00:09'),
('66fd2555c6f39927d1932bbeea0bc741c2d19f5d946291bf747b7b02af5f89e8b131b98b44d84724', 4, 1, NULL, '[]', 0, '2021-04-23 15:17:40', '2021-04-23 15:17:40', '2022-04-23 20:47:40'),
('6e2412bc552ac46e5ea3bb4b34c001cd72774b18687e41c8781215ef655dfd6ac3a2819bfae741bc', 4, 1, NULL, '[]', 0, '2021-04-23 23:14:36', '2021-04-23 23:14:36', '2022-04-24 04:44:36'),
('73efc06d9339ad3ae8e6db7e707219b9c90070fb0c82bcfe0a48f4c33e95bee969d950e84ede6bda', 4, 5, 'myApp', '[]', 0, '2021-04-25 10:55:53', '2021-04-25 10:55:53', '2022-04-25 16:25:53'),
('7787bed57c905283e41ba3876094df35936ee6ba3fc5b6bfdb296bf48b677f9484eb4af31118e11f', 4, 5, 'myApp', '[]', 0, '2021-04-25 10:43:25', '2021-04-25 10:43:25', '2022-04-25 16:13:25'),
('82b4a115b0c2fc07cca529b8342184775847455103ff8e8a6bd16370dcedd9d6a1bca09716aca7f1', 4, 1, NULL, '[]', 0, '2021-04-23 15:16:48', '2021-04-23 15:16:48', '2022-04-23 20:46:48'),
('87ebf8e931eeff734dda623fd8778d86a76f471ee99a9ee05e51b493c9ca3b92afeffddd9374b1bf', 4, 5, 'myApp', '[]', 0, '2021-04-25 06:22:07', '2021-04-25 06:22:07', '2022-04-25 11:52:07'),
('8a158062255e9c28b2b3e1493d335c1897cc8cdae641dccd297093c5de5bdb4bc2b59b9a2ce22aff', 7, 5, 'myApp', '[]', 0, '2021-04-25 10:55:16', '2021-04-25 10:55:16', '2022-04-25 16:25:16'),
('8a3e43ba364541f79fc00e6c403aacfab3c34166df9b084c95d44a91a128d5759a38fc8d6a3db0c5', 4, 3, 'myApp', '[]', 0, '2021-04-24 00:18:03', '2021-04-24 00:18:03', '2022-04-24 05:48:03'),
('8bb87abc290385498d264595c1ccc0994a1cd3a888f4d7ba8cafb3f4d1368b42c65e32c3225b21aa', 4, 5, 'myApp', '[]', 0, '2021-04-24 02:46:04', '2021-04-24 02:46:04', '2022-04-24 08:16:04'),
('8c5dc6935747bff48ee689a78ee727573340fba826e15e58758d0b0d3616efe8d251650f4d427454', 4, 3, 'myApp', '[]', 0, '2021-04-24 00:15:37', '2021-04-24 00:15:37', '2022-04-24 05:45:37'),
('8fa2e2b36bcbafa02f2d00c1c10310291ae3e7fe988e43f086d837f1e2b2eb9f698e902e12a8dd2c', 4, 1, NULL, '[]', 0, '2021-04-23 15:31:20', '2021-04-23 15:31:20', '2022-04-23 21:01:20'),
('9c2961e78076ee57b0c18e26b2874324f1809142589bca21963b188036fbc7d5f5dbff1fa76c1198', 7, 5, 'myApp', '[]', 0, '2021-04-25 10:19:01', '2021-04-25 10:19:01', '2022-04-25 15:49:01'),
('9fffbeda67ea49120078bcc16b47c865c0d219369a8872fa2123a2a65b802c8289f40e23198c6ecf', 4, 5, 'myApp', '[]', 0, '2021-04-25 12:15:39', '2021-04-25 12:15:39', '2022-04-25 17:45:39'),
('a0cf403da7adde398211ebbcb704a30cfc22f7eede44dbd274bae20d1b3e5fbd99de1220e62df698', 4, 5, 'myApp', '[]', 0, '2021-04-25 06:01:57', '2021-04-25 06:01:57', '2022-04-25 11:31:57'),
('a638338718c910b6fd7337a4afe9b025b4c7ec5eb8e28bfbeeaa21fb2345e9214516694b69872ca6', 4, 1, NULL, '[]', 0, '2021-04-23 15:36:16', '2021-04-23 15:36:16', '2022-04-23 21:06:16'),
('a76eca45e195ef67199994a23b71445c901275fc16821487a67a33ecfd236190b112c332cae25c2f', 4, 5, 'myApp', '[]', 0, '2021-04-25 06:37:19', '2021-04-25 06:37:19', '2022-04-25 12:07:19'),
('b5278043781d66c6ed6697c455dcf26a9fdd9ef8554c3e58cdd111dd68c4b4993ddaba4e4e42044d', 4, 3, 'myApp', '[]', 0, '2021-04-24 00:14:18', '2021-04-24 00:14:18', '2022-04-24 05:44:18'),
('bceb176de1e9ed0e849749ff18218d9009a43025bbb91f23283ab0cf0db434790944d8f128b1cad1', 4, 5, 'myApp', '[]', 0, '2021-04-25 12:29:50', '2021-04-25 12:29:50', '2022-04-25 17:59:50'),
('be5092e0f2737a3ca8a9026d05b159e01840f3d0a3bd20b2103721eaf53b21e557d579035bc51621', 4, 5, 'myApp', '[]', 0, '2021-04-25 06:00:34', '2021-04-25 06:00:34', '2022-04-25 11:30:34'),
('bf17b136ad0195389f3c09d957303f7b4ec126d6eb8cea06c00bcf8d2c65360ac240f333fed6666d', 9, 5, 'myApp', '[]', 0, '2021-04-25 12:14:52', '2021-04-25 12:14:52', '2022-04-25 17:44:52'),
('c138323b658c081e032751ec8e0f8e0735f5a967bddec1977989a9c12b3339c41c2a09c8f6a57c92', 6, 5, 'myApp', '[]', 0, '2021-04-24 05:30:55', '2021-04-24 05:30:55', '2022-04-24 11:00:55'),
('cc742513a42e89403c4fab4d904f49295eb96408e3fab28fb85a95dd96a9f3737275ffb971b3d189', 4, 5, 'myApp', '[]', 0, '2021-04-25 06:01:09', '2021-04-25 06:01:09', '2022-04-25 11:31:09'),
('d466c52ee383dff2289456b2b1bf60c69c2f282e25950f9b323cc8085c1dadc21680232ee08e842e', 4, 3, 'myApp', '[]', 0, '2021-04-24 00:13:50', '2021-04-24 00:13:50', '2022-04-24 05:43:50'),
('e2d8656b8cc7781eff666ed18f202a1bb95945eb0eabfc3a8f830ce8b381455503298fcf7cd78acf', 4, 3, 'myApp', '[]', 0, '2021-04-24 01:09:40', '2021-04-24 01:09:40', '2022-04-24 06:39:40'),
('e904e93aaacfdeaf22d093f15bd3fa626031b9f2d1979f7a59cd7580227c0b0b7260ab7ca9221512', 4, 1, NULL, '[]', 0, '2021-04-23 15:30:23', '2021-04-23 15:30:23', '2022-04-23 21:00:23'),
('eb6539b2efa0c227465cfc1176f2aaa2e2d5cbec828c7dc46e4c22772576e5556312081ca7fae4c7', 4, 5, 'myApp', '[]', 0, '2021-04-25 06:03:16', '2021-04-25 06:03:16', '2022-04-25 11:33:16'),
('efd044548aa55f8c969b74437f153e2481ecf790f592830205d8a60a1e9bcc1579d6f4cf5671993f', 4, 1, NULL, '[]', 0, '2021-04-23 15:36:14', '2021-04-23 15:36:14', '2022-04-23 21:06:14'),
('f3685ad867c53dc9a434899f51c6745dbd78c03a9e502ba34df4d8cddff6be09ad6513d77d9ec89b', 4, 1, NULL, '[]', 0, '2021-04-23 15:27:26', '2021-04-23 15:27:26', '2022-04-23 20:57:26'),
('f63e824eb5e34e4328a89326f90fc5d349b3d70e7d472d26351920789ec6c56e30de3cc61f43ce71', 4, 3, 'myApp', '[]', 0, '2021-04-24 01:13:56', '2021-04-24 01:13:56', '2022-04-24 06:43:56'),
('fb692d248529d242bfa291667a22779135bb4f65167db45910c470bb45f599c5df65c2b99d6e409d', 4, 1, NULL, '[]', 0, '2021-04-23 15:30:20', '2021-04-23 15:30:20', '2022-04-23 21:00:20'),
('ffe014b6e458e5ec2f61f2b63bc79887ca7e2d7ab3b5827aa22861e091c955699eba308ed503ba37', 4, 3, 'myApp', '[]', 0, '2021-04-24 01:12:52', '2021-04-24 01:12:52', '2022-04-24 06:42:52');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'PSKfbktugPCVITCctU1pUF7DBPWsNkuHNq8dFG1O', 'http://localhost', 1, 0, 0, '2021-04-23 15:00:17', '2021-04-23 15:00:17'),
(2, NULL, 'Laravel Password Grant Client', 'JpzCTCIFKlDW9WZSXZ1pUgh7yqrXxV4RaKdc23pi', 'http://localhost', 0, 1, 0, '2021-04-23 15:00:17', '2021-04-23 15:00:17'),
(3, NULL, 'Laravel Personal Access Client', 'VYqz2H27MCJSu3l8zQSyp889XEIZ2qx6WkHDTv2Z', 'http://localhost', 1, 0, 0, '2021-04-23 23:40:55', '2021-04-23 23:40:55'),
(4, NULL, 'Laravel Password Grant Client', 'm6wJlcjuuLdsLpwoeQFAHgFgD8jmToESkuCyx28Z', 'http://localhost', 0, 1, 0, '2021-04-23 23:40:56', '2021-04-23 23:40:56'),
(5, NULL, 'Laravel Personal Access Client', 'ksAwAS85bC6wBNsR0BPUHbfwfbIsP2vlJgKDzkBk', 'http://localhost', 1, 0, 0, '2021-04-24 02:45:31', '2021-04-24 02:45:31'),
(6, NULL, 'Laravel Password Grant Client', '75mbKk3bQ2nDs2lFux7QAXIKgMyJHx9fHbTtyqF0', 'http://localhost', 0, 1, 0, '2021-04-24 02:45:32', '2021-04-24 02:45:32');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-04-23 15:00:17', '2021-04-23 15:00:17'),
(2, 3, '2021-04-23 23:40:56', '2021-04-23 23:40:56'),
(3, 5, '2021-04-24 02:45:32', '2021-04-24 02:45:32');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `city`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(4, 'prakash', 'prakashmca577@gmail.com', '9932899411', 'kolkata', NULL, '$2y$10$j5636481bNB1VmB1oOGbBuVK5AaTmmN7J54Oc0htz.bHnO63QlzRm', NULL, '2021-04-23 14:43:01', '2021-04-23 14:43:01'),
(5, 'Sakib', 'sakib@gmail.com', '9932899416', 'kolkata', NULL, '$2y$10$d3Awpe2z4fafLv9Qv1Vs5eM43M3qpaKoQTEwLi7BqWgbovu.STXey', NULL, '2021-04-24 03:06:35', '2021-04-24 03:06:35'),
(6, 'samir', 'samir@gmail.com', '9932899417', 'kolkata', NULL, '$2y$10$TdcWl7s/U6NkRt8BklbRo.W9n9YERIPP6OdNCadyJw0HsqH/Oo0aG', NULL, '2021-04-24 04:57:35', '2021-04-24 04:57:35'),
(7, 'Rosy', 'rose@gmail.com', '9932899414', 'kolkata', NULL, '$2y$10$t52cR9IerOos2xR7KEX.h.Fq.jhvjKTHLQVNZ7BSHejnsYCv.UUbu', NULL, '2021-04-24 04:58:01', '2021-04-24 04:58:01'),
(9, 'Rahul', 'rahul@yop.com', '9563491087', NULL, NULL, '$2y$10$HwZnJyN2HmpnMUsixh6Ameb5kYkCnB5PlsYCcep1Cfkx/3FOXocWO', NULL, '2021-04-25 03:56:23', '2021-04-25 03:56:23');

-- --------------------------------------------------------

--
-- Table structure for table `visitors_tables`
--

CREATE TABLE `visitors_tables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `visiter_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `check_in` time NOT NULL,
  `check_out` time NOT NULL,
  `purpose` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `visitors_tables`
--
ALTER TABLE `visitors_tables`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `friends`
--
ALTER TABLE `friends`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `visitors_tables`
--
ALTER TABLE `visitors_tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
