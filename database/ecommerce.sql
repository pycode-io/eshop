-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 02, 2023 at 07:43 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Lorem Ipsum', 'lorem-ipsum-is', '/storage/photos/1/Banner/banner-04.jpg', '<h2><span style=\"font-weight: bold; color: rgb(99, 99, 99);\">Up to 10%</span></h2>', 'active', '2020-08-14 01:47:38', '2023-07-01 05:12:50'),
(2, 'Lorem Ipsum', 'lorem-ipsum', '/storage/photos/1/Banner/banner-07.jpg', '<p>Up to 90%</p>', 'active', '2020-08-14 01:50:23', '2020-08-14 01:50:23'),
(4, 'Banner', 'banner', '/storage/photos/1/Banner/banner-06.jpg', '<h2><span style=\"color: rgb(156, 0, 255); font-size: 2rem; font-weight: bold;\">Up to 40%</span><br></h2><h2><span style=\"color: rgb(156, 0, 255);\"></span></h2>', 'active', '2020-08-17 20:46:59', '2020-08-17 20:46:59'),
(15, 'Fashion', 'fashion', '/storage/photos/1/Banner/banner-09.jpg', '<h2><b style=\"background-color: rgb(255, 255, 0);\">Latest Fashion</b></h2>', 'inactive', '2023-07-01 05:15:40', '2023-07-01 05:15:50');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Adidas', 'adidas', 'active', '2020-08-14 04:23:00', '2020-08-14 04:23:00'),
(2, 'Nike', 'nike', 'active', '2020-08-14 04:23:08', '2020-08-14 04:23:08'),
(3, 'Kappa', 'kappa', 'active', '2020-08-14 04:23:48', '2020-08-14 04:23:48'),
(4, 'Prada', 'prada', 'active', '2020-08-14 04:24:08', '2020-08-14 04:24:08'),
(6, 'Brand', 'brand', 'active', '2020-08-17 20:50:31', '2020-08-17 20:50:31');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(12, 4, 6, 31, 2000.00, 'new', 3, 6000.00, '2023-07-01 05:26:27', '2023-07-01 05:29:39');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `summary` text DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT 1,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Men\'s Fashion', 'mens-fashion', NULL, '/storage/photos/1/Category/mini-banner1.jpg', 1, NULL, NULL, 'active', '2020-08-14 04:26:15', '2020-08-14 04:26:15'),
(2, 'Women\'s Fashion', 'womens-fashion', NULL, '/storage/photos/1/Category/mini-banner2.jpg', 1, NULL, NULL, 'active', '2020-08-14 04:26:40', '2020-08-14 04:26:40'),
(3, 'Kid\'s', 'kids', NULL, '/storage/photos/1/Category/mini-banner3.jpg', 1, NULL, NULL, 'active', '2020-08-14 04:27:10', '2020-08-14 04:27:42'),
(4, 'T-shirt\'s', 't-shirts', NULL, NULL, 0, 1, NULL, 'active', '2020-08-14 04:32:14', '2020-08-14 04:32:14'),
(5, 'Jeans pants', 'jeans-pants', NULL, NULL, 0, 1, NULL, 'active', '2020-08-14 04:32:49', '2020-08-14 04:32:49'),
(6, 'Sweater & Jackets', 'sweater-jackets', NULL, NULL, 0, 1, NULL, 'active', '2020-08-14 04:33:37', '2020-08-14 04:33:37'),
(7, 'Rain Coats & Trenches', 'rain-coats-trenches', NULL, NULL, 0, 1, NULL, 'active', '2020-08-14 04:34:04', '2020-08-14 04:34:04');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `type` enum('fixed','percent') NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
(2, '111111', 'percent', 10.00, 'active', NULL, NULL),
(6, 'py100', 'percent', 20.00, 'active', '2023-06-29 12:09:25', '2023-06-29 12:09:25'),
(7, 'sky1000', 'fixed', 50.00, 'active', '2023-06-29 12:09:54', '2023-06-29 12:09:54');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `subject` text NOT NULL,
  `email` varchar(191) NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `message` longtext NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `subject`, `email`, `photo`, `phone`, `message`, `read_at`, `created_at`, `updated_at`) VALUES
(1, 'Prajwal Rai', 'About price', 'prajwal.iar@gmail.com', NULL, '9807009999', 'Hello sir i am from kathmandu nepal.', '2020-08-14 08:25:46', '2020-08-14 08:00:01', '2020-08-14 08:25:46'),
(2, 'Prajwal Rai', 'About Price', 'prajwal.iar@gmail.com', NULL, '9800099000', 'Hello i am Prajwal Rai', '2020-08-18 03:04:15', '2020-08-15 07:52:39', '2020-08-18 03:04:16'),
(3, 'Prajwal Rai', 'lorem ipsum', 'prajwal.iar@gmail.com', NULL, '1200990009', 'hello sir sdfdfd dfdjf ;dfjd fd ldkfd', '2023-06-28 13:34:28', '2020-08-17 21:15:12', '2023-06-28 13:34:28');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_07_10_021010_create_brands_table', 1),
(5, '2020_07_10_025334_create_banners_table', 1),
(6, '2020_07_10_112147_create_categories_table', 1),
(7, '2020_07_11_063857_create_products_table', 1),
(8, '2020_07_12_073132_create_post_categories_table', 1),
(9, '2020_07_12_073701_create_post_tags_table', 1),
(10, '2020_07_12_083638_create_posts_table', 1),
(11, '2020_07_13_151329_create_messages_table', 1),
(12, '2020_07_14_023748_create_shippings_table', 1),
(13, '2020_07_15_054356_create_orders_table', 1),
(14, '2020_07_15_102626_create_carts_table', 1),
(15, '2020_07_16_041623_create_notifications_table', 1),
(16, '2020_07_16_053240_create_coupons_table', 1),
(17, '2020_07_23_143757_create_wishlists_table', 1),
(18, '2020_07_24_074930_create_product_reviews_table', 1),
(19, '2020_07_24_131727_create_post_comments_table', 1),
(20, '2020_08_01_143408_create_settings_table', 1),
(21, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(22, '2023_06_21_164432_create_jobs_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('2145a8e3-687d-444a-8873-b3b2fb77a342', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-15 07:31:21', '2020-08-15 07:31:21'),
('35aed90f-25cc-4814-b4c8-847890759ad9', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/6\",\"fas\":\"fa-file-alt\"}', NULL, '2023-07-01 05:29:38', '2023-07-01 05:29:38'),
('3af39f84-cab4-4152-9202-d448435c67de', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/4\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-15 07:54:52', '2020-08-15 07:54:52'),
('4a0afdb0-71ad-4ce6-bc70-c92ef491a525', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-17 21:13:51', '2020-08-17 21:13:51'),
('540ca3e9-0ff9-4e2e-9db3-6b5abc823422', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', '2020-08-15 07:30:44', '2020-08-14 07:12:28', '2020-08-15 07:30:44'),
('5da09dd1-3ffc-43b0-aba2-a4260ba4cc76', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-15 07:51:02', '2020-08-15 07:51:02'),
('5e91e603-024e-45c5-b22f-36931fef0d90', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/white-sports-casual-t\",\"fas\":\"fa-star\"}', NULL, '2020-08-15 07:44:07', '2020-08-15 07:44:07'),
('62e7aac9-093f-43e4-a5b3-1845c6a16f04', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage\",\"fas\":\"fas fa-comment\"}', NULL, '2023-07-01 15:11:01', '2023-07-01 15:11:01'),
('73a3b51a-416a-4e7d-8ca2-53b216d9ad8e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-14 07:11:03', '2020-08-14 07:11:03'),
('8605db5d-1462-496e-8b5f-8b923d88912c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/1\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-14 07:20:44', '2020-08-14 07:20:44'),
('a6ec5643-748c-4128-92e2-9a9f293f53b5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/5\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-17 21:17:03', '2020-08-17 21:17:03'),
('b186a883-42f2-4a05-8fc5-f0d3e10309ff', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/2\",\"fas\":\"fa-file-alt\"}', '2020-08-15 04:17:24', '2020-08-14 22:14:55', '2020-08-15 04:17:24'),
('d2fd7c33-b0fe-47d6-8bc6-f377d404080d', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-14 07:08:50', '2020-08-14 07:08:50'),
('dff78b90-85c8-42ee-a5b1-de8ad0b21be4', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/3\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-15 06:40:54', '2020-08-15 06:40:54'),
('e03ea6d6-2b20-48f2-bb9c-42d19fd74df6', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/lorem-ipsum-is-simply\",\"fas\":\"fa-star\"}', NULL, '2023-07-01 15:07:37', '2023-07-01 15:07:37'),
('e28b0a73-4819-4016-b915-0e525d4148f5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/lorem-ipsum-is-simply\",\"fas\":\"fa-star\"}', NULL, '2020-08-17 21:08:16', '2020-08-17 21:08:16'),
('ffffa177-c54e-4dfe-ba43-27c466ff1f4b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-17 21:13:29', '2020-08-17 21:13:29');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_total` double(8,2) NOT NULL,
  `shipping_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `total_amount` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('cod','paypal') NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') NOT NULL DEFAULT 'new',
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `country` varchar(191) NOT NULL,
  `post_code` varchar(191) DEFAULT NULL,
  `address1` text NOT NULL,
  `address2` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`) VALUES
(6, 'ORD-LW8J4M4YNZ', 31, 6000.00, NULL, NULL, 6000.00, 3, 'cod', 'unpaid', 'delivered', 'Smita', 'Singh', 'smitasingh@gmail.com', '9044438304', 'IN', '401208', 'mira road', '912 space', '2023-07-01 05:29:37', '2023-07-01 05:31:23');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `summary` text NOT NULL,
  `description` longtext DEFAULT NULL,
  `quote` text DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `tags` varchar(191) DEFAULT NULL,
  `post_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_tag_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Where does it come from?', 'where-does-it-come-from', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Contrary to popular belief, Lorem Ipsum is not simply random text.&nbsp;</span><br></p>', '<h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.</span><br></p>', '/storage/photos/1/Blog/blog1.jpg', '2020,Visit nepal 2020', 1, NULL, NULL, 'active', '2020-08-14 01:55:55', '2020-08-14 04:29:56'),
(2, 'Where can I get some?', 'where-can-i-get-some', '<h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\"><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">It is a long established fact that a reader</span><br></h2>', '<h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; line-height: 24px; font-size: 24px; padding: 0px; font-family: DauphinPlain;\">Why do we use it?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; line-height: 24px; font-size: 24px; padding: 0px; font-family: DauphinPlain;\">Why do we use it?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>', NULL, '/storage/photos/1/Blog/blog2.jpg', 'Enjoy', 2, NULL, 1, 'active', '2020-08-14 01:58:52', '2020-08-14 07:08:14'),
(3, 'The standard Lorem Ipsum passage, used since the 1500s', 'the-standard-lorem-ipsum-passage-used-since-the-1500s', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit,</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>', NULL, '/storage/photos/1/Blog/blog3.jpg', '', 3, NULL, NULL, 'active', '2020-08-14 02:59:33', '2020-08-14 04:29:44'),
(5, 'The standard Lorem Ipsum passage,', 'the-standard-lorem-ipsum-passage', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">The standard Lorem Ipsum passage, used since the 1500s</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,</span><br></p>', '/storage/photos/1/Blog/blog2.jpg', ',Enjoy,2020,Visit nepal 2020', 1, NULL, 1, 'active', '2020-08-15 06:58:45', '2020-08-15 06:58:45'),
(6, 'Lorem Ipsum is simply', 'lorem-ipsum-is-simply', '<p><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry.</span><br></p>', '<h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><hr><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p>', NULL, '/storage/photos/1/Blog/blog3.jpg', 'Enjoy,2020', 2, NULL, 1, 'active', '2020-08-17 20:54:19', '2020-08-17 20:54:19');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Travel', 'contrary', 'active', '2020-08-14 01:51:03', '2020-08-14 01:51:39'),
(2, 'Electronics', 'richard', 'active', '2020-08-14 01:51:22', '2020-08-14 01:52:00'),
(3, 'Cloths', 'cloths', 'active', '2020-08-14 01:52:22', '2020-08-14 01:52:22'),
(4, 'enjoy', 'enjoy', 'active', '2020-08-14 03:16:10', '2020-08-14 03:16:10');

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` text NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `replied_comment` text DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_comments`
--

INSERT INTO `post_comments` (`id`, `user_id`, `post_id`, `comment`, `status`, `replied_comment`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 31, 5, 'Nice blog', 'active', NULL, NULL, '2023-07-01 15:11:01', '2023-07-01 15:11:01');

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Enjoy', 'enjoy', 'active', '2020-08-14 01:53:52', '2020-08-14 01:53:52'),
(2, 'Travel', '2020', 'active', '2020-08-14 01:54:09', '2023-07-01 14:49:06'),
(4, 'Fashion', 'tag', 'active', '2020-08-15 06:59:31', '2023-07-01 14:49:52');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `summary` text NOT NULL,
  `description` longtext DEFAULT NULL,
  `photo` text NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 1,
  `size` varchar(191) DEFAULT 'M',
  `condition` enum('default','new','hot') NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `child_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(1, 'Melange Casual Black', 'melange-casual-black', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">The standard Lorem Ipsum passage, used since the 1500s</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>', '/storage/photos/1/Products/405b7-pmtk004t.jpg,/storage/photos/1/Products/43f35-2_2.jpg', 5, 'S,M,XL', 'new', 'active', 600.00, 10.00, 1, 1, 4, 4, '2020-08-14 04:38:26', '2020-08-14 04:42:46'),
(2, 'White Sports Casual T-', 'white-sports-casual-t', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">The standard Lorem Ipsum passage, used since the 1500s</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>', '/storage/photos/1/Products/1d60f-2.jpg', 3, 'XL', 'hot', 'active', 400.00, 4.00, 1, 1, 4, 2, '2020-08-14 04:40:21', '2020-08-14 06:26:01'),
(3, 'Summer Round Neck T', 'summer-round-neck-t', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3>', '/storage/photos/1/Products/02090-pms003a.jpg,/storage/photos/1/Products/01f42-pwt004b.jpg,/storage/photos/1/Products/01bc5-mpd006b.jpg,/storage/photos/1/Products/0122b-wsd000t.jpg', 6, 'S,M', 'hot', 'active', 3000.00, 5.00, 0, 2, NULL, 2, '2020-08-14 05:57:48', '2020-08-14 05:57:48'),
(4, 'Melange Ethnic Kurthi', 'melange-ethnic-kurthi', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident,</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3>', '/storage/photos/1/Products/0a402-image4xxl-3-.jpg,/storage/photos/1/Products/2282b-wsd008t.jpg,/storage/photos/1/Products/21951-image4xxl.jpg', 2, 'XL', 'default', 'active', 4000.00, 50.00, 0, 2, NULL, 1, '2020-08-14 06:04:13', '2023-07-01 05:31:23'),
(5, 'Cotton High Quality Kurt', 'cotton-high-quality-kurt', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident,</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>', '/storage/photos/1/Products/0455e-c1.jpg,/storage/photos/1/Products/04ec4-pmtk001t.jpg,/storage/photos/1/Products/086c2-a1.jpg,/storage/photos/1/Products/09a16-mpd000t_6.jpg,/storage/photos/1/Products/0c2d2-wbk012c-royal-blue.jpg', 0, 'M,XL', 'new', 'active', 4000.00, 10.00, 0, 3, NULL, 3, '2020-08-14 06:10:52', '2020-08-14 09:37:36'),
(6, 'Ladies Cotton Kurti Sha', 'ladies-cotton-kurti-sha', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system,</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>', '/storage/photos/1/Products/6a8b5-wsd013t.jpg,/storage/photos/1/Products/5ded8-image1xxl-5-.jpg,/storage/photos/1/Products/74840-image4xxl-6-.jpg', 6, 'M,L', 'hot', 'active', 6000.00, 3.00, 1, 3, NULL, 4, '2020-08-14 06:13:20', '2020-08-14 06:31:42'),
(7, 'GRAY BABY ROMPERS', 'gray-baby-rompers', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system,</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their du</p>', '/storage/photos/1/Products/08ec9-n3.jpg,/storage/photos/1/Products/07e30-mtk006b.jpg,/storage/photos/1/Products/18b18-wbk003b.jpg', 0, 'L', 'hot', 'active', 1999.00, 3.00, 0, 3, NULL, 1, '2020-08-14 06:23:33', '2020-08-14 22:15:19'),
(8, 'Baby Girls\' 2-Piece Yell', 'baby-girls-2-piece-yell', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit,</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their du</p>', '/storage/photos/1/Products/calvin-klein.jpg,/storage/photos/1/Products/calvin.jpg,/storage/photos/1/Products/d3fdb-image2xxl-4-.jpg', 1, 'S', 'new', 'active', 200.00, 0.00, 0, 3, NULL, 2, '2020-08-14 06:25:42', '2020-08-14 09:37:36'),
(9, 'Lorem Ipsum is simply', 'lorem-ipsum-is-simply', '<p><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry.</span><br></p>', '<p><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">orem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</span></p><p><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">orem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</span></p><p><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">orem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</span><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\"><br></span><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\"><br></span><br></p>', '/storage/photos/1/Products/0455e-c1.jpg,/storage/photos/1/Products/04776-pms000a.jpg,/storage/photos/1/Products/04ec4-pmtk001t.jpg,/storage/photos/1/Products/032f0-image3xxl-1-.jpg', 4, 'S,M,XL', 'new', 'active', 200.00, 5.00, 0, 2, NULL, 3, '2020-08-15 06:52:44', '2020-08-15 06:53:14'),
(10, 'Lorem Ipsum is simply', 'lorem-ipsum-is-simply-2008183507-655', '<p><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry.&nbsp;</span><br></p>', '<p><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p><p><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p><p><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\"><br></span><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\"><br></span><br></p>', '/storage/photos/1/Products/01f42-pwt004b.jpg,/storage/photos/1/Products/02090-pms003a.jpg,/storage/photos/1/Products/032f0-image3xxl-1-.jpg', 3, 'L,XL', 'hot', 'active', 300.00, 10.00, 0, 1, 4, 3, '2020-08-17 20:50:07', '2020-08-17 20:50:07');
INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(11, 'testing product', 'testing-product', '<p>testing product<img src=\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAMDAwMDAwQEBAQFBQUFBQcHBgYHBwsICQgJCAsRCwwLCwwLEQ8SDw4PEg8bFRMTFRsfGhkaHyYiIiYwLTA+PlQBAwMDAwMDBAQEBAUFBQUFBwcGBgcHCwgJCAkICxELDAsLDAsRDxIPDg8SDxsVExMVGx8aGRofJiIiJjAtMD4+VP/CABEIAQABAAMBIgACEQEDEQH/xAAdAAABBQEBAQEAAAAAAAAAAAAEAwUGBwgJAgEA/9oACAEBAAAAAHMlVddZdZRddYhUKNVpBLAs+fJIoooIIpIojtBCqy6y6q66xPqq8f8AyC/nOQWLpW2UERx0EEUUWYhZRcj2QSqurWWFvTMYc0Pkserc1GiOMOgiigzrqqkEKLkLLsfPB9ZYn5sGSRacJ+Lq0uMMOKkggzkKqLkEKrrfMOQ23bHbK+r2WGiyWNRXck4FFHQRFZ1l1SCF11SKLxhc+3bDd0quygzssojkZl+6RBBhx0WVdZUghdZf5ztZugN5Gui/6s8f12G5M8V35OQxkBh2ZZVYkhZZeD87rw3NND3Vf4hSuLYgQIy39sAMVAcZlUWIXWIXWobCGytaShxcCVU4Dhmr4yYE5dNPIogyDIosuuuQR7yfjnXespu9OLfmv5auY8/wwvyN0Ks4cUVFiVVXVIKI/YsyxfF9A6At5nhFFUoTDomzl+tO6/FGEQYVVSVClyU8TZbmsksW19ZGs9fRmc4/qSGOpky6SoAjDsKq6qxRC4uI8yz7altlSxycxziMMZtg7oqv0rkIgoseXWXXIJUbsE0nMOrbtX9otZsr+AZLxvGfbgLvO5RRBo+qqSuSupGcF1k29arDrd8h0vsRVky5kMNqdwtU6qFGGjyyhJKqxNN4ej0K3HspgZbhc/LdGc45IKaFwLx3CiIPHVlSl11xMcUayQfV2xH5hcG+w3ppzplEiPeR5l0QUFGjhKxBC68AwIxWDvWpIbf8Cst1nnlrxvT4ggoinROVICRsglclfxk/Lc26mOrJQpU7In7q1U3z1lZrGGg27suYQSNEkEkqwzBkG63z6s6456S/o9Zh7NUmQqEsk2NpiN2ptXhCxpcoklTM+S4p1/ljhi/RXM2ydNyY6LUXRT56bWr7+t3eAIkXILIJ84QqKN9C9KTTlboX9j/T9hWG2VDQjUzfGvydLOiCYUYIJJJb8DVyxaV3ZMjsgyzBmvLRlaFY0TXLGF+TIk3Qc4OKkkFECYIrxgvXfZlqRSMc6dd2QY2wXO1WitXwVeV9GvgkTIXKJVyJQMXc+gdi2tIa2oGT2T+bIlkqBCNvwcOx+jIQUTKWWAKpLOVepS3oRYdpA1vGpys0VVjVsjwb+1/dfaKCDihHxiteWsFJ40giWhdhXc8RKoprJBsKUgGwi2E8zDWr43iRhaFXVYJ7ZEgcs0NHN1aLnPnP0+R+89K6bmomfvcud7Blbqyq1ZpmcHIgMYOX8/3HtawmihLga4LmyLIyJzs5+l7yirC4t7pPVU+cfyCDJWOf59tBwi9LWQ4slXsEtGWmTw7GiiC0R6obV9iuiXvwDGqp9anKi2ZLydgoy2GMUo9ub26jtyNB+aN1LZrv4/IRoqDMemlYLnWxJt4a2h3Y5SMo6PhiaX//xAAbAQACAwEBAQAAAAAAAAAAAAADBQIEBgEAB//aAAgBAhAAAADbirgAANWNeqMI4R+rhBXACkOFZabooR+pBAAFHPLZ+6a3CEfpgQBrJc5yS9rO1McPowgCWrM9L1W019OI9+IQlYF6QLha852QtyGIFUcvAduk8lyyPYjEJVPIV5mXv7AmUNUEYUpc5RtVwOrHmMtEKCqvQIkLWY+sFNceiggPQFPPdZHP0150MSC2pnXWk8zPIrFjFajcJblSj7jQ5bR72cTVmt5bfVzIy5UuX2GE96B7NxcLxZwjX3uEEQUWDFZyM+89D//EABoBAAMBAQEBAAAAAAAAAAAAAAMEBQIGAQD/2gAIAQMQAAAAQ0YuykbIXeSl1rg9EKQtI/rNBFMpd8JshS0L7fp8ih5KXiNEKbpKoQ2AjnTSk47RdUrtNb1tiT9H9LyRN6r03nPVa8H2cuXmN63ZdveDQqKDWll53Xu7pelIspclrfc6WHrW+nF1jK8ykgtnnvY/v1pvbteaQny4pSU373qVSW81lcrreTpaOtdSo39RZUdQWwlLV+pdJHpyaTI3kAYlLB6JxtZYs2wpRm6amTVO5SwZudLracEEeWuN7xURGUZdwBxYwE3/xAAhEAABBQEBAAMBAQEAAAAAAAABAAIDBAUGEQcQEhMUFf/aAAgBAQABAgH8/kNDQPAPyG/kN8DfzYtP1dDrW95U+QaXS/n8lv5LS0tLS0tLSAA0N8DfA3wN8a0NI6Hpbet/05bDJmWYxndBk9b+S0tLSC0tLS0t8A/PgaB4AGhob50/RSSyBwYn0v5QMhmkg5zq/C0tIIII8IDQ38+AeeNAHnmje07tWhYrTNiloST0YY258StRcZ0JaQQW+EEEeAAAeAAAeeOXY79MZ9eDk7PCW/j2bJoy2a9R9qB0cw5rWLSCPCCCAPPAAPAAAPO22Y5MLOy8GOuyvLW1ee0cWSJ5rPerMfH6rmkEeEEEBoAAQAHgAEjur1MrP5fNagmfT2a2VfoTxRS3JJjIuX0nAggggjzzwAAADwDobN1cTTrMampqH1IzoM2/HIWSufKvjnTIIIIIIAQAAQAQXnbT3H/HzYmxgNZ9Bsklu70BaoJnvD8i41xRBBB+vAgAggAvO2nnHx5bg6Ctp/thtXdbrqPNx1+uxJHzr+jA93HXyiCCCPoIIAIAJy7MzHh6k1D/AI2fp1joJx1O7s9jm6L4b7Wolw+M7/hRR+h9BAfQ+nrsVaXMSZeTNDnUedltM2snUyqvJw890Ve2xpIauYt+uBDkUEAEEAAArB6Z1tvEpuBXpaU2A15Y01I2Pj+SKdx0ya38wPx7CcCiPoIIIIfVx+2bbOLMEP8AHRjq17Apz+hSv+Q1ILLYl+HDirRTkUUPoIIIIJi0X7j5m0LeNoMfsmp0se7n2fS+abunNdKyBQrzgbITgUUPoIIILxdDoeyl5+Pt2vNsMwcZtSKGRPdO/tW2lOxgg+uRlKKKP0EEEEE1Wn9xfgM685zk6NkyR9VY7ir31TX8e3t360MxcJFaXPzQOKKKCCCCCCC1r2jZidz/AC2PyPcdVxu1djo4NXG/0V08vf3WhsKwZRILDM+Tn5UUfofQQQUzuw05nc3g5OVI39fImziaAza/PwZBimW3s6elpK7G4flyYeMtFFFBBBBBBb17XtBc3jSy6PPa3x30+BxfVUrsU7rJta2zvywsuG0+ZznOUq4m2nIofTUPoLtNJzieOvMm030PlSe72vLct0dTpI9L8WoteBsF9PM5Be+Yc1O5ORQQQQQT3bk9klfGWrcRXyDxHG3PkHMwXZ6gfCLMOnC+Cdv9LaCnMxzJInuRIQQQQVxWTMvPjeeaWhPcqmjpt5xZkEEESmVxlpjHFthwVgk5hzi4uQIILSDbbOpgVwE9ZVJo36dR0kWZnRxsCmdbGxIi2RPdYBflGBjiS0ggghy6PNsRqtNz/QtlpzOFmLscfNaxrmvbbbv2SyeT3yRofzQciSQQQf1/tbV3+b0KUrfcTYr2MizE63WLakLWfiWLorl6WKSGT9xuJpUOM5VziXEH18saq0f5Wq2jgauEG+cHu1Jq8nt+o6wyxErK29GxLYfM9iq1hj5NnO3Huc5x9B0Zs+vG1yIssvZu1w1zOdFlaebK1SmaOeGrPfl1HSssj+dYs2Y+ji3GWat5uo2f9e5k1Mxn9OT2uFpm/mzQ8fNmQh1t9aQOki1nXcnJzbmFm8zmcnFxUPGx81/wGZMmXZwffeefQLC1/pThMNGtp5/x7nRs9vuY+NxL4v8ALi54rWBnwxTtlY4Pef7F/vuC/OfE9OQc8lWINOrx6id7ouisQyft7nuDmi8AwJhjLU9jo/x+v1mrNdCffU8iwHaTeWbF9bT81mfP9Pb+AzOaWkNdE+M/orz/xABHEAABAwIDBQMHCQUIAQUAAAABAAIDBBESITEFEyJBUWFxgRAjMlKRocEGFBUwQnKx0eFAQ2KS8CAkJTNTgrLxcxZUZKLC/9oACAEBAAM/AfreSgpWkyOA6C+qia+zpA3hvg/Xt5KjpRbcyyP/APMQFWsfw0rSOjnqjeBv6Sdva2z/AMlsOvIEdWxrj9l/Aff+1RbJgcyPimPb6Nwq3ak5dLK97R6LRk32BTUzR5wk8mn7KfI4ucSSU5pTb+caT3HRbzON18tHara2zHgRyuAGsT+Jh8OXgqKuwx1I3Ep53uw+PLx/Zs1DsGk5PnfcRx/Eqq2hO6Wd5Je4uJNyLlYfRt32sgHdSho+NuvPJMfhsDE46Ys2u7jyToX4XNLD0KcTeI2Ka4YZG6ZZ5+woWa4G2Wtk+le2ir7lhybJe9kCARmD+yU2y6OSqqHWZGPH/sqs23tB9VI1135NYM8LRoAp3NziLR23BKkDw1zSCHHLVPadFgPLxCa7C1rQQb3id6BHedEyohBjYXR3NrnzkXZ2hTwVAje1p566g9ChPHi0cfx7e1Oazjy4rO7FG77IjLhr07e5PEn0ZWOJP7pxPu/YwL30AzR2ttD5tBnBA4/7ncynM+zH90dfap6qTBuZo75XZJf23KnLG7xwebZG2n9dFv3hoyyPJVsNyM7BVWzpONguOYC+dtaS5rJWNOrbXz+0eYTascAwPY8nXPuT2l+LhIHE38CE17GzNbxkcY63Td2QQTIzl2fqnMLJYnWcw3adLdE3bWy2S/vGcMg7fqh9Q+goRTwOtPUHX1WjUqOL0Bf33VRtWRozdpqRkO4KmooWDdhM6WUY5KJ4sQFT1jc2BS7LnuOBuLhdZEsbNbC9jrOzvmc9fe0pjHskZ6PPst2LDw3a5rvitzPxdoWGdwPM5L6K2uGvdaGo4HjkDyP7CGt96+f7Qklvw+hGP4Qt65sk9zi9Fg1co6GmbwAOOZQAF/JkgSg4KKricHNvkpNmPc0guY0Zjqy+ngcwtxUOYDdr+Jh7x8VhceLMZ37CtCOnvsmSNw9CMuwo4721X0rsWCRzryxjdy/eb+Y/YDTbLqHA2LhhH+7JB9bx6MzKftCsMzvQjGQ6IMsEHAZIrLy4gmzwk2zCcyKSO9nU7uE88J0Vm4/b4rHBbm3Tv6otw4rWIt+S9MdRcfFbusnonnKduJv3m/sFoIIb5ude3cP1RfUP/iKHzN2X2/guiPkyQV1BE0l72tHatm1LCG1EZ8VHT7RsCHRyYmkg3yKvFNGTxNKLHFpT33bfO+R7keB3Q5+KOy9qwT8opRftB19yxtBBuCMj2fXZJ/0hG1v+gSO8lHfW6KFkFSZXhjGTak9i2CBY18AP3ls+pA3FTDJ914Pkuo6OJ0js7DRbfqZ3U2zKe2nHa+vNbRrPP7c2hNJfPdMOQ8VsKmj3bYha3Mk/itkxM+cUTcEjXXsDkV56N/KZmFyMcp9v5qx1y5IEvb0vZcTXjPLNN2hsGnN+KEbt3+366zb9E76Ufc+hCAM+divPnwWzasVb6smzCOG9vSXyGNt4xjCOZfZbBZI2WlqZIgNOLJMwtjc8nCBmsbLqLd+caHdiZSQmTC1oaMhZRUgduoZp2YbiQcEZsbHNwPXULatdeWlpJmNYzEeIS5Hn6IVbtpkjJIyLDPI296Mcc0Z9KJzXgdgQDsQ+w7CrWHRFrwerfgrsPtCtNU0hPptDwO1v11mFO+k57a3DV509ql+czRMaXbyI8I1y6LaW0duNp3vMDsQuXC+FbY2dV1ULq6oO6e9g3kxADRkCciCSFKNlxv8ARqd1vnW0zP8A9T2IzUDHu1shJIL6AqHaVGIjuy3EC5rxe9uSodoUkMUo3c0H+W+FuHD4HkmYHxMxYJbbyVx43WzFlBQwGOJtmr5pte3oiQYT46LiLCbh8THZnssUQLc7rK/9dVYADS+fijs/btPL9nGL/ddkVkD9bhhJ/rNY9p1fZO4DwVpPaF/j0I7HKT6R+eQyuikItlzCc4sfMyN72/vHMBd4K1O5mg5rd7OZ3LNY2rNAIFqDJIpB4ovfE9/qMJ6DFwu9hRbOb88/FAtI009iGHsv+qENSx5PQ+C+d7Mp5L8RjbfvCv8AV52W7hkda+BuK3dmt1tSdkjg45e9Ei/b8Fh+UdJf7RcPcmOY1ABGWeKH1nJ7IQ0aBOZogSWnUIFAI2KD6SM2v5y3tRe5zD6xz7JG3+CLgx1uQPtyPvWJjb3Omnchur93hdWwPt9pb3ZjIz9gkfWc+q80xl/8yS57mZoT7XnczMXcPYSruMZ1XzDaUFR/pTAnuvmm1EDHNN7tQfdS09ZTTMGTA4lQVtM40xDy3IjoVUyT4ZaKrYHfaMfD7iU+rqzgbk3UogqyssVE2/8AqtHvR3r2elwZHszWMOA9Yj+b9QiGtN7Ee7OyD2lp/wBM28AvN25ZIjzd8n8uYyWv1V1ZpQpKCeoOu73cR/idzCxyM7G5heeHc5Zlb+hjheeOHgPdyQtfqjUswsJB6jVOYHmRznOvfEdT3qGWLA5uiihGFjQB2eTJE3si+h7jdCHaLLXDG3B+6NfxQD5G+tn46/iuMluTXWv2Zgoh7P8AyjPsOXxWHvxEdEYKoW5ObfuvYr3/AFeCMi9i5byeKjabNhBfJ2OPLwV5nOOgW7xO/gTnkBouTkAtu7DgG1apohheOOJ3pYfW8F5vVDBjOQGqoKV+EyRt+8bX7lseliuaiHF0x4vcFsqd+F5wduYHvVHtAubBKHltr2N9ViCF1u6ItHNFtVJ90m9+q4qd1/3THHnlzWDxNh8UW7wNFrSG3jmi17j6xxD+vFOZVNtle/Zmt7TMPPCFf6nNNpopZ3EWYOHw/VPqKh75DiLnXcepPJEB2ef9D4qv+VdZuIeCBuDfTkZNH5novk18lGB8NMHzAZzycT/08FSmgqKdkgLnsLQ0dqkqaSJk4cMg0PIyJC+cbOexsj4z1Za59q2FVua6anaTc3L/ADht3lbFoiXMgiYLDQBvvVFjIhZc6ZfmV5kNwgK2iDbpkkkcV9Xq09sruui2OhNhnFa/XmhYEkDR1u/X3pvnBc8iM+eiLo4tL4AOnK3wW5q730IPvut5s9nYVr3/AFOCMu6LgETXWa3IgHWwyy96zz5XPiq75SVrKWm4Ra8stsmNvmVSbHoY6GiYA1gzd1PU9SqKm/zsLi7m5bGe/EIKcv64W3Wy6HZbGO3YqHSsMIHpCxzKj2hQxP8AXbn3qIguwj2J8zsTnYR0AUMHag3RBjVDQwPc5yk2ntIvJs0aIOqL6ENLiOeQR+bUhP7vn4YQmuazL7Fj+Cx4S77RDXe9XgI6PJHjxLDUMNhmLLe0zmXvwDww5LM/Uiio753Olk6epdnk05nqt/Uxx3tdwBJ7VR7KoW01G3BG30nfbkdzLihD5tjc7ZAJ+3bNrppI4g7EI4ja/e5QTwn6L2jVUM7Rl5wvYe/mvlFsar/xZkrzoKgkvY/ueV9FVDaaqd/d3nJ3qH8kwhtyC12YKYAmBpN0zDiLlkWxZqWbEXuuV5/lqPeUN7mM/PZ9gGixUgjsMzGcvuElEBqDd32vv7kN9M3llYdv9BEZa4XXRZVsZ62R/wB3/S1+pcKrdsdwwx595ROIlZ37V882XTyn95DG/wAXDP3ot2tPGdHMa5v4Kohp3SQsxuaL4Ovd2rZ0m0pmz72CNz7NLxllln0VFtah3YEdVFOzT0mEFf8ApvaDd0S6mnuY/wCH+FV9LTsgdaWEaNdqO4qWRlhEf5lNUjTD4p7xxOJCte3JF7XEtt0VqmO4+238UWyAXP8Aluz7wsZBub4o/wDgrNab3N8PhZB8TQR9ofBWnve2JuvxXnAb8JAKEdVCeTXMdYdcWH3YvqcLLp9RXT4jkXuzv6uvvXC1vM696zshJstkJOcMjo//ANj8UI6ymqBzu0+KEka2jsuuq9qQsD6SaUvOHWPFrcdEHbKpWONrMaAmbQ2DM4elAN60/d19y4GrIW5p4nDSw2Lb4+V+iJCOdlwOThUBB9WG6gel7FwY/wD5VwOVuibvBFcHPD7OaxYBz/VC5dza234LE2N3Z16IMwaABj/+K3kEbvWYD7R9R5h1vVd+CMjnvGeUh8HZm6vIO5cae3aNVAP3kAeO+M/qvnezsTdRZw8FvIWdyjqYXNe0ODhZwOhCd8nKx9LFTTPgLsUGFpdYHll0VRUbGq2uppM4H2uLclic5najhF1YoBq4ShmSblYKgl3X/tEMmPPG4/igGUsfVxe7+vFB07H9RmjvHD+EqzS4nm34IbkEnQae1Oe6EX0efxROzaMn/wBtH/x+o3kDmjm0j2oxSvjOhb+IzWBxPquIVnXTIflHS4zbesfH8U2CSeAnK92+KdBNgOl8kHBF7Q9g4mm4UVVTub1yIUmw/lLNRvGQccHa3VpXCFwqyvl5DG19hmctF/dLNPpED+X87otqBbKzLd181Z7SOTETNL4K8Tsv3lrq+8a7oPwV5W2zLWE29bmtzTxR+pG1vsH1Fx3J0VRO/CeGTF3tOqwPewkZ+ieqzse5SwPxxOLZInB7D2jNQ/KCibUDhmi4Z2dD1HYVkBzaUHxArG1Np5ibcLzr0KfPLR7SjALqd2GS3Nh/JWa3uWSsvag1hcdETKWxntQxU9PfDezn88ljqJMGjdFjffkdFeR/a742TjZvV90XvlN/SWPbdIMOIb3Db+uit/bxOwwsMh68lVVDTjlc3sZw+9PxOlxOdcZ5k/in0rtxOCBqx3RFrjfXmixzX+BU+wdpsqY82ejLH67DqPyUVXDHLA8PjkZjjd1afyWJpb0WVk2ZhBWT4JdbfzBNY9zPVKyV1xWCZSQhh9J/4LeVRJ9bEUd3PVHUaI7sud1ugWtHaudsuJ3tRxFxv6J96qqt+GFjnmxcbJ9AYtoVFxLhJYz1b/2mRML3mzWjMqXabxqyI6N696ZHhy0CsE2eIhw5Km2nA6DDxAWB5joVX7MkkZNGTu8uwhAgsPPMdboloB1CfDL9FzO4SS+nPR3Nvit3U4ho7NYgrreNxNycNCnirblZxOBw7swjkHDxQcFumFw4stE6atmc997Gw6eHYjgA5uue/kEW04ibzsrMaB2Il6klGI3tb2qeV7mlmHvW0thTEMjE8DjxxOGvceSoNqMG6dgk5xPycPz/ALRqKuKjacvTk+ATWtbkrKwWqMMomaPvKn2jGC5oOVut0xjjJT+LU+nydwvbqpqd7JocnRuDgRyITdobOpa1uWL0x0PMLG211kuE3TXbeitobk+AK4ckWcJQlhfE1xBc3jIysOw9UJpamZuEMdKWx/d6+Ke+qDAM8gE5oOR5+5OfdNjddwUQbxDQZJl8+aoXAdbKjnzAIPWy2jG2zZN6zo8XPtQOU0bmH+YKOQXY4OHZ5RVbTqZr3vIQO4ZBZDNZBA6eS+SmY5m7w4b8YPTsQe05IOcSAjHiaiaaoowP3rS0fe/6T4wLrIJ+7NnKY7dmxZtbE2x8VjatSpd0YI8zIOIdnTxR+mIaNo4Io2XtpnqTbuXz7atRLIMLAZD1Fm5KWWhjlAPEW3BHU/qmNg86LuzB9qpZp6h7xdgfgA7v1WyjrA0rY7XZ0zPYtkssG00Y/wBqoMOUYHgoIcrBQuzsFGTiYSx/VuXlzv1Ku1oJXahoreXJNe0krMlRCoqZn9Q0eCaNPIQzhTRtSpP3Qjhy8ECm3cbZkos2lU1GG+8DRfo0XBt7E2niYWtHEwgu56phhaywyGSZTQSSkZRsP/SNLRxtd6VsT/vOzPvRsFiRVyQgPIHeXBK5vRxCOEXTUbZeCuR1XLyB4QIKxNcFuzK3o9HD5MLLnonjaMk+Lgx4XD4oFosg3yXKN7WyQ5LfT01IPtv3jx/Cz9fJb+xiWFOPl3e0apvSd9v5kXxtJWSvZG+iA8lqvd+swn2LeF38KYGOJOSu0vt6TiQrM8n91kPYU2RpxNBDvijHM+kkvdoxsd6zT+XNFzfSz6q5Q5JzDxkDNBud8kaiSWsdlvjhiv8A6bNPbquauVbLygBAoL//xAAnEAEAAgICAgMBAQACAwEAAAABABEhMUFRYXEQgZGhscHRIOHw8f/aAAgBAQABPxAgMCeCWwfUd5gLJlgKmLUJuhlQ6Y365QK6Je8KdEQCzyo2jDNcDdIPTQ5lxdLs0e6IN2LRT+7uGSFRnHoxuNzGc7j3H43/AMDOXULU8uvkafgHmGOpQQnNDzfgMdTJm4jOo1tYORRFMOR/gXEJMWEs4uGlaIxRW924vETqFtsAt3jMWa/QgNoTrX0r/W99MulhkeJbNYpZxAW+sbekJS+HPylVzLLuLiWko+L+0PCLi4eEDomKXQy+UKVQaAvzLrRdkbOHouUBuiAdF7qGUIyXYi9Hm5QKS3eYy0Qhwc/CVOYQlfXSqXkjQauf+C+JvlLrh/6lgVsVnbWYr0wQ6qohqjA1ZWJjtpdje3kYtIAInI/JY9RR1LSWkc6YJx8Fm4ZQ+OSODevgCMCHniZHm1yVoAeRCJyJaPYL+9sNXaqKRdYhMQG6geWGroNopFUVF00sDyuatbYlshxQAazfYDfklQFqgaPWTV3uH3bWnlDrfbUK25ANUM1Xl55gYZURYrgHtM0xq81i/wAS9TfiJHH4LalzDOIQCbIThnbM9QgvUZvk4vE1w452uDRK8ctZG/awFQZdFQ8zFhIyGcs3T2NXeciO1WZA39VUHeBFsmaylKFI7RH8IKKergN3O2LV8RWEQLYrhX/1Jndy+tiO89Lw7mTgUOYLaf18XEAwNqbZRvpqV8RoWBm0t3q6xPiTqXxlYIfE8O0G4mT4yFPht4gAV0ZY/JrhYYH1+C1eaOOoLbqrWLPMFRo2FLverlYADGI/aE9ajNIeIkFO9bYxRsOgDinu9Nw2GhcBonQPQwynC1AAacFcDwmpdaCG3mnNdcnTdSx4UZquwaMeLGiMzM5R52J1Wot+41VP8Fq+pRbN9QBiV+FiYNQKxBgVD80RZCUqWZQrL0RLI0LGL8J1cwYkOAjEBDlHFy1MLQL7ZhjcY+rUO1iLPUELZR7dCgp7PtIusQGyWyJewQyC6R0V15xmCt+kO9umRwVK6BrC5opJgPJZrV6ZTZ5Cpq3zQ/CUD4BzMsIKZhg/DU6mCZYWKgBegmR6tZixc9CpGmzUW81l/WErzLVniPgUVCCjGTwxhr+yjAohhe4CytVNpMexrhisQawiTkaCOLwHPdZ1zm79YmeiqCc4Ig/CN0HDa5bI9S4JY2+nr/tFpEp8G39Pmz+IvgaA4hdwL0w5lhBmD3AJUqPIPhWz9hcvI57tjHAFB+hL7pomHeq3FNw1pLFZgZQk4LVVEFFcGmHS+AB/6WNpJ4Nmc2f3buJsm2nFRkAlFhrCvqoYSkTLNnB7uXctMjThH7UA0AQ0rTDc3/HgggQyYD4B6hmruG5nXv8A5l4hAZFpp/YDLnl7lKPXkGLgwtElSjFWv+gYkaaqUh8TJRZpto0SsmSmdWlnBE7LQNPDSV+VVuMlbTGLM3P4S4tam14/yXJpvOsU8PpnsAPK1Bf8lpHFXvnIQw7KoCrmd3Ot9P5A/ErEqbIBRCrguCUQ/EIhQXRU1eNQpCu7KEKm6tn1ceQpxVXP+Q/vsf8AnMdgNa0fL3Lr0VktrllIWxISgVaEXcRuDWgVxH3M8hDyVWEHS2nV1itQbmNQuB6EY6d8rRVzxu5SYzovjWToxLpEoJ00n/Uzl7ucUf6RTBlUuhzX9hJ9fUQx3Oteoa3DDUSEgEHUCBAgtgUQ00HC083xLWoqteqECLMNgu/0jKN9Us1SigsBbCEYb0aiKCl1Vc0joQE5jFUhl3EprVNWMIwtcs49QbUDTkcjIdu/EIhZGKGrCgyBKcJBWu1dEkKVRbbt8yrsFhti2bWauVSXoYTnQ+SwC+dS7zBDfOz/AJhXtq65S0t+Q3nRS+Bv9xCItvV6DohbsQpmggqaTJBLX8Gj4q1MTNtY5tAEVDToVOFL9PMuzGPupufcn/IFX61AdbYlQvx8LXeVYqVHSloAv3AsYtMyrzmHXV2Si1D7ILVfhHihLmS2kRpKc5QgoCJVx8SYbIYdmtu1/wCiAksVUsrIFP1ljilQ5bk/tRVrAP6m/wAjQ+pyQXPFA7gASj9agT4ZQQpgODb96vufqVJQtTt3jFmfpWH+1DBQEf2xkAcEEFKgrwZa5qDvQcRyx1cNLU12Svu5Q8wUAyDAjlA3GUWwNlBf9i0wzK4H/gioFkJW+SFQCtvhQ3ht5qXMQKJjw1CwJQ3+57SaRDL0/HaBC6gxkgJ1mgwLe1v5xKC0oZQzD9llTO8gOw3HqLfBFmcYjmKFM5NP0QCABEb3OFWVZLwXEJxdssm4ZyBpIWVRV/73CXJAoWvA+fE5NiC41vBA32B5ukzQpuAmwrnFhHAGUmnlb6gmlklJhAy+oKiV7jd2fyVQMARfF5ccR9d+5kAm92XFZ2vJ8ik8oTBtYhhr4GAe8xqy4Iud2E1TIaqzYG62w+axD6WXJ2rMqORdoM40WvC434aeh6lpMQmzw3KqkTfmExfgARk4Uq1tcQ2XST+m48qYqZFH2aisFJQVWYYYMEM4oqjWSE1pagaC8K7oV/MZHIKF+2N1mXabtcU4Y/ZsPUl4fiCQQDUEFwQUtytWShMp2/UCtxlUBxh0aPcF01JZxh34QgcfJ/tQiwqgGVXgIeopgFOF0wAKnIOQpi8oqB7vKMzE4IXrdHTOBVHrGDd5VqBsjYtqGk90VEMsKk0GBledMUakQKKMGn2VFoVSmTOFw/sBE9NapT/IBFgCeLq9u6wOx9uw81qhmebVj5IqCc5+Oso18AfIXc0eRiTF/I0nJfKP5Es9pMghaLulK2m37FmEyvhmA74ouBeo3+Fx60j1SkFuGv8AfoFqreWIM1swA4wdwSPuuRqr2ISlFlirwLJYHoUhTNeyVABctGV7iX4QBKXMD4Vo3RYXCklnUNlhV/dxl1aAcbaj+QmMGYKU9tKoxd3eBphFxdADCsI3TmUrMVCvCQFZeo6dRoT1/wC3xp+QqyKofDJ1K4qdvhigijUFBXwCCW5WXO51wBCXKztxQcsqFuc9rlWyqQk6W3ouBvGhb9TGGqIhuHQEuyIT9VMNmUtaXAhOME1wrtZ1qJC8QYg00crLsgxXixjbZQh0BrH3ClIYdKXZ5xLguZPsQerIvEC0xY1lEPCJDxT/AJS3kzLOve6qXE1ajytWO83T9vxZc31HzUdzSCKINxQ2eCj2kJbKm+7O/pZZMnRgXVsORhb/ANCrMknUoGUKw0a5q8E465XNcVovYxpbXGdtP+I0xalGK4TuDqsOEjBZZxTKKaCHQu2Bt+S+JeLQniKWyUc8Uk143RySB/EyKGHdYfy2RrDNCi1ZngqimC1Lycl8hZkDowzlBcoJhXhtMm2ri91ZFDIsx7UT2zLEFtkpDZ18g1EUTF8injx/v8l5sHrXG4hlbyuKktY9F/0jU2qPFZH8uc66ykmxfxAFA20A4MwzDLIOYuyoTHC9tm1HTEBrT1EGFRkbh91OM/JlPowXiLcbIVhtRldDDesWMZZkwb80Nle3mjCvKQ26gSrl2v1aTQgyWN22JRZuTQacf1POSL8/9M0hRJsZAvhGPwpGy7GBEczKiC1O49Jl8mCvpksouWi8VF3KZsNkzkp+lt9ZELRi69LP8j79kOj7lvd+15IeEekBUJ6/YRv9WJf4EGYKbRVlVqVzUG1G0GoPU46lVUCsw7Es7lzjdccPH7KCoEtikzadVdHqOI8g5lkU3jErzAkhV7A6ui7lqACpq6za7+ipbhQCPbSAfWGZFm2vuMNyDi8iqu8zK9/bZPkK44oxwREa1KSqBbFZosoEsPDUtctR3fd5qLFjMVuj0rhKBs/AXcvl2piYqgCgpEdjAlaQfeaFy/kDhqoiW+25YLgP7MLNtD5qUiywooLGZpR4jgjJWINrRopRVt7HUUIZp8U6K+qlIslLaApOd1DoAXsOswhVazHLioIxoPTacDEYeFWYScmZ9SZQFV9omyLMzNcTFv8A8IMxLCrwqZHBjN8FM/kwFZktNH/MwLDwzDBsl5dIqILxq4ShFXWHhbJU3qeoBq+yXQBC406RiLhh97/BGVrYfASdxgiCj4GPq2FkavZ+RqgKUVyP8sEm1IOhWv7qpeyV4ISN0Kvsu5ScOQ6TUB5laeEca4ew9DGu8wQUop8ARK+U64iyiWRRu9IJVGsdnS+Cbb1S0F4jQTrlBBjbsUsSrykdyxj9olCKTU9k5BG4LX1FQg2H1vpl7FCKV7feJbvImCNEW3U3u4pgKM0BSx0rQ+YtG7r0Cq9YoSYSpkt2ti14IrIGw4UF0fyCvlKn7s9So+a98lde4BEipt7dxH0gop1m66pbFSjOD48zFv4OWBBVKDMejBTF/fMbCc5Gn0zCrKWaRG7i3klra3CF3alwjyMNzivB4zL92crDP05XcDaEP/0dEljuUieSXhTUYiZiIVlUpEE4xh4dQC+Km3qXZjTnqYa0foNOXUoMAoTFUYPtYxxWW5ZSq/2WEvIHdXV9rKhvFmZNlk3nhdZi9GoLrNqjFJoF4JaUtIpiWdpLn46blEKwhrCjoJnFl5B3T/IWCvBRUwKAA6h/EUJX6RzUfydSjuqg8GyQuxs8RAGgdLSIzaa+oizu3s9ZyeZUo4/C4IpKFuOlibLYkd6KeWLPWMStUX8BSQVoeXtgbC7VqXdPtGCbNXK2ak8XiNcgr5w0rfrEB3QY5usXUvko1gmMpLHgXjuqiHNERx9TAn4VjmsVv5Fp6MLzK4HkmyUy0YLr4KBxDyZkHlEIcUxlsswKLZfpCygZFP8A9lu5swAJqPnQOU4cYYnUoAbv37ibLHsusZRXgB1r+hlL0RoGm4DQ4hs8HsAm3TURNpD1wF3ffQi/W4dNDtGTinACNgKnritstzZSyqMMRuEXS1nOZmsq7P8AZXqcBCYSobTMGgaiOVLLAuHKEH+YGf2HCdtBH7M/yeZmIYJYSNqlI4c5+ErI0r7loZMbgXMKaYBbGCFFkHhn5NlMLP8AJdV2oy2+6JdFiS7xfVEU1DPtRcoYmKRfNTCYJRWVXKAQYB4SGDFGjfC/F8eriCNvgHvVWFL1ZH4dIoQAeIfe2ssMjjZB1yGeJilj1iKoXFVKC36sRCyHxBqkNWYaoBwJQhZKIep4ioKZVVVRubZuVDSYEsWl0yoSooRECL1d1uNEW2mpaLM501NOL2c+YYQ9OpuXAXRssoa4lEqp2YoQMhb+RcpcLqBdcRzQjy5QDH5KySwEbIPsGodGmQiC9o8se5FtjS0tfcCteAuw0LlOIn2Lr4raZcgxxCypKiURA5mDWwKjuXUbFcTCUY57hz3K41cY8VrPTU7CS4iqal2UFq7ZLiLRiNJ1zLEVGJRdNRtOSABdL1DpO4EbFkebIXuqlklZMtKWsvAaNXkcMvBdn7AgGHW4YtNcsdUdd6YhlZWvtuGcCuq1LaWUCt4llO0TCm62JTDcXVR1NUQ67JV8xzrMShgvEqxyY5sRjCvbwosFYKggaGoWU0RRgN1cQc9tR85YRtcL9wf9lJ4VL5q4DQoqwiUZl0sNGblgY4cxi5qiGG6xzfKXQ77bVb3drEKIPAIi4meeCd1bKB4C624IXelc3o8wC0UgyYF4vfokyNpYt+CErYxNl4qW7jmXcRExJU//xAAwEQACAQMDAQYFBAMBAAAAAAABAgADBBESITFhBRMiQVFxEDJSgbEUI0KhFWKRc//aAAgBAgEBPwBoYxjGMY0YgCO5zgQ0mIlRSvO0ZhGjQj4sYxjGNGMYytWVRyIjg+cqu9MahGuRVQ45HIjVAxyuxHIiOGEIhEIhjGMYxjGNK9T+IGTLuuAxHJnfV9WVYifr7pPnOtYK6sQ6GPsQ4lJtJg3hHw4hMYxzDxKrBEZj5CV6rJbl/M7k+8LFiSYohAxH/YbUODyJRIqoIqYx0iQiEQiEwmMYx2l+xW3brgTtAEWYx5YgwOYMQ1FBxtK5DgrlZaFe7UKTtsfcQpnDAciAcr6iDdRCIRCYx+DmdoH9periXSF7JtJwcAxezq1VPDXzsP7hpvQuDTY55nd947EnYGL/AItKAOgu+ODmJXT9QyomhTuF6iUTrpCE4wYhGWH3/wCwiERjCYTGM7RyUQdZVOqxq/8Am0So/wBRxiKWerkDiU201cGFRKhC3NEjnVLY4wvSNsfvFOmsn+wIhEIjGEiMYTL18sB6AygNaFW4K4P3lUG1rvTf+LTW2pgjEZiUDrVtWBGbTneBy1zTyf5iKcFGHmuY5yCZVbSUb0eY2hEJhMJlRwiljGJqhmPLRbpLdN92l/3t1qucbBgJT0EqS5B8gI2kLlnxjqPxiOcDIJIlBe8uKYH1fiU8mnR9jA0qAPQI8wJQbXSRvVRCITCYZfVdTrRX3aOdCKvmZUYltlyZb236lgKlRQM/KBuZdWD2lyUf5TujeoiUbcL1lYrjCzsq2Smr1W3bH/IM4pdIAdMXzHqPzLE5oY+liJiGGE4iHvazv9Tf0JcgAU29D+YfEKidZeLSoUqVSk5w5wwJ4Met+s7O8fiam+Mwk5xNBIltV0Iw6RRkL0H5lMeAGfQfUYljs1VYRCfhUzoPtLY7kS43on2iP4gZdUO9pZHviWuBb3KZySAw+0C5MxiJuwHrF5P3/oQDwgf6zTlF6GWa4q1DCIT8LjtK1okjJc+iyjdU3rHTtv8ALNnSXdM29QMvyNxKDh0Eq0zSqEjgzTgxl2luuqt0UREJLH02+53MddEXGN5b09IJ9ZiGdrXr6+4Q4A+YwLtKiEMHBwR5y37QZfDVHswjPTuqRQ8NwfQy1dkYo2xBwZVCsm8KlgTPD3ctEC7n3MohQoPXMuBUc4RczN1RIOmU+014qqV6iU69GsPA4b4XTlrmoT5tEaMJsJb1dGx4ioGrM4OxMZdSkRgASIyxWIBHQCK76Qudsxi5PzGc8mOq6YfCcqSD8L8aLp/eIYDKraYhyQZbOcmasLC2rMzM7xTMzM5EKif/xAAwEQACAgECBAUDAwQDAAAAAAABAgADEQQhEjFBUQUQImGBE0JxMlKRM2KhsRQjc//aAAgBAwEBPwAeQi+Q3gBJ2iVdTBwCLWj8oaXUdxFMDQHPkDAfJeUEEXciUUHtGQgcpXWrnEWgowzyPWLWRs24PIzU6cruoitA0B8uvkvKLBNJTtxt8TT1gKGOwheoLgoCJXTo7ft+m3cGPpinpbBHQxRsVMsHEsuT6VnsYGgMDQDyHKDnKlNlgUdSBKKla4J0XYD8RgBiWcpk5yDNJf8AWH03+JcDTYYWzn3mrTiT3G8BgMB8gMmCCeGoG1SZ6bzQnOqbuQZYW/aY+cSrS3XZK7DqTKNOKiDmxz7CasMTxEYBG0D42PQxtxkx14HZexgMBgGYBjyE8LGb2PZDNE6rrU4hsSR/Ms8TootwaGBJ6y81WaUXIDvjaV2LUiL+/mTEbxM3+orVXn9W3KNm6gcT8ZTYtjGxlw4LjAM5mrUqyt3GPkRTBFGIPICeEbWMT2lPp11X/ostdGODWue5EvCJpgpIHEwMtQmniXpDc7DBnhwcraDyKGapc5b3i7j4mqTi05P7WBgMB8sQDy8NrIBPcy48FgYcw2R8RlW+pLk5OuRClLadTaBlJZrafpuq1+rkOwERePBxNJUErY/2GWeoOp6NEGCBCnHXYvdINjBFHnShssAAlSrVwIPtllTXXBVE0lVdNSabHC/CX4c5lOmrsS02IWCw6bRZIWhmB3LHIx85g4Q5CjABlLFEdjyCy3ay38iYiHFw7GXIa7nXs0ByPIbeXhlGENzfhY7EcTdBNOqk5ssKJz25mNrKtL6tOtrHoX5RNb/yaRdScH716gzUavW2HGTiaau123+TPELGUJSuykgt7x+dsOzRuYPY/wCp4kvDqif3KDAYJgwKSYF+jRWg+1f8mAF1sXuP9TIQ0uBkcIBH4nh2dUbRZWmagCpAxxCVUrpvEhwbJamcD/IltaAnCxHAbGZqKxaVb3jHDN7mWH1kTnx+xzPFB/Rb2MEA8q/6i/mXjKgykf8AZHpBqZR0OR8zwzXHS3FG5MMS52bVUOV4QGIPzL7sGA5aD9BPaMeXxCfUT/dC3rPuJ4k2a6hBAIZp/CtVcAxArXu0fSWJQpJDbD1CYKPNO4uUq36lmrrNVp/M09/1EUncrjMvsyZW++CYWK0Z/ccR2ACjvk/AiHjhBzmay0WWAD7YIBPC9HWlY1Nigsc8APT3j2lmlF7YKd+QlmmrtOazhuqmfSs09gbqvP3E11Sugcdpp2at9o/AOBSOYgRhb7ZmqYsoA9gJdxFiPbE0xqQZdsRk0l6kcQ/mXeDON6HDDsZbp7qNrEK+VdarpKgOQQR6+sGRFOSO4joLUz1mos4KxWRviVtiwfmMCwUnqJW2DvCdlY9N/mM6FiwG/KcRxsB/EL2DriLddnBYyux8Ybce/lpjx6Ks+0cbwjkJVWWiEhuEzXgccVM2ge8srCYHsIFA3i4IMJGZzhEOQdoth6z/2Q==\" data-filename=\"avatar-4.jpg\" style=\"width: 256px;\"><br></p>', '<p>testing product<br></p>', '/storage/photos/1/Products/0a402-image4xxl-3-.jpg,/storage/photos/1/Products/0bc05-pwt000a.jpg,/storage/photos/1/Products/0c2d2-wbk012c-royal-blue.jpg,/storage/photos/1/Products/0c88d-mtk009a.jpg,/storage/photos/1/Products/0dfc6-mtk000b.jpg', 10, 'S,M,L', 'default', 'active', 200.00, 10.00, 1, 1, 4, 1, '2023-06-28 13:33:33', '2023-06-28 13:42:07');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT 0,
  `review` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rate`, `review`, `status`, `created_at`, `updated_at`) VALUES
(1, 31, 9, 5, 'nice product', 'active', '2023-07-01 15:07:36', '2023-07-01 15:07:36');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext NOT NULL,
  `short_des` text NOT NULL,
  `logo` varchar(191) NOT NULL,
  `photo` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis unde sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis unde omnis iste natus error sit voluptatem Excepteu\r\n\r\n                            sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspi deserunt mollit anim id est laborum. sed ut perspi.', 'Praesent dapibus, neque id cursus ucibus, tortor neque egestas augue, magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.', '/storage/photos/1/logo.png', '/storage/photos/1/blog3.jpg', 'NO. 342 - London Oxford Street, 012 United Kingdom', '+060 (800) 801-582', 'eshop@gmail.com', NULL, '2020-08-14 01:49:09');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Kahtmandu', 100.00, 'active', '2020-08-14 04:22:17', '2020-08-14 04:22:17'),
(3, 'Pokhara', 400.00, 'active', '2020-08-15 06:54:04', '2020-08-15 06:54:04'),
(4, 'Dharan', 400.00, 'active', '2020-08-17 20:50:48', '2020-08-17 20:50:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` varchar(11) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `provider` varchar(191) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `is_varified` tinyint(4) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `status`, `is_varified`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Pradeep Yadav', 'admin@gmail.com', '', NULL, '$2y$10$GOGIJdzJydYJ5nAZ42iZNO3IL1fdvXoSPdUOH3Ajy5hRmi0xBmTzm', '/storage/photos/1/users/user1.jpg', 'admin', NULL, 'active', 0, 'j9dKEiRDDZmTqocspKMiRkY4x8EcRbYTZmmQt4BOtHzQJRRFIiCQBNAMfVtf', '2023-06-10 14:19:27', '2023-06-29 12:04:07'),
(30, 'Pradeep Yadav', 'pradeepyadav.genie@gmail.com', '9044438303', '2023-07-02 04:51:59', '$2y$10$/9GFSDoPVBQqwSOC2nvTROvNsuAEWZsUSse9BnIr3V2aKKeWeJOte', '/storage/photos/1/users/pradeep-yadav.jpeg', 'user', NULL, 'active', 1, '', '2023-06-28 14:19:27', '2023-07-02 05:40:39'),
(31, 'Smita Singh', 'smitasingh@gmail.com', '9044438304', NULL, '$2y$10$z2v6SwSN4PaTUyAJ.dAppeu6jVzQU8RMkXDl9A434Pe5TTzg/WM9S', NULL, 'user', NULL, 'active', 0, NULL, '2023-07-01 05:25:30', '2023-07-01 05:25:30'),
(32, 'Harsh Yadav', 'harshy3166@gmail.com', '9044438305', '2023-07-01 19:58:52', '$2y$10$AIpo7nOSYVFrvqjJ870GJev4ZD32fjv7egV2D.ctRl14lfdx6A6uG', NULL, 'user', NULL, 'active', 1, '', '2023-07-01 19:53:42', '2023-07-02 04:32:56'),
(33, 'Neeraj Yadav', 'neerajy@gmail.com', '9044438306', NULL, '$2y$10$Qo1h02OCFgn7qCXTstuDAe2ZF8JV47Ra1z2saS/yaNuxlB4rHd4qi', NULL, 'user', NULL, 'active', 0, NULL, '2023-07-02 04:35:53', '2023-07-02 04:35:53');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `product_id`, `cart_id`, `user_id`, `price`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(3, 9, NULL, 31, 190.00, 1, 190.00, '2023-07-01 15:07:13', '2023-07-01 15:07:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_added_by_foreign` (`added_by`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  ADD KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  ADD KEY `posts_added_by_foreign` (`added_by`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_slug_unique` (`slug`);

--
-- Indexes for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_user_id_foreign` (`user_id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_tags_slug_unique` (`slug`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`),
  ADD KEY `products_child_cat_id_foreign` (`child_cat_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_cart_id_foreign` (`cart_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
