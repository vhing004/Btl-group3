-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 29, 2026 at 06:28 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `studentgear`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `fullname` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `role` enum('admin','moderator','staff') COLLATE utf8mb4_general_ci DEFAULT 'staff',
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `email`, `fullname`, `role`, `is_active`, `created_at`, `last_login`) VALUES
(2, 'admin', 'admin123', 'admin@studentgear.com', 'Quản trị viên', 'admin', 1, '2026-05-04 06:13:23', '2026-05-08 05:55:25');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `position` int DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `image`, `link`, `start_date`, `end_date`, `position`, `is_active`, `created_at`) VALUES
(1, 'Siêu phẩm giá tai nghe Iphone', 'https://phukienngonbore.com/wp-content/uploads/2021/12/banner-1.png', '/products?discount=50', '2024-01-01', '2024-01-31', 2, 1, '2026-04-17 08:54:59'),
(2, 'Tai nghe Airpod ', 'https://phukienngonbore.com/wp-content/uploads/2021/12/banner-2.png', '/products?category=new', '2024-01-01', '2024-12-31', 3, 1, '2026-04-17 08:54:59'),
(3, 'Sạc nhanh Iphone', 'https://phukienngonbore.com/wp-content/uploads/2021/12/banner-3.png', '/products', '2024-02-01', '2024-03-31', 4, 1, '2026-04-17 08:54:59'),
(4, 'Hàng chất - Giá rẻ - Bảo hành nhanh', 'https://phukienngonbore.com/wp-content/uploads/2021/03/phu-kien-dien-thoai-gia-re.png', '/products?discount=50', '2024-01-01', '2024-01-31', 5, 1, '2026-04-17 08:54:59'),
(5, 'Đổi mới trong 3 tháng', 'https://phukienngonbore.com/wp-content/uploads/2022/08/doi-moi-1536x575.png', '/products?new3month', '2024-01-01', '2024-01-31', 1, 1, '2026-04-17 08:54:59');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `image`, `slug`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Laptop', 'Máy tính xách tay, laptop chính hãng', 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/g/r/group_789.png', 'laptop', 1, '2026-04-17 08:54:59', '2026-05-07 09:59:45'),
(2, 'Điện thoại và Củ Sạc', 'Điện thoại di động, smartphone', 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/s/a/samsung-galaxy-s26-ultra-1.jpg', 'dien-thoai', 1, '2026-04-17 08:54:59', '2026-05-07 09:06:52'),
(3, 'Tai nghe', 'Tai nghe, headphones, earbuds', 'https://phukienngonbore.com/wp-content/uploads/2021/12/airpod3-ho-van-1562m-300x300.png', 'tai-nghe', 1, '2026-04-17 08:54:59', '2026-05-07 09:07:55'),
(4, 'Chuột và Bàn phím', 'Chuột máy tính, bàn phím cơ', 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/g/a/gaming_8_-_2025-05-30t092833.530.png', 'chuot-ban-phim', 1, '2026-04-17 08:54:59', '2026-05-07 09:08:29'),
(5, 'Phụ kiện', 'Sạc, dây cáp, ốp lưng', 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/c/2/c270-hd-webcam-refresh.png', 'phu-kien', 1, '2026-04-17 08:54:59', '2026-05-07 09:09:15'),
(6, 'Màn hình', 'Màn hình máy tính, monitor', 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/g/r/group_635_30.png', 'man-hinh', 1, '2026-04-17 08:54:59', '2026-05-07 09:09:44'),
(7, 'Ghế làm việc', 'Bàn gaming, bàn làm việc', 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/g/h/ghe-cong-thai-hoc-hyperwork-airy-1.png', 'ban-lam-viec', 1, '2026-04-17 08:54:59', '2026-05-07 09:10:35'),
(8, 'Đèn LED', 'Đèn bàn, đèn thông minh', 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/d/e/den-led-de-ban-taotronics-tt-dl01-tt-dl02-1_3.jpg', 'den-led', 1, '2026-04-17 08:54:59', '2026-05-15 05:56:42'),
(9, 'PC Gaming ver 2', 'PC gaming tất cả các thể loại.', '../../assets/images/categories/1779085043_DEALHUNTER365.jpg', 'pc-gaming-ver-2', 0, '2026-05-16 08:13:00', '2026-05-21 09:45:21'),
(10, 'Chair', 'Ghế ngồi cao cấp ', '../../assets/images/categories/1779085020_avatar.jpg', 'chair', 0, '2026-05-17 04:08:45', '2026-05-18 06:17:00');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `order_code` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `total_price` decimal(12,2) NOT NULL,
  `shipping_fee` decimal(10,2) DEFAULT '0.00',
  `discount_amount` decimal(10,2) DEFAULT '0.00',
  `shipping_address` text COLLATE utf8mb4_general_ci NOT NULL,
  `shipping_phone` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `shipping_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` enum('pending','confirmed','shipping','delivered','cancelled','returned') COLLATE utf8mb4_general_ci DEFAULT 'pending',
  `payment_method` enum('cod','bank_transfer','online') COLLATE utf8mb4_general_ci DEFAULT 'cod',
  `payment_status` enum('unpaid','paid','refund') COLLATE utf8mb4_general_ci DEFAULT 'unpaid',
  `note` text COLLATE utf8mb4_general_ci,
  `cancel_return_reason` text COLLATE utf8mb4_general_ci,
  `tracking_number` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cancelled_reason` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `confirmed_at` timestamp NULL DEFAULT NULL,
  `shipped_at` timestamp NULL DEFAULT NULL,
  `delivered_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_code`, `total_price`, `shipping_fee`, `discount_amount`, `shipping_address`, `shipping_phone`, `shipping_name`, `status`, `payment_method`, `payment_status`, `note`, `cancel_return_reason`, `tracking_number`, `cancelled_reason`, `created_at`, `updated_at`, `confirmed_at`, `shipped_at`, `delivered_at`) VALUES
(27, 8, 'ORD-6A17E8C60BC47', 790000.00, 30000.00, 0.00, '136 Cầu Diễn, Bắc Từ Liêm, Hà Nội', '0979071245', 'Nguyễn Hữu Vinh', 'delivered', 'cod', 'paid', 'ship lucky', NULL, NULL, NULL, '2026-05-28 07:03:34', '2026-05-28 08:06:56', NULL, NULL, '2026-05-28 08:06:56'),
(28, 8, 'ORD-6A17E8E3558E3', 580000.00, 30000.00, 0.00, '136 Cầu Diễn, Bắc Từ Liêm, Hà Nội', '0979071245', 'Nguyễn Hữu Vinh', 'delivered', 'cod', 'paid', 'good lucky, ship safe', NULL, NULL, NULL, '2026-05-28 07:04:03', '2026-05-28 09:30:01', NULL, NULL, '2026-05-28 09:30:01'),
(29, 10, 'ORD-6A17E9E40384B', 226930.00, 30000.00, 0.00, 'Cổ nhuế 2, bắc từ liêm, hà nội', '0976341526', 'Ngô Hoàng Long', 'cancelled', 'cod', 'unpaid', 'ship hàng cẩn thận', NULL, NULL, NULL, '2026-05-28 07:08:20', '2026-05-28 07:28:54', NULL, NULL, NULL),
(30, 10, 'ORD-6A17E9F1EED4D', 791000.00, 30000.00, 0.00, 'Cổ nhuế 2, bắc từ liêm, hà nội', '0976341526', 'Ngô Hoàng Long', 'delivered', 'cod', 'paid', 'an toàn là trên hết ', NULL, NULL, NULL, '2026-05-28 07:08:33', '2026-05-28 09:09:16', NULL, NULL, '2026-05-28 09:09:16'),
(31, 9, 'ORD-6A17F02208E81', 342000.00, 30000.00, 0.00, '437 xuân đỉnh, bắc từ liêm', '0977893466', 'Vũ Minh Hào', 'delivered', 'cod', 'paid', 'ship nhanh giúp anh', NULL, NULL, NULL, '2026-05-28 07:34:58', '2026-05-28 09:29:55', NULL, NULL, '2026-05-28 09:29:55'),
(32, 9, 'ORD-6A17F030157E3', 461500.00, 30000.00, 0.00, '437 xuân đỉnh, bắc từ liêm', '0977893466', 'Vũ Minh Hào', 'returned', 'cod', 'paid', 'cần thì gọi anh ', NULL, NULL, NULL, '2026-05-28 07:35:12', '2026-05-28 07:45:17', NULL, NULL, '2026-05-28 07:44:21'),
(36, 8, 'ORD-24941297AA427', 480000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hai Bà Trưng, Hà Nội', '0912345678', 'Khách Test ID 8', 'delivered', 'cod', 'paid', NULL, NULL, NULL, NULL, '2026-01-10 02:15:30', '2026-05-28 09:35:02', NULL, NULL, '2026-05-28 09:35:02'),
(37, 9, 'ORD-7D2E8BE7A8A7A', 3020000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hai Bà Trưng, Hà Nội', '0919876543', 'Khách Test ID 9', 'delivered', 'bank_transfer', 'paid', NULL, NULL, NULL, NULL, '2026-01-22 07:30:00', '2026-05-28 09:35:03', NULL, NULL, '2026-05-28 09:35:03'),
(38, 10, 'ORD-74A25394A9A93', 420000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hai Bà Trưng, Hà Nội', '0981122334', 'Khách Test ID 10', 'delivered', 'cod', 'paid', NULL, NULL, NULL, NULL, '2026-02-05 03:20:15', '2026-05-28 09:09:26', NULL, NULL, '2026-05-28 09:09:26'),
(39, 11, 'ORD-FA4AAF5C1CD17', 8010000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hai Bà Trưng, Hà Nội', '0985566778', 'Khách Test ID 11', 'delivered', 'bank_transfer', 'paid', NULL, NULL, NULL, NULL, '2026-02-18 09:45:00', '2026-05-28 09:02:13', NULL, NULL, '2026-05-28 09:02:13'),
(40, 12, 'ORD-F8DF2C7C5204B', 1280000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hai Bà Trưng, Hà Nội', '0973344556', 'Khách Test ID 12', 'delivered', 'cod', 'paid', NULL, NULL, NULL, NULL, '2026-03-12 04:00:22', '2026-05-28 08:58:01', NULL, NULL, '2026-05-28 08:58:01'),
(41, 13, 'ORD-AF9E6E215BD5C', 410000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hai Bà Trưng, Hà Nội', '0977788990', 'Khách Test ID 13', 'delivered', 'bank_transfer', 'paid', NULL, NULL, NULL, NULL, '2026-03-29 08:10:00', '2026-05-28 09:01:16', NULL, NULL, '2026-05-28 09:01:16'),
(42, 8, 'ORD-6ECACE2C2E85B', 2580000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hai Bà Trưng, Hà Nội', '0912345678', 'Khách Test ID 8', 'delivered', 'cod', 'paid', NULL, NULL, NULL, NULL, '2026-04-04 01:40:12', '2026-05-28 09:35:06', NULL, NULL, '2026-05-28 09:35:06'),
(44, 12, 'ORD-84D3236E6F772', 310000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hai Bà Trưng, Hà Nội', '0973344556', 'Khách Test ID 12', 'delivered', 'cod', 'paid', NULL, NULL, NULL, NULL, '2026-05-02 10:50:44', '2026-05-28 08:57:58', NULL, NULL, '2026-05-28 08:57:58'),
(45, 13, 'ORD-1E9B02F88CBD0', 2580000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hai Bà Trưng, Hà Nội', '0977788990', 'Khách Test ID 13', 'delivered', 'bank_transfer', 'paid', NULL, NULL, NULL, NULL, '2026-05-15 03:05:00', '2026-05-28 09:30:31', NULL, NULL, '2026-05-28 09:30:31'),
(46, 8, 'ORD-597C63D1C0CD7', 15230000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0912345678', 'Khách Test ID 8', 'delivered', 'cod', 'paid', NULL, NULL, NULL, NULL, '2026-01-02 03:14:22', '2026-05-28 09:35:05', NULL, NULL, '2026-05-28 09:35:05'),
(48, 10, 'ORD-939ECFDD9DFFC', 15230000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0981122334', 'Khách Test ID 10', 'delivered', 'cod', 'paid', NULL, NULL, NULL, NULL, '2026-01-08 02:35:00', '2026-05-28 09:08:27', NULL, NULL, '2026-05-28 09:08:27'),
(49, 11, 'ORD-859733EC30AF7', 310000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0985566778', 'Khách Test ID 11', 'pending', 'bank_transfer', 'unpaid', NULL, NULL, NULL, NULL, '2026-01-12 09:50:45', '2026-05-28 08:42:49', NULL, NULL, NULL),
(50, 12, 'ORD-B251F41AEE77B', 10530000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0973344556', 'Khách Test ID 12', 'delivered', 'cod', 'paid', NULL, NULL, NULL, NULL, '2026-01-15 04:12:30', '2026-05-28 08:57:55', NULL, NULL, '2026-05-28 08:57:55'),
(51, 13, 'ORD-0C54AC31B38E3', 245000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0977788990', 'Khách Test ID 13', 'delivered', 'bank_transfer', 'paid', NULL, NULL, NULL, NULL, '2026-01-18 08:00:22', '2026-05-28 09:01:13', NULL, NULL, '2026-05-28 09:01:13'),
(54, 10, 'ORD-ADE724C410F01', 3230000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0981122334', 'Khách Test ID 10', 'delivered', 'bank_transfer', 'paid', NULL, NULL, NULL, NULL, '2026-01-28 10:21:05', '2026-05-28 09:09:03', NULL, NULL, '2026-05-28 09:09:03'),
(55, 11, 'ORD-63F3D6F9917E7', 2830000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0985566778', 'Khách Test ID 11', 'delivered', 'cod', 'paid', NULL, NULL, NULL, NULL, '2026-01-31 14:02:14', '2026-05-28 09:03:13', NULL, NULL, '2026-05-28 09:03:13'),
(56, 12, 'ORD-0D57BE1A31461', 13530000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0973344556', 'Khách Test ID 12', 'delivered', 'cod', 'paid', NULL, NULL, NULL, NULL, '2026-02-02 01:45:10', '2026-05-28 08:58:03', NULL, NULL, '2026-05-28 08:58:03'),
(57, 13, 'ORD-C2BE640B1ACAA', 2920000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0977788990', 'Khách Test ID 13', 'delivered', 'bank_transfer', 'paid', NULL, NULL, NULL, NULL, '2026-02-04 06:12:55', '2026-05-28 09:01:56', NULL, NULL, '2026-05-28 09:01:56'),
(58, 8, 'ORD-B0F08BF00A725', 125000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0912345678', 'Khách Test ID 8', 'delivered', 'cod', 'paid', NULL, NULL, NULL, NULL, '2026-02-07 04:22:40', '2026-05-28 09:35:10', NULL, NULL, '2026-05-28 09:35:10'),
(62, 12, 'ORD-5F7C33ED55505', 2920000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0973344556', 'Khách Test ID 12', 'delivered', 'bank_transfer', 'paid', NULL, NULL, NULL, NULL, '2026-02-19 02:22:44', '2026-05-28 08:58:09', NULL, NULL, '2026-05-28 08:58:09'),
(63, 13, 'ORD-099EC8A9F01E4', 350000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0977788990', 'Khách Test ID 13', 'delivered', 'cod', 'paid', NULL, NULL, NULL, NULL, '2026-02-22 08:33:01', '2026-05-28 09:01:25', NULL, NULL, '2026-05-28 09:01:25'),
(64, 8, 'ORD-E12E19632A01B', 2530000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0912345678', 'Khách Test ID 8', 'delivered', 'bank_transfer', 'paid', NULL, NULL, NULL, NULL, '2026-02-25 04:40:19', '2026-05-28 09:35:08', NULL, NULL, '2026-05-28 09:35:08'),
(65, 9, 'ORD-4814C6C9D6A2A', 225000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0919876543', 'Khách Test ID 9', 'delivered', 'cod', 'paid', NULL, NULL, NULL, NULL, '2026-02-28 10:55:50', '2026-05-28 09:26:35', NULL, NULL, '2026-05-28 09:26:35'),
(66, 10, 'ORD-D8AE81B5CE010', 2780000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0981122334', 'Khách Test ID 10', 'delivered', 'cod', 'paid', NULL, NULL, NULL, NULL, '2026-03-03 02:10:15', '2026-05-28 09:09:14', NULL, NULL, '2026-05-28 09:09:14'),
(68, 12, 'ORD-25770030DAB26', 225000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0973344556', 'Khách Test ID 12', 'delivered', 'cod', 'paid', NULL, NULL, NULL, NULL, '2026-03-09 04:15:00', '2026-05-28 08:57:50', NULL, NULL, '2026-05-28 08:57:50'),
(69, 13, 'ORD-D73566D1434E1', 11030000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0977788990', 'Khách Test ID 13', 'delivered', 'bank_transfer', 'paid', NULL, NULL, NULL, NULL, '2026-03-12 09:33:12', '2026-05-28 09:01:19', NULL, NULL, '2026-05-28 09:01:19'),
(70, 8, 'ORD-854F2D061A001', 2130000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0912345678', 'Khách Test ID 8', 'delivered', 'cod', 'paid', NULL, NULL, NULL, NULL, '2026-03-15 03:24:50', '2026-05-28 09:28:35', NULL, NULL, '2026-05-28 09:28:35'),
(71, 9, 'ORD-919BE5240E699', 1880000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0919876543', 'Khách Test ID 9', 'delivered', 'bank_transfer', 'paid', NULL, NULL, NULL, NULL, '2026-03-18 06:19:11', '2026-05-28 09:28:39', NULL, NULL, '2026-05-28 09:28:39'),
(73, 11, 'ORD-E2277B48F0EC0', 3230000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0985566778', 'Khách Test ID 11', 'delivered', 'cod', 'paid', NULL, NULL, NULL, NULL, '2026-03-25 08:12:43', '2026-05-28 09:02:27', NULL, NULL, '2026-05-28 09:02:27'),
(74, 12, 'ORD-D04EB777698CC', 400000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0973344556', 'Khách Test ID 12', 'delivered', 'bank_transfer', 'paid', NULL, NULL, NULL, NULL, '2026-03-28 04:20:09', '2026-05-28 08:57:47', NULL, NULL, '2026-05-28 08:57:47'),
(75, 13, 'ORD-BD0A9FF00D766', 5380000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0977788990', 'Khách Test ID 13', 'delivered', 'cod', 'paid', NULL, NULL, NULL, NULL, '2026-03-31 10:59:58', '2026-05-28 09:01:22', NULL, NULL, '2026-05-28 09:01:22'),
(76, 8, 'ORD-3BC711C4E1487', 18530000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0912345678', 'Khách Test ID 8', 'delivered', 'cod', 'paid', NULL, NULL, NULL, NULL, '2026-04-02 02:12:44', '2026-05-28 09:29:17', NULL, NULL, '2026-05-28 09:29:17'),
(77, 9, 'ORD-125A622741447', 5380000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0919876543', 'Khách Test ID 9', 'delivered', 'bank_transfer', 'paid', NULL, NULL, NULL, NULL, '2026-04-05 08:01:23', '2026-05-28 09:29:23', NULL, NULL, '2026-05-28 09:29:23'),
(78, 10, 'ORD-5DFAF4798C631', 420000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0981122334', 'Khách Test ID 10', 'delivered', 'cod', 'paid', NULL, NULL, NULL, NULL, '2026-04-08 04:22:10', '2026-05-28 09:08:55', NULL, NULL, '2026-05-28 09:08:55'),
(79, 11, 'ORD-6C14395ACF302', 9020000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0985566778', 'Khách Test ID 11', 'delivered', 'bank_transfer', 'paid', NULL, NULL, NULL, NULL, '2026-04-11 07:15:55', '2026-05-28 09:02:39', NULL, NULL, '2026-05-28 09:02:39'),
(80, 12, 'ORD-EF8F34EF8D4A9', 350000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0973344556', 'Khách Test ID 12', 'delivered', 'cod', 'paid', NULL, NULL, NULL, NULL, '2026-04-14 03:40:19', '2026-05-28 08:58:06', NULL, NULL, '2026-05-28 08:58:06'),
(82, 8, 'ORD-79A4923142125', 980000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0912345678', 'Khách Test ID 8', 'delivered', 'bank_transfer', 'paid', NULL, NULL, NULL, NULL, '2026-04-21 01:50:11', '2026-05-28 09:29:19', NULL, NULL, '2026-05-28 09:29:19'),
(83, 9, 'ORD-C8850600B504C', 530000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0919876543', 'Khách Test ID 9', 'delivered', 'cod', 'paid', NULL, NULL, NULL, NULL, '2026-04-24 06:30:15', '2026-05-28 09:29:21', NULL, NULL, '2026-05-28 09:29:21'),
(84, 10, 'ORD-575BA3A1F91A7', 980000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0981122334', 'Khách Test ID 10', 'delivered', 'bank_transfer', 'paid', NULL, NULL, NULL, NULL, '2026-04-27 04:14:02', '2026-05-28 09:09:18', NULL, NULL, '2026-05-28 09:09:18'),
(85, 11, 'ORD-A76869A18C3FA', 449000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0985566778', 'Khách Test ID 11', 'delivered', 'cod', 'paid', NULL, NULL, NULL, NULL, '2026-04-30 10:05:40', '2026-05-28 09:02:23', NULL, NULL, '2026-05-28 09:02:23'),
(86, 12, 'ORD-59265866F312A', 2780000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0973344556', 'Khách Test ID 12', 'delivered', 'cod', 'paid', NULL, NULL, NULL, NULL, '2026-05-02 03:11:45', '2026-05-28 08:57:52', NULL, NULL, '2026-05-28 08:57:52'),
(87, 13, 'ORD-145825A13ECCE', 1680000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0977788990', 'Khách Test ID 13', 'delivered', 'bank_transfer', 'paid', NULL, NULL, NULL, NULL, '2026-05-05 07:19:00', '2026-05-28 09:00:47', NULL, NULL, '2026-05-28 09:00:47'),
(88, 8, 'ORD-33CDA9DC4DC98', 410000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0912345678', 'Khách Test ID 8', 'delivered', 'cod', 'paid', NULL, NULL, NULL, NULL, '2026-05-08 02:33:12', '2026-05-28 09:30:25', NULL, NULL, '2026-05-28 09:30:25'),
(89, 9, 'ORD-618D40606F7E1', 2180000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0919876543', 'Khách Test ID 9', 'delivered', 'bank_transfer', 'paid', NULL, NULL, NULL, NULL, '2026-05-11 08:45:00', '2026-05-28 09:30:04', NULL, NULL, '2026-05-28 09:30:04'),
(90, 10, 'ORD-2BFC4703B3222', 2830000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0981122334', 'Khách Test ID 10', 'delivered', 'cod', 'paid', NULL, NULL, NULL, NULL, '2026-05-14 04:20:19', '2026-05-28 09:08:49', NULL, NULL, '2026-05-28 09:08:49'),
(91, 11, 'ORD-FB7A78D874509', 4530000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0985566778', 'Khách Test ID 11', 'delivered', 'bank_transfer', 'paid', NULL, NULL, NULL, NULL, '2026-05-17 06:02:54', '2026-05-28 08:47:13', NULL, NULL, '2026-05-28 08:47:13'),
(92, 12, 'ORD-1302D78E99A3E', 1680000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0973344556', 'Khách Test ID 12', 'delivered', 'bank_transfer', 'paid', NULL, NULL, NULL, NULL, '2026-05-20 01:14:11', '2026-05-28 08:46:56', NULL, NULL, '2026-05-28 08:46:56'),
(93, 13, 'ORD-F682E31F6BA11', 125000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0977788990', 'Khách Test ID 13', 'delivered', 'cod', 'paid', NULL, NULL, NULL, NULL, '2026-05-23 09:50:04', '2026-05-28 08:46:42', NULL, NULL, '2026-05-28 08:46:42'),
(94, 8, 'ORD-88738E700B698', 460000.00, 30000.00, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0912345678', 'Khách Test ID 8', 'delivered', 'bank_transfer', 'paid', NULL, NULL, NULL, NULL, '2026-05-26 04:22:15', '2026-05-28 08:46:30', NULL, NULL, '2026-05-28 08:46:30'),
(96, 7, 'ORD-6A180B9C0294B', 15755000.00, 30000.00, 0.00, 'cầu diễn, hà nội', '0979071245', 'Test Case', 'delivered', 'cod', 'paid', '', NULL, NULL, NULL, '2026-05-28 09:32:12', '2026-05-28 09:32:57', NULL, NULL, '2026-05-28 09:32:57'),
(97, 7, 'ORD-6A180BABC8FA0', 4530000.00, 30000.00, 0.00, 'cầu diễn, hà nội', '0979071245', 'Test Case', 'delivered', 'cod', 'paid', '', NULL, NULL, NULL, '2026-05-28 09:32:27', '2026-05-28 09:32:51', NULL, NULL, '2026-05-28 09:32:51'),
(98, 9, 'ORD-6AA5AD1A2CD7E', 0.00, NULL, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0919876543', 'Khách Test ID 9', 'pending', 'bank_transfer', 'unpaid', NULL, NULL, NULL, NULL, '2026-02-10 09:05:18', '2026-02-10 09:05:18', NULL, NULL, NULL),
(99, 12, 'ORD-A50507C91AAB2', 0.00, NULL, 0.00, 'Ký túc xá Bách Khoa, Hà Nội', '0973344556', 'Khách Test ID 12', 'pending', 'bank_transfer', 'unpaid', NULL, NULL, NULL, NULL, '2026-02-19 02:22:44', '2026-02-19 02:22:44', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount_percent` decimal(5,2) DEFAULT '0.00',
  `total_price` decimal(12,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `quantity`, `price`, `discount_percent`, `total_price`, `created_at`) VALUES
(48, 27, 31, 'Chuột Logitech G502 Hero', 1, 760000.00, 0.00, 760000.00, '2026-05-28 07:03:34'),
(49, 28, 28, 'Airpods 2 Hổ Vằn', 1, 212500.00, 0.00, 212500.00, '2026-05-28 07:04:03'),
(50, 28, 50, 'Đèn LED Treo Màn Hình Baseus', 1, 337500.00, 0.00, 337500.00, '2026-05-28 07:04:03'),
(51, 29, 25, 'Airpods Pro ANC Louda', 1, 196930.00, 0.00, 196930.00, '2026-05-28 07:08:20'),
(52, 30, 13, 'Sạc Dự Phòng MagSafe 10000mAh', 1, 495000.00, 0.00, 495000.00, '2026-05-28 07:08:33'),
(53, 30, 33, 'Chuột không dây Logitech M331', 1, 266000.00, 0.00, 266000.00, '2026-05-28 07:08:33'),
(54, 31, 67, 'Thẻ nhớ MicroSD SanDisk 128GB', 1, 312000.00, 0.00, 312000.00, '2026-05-28 07:34:58'),
(55, 32, 36, 'Cáp sạc Type-C 2m bọc dù', 1, 85500.00, 0.00, 85500.00, '2026-05-28 07:35:12'),
(56, 32, 38, 'Ốp lưng Magsafe trong suốt', 1, 96000.00, 0.00, 96000.00, '2026-05-28 07:35:12'),
(57, 32, 62, 'Giá đỡ Laptop N3 Aluminum', 1, 250000.00, 0.00, 250000.00, '2026-05-28 07:35:12'),
(58, 36, 58, 'Lót chuột Corsair MM300', 1, 450000.00, 0.00, 450000.00, '2026-05-28 08:38:02'),
(59, 37, 9, 'Logitech K840', 1, 2990000.00, 5.00, 2990000.00, '2026-05-28 08:38:02'),
(60, 38, 67, 'Thẻ nhớ MicroSD SanDisk 128GB', 1, 390000.00, 20.00, 390000.00, '2026-05-28 08:38:02'),
(61, 39, 82, 'Màn hình Acer Nitro VG240Y', 2, 3990000.00, 12.00, 7980000.00, '2026-05-28 08:38:02'),
(62, 40, 110, 'Ghế văn phòng công thái học Ergonomic Okamura Contessa II', 1, 1250000.00, 5.00, 1250000.00, '2026-05-28 08:38:02'),
(63, 41, 39, 'Hub chuyển đổi 5 in 1', 1, 380000.00, 15.00, 380000.00, '2026-05-28 08:38:02'),
(64, 42, 83, 'Màn hình Philips 241V8', 1, 2550000.00, 0.00, 2550000.00, '2026-05-28 08:38:02'),
(66, 44, 123, 'Đèn LED Thanh Cảm Ứng Bếp', 1, 280000.00, 0.00, 280000.00, '2026-05-28 08:38:02'),
(67, 45, 83, 'Màn hình Philips 241V8', 1, 2550000.00, 0.00, 2550000.00, '2026-05-28 08:38:02'),
(68, 46, 17, 'Laptop ASUS Vivobook', 1, 15200000.00, 0.00, 15200000.00, '2026-05-28 08:42:49'),
(70, 48, 17, 'Laptop ASUS Vivobook', 1, 15200000.00, 0.00, 15200000.00, '2026-05-28 08:42:49'),
(71, 49, 33, 'Chuột không dây Logitech M331', 1, 280000.00, 5.00, 280000.00, '2026-05-28 08:42:49'),
(72, 50, 23, 'Oppo Reno 11', 1, 10500000.00, 10.00, 10500000.00, '2026-05-28 08:42:49'),
(73, 51, 128, 'Đèn LED Chiếu Điểm Spotlight 7W', 1, 215000.00, 5.00, 215000.00, '2026-05-28 08:42:49'),
(76, 54, 27, 'Marshall Major IV', 1, 3200000.00, 0.00, 3200000.00, '2026-05-28 08:42:49'),
(77, 55, 29, 'Samsung Buds 2 Pro', 1, 2800000.00, 30.00, 2800000.00, '2026-05-28 08:42:49'),
(78, 56, 24, 'iPhone 13 128GB', 1, 13500000.00, 20.00, 13500000.00, '2026-05-28 08:42:49'),
(79, 57, 78, 'Màn hình Lenovo L24i-30', 1, 2890000.00, 0.00, 2890000.00, '2026-05-28 08:42:49'),
(80, 58, 121, 'Đèn LED Búp (Bulb) Trụ 30W', 1, 95000.00, 0.00, 95000.00, '2026-05-28 08:42:49'),
(84, 62, 78, 'Màn hình Lenovo L24i-30', 1, 2890000.00, 0.00, 2890000.00, '2026-05-28 08:42:49'),
(85, 63, 120, 'Đèn LED Rọi Ray 20W KingLED', 1, 320000.00, 0.00, 320000.00, '2026-05-28 08:42:49'),
(86, 64, 129, 'Test Product', 2, 1250000.00, 12.00, 2500000.00, '2026-05-28 08:42:49'),
(87, 65, 127, 'Đèn LED Sân Vườn Cắm Cỏ', 1, 195000.00, 0.00, 195000.00, '2026-05-28 08:42:49'),
(88, 66, 112, 'Ghế Gaming Công Thái Học GTChair - Marrit X Đen', 1, 2750000.00, 0.00, 2750000.00, '2026-05-28 08:42:49'),
(90, 68, 127, 'Đèn LED Sân Vườn Cắm Cỏ', 1, 195000.00, 0.00, 195000.00, '2026-05-28 08:42:49'),
(91, 69, 19, 'Lenovo Ideapad 3', 1, 11000000.00, 15.00, 11000000.00, '2026-05-28 08:42:49'),
(92, 70, 111, 'Ghế Công Thái Học Ergonomic GTChair I-see M Đen', 1, 2100000.00, 0.00, 2100000.00, '2026-05-28 08:42:49'),
(93, 71, 107, 'Bàn làm việc đứng điều chỉnh độ cao Flexispot ET114N-EN1', 1, 1850000.00, 0.00, 1850000.00, '2026-05-28 08:42:49'),
(95, 73, 27, 'Marshall Major IV', 1, 3200000.00, 0.00, 3200000.00, '2026-05-28 08:42:49'),
(96, 74, 126, 'Đèn LED Ốp Trần Trang Trí', 2, 185000.00, 0.00, 370000.00, '2026-05-28 08:42:49'),
(97, 75, 80, 'Màn hình BenQ EX2510S', 1, 5350000.00, 10.00, 5350000.00, '2026-05-28 08:42:49'),
(98, 76, 12, 'Laptop Acer Gaming Aspire 7 A715-59G-57TU', 1, 18500000.00, 15.00, 18500000.00, '2026-05-28 08:42:49'),
(99, 77, 80, 'Màn hình BenQ EX2510S', 1, 5350000.00, 10.00, 5350000.00, '2026-05-28 08:42:49'),
(100, 78, 67, 'Thẻ nhớ MicroSD SanDisk 128GB', 1, 390000.00, 20.00, 390000.00, '2026-05-28 08:42:49'),
(101, 79, 5, 'Sony WH-1000XM5', 1, 8990000.00, 0.00, 8990000.00, '2026-05-28 08:42:49'),
(102, 80, 69, 'Giá treo tai nghe RGB Onikuma', 1, 320000.00, 0.00, 320000.00, '2026-05-28 08:42:49'),
(104, 82, 31, 'Chuột Logitech G502 Hero', 1, 950000.00, 20.00, 950000.00, '2026-05-28 08:42:49'),
(105, 83, 62, 'Giá đỡ Laptop N3 Aluminum', 2, 250000.00, 0.00, 500000.00, '2026-05-28 08:42:49'),
(106, 84, 106, 'Bàn Làm Việc Đứng Flexispot ET223 - E7', 1, 950000.00, 10.00, 950000.00, '2026-05-28 08:42:49'),
(107, 85, 25, 'Airpods Pro ANC Louda', 1, 419000.00, 53.00, 419000.00, '2026-05-28 08:42:49'),
(108, 86, 112, 'Ghế Gaming Công Thái Học GTChair - Marrit X Đen', 1, 2750000.00, 0.00, 2750000.00, '2026-05-28 08:42:49'),
(109, 87, 66, 'Ổ cứng di động WD My Passport 1TB', 1, 1650000.00, 8.00, 1650000.00, '2026-05-28 08:42:49'),
(110, 88, 39, 'Hub chuyển đổi 5 in 1', 1, 380000.00, 15.00, 380000.00, '2026-05-28 08:42:49'),
(111, 89, 64, 'Webcam Logitech C922 Pro', 1, 2150000.00, 12.00, 2150000.00, '2026-05-28 08:42:49'),
(112, 90, 29, 'Samsung Buds 2 Pro', 1, 2800000.00, 30.00, 2800000.00, '2026-05-28 08:42:49'),
(113, 91, 32, 'Bàn phím DareU EK87', 1, 4500000.00, 0.00, 4500000.00, '2026-05-28 08:42:49'),
(114, 92, 66, 'Ổ cứng di động WD My Passport 1TB', 1, 1650000.00, 8.00, 1650000.00, '2026-05-28 08:42:49'),
(115, 93, 36, 'Cáp sạc Type-C 2m bọc dù', 1, 95000.00, 10.00, 95000.00, '2026-05-28 08:42:49'),
(116, 94, 128, 'Đèn LED Chiếu Điểm Spotlight 7W', 2, 215000.00, 5.00, 430000.00, '2026-05-28 08:42:49'),
(118, 96, 12, 'Laptop Acer Gaming Aspire 7 A715-59G-57TU', 1, 15725000.00, 0.00, 15725000.00, '2026-05-28 09:32:12'),
(119, 97, 32, 'Bàn phím DareU EK87', 1, 4500000.00, 0.00, 4500000.00, '2026-05-28 09:32:27'),
(120, 98, 78, 'Màn hình Lenovo L24i-30', 1, 2890000.00, 0.00, 2890000.00, '2026-05-29 06:06:33'),
(121, 99, 19, 'Lenovo Ideapad 3', 1, 11000000.00, 15.00, 11000000.00, '2026-05-29 06:06:55');

-- --------------------------------------------------------

--
-- Table structure for table `order_requests`
--

CREATE TABLE `order_requests` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `request_type` enum('cancel','return') COLLATE utf8mb4_general_ci NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_general_ci DEFAULT 'pending',
  `user_id` int NOT NULL,
  `requested_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `admin_id` int DEFAULT NULL,
  `reviewed_at` timestamp NULL DEFAULT NULL,
  `rejection_reason` text COLLATE utf8mb4_general_ci,
  `evidence_image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `refund_amount` decimal(12,2) DEFAULT NULL,
  `refund_status` enum('pending','processing','completed') COLLATE utf8mb4_general_ci DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_requests`
--

INSERT INTO `order_requests` (`id`, `order_id`, `request_type`, `reason`, `description`, `status`, `user_id`, `requested_at`, `admin_id`, `reviewed_at`, `rejection_reason`, `evidence_image`, `refund_amount`, `refund_status`) VALUES
(5, 29, 'cancel', 'Tôi không còn nhu cầu mua nữa', '', 'approved', 10, '2026-05-28 07:28:20', 2, '2026-05-28 07:28:54', NULL, NULL, 226930.00, 'completed'),
(6, 32, 'return', 'Sản phẩm không đúng mô tả', '', 'approved', 9, '2026-05-28 07:44:49', 2, '2026-05-28 07:45:49', NULL, NULL, 461500.00, 'completed'),
(7, 27, 'return', 'Giao sai sản phẩm', '', 'pending', 8, '2026-05-28 08:07:12', NULL, NULL, NULL, NULL, 790000.00, 'pending'),
(8, 49, 'cancel', 'Tôi không còn nhu cầu mua nữa', '', 'pending', 11, '2026-05-28 09:36:12', NULL, NULL, NULL, NULL, 310000.00, NULL),
(9, 93, 'return', 'Sản phẩm không đúng mô tả', '', 'pending', 13, '2026-05-28 09:36:31', NULL, NULL, NULL, NULL, 125000.00, 'pending'),
(10, 74, 'return', 'Thiếu phụ kiện đi kèm', '', 'rejected', 12, '2026-05-28 09:36:51', 2, '2026-05-28 09:38:17', 'Xin lỗi bạn, sản phẩm này không có phụ kiện đi kèm.', NULL, 400000.00, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `order_status_history`
--

CREATE TABLE `order_status_history` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `old_status` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `new_status` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `note` text COLLATE utf8mb4_general_ci,
  `changed_by` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_status_history`
--

INSERT INTO `order_status_history` (`id`, `order_id`, `old_status`, `new_status`, `note`, `changed_by`, `created_at`) VALUES
(56, 27, NULL, 'pending', 'Khách hàng đặt hàng thành công', NULL, '2026-05-28 07:03:34'),
(57, 28, NULL, 'pending', 'Khách hàng đặt hàng thành công', NULL, '2026-05-28 07:04:03'),
(58, 29, NULL, 'pending', 'Khách hàng đặt hàng thành công', NULL, '2026-05-28 07:08:20'),
(59, 30, NULL, 'pending', 'Khách hàng đặt hàng thành công', NULL, '2026-05-28 07:08:33'),
(60, 29, 'pending', 'cancelled', 'Admin đã duyệt yêu cầu hủy đơn hàng.', 2, '2026-05-28 07:28:54'),
(61, 31, NULL, 'pending', 'Khách hàng đặt hàng thành công', NULL, '2026-05-28 07:34:58'),
(62, 32, NULL, 'pending', 'Khách hàng đặt hàng thành công', NULL, '2026-05-28 07:35:12'),
(63, 32, 'pending', 'confirmed', 'Đơn hàng của bạn đã được chấp nhận.', 2, '2026-05-28 07:43:41'),
(64, 32, 'confirmed', 'shipping', 'Đơn hàng đang được vận chuyển.', 2, '2026-05-28 07:43:59'),
(65, 32, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công. Vui lòng chú ý điện thoại.', 2, '2026-05-28 07:44:21'),
(66, 32, 'delivered', 'returned', 'Admin đã duyệt yêu cầu hoàn trả hàng hóa.', 2, '2026-05-28 07:45:17'),
(67, 32, 'returned', 'returned', 'Hệ thống StudentGear đã hoàn tiền thành công cho quý khách qua phương thức thanh toán tương ứng.', 2, '2026-05-28 07:45:49'),
(68, 27, 'pending', 'confirmed', 'Đơn hàng đã được xác nhận.', 2, '2026-05-28 08:06:24'),
(69, 27, 'confirmed', 'shipping', 'Đơn hàng đang được giao đến bạn.', 2, '2026-05-28 08:06:39'),
(70, 27, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công.', 2, '2026-05-28 08:06:56'),
(71, 36, 'Bắt đầu', 'pending', 'Đơn hàng thử nghiệm tiến độ Tháng 1.', NULL, '2026-05-28 08:38:02'),
(72, 37, 'Bắt đầu', 'pending', 'Đơn hàng thử nghiệm tiến độ Tháng 1.', NULL, '2026-05-28 08:38:02'),
(73, 38, 'Bắt đầu', 'pending', 'Đơn hàng thử nghiệm tiến độ Tháng 2.', NULL, '2026-05-28 08:38:02'),
(74, 39, 'Bắt đầu', 'pending', 'Đơn hàng thử nghiệm tiến độ Tháng 2.', NULL, '2026-05-28 08:38:02'),
(75, 40, 'Bắt đầu', 'pending', 'Đơn hàng thử nghiệm tiến độ Tháng 3.', NULL, '2026-05-28 08:38:02'),
(76, 41, 'Bắt đầu', 'pending', 'Đơn hàng thử nghiệm tiến độ Tháng 3.', NULL, '2026-05-28 08:38:02'),
(77, 42, 'Bắt đầu', 'pending', 'Đơn hàng thử nghiệm tiến độ Tháng 4.', NULL, '2026-05-28 08:38:02'),
(79, 44, 'Bắt đầu', 'pending', 'Đơn hàng thử nghiệm tiến độ Tháng 5.', NULL, '2026-05-28 08:38:02'),
(80, 45, 'Bắt đầu', 'pending', 'Đơn hàng thử nghiệm tiến độ Tháng 5.', NULL, '2026-05-28 08:38:02'),
(81, 46, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 1', NULL, '2026-05-28 08:42:49'),
(83, 48, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 1', NULL, '2026-05-28 08:42:49'),
(84, 49, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 1', NULL, '2026-05-28 08:42:49'),
(85, 50, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 1', NULL, '2026-05-28 08:42:49'),
(86, 51, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 1', NULL, '2026-05-28 08:42:49'),
(89, 54, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 1', NULL, '2026-05-28 08:42:49'),
(90, 55, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 1', NULL, '2026-05-28 08:42:49'),
(91, 56, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 2', NULL, '2026-05-28 08:42:49'),
(92, 57, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 2', NULL, '2026-05-28 08:42:49'),
(93, 58, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 2', NULL, '2026-05-28 08:42:49'),
(97, 62, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 2', NULL, '2026-05-28 08:42:49'),
(98, 63, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 2', NULL, '2026-05-28 08:42:49'),
(99, 64, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 2', NULL, '2026-05-28 08:42:49'),
(100, 65, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 2', NULL, '2026-05-28 08:42:49'),
(101, 66, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 3', NULL, '2026-05-28 08:42:49'),
(103, 68, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 3', NULL, '2026-05-28 08:42:49'),
(104, 69, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 3', NULL, '2026-05-28 08:42:49'),
(105, 70, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 3', NULL, '2026-05-28 08:42:49'),
(106, 71, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 3', NULL, '2026-05-28 08:42:49'),
(108, 73, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 3', NULL, '2026-05-28 08:42:49'),
(109, 74, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 3', NULL, '2026-05-28 08:42:49'),
(110, 75, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 3', NULL, '2026-05-28 08:42:49'),
(111, 76, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 4', NULL, '2026-05-28 08:42:49'),
(112, 77, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 4', NULL, '2026-05-28 08:42:49'),
(113, 78, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 4', NULL, '2026-05-28 08:42:49'),
(114, 79, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 4', NULL, '2026-05-28 08:42:49'),
(115, 80, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 4', NULL, '2026-05-28 08:42:49'),
(117, 82, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 4', NULL, '2026-05-28 08:42:49'),
(118, 83, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 4', NULL, '2026-05-28 08:42:49'),
(119, 84, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 4', NULL, '2026-05-28 08:42:49'),
(120, 85, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 4', NULL, '2026-05-28 08:42:49'),
(121, 86, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 5', NULL, '2026-05-28 08:42:49'),
(122, 87, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 5', NULL, '2026-05-28 08:42:49'),
(123, 88, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 5', NULL, '2026-05-28 08:42:49'),
(124, 89, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 5', NULL, '2026-05-28 08:42:49'),
(125, 90, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 5', NULL, '2026-05-28 08:42:49'),
(126, 91, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 5', NULL, '2026-05-28 08:42:49'),
(127, 92, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 5', NULL, '2026-05-28 08:42:49'),
(128, 93, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 5', NULL, '2026-05-28 08:42:49'),
(129, 94, 'Bắt đầu', 'pending', 'Khởi tạo đơn hàng Tháng 5', NULL, '2026-05-28 08:42:49'),
(134, 94, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:46:06'),
(135, 94, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 08:46:26'),
(136, 94, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 08:46:30'),
(137, 93, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:46:35'),
(138, 93, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 08:46:39'),
(139, 93, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 08:46:42'),
(140, 92, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:46:46'),
(141, 92, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 08:46:53'),
(142, 92, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 08:46:56'),
(143, 91, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:47:00'),
(144, 91, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 08:47:09'),
(145, 91, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 08:47:13'),
(146, 36, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:47:33'),
(148, 37, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:47:47'),
(149, 28, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:48:04'),
(150, 30, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:48:11'),
(151, 51, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:48:24'),
(152, 38, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:48:35'),
(153, 41, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:48:42'),
(155, 74, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:48:51'),
(156, 78, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:48:57'),
(157, 76, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:49:01'),
(158, 68, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:49:04'),
(160, 70, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:49:11'),
(161, 79, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:49:14'),
(163, 71, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:49:28'),
(164, 82, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:49:32'),
(165, 69, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:49:35'),
(166, 83, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:49:39'),
(167, 84, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:49:45'),
(168, 75, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:49:49'),
(169, 77, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:49:54'),
(170, 73, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:49:58'),
(171, 46, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:50:31'),
(172, 89, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:50:34'),
(173, 66, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:50:38'),
(174, 86, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:51:01'),
(175, 50, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:51:06'),
(177, 44, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:51:14'),
(178, 85, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:51:18'),
(179, 40, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:51:24'),
(180, 63, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:51:28'),
(181, 87, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:51:51'),
(182, 65, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:52:19'),
(184, 31, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:52:38'),
(185, 39, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:55:01'),
(186, 48, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:56:00'),
(188, 54, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:56:11'),
(189, 90, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:56:14'),
(191, 56, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:56:33'),
(192, 80, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:56:36'),
(193, 62, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 08:56:39'),
(194, 62, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 08:56:47'),
(195, 80, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 08:56:53'),
(196, 56, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 08:56:56'),
(197, 40, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 08:57:02'),
(198, 44, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 08:57:05'),
(199, 50, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 08:57:09'),
(200, 86, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 08:57:13'),
(201, 68, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 08:57:16'),
(202, 74, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 08:57:20'),
(203, 74, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 08:57:47'),
(204, 68, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 08:57:50'),
(205, 86, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 08:57:52'),
(206, 50, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 08:57:55'),
(207, 44, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 08:57:58'),
(208, 40, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 08:58:01'),
(209, 56, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 08:58:03'),
(210, 80, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 08:58:06'),
(211, 62, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 08:58:09'),
(212, 87, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:00:40'),
(213, 87, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:00:47'),
(214, 63, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:00:51'),
(215, 75, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:00:58'),
(216, 69, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:01:01'),
(217, 41, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:01:05'),
(218, 51, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:01:07'),
(219, 51, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:01:13'),
(220, 41, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:01:16'),
(221, 69, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:01:19'),
(222, 75, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:01:22'),
(223, 63, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:01:25'),
(227, 57, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 09:01:47'),
(228, 57, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:01:52'),
(229, 57, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:01:56'),
(230, 39, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:02:10'),
(231, 39, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:02:13'),
(232, 85, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:02:15'),
(233, 85, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:02:23'),
(234, 73, 'confirmed', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:02:27'),
(235, 79, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:02:36'),
(236, 79, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:02:39'),
(240, 55, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 09:03:05'),
(241, 55, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:03:10'),
(242, 55, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:03:13'),
(246, 90, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:03:43'),
(248, 48, 'confirmed', 'confirmed', 'Đơn hàng đã được xác nhận thành công. Shop đang chuẩn bị đóng gói hàng hóa.', 2, '2026-05-28 09:05:20'),
(249, 48, 'confirmed', 'confirmed', 'Đơn hàng đã được xác nhận thành công. Shop đang chuẩn bị đóng gói hàng hóa.', 2, '2026-05-28 09:05:28'),
(250, 48, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:08:05'),
(251, 48, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:08:27'),
(253, 90, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:08:49'),
(254, 78, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:08:52'),
(255, 78, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:08:55'),
(256, 54, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:08:57'),
(258, 54, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:09:03'),
(259, 66, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:09:06'),
(260, 84, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:09:08'),
(261, 30, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:09:11'),
(262, 66, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:09:14'),
(263, 30, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:09:16'),
(264, 84, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:09:18'),
(266, 38, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:09:24'),
(267, 38, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:09:26'),
(269, 65, 'confirmed', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:26:35'),
(270, 71, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:28:28'),
(271, 70, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:28:31'),
(272, 70, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:28:35'),
(273, 71, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:28:39'),
(274, 77, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:29:09'),
(275, 83, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:29:12'),
(276, 82, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:29:14'),
(277, 76, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:29:15'),
(278, 76, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:29:17'),
(279, 82, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:29:19'),
(280, 83, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:29:21'),
(281, 77, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:29:23'),
(282, 31, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:29:52'),
(283, 31, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:29:55'),
(284, 89, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:29:57'),
(285, 28, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:29:59'),
(286, 28, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:30:01'),
(287, 89, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:30:04'),
(288, 88, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 09:30:22'),
(289, 88, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:30:24'),
(290, 88, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:30:25'),
(291, 45, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 09:30:28'),
(292, 45, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:30:30'),
(293, 45, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:30:31'),
(294, 96, NULL, 'pending', 'Khách hàng đặt hàng thành công', NULL, '2026-05-28 09:32:12'),
(295, 97, NULL, 'pending', 'Khách hàng đặt hàng thành công', NULL, '2026-05-28 09:32:27'),
(296, 97, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 09:32:47'),
(297, 97, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:32:49'),
(298, 97, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:32:51'),
(299, 96, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 09:32:52'),
(300, 96, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:32:55'),
(301, 96, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:32:57'),
(302, 42, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 09:34:25'),
(303, 64, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 09:34:32'),
(304, 58, 'pending', 'confirmed', 'Đơn hàng đã được StudentGear xác nhận thành công và chuẩn bị đóng gói.', 2, '2026-05-28 09:34:38'),
(305, 58, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:34:49'),
(306, 64, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:34:51'),
(307, 42, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:34:53'),
(308, 46, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:34:55'),
(309, 37, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:34:56'),
(310, 36, 'confirmed', 'shipping', 'Đơn hàng đã đóng gói hoàn tất và bàn giao cho đơn vị vận chuyển.', 2, '2026-05-28 09:34:58'),
(311, 36, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:35:02'),
(312, 37, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:35:03'),
(313, 46, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:35:05'),
(314, 42, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:35:06'),
(315, 64, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:35:08'),
(316, 58, 'shipping', 'delivered', 'Đơn hàng đã được giao thành công đến tay khách hàng.', 2, '2026-05-28 09:35:10');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_general_ci,
  `price` decimal(10,2) NOT NULL,
  `cost_price` decimal(10,2) DEFAULT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `category_id` int NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_featured` tinyint(1) DEFAULT '0',
  `is_new` tinyint(1) DEFAULT '0',
  `discount_percent` decimal(5,2) DEFAULT '0.00',
  `views` int DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `cost_price`, `stock`, `category_id`, `image`, `slug`, `is_featured`, `is_new`, `discount_percent`, `views`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Laptop Dell XPS 13', 'Laptop Dell XPS 13 inch FHD, Intel Core i5, 8GB RAM, 512GB SSD', 25999000.00, 20000000.00, 15, 1, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/g/r/group_789.png', NULL, 1, 1, 10.00, 14, 1, '2026-04-17 08:54:59', '2026-05-25 15:15:05'),
(2, 'MacBook Air M1', 'Laptop Apple MacBook Air M1, 8GB RAM, 256GB SSD', 29990000.00, 25000000.00, 8, 1, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/g/r/group_906_1_.png', NULL, 1, 0, 5.00, 0, 1, '2026-04-17 08:54:59', '2026-05-01 09:32:19'),
(3, 'iPhone 14 Pro', 'iPhone 14 Pro 128GB, màn hình AMOLED, camera 48MP', 29990000.00, 24000000.00, 20, 2, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/s/a/samsung-galaxy-s26-ultra-1.jpg', NULL, 1, 1, 0.00, 0, 1, '2026-04-17 08:54:59', '2026-05-01 09:26:44'),
(4, 'Samsung Galaxy S23', 'Samsung Galaxy S23 Ultra, Snapdragon 8 Gen 2, 256GB', 23990000.00, 18000000.00, 25, 2, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/d/i/dien-thoai-samsung-galaxy-s25-ultra_3__3.png', NULL, 0, 1, 15.00, 0, 1, '2026-04-17 08:54:59', '2026-05-01 09:26:58'),
(5, 'Sony WH-1000XM5', 'Tai nghe Sony WH-1000XM5 ANC, Bluetooth 5.3', 8990000.00, 7000000.00, 30, 3, 'https://phukienngonbore.com/wp-content/uploads/2021/12/airpod3-ho-van-1562m-300x300.png', NULL, 1, 0, 0.00, 4, 1, '2026-04-17 08:54:59', '2026-05-21 07:54:19'),
(6, 'Logitech MX Master 3', 'Chuột Logitech MX Master 3, Bluetooth, USB-C', 2190000.00, 1500000.00, 50, 4, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/c/h/chuot-khong-day-logitech-mx-master-4_1_.png', NULL, 0, 0, 10.00, 0, 1, '2026-04-17 08:54:59', '2026-05-01 09:38:15'),
(7, 'Razer DeathAdder V2', 'Chuột gaming Razer DeathAdder V2, 20000 DPI', 1490000.00, 1000000.00, 40, 4, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/g/a/gaming_8_-_2025-05-30t092833.530.png', NULL, 0, 0, 0.00, 0, 1, '2026-04-17 08:54:59', '2026-05-01 09:40:34'),
(9, 'Logitech K840', 'Bàn phím cơ Logitech K840, RGB LED', 2990000.00, 2000000.00, 25, 4, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/c/h/chuot-khong-day-bluetooth-logitech-pebble-m350s_4.png', NULL, 0, 0, 5.00, 0, 1, '2026-04-17 08:54:59', '2026-05-01 09:40:14'),
(10, 'Macbook NEO 13 inch A18 PRO', 'Chip Louda mới nhất, chống ồn cực tốt', 14190000.00, NULL, 100, 1, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/m/a/macbook_13_19.png', 'airpods-pro-anc-2026', 1, 1, 53.00, 1539, 1, '2026-04-29 10:00:24', '2026-05-23 08:21:46'),
(11, 'Củ Sạc Nhanh 35W Dual Port', 'Sạc nhanh 2 cổng tiện lợi cho iPhone', 350000.00, NULL, 50, 2, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/c/u/cu-sac-anker-zolo-a2698-1c-30w.png', 'cu-sac-nhanh-35w', 1, 0, 20.00, 895, 1, '2026-04-29 10:00:24', '2026-05-01 15:07:39'),
(12, 'Laptop Acer Gaming Aspire 7 A715-59G-57TU', 'Âm thanh cực đỉnh, pin trâu 80h', 18500000.00, NULL, 30, 1, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_d_i_1__4_8.png', 'marshall-major-iv-rep', 1, 1, 15.00, 1230, 1, '2026-04-29 10:00:24', '2026-05-28 09:31:50'),
(13, 'Sạc Dự Phòng MagSafe 10000mAh', 'Hít nam châm cực chắc cho iPhone 12-15', 550000.00, NULL, 40, 2, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/p/i/pin-sac-du-phong-anker-pirume-a1339-9600mah-65w_1_.png', 'sac-du-phong-magsafe', 1, 0, 10.00, 609, 1, '2026-04-29 10:00:24', '2026-05-28 07:07:26'),
(14, 'Laptop HP Omnibook 5 AI 16-AF1048TU BZ7Q9PA', 'Pin 8h liên tục, âm thanh vòm', 14790000.00, NULL, 80, 1, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/g/r/group_744_1_42.png', 'airpods-3-ho-van', 1, 1, 36.00, 2140, 1, '2026-04-29 10:00:24', '2026-05-16 09:26:55'),
(15, 'Macbook Air M2 2023', 'Chip M2 cực mạnh, màn hình Liquid Retina', 26900000.00, NULL, 20, 1, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/m/a/macbook_13.png', 'macbook-air-m2', 1, 0, 10.00, 19, 1, '2026-04-29 10:02:50', '2026-05-23 08:01:00'),
(16, 'Laptop Dell XPS 13', 'Thiết kế sang trọng, mỏng nhẹ', 24500000.00, NULL, 15, 1, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/m/a/macbook_13_17.png', 'dell-xps-13', 0, 0, 5.00, 2, 1, '2026-04-29 10:02:50', '2026-05-06 07:35:11'),
(17, 'Laptop ASUS Vivobook', 'Màn hình OLED rực rỡ', 15200000.00, NULL, 30, 1, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/g/r/group_744_1_84.png', 'asus-vivobook-oled', 0, 0, 0.00, 10, 1, '2026-04-29 10:02:50', '2026-05-02 14:30:55'),
(18, 'HP Envy 14 2024', 'Hiệu năng cao cho văn phòng', 15800000.00, 13800000.00, 12, 1, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/g/r/group_874_1__2.png', 'hp-envy-14-2024', 0, 0, 8.00, 3, 1, '2026-04-29 10:02:50', '2026-05-28 07:01:59'),
(19, 'Lenovo Ideapad 3', 'Giá rẻ cho sinh viên', 11000000.00, 10500000.00, 50, 1, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_d_i_7_57.png', 'lenovo-ideapad-3', 0, 0, 15.00, 7, 1, '2026-04-29 10:02:50', '2026-05-28 07:01:19'),
(20, 'iPhone 15 Pro Max', 'Titan tự nhiên, chip A17 Pro', 29900000.00, NULL, 40, 2, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone-17-pro-max_3.jpg', 'iphone-15-pro-max', 1, 0, 5.00, 12, 1, '2026-04-29 10:02:50', '2026-05-28 09:32:17'),
(21, 'Samsung Galaxy S24 Ultra', 'Camera 200MP, bút S-Pen', 26500000.00, NULL, 35, 2, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/s/a/samsung-galaxy-z-fold-7.jpg', 'samsung-s24-ultra', 0, 0, 12.00, 6, 1, '2026-04-29 10:02:50', '2026-05-18 06:27:33'),
(22, 'Xiaomi 14 Pro', 'Sạc siêu nhanh 120W', 18900000.00, NULL, 25, 2, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/d/i/dien-thoai-xiaomi-15-ultra.png', 'xiaomi-14-pro', 0, 0, 0.00, 0, 1, '2026-04-29 10:02:50', '2026-05-01 09:28:23'),
(23, 'Oppo Reno 11', 'Chuyên gia chân dung', 10500000.00, NULL, 45, 2, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/x/9/x9-1_1.jpg', 'oppo-reno-11', 0, 0, 10.00, 2, 1, '2026-04-29 10:02:50', '2026-05-01 09:28:43'),
(24, 'iPhone 13 128GB', 'Lựa chọn quốc dân giá tốt', 13500000.00, NULL, 60, 2, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone-15-plus-256gb_3.png', 'iphone-13-128gb', 0, 0, 20.00, 3, 1, '2026-04-29 10:02:50', '2026-05-02 08:24:34'),
(25, 'Airpods Pro ANC Louda', 'Chống ồn xuyên âm cực tốt', 419000.00, NULL, 100, 3, 'https://phukienngonbore.com/wp-content/uploads/2021/11/airpod-3-rep-1-1-300x300.jpg', 'airpods-pro-anc', 1, 0, 53.00, 5, 1, '2026-04-29 10:02:50', '2026-05-28 07:07:45'),
(26, 'Tai nghe Sony WH-1000XM5', 'Chống ồn số 1 thế giới', 6500000.00, NULL, 15, 3, 'https://phukienngonbore.com/wp-content/uploads/2022/10/tai-nghe-airpod-pro-2-2022-gia-re-300x300.jpg', 'sony-wh-1000xm5', 0, 0, 10.00, 7, 1, '2026-04-29 10:02:50', '2026-05-16 09:27:37'),
(27, 'Marshall Major IV', 'Pin 80h, âm thanh cổ điển', 3200000.00, NULL, 20, 3, 'https://phukienngonbore.com/wp-content/uploads/2022/10/tai-nghe-ho-van-1562ae-300x300.jpg', 'marshall-major-4', 0, 0, 0.00, 1, 1, '2026-04-29 10:02:50', '2026-05-25 05:54:53'),
(28, 'Airpods 2 Hổ Vằn', 'Check setting, pin bền', 250000.00, NULL, 150, 3, 'https://phukienngonbore.com/wp-content/uploads/2021/03/tai-nghe-bluetooth-AMOI-F9-7-200x200.jpg', 'airpods-2-ho-van', 0, 0, 15.00, 5, 1, '2026-04-29 10:02:50', '2026-05-28 07:02:43'),
(29, 'Samsung Buds 2 Pro', 'Âm thanh 24-bit đỉnh cao', 2800000.00, NULL, 30, 3, 'https://phukienngonbore.com/wp-content/uploads/2022/10/tai-nghe-iphone-14-co-day-chinh-hang-300x300.jpg', 'samsung-buds-2-pro', 0, 0, 30.00, 2, 1, '2026-04-29 10:02:50', '2026-05-02 14:00:32'),
(30, 'Bàn phím cơ AKKO 3068', 'Switch AKKO v3 cực mượt', 1250000.00, NULL, 40, 4, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/b/a/ban-phim-co-rapoo-gk500-den.png', 'akko-3068-v3', 1, 0, 10.00, 6, 1, '2026-04-29 10:02:50', '2026-05-18 05:46:06'),
(31, 'Chuột Logitech G502 Hero', 'Cảm biến 25K DPI cực nhạy', 950000.00, NULL, 55, 4, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/c/h/chuot-gaming-co-day-asus-tuf-m3-gen-2_1_1.png', 'logitech-g502-hero', 0, 0, 20.00, 16, 1, '2026-04-29 10:02:50', '2026-05-28 07:02:47'),
(32, 'Bàn phím DareU EK87', 'Phím cơ giá rẻ quốc dân', 4500000.00, NULL, 100, 4, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/g/a/gaming_8_-_2025-08-06t111146.036.png', 'dareu-ek87', 0, 0, 0.00, 1, 1, '2026-04-29 10:02:50', '2026-05-28 09:32:25'),
(33, 'Chuột không dây Logitech M331', 'Click không gây tiếng động', 280000.00, NULL, 80, 4, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/f/r/frame_1_3__3.png', 'logitech-m331', 0, 0, 5.00, 3, 1, '2026-04-29 10:02:50', '2026-05-28 07:07:38'),
(34, 'Bộ phím chuột văn phòng Dell', 'Bền bỉ, gõ êm', 3500000.00, 3299999.00, 120, 4, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/g/a/gaming_8_33_.png', 'bo-phim-chuot-van-phong-dell', 0, 0, 0.00, 0, 1, '2026-04-29 10:02:50', '2026-05-16 08:10:55'),
(36, 'Cáp sạc Type-C 2m bọc dù', 'Siêu bền, chống đứt', 95000.00, NULL, 300, 5, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/c/a/cap-sac-nhanh-baseus-cafule-pd-2-0-100w-type-c-to-type-c-20v-5a-2m.1_7_.png', 'cap-sac-du-2m', 0, 0, 10.00, 2, 1, '2026-04-29 10:02:50', '2026-05-28 07:34:08'),
(38, 'Ốp lưng Magsafe trong suốt', 'Hít nam châm chắc chắn', 120000.00, NULL, 500, 5, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/o/p/op-lung-iphone-17-pro-max-apple-techwoven-with-magsafe.png', 'op-magsafe-trong', 0, 0, 20.00, 3, 1, '2026-04-29 10:02:50', '2026-05-28 07:34:14'),
(39, 'Hub chuyển đổi 5 in 1', 'Dành cho Macbook và Type-C', 380000.00, NULL, 40, 5, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/t/h/thumb-op-lung_1_9.png', 'hub-type-c-5in1', 0, 0, 15.00, 0, 1, '2026-04-29 10:02:50', '2026-05-06 05:54:22'),
(50, 'Đèn LED Treo Màn Hình Baseus', 'Chống mỏi mắt, không gây chói màn hình', 450000.00, NULL, 60, 8, 'https://genk.mediacdn.vn/139269124445442048/2026/4/14/egbqegqeg-1776189527631-1776189528738415833856.jpg', 'den-treo-man-hinh-baseus', 1, 0, 25.00, 1812, 1, '2026-04-29 10:03:02', '2026-05-28 07:02:32'),
(54, 'Đèn LED Để Bàn Tích Điện', 'Sử dụng liên tục 10h khi mất điện', 190000.00, NULL, 120, 8, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/d/e/den-led-de-ban-taotronics-tt-dl01-tt-dl02-1_3.jpg', 'den-led-tich-dien-gap-gon', 0, 0, 20.00, 420, 1, '2026-04-29 10:03:02', '2026-05-06 06:27:50'),
(58, 'Lót chuột Corsair MM300', 'Lót chuột kích thước lớn, bề mặt vải dệt chống sờn.', 450000.00, 250000.00, 100, 5, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/p/h/photo_2020-09-19_13-56-51_1.jpg', 'lot-chuot-corsair-mm300', 0, 0, 0.00, 45, 1, '2026-05-05 15:17:43', '2026-05-06 06:05:22'),
(62, 'Giá đỡ Laptop N3 Aluminum', 'Chất liệu hợp kim nhôm, hỗ trợ tản nhiệt, gập gọn.', 250000.00, 120000.00, 60, 5, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_ng_n_15_123.png', 'gia-do-laptop-n3', 0, 0, 0.00, 96, 1, '2026-05-05 15:17:43', '2026-05-28 07:34:04'),
(63, 'Tay cầm Xbox Series X Controller', 'Kết nối Bluetooth, tương thích PC và Console.', 1590000.00, 1300000.00, 12, 5, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/r/o/rog-xbox-ally-x-1_1.jpg', 'tay-cam-xbox-series-x', 1, 0, 0.00, 181, 1, '2026-05-05 15:17:43', '2026-05-06 13:52:01'),
(64, 'Webcam Logitech C922 Pro', 'Stream Full HD 1080p, tích hợp chân tripod nhỏ.', 2150000.00, 1700000.00, 10, 5, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/c/2/c270-hd-webcam-refresh.png', 'webcam-logitech-c922', 0, 0, 12.00, 76, 1, '2026-05-05 15:17:43', '2026-05-06 08:31:53'),
(65, 'Cáp sạc iPhone Apple 20W', 'Cáp Type-C sang Lightning chính hãng, sạc nhanh.', 550000.00, 350000.00, 80, 5, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/c/a/cap-chuyen-doi-type-c-to-lightning-momax-silicone-30w-2m-dl55.png', 'cap-sac-iphone-20w', 0, 0, 0.00, 420, 1, '2026-05-05 15:17:43', '2026-05-06 05:55:13'),
(66, 'Ổ cứng di động WD My Passport 1TB', 'Sao lưu dữ liệu tự động, mã hóa mật khẩu 256-bit.', 1650000.00, 1350000.00, 18, 5, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/t/h/the-nho-micro-sdxc-sandisk-extreme-pro-v30-a2-128gb-200mbs.png', 'o-cung-wd-my-passport-1tb', 1, 0, 8.00, 60, 1, '2026-05-05 15:17:43', '2026-05-15 06:51:44'),
(67, 'Thẻ nhớ MicroSD SanDisk 128GB', 'Tốc độ đọc 120MB/s, chuyên dụng cho điện thoại, camera.', 390000.00, 220000.00, 120, 5, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/t/h/the-nho-sandisk-128gb-class-10-100mbs.png', 'the-nho-sandisk-128gb', 0, 0, 20.00, 141, 1, '2026-05-05 15:17:43', '2026-05-28 07:34:16'),
(69, 'Giá treo tai nghe RGB Onikuma', 'Tích hợp đèn LED đổi màu, cổng USB mở rộng.', 320000.00, 180000.00, 45, 5, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/g/i/gia-treo-tai-nghe-hyperwork-hs01_1_.png', 'gia-treo-tai-nghe-rgb', 0, 0, 0.00, 28, 1, '2026-05-05 15:17:43', '2026-05-06 06:08:03'),
(78, 'Màn hình Lenovo L24i-30', 'Thiết kế siêu mỏng, viền gọn gàng, phù hợp làm việc văn phòng.', 2890000.00, 2300000.00, 30, 6, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/g/r/group_179_6_60.png', 'man-hinh-lenovo-l24i-30', 0, 0, 0.00, 45, 1, '2026-05-05 15:19:43', '2026-05-06 06:14:07'),
(79, 'Màn hình HKC MB24V13', 'Màn hình 24 inch Full HD giá tốt, thiết kế hiện đại.', 2190000.00, 1650000.00, 40, 6, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/m/a/man-hinh-dell-u2424h-24-inch-10.png', 'man-hinh-hkc-mb24v13', 0, 0, 0.00, 30, 1, '2026-05-05 15:19:43', '2026-05-06 06:13:44'),
(80, 'Màn hình BenQ EX2510S', 'Dòng Mobiuz, 165Hz, 1ms, HDRi, loa tích hợp TreVolo.', 5350000.00, 4500000.00, 7, 6, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/g/r/group_635_24.png', 'man-hinh-benq-ex2510s', 0, 1, 10.00, 75, 1, '2026-05-05 15:19:43', '2026-05-06 06:13:33'),
(81, 'Màn hình Xiaomi Mi Desktop Monitor 27\"', 'Góc nhìn rộng 178 độ, bảo vệ mắt khỏi ánh sáng xanh.', 3450000.00, 2900000.00, 15, 6, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/g/r/group_921_3_.png', 'man-hinh-xiaomi-27-inch', 0, 0, 0.00, 120, 1, '2026-05-05 15:19:43', '2026-05-06 06:13:19'),
(82, 'Màn hình Acer Nitro VG240Y', 'Tấm nền IPS, 165Hz, thiết kế ZeroFrame hầm hố.', 3990000.00, 3200000.00, 22, 6, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/g/r/group_895_1_.png', 'man-hinh-acer-nitro-vg240y', 0, 0, 12.00, 90, 1, '2026-05-05 15:19:43', '2026-05-06 06:13:08'),
(83, 'Màn hình Philips 241V8', 'Công nghệ SmartImage, chế độ LowBlue giảm mỏi mắt.', 2550000.00, 2100000.00, 35, 6, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/g/r/group_179_6_41.png', 'man-hinh-philips-241v8', 0, 0, 0.00, 25, 1, '2026-05-05 15:19:43', '2026-05-06 06:12:57'),
(106, 'Bàn Làm Việc Đứng Flexispot ET223 - E7', 'Bàn làm việc đứng Flexispot ET223-E7 là dòng bàn cao cấp được ra mắt vào năm 2020, là mẫu bàn làm việc có thể thay đổi chiều cao của thương hiệu Flexispot. Sản phẩm sở hữu những sự cải tiến so với bàn E4 Premium 3 stage trước đó của hãng bao gồm, tính năng chống va chạm, cho phép nâng cấp và sửa chữa và chân bàn trụ vững, cứng cáp hơn.', 950000.00, 600000.00, 40, 7, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/b/_/b_n_i_u_ch_nh_cao.jpg', 'ban-lam-viec-chan-sat-chu-k', 0, 0, 10.00, 90, 1, '2026-05-05 15:21:55', '2026-05-14 08:19:17'),
(107, 'Bàn làm việc đứng điều chỉnh độ cao Flexispot ET114N-EN1', 'ET114N-EN1 là sản phẩm bàn làm việc đứng Flexispot được thiết kế theo chuẩn Ergonomics tuân theo các tiêu chuẩn của BIFMA.  Bàn sẽ mang đến khả năng hoạt động ổn định hơn và chắc chắn hơn.', 1850000.00, 1300000.00, 15, 7, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/b/a/ban-lam-viec-thay-doi-do-cao-flexispot-e4-dergo__1__23bcf0f776f740bbb112441f0fc818a1.jpg', 'ban-lam-viec-vintage-go-cao-su', 0, 0, 0.00, 70, 1, '2026-05-05 15:21:55', '2026-05-06 08:32:33'),
(108, 'Ghế công thái học Ergonomic Sihoo M102C', 'Ghế công thái học Ergonomic Sihoo M102C có thiết kế gây ấn tượng với phần tựa lưng full lưới 2 mảnh bằng lưới PA+Fiber chất lượng cao. Trang bị phần tựa đầu cao 6cm có thể tùy chỉnh được độ nghiêng, kê tay thiết kế 3D với lớp đệm bọc vải cực thoải mái. Sở hữu trục thuỷ lực đảm bảo đạt tiêu chuẩn BIFMA, sản phẩm ghế công thái học Sihoo sử dụng với tải trọng lớn.', 3800000.00, 2900000.00, 12, 7, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/g/h/ghe-cong-thai-hoc-sihoo-m102c.png', 'ban-lam-viec-streamer-pro', 0, 1, 20.00, 240, 1, '2026-05-05 15:21:55', '2026-05-06 06:24:26'),
(109, 'Ghế công thái học HyperWork Media Airy', 'Ghế công thái học HyperWork Airy có tính năng điều chỉnh đa dạng với chất lượng ấn tượng từ thiết kế chuẩn ergonomic kèm vật liệu bền bỉ, để ưu tiên sự thoải mái cho người dùng. Không những vậy, sản phẩm ghế công thái học HyperWork còn được đề cao về mặt thẩm mỹ qua kiểu dáng hiện đại thích hợp trong mọi không gian. Đi kèm là vô số tính năng phong phú giúp tối ưu chất lượng sử dụng cho người dùng.', 4500000.00, 3500000.00, 8, 7, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/g/h/ghe-cong-thai-hoc-hyperwork-airy-1.png', 'ban-lam-viec-doi-teamwork', 0, 0, 0.00, 45, 1, '2026-05-05 15:21:55', '2026-05-06 06:23:44'),
(110, 'Ghế văn phòng công thái học Ergonomic Okamura Contessa II', 'Okamura Contessa II là sự kết hợp giữa phong cách thiết kế Ý đến từ thương hiệu ITALDESIGN và kỹ thuật hiện đại của Okamura. Chiếc ghế Okamura mang đến sự thoải mái tối ưu với người dùng, từ đó nâng cao hiệu suất làm việc.', 1250000.00, 850000.00, 18, 7, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/_/0/_0001_e5654fd5-8516-479a-83c1-2c8ef834_1_.jpg', 'ban-console-office-decor', 0, 0, 5.00, 30, 1, '2026-05-05 15:21:55', '2026-05-06 06:23:05'),
(111, 'Ghế Công Thái Học Ergonomic GTChair I-see M Đen', 'Một chiếc ghế êm ái, thoải mái và thoáng mát là điều mà mọi nhân viên văn phòng đều hướng tới. Đáp ứng được tất cả các yêu cầu trên ghế công thái học Ergonomic GTChair I-see M là sản phẩm tuyệt vời mà bạn đang tìm kiếm. Đặc biệt chúng còn giúp giảm thiểu các bệnh về lưng và cột sống.', 2100000.00, 1600000.00, 14, 7, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/a/n/anh_ghe_1_2.jpg', 'ban-lam-viec-mat-kinh-cuong-luc', 0, 0, 0.00, 73, 1, '2026-05-05 15:21:55', '2026-05-06 06:21:38'),
(112, 'Ghế Gaming Công Thái Học GTChair - Marrit X Đen', 'Phù hợp cho trẻ em, điều chỉnh được độ nghiêng mặt bàn.', 2750000.00, 2000000.00, 22, 7, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/g/h/ghe_cong_thai_hoc_1.jpg', 'ban-hoc-sinh-chong-gu', 0, 0, 0.00, 110, 1, '2026-05-05 15:21:55', '2026-05-06 06:20:49'),
(113, 'Ghế công thái học E-DRA EEC218', 'Ghế công thái học E-Dra EEC218 với chất liệu lưới cao cấp và khả năng điều chỉnh độ cao tựa lưng và đầu mang lại trải nghiệm vô cùng thoải mái. Trang bị trụ thủy lực Class-3 Bifma và bánh xe PU 50mm Bifma trên ghế đảm bảo khả năng vận hành mượt mà. Ngoài ra, sản phẩm ghế công thái học E-Dra này có khả năng chịu tải của ghế lên đến 100kg, tương thích nhiều người dùng.', 1350000.00, 950000.00, 30, 7, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/g/h/ghe-cong-thai-hoc-e-dra-eec218-1.png', 'ban-lam-viec-muji-style-v2', 0, 0, 0.00, 55, 1, '2026-05-05 15:21:55', '2026-05-06 06:20:20'),
(119, 'Đèn LED Âm Trần Philips 9W', 'Ánh sáng trung tính, thiết kế mỏng nhẹ, độ bền lên đến 20.000 giờ.', 125000.00, 95000.00, 200, 8, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/d/e/den-led-de-ban-taotronics-tt-dl064_1_1.jpg', 'den-led-am-tran-philips-9w', 0, 0, 0.00, 61, 1, '2026-05-05 15:22:57', '2026-05-06 08:30:31'),
(120, 'Đèn LED Rọi Ray 20W KingLED', 'Chuyên dùng cho shop thời trang, xoay 360 độ, độ hoàn màu CRI > 90.', 320000.00, 240000.00, 60, 8, 'https://product.hstatic.net/1000253446/product/den_ban_bao_ve_thi_luc_dien_quang_dq_dkl14_7341df5fa78a4951814f17727d6d0220_large.jpg', 'den-led-roi-ray-20w-kingled', 0, 0, 0.00, 45, 1, '2026-05-05 15:22:57', '2026-05-06 06:35:43'),
(121, 'Đèn LED Búp (Bulb) Trụ 30W', 'Tiết kiệm điện 80%, đuôi xoáy E27 phổ biến, độ sáng cao.', 95000.00, 65000.00, 100, 8, 'https://product.hstatic.net/1000253446/product/den_ban_dien_quang_dq_dkl03___kieu_choa_sat__mau_do_den___4356ff2e7f844ac7a35157737070280e_large.jpg', 'den-led-bup-tru-30w', 0, 0, 0.00, 30, 1, '2026-05-05 15:22:57', '2026-05-06 06:36:10'),
(123, 'Đèn LED Thanh Cảm Ứng Bếp', 'Cảm biến vẫy tay thông minh, lắp đặt dưới tủ bếp hoặc tủ quần áo.', 280000.00, 180000.00, 45, 8, 'https://product.hstatic.net/1000253446/product/den_ban_bao_ve_thi_luc_dien_quang_dq_dkl17___kieu_con_cho___bong_led___df9a88019712488cbdea3715a1fae9db_large.jpg', 'den-led-thanh-cam-ung-bep', 0, 1, 0.00, 140, 1, '2026-05-05 15:22:57', '2026-05-06 06:36:57'),
(126, 'Đèn LED Ốp Trần Trang Trí', 'Thiết kế hiện đại, nhiều vòng tròn lồng nhau, điều khiển remote.', 185000.00, 145000.00, 12, 8, 'https://product.hstatic.net/1000253446/product/den_ban_dien_quang_dq_dkl05___kieu_xe_hoi__mau_vang_den___8a708c65adbd4ce7a8870d91c5a237a1_large.jpg', 'den-led-op-tran-trang-tri', 0, 0, 0.00, 75, 1, '2026-05-05 15:22:57', '2026-05-28 06:57:38'),
(127, 'Đèn LED Sân Vườn Cắm Cỏ', 'Thân inox chống gỉ, ánh sáng vàng ấm, tạo điểm nhấn cảnh quan.', 195000.00, 135000.00, 55, 8, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/d/e/den-led-de-ban-taotronics-tt-dl22-1_1.jpg', 'den-led-san-vuon-cam-co', 0, 0, 0.00, 38, 1, '2026-05-05 15:22:57', '2026-05-06 06:28:17'),
(128, 'Đèn LED Chiếu Điểm Spotlight 7W', 'Góc chiếu hẹp, tạo hiệu ứng tập trung ánh sáng vào vật thể.', 215000.00, 155000.00, 70, 8, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/d/e/den-ngu-led-di-dong-taotronics-tt-dl23-1_1_1.jpg', 'den-led-chieu-diem-spotlight-7w', 0, 0, 5.00, 92, 1, '2026-05-05 15:22:57', '2026-05-16 09:01:29'),
(129, 'Test Product', '12', 1250000.00, 1200000.00, 12, 9, '../../assets/images/products/1779085063_DEALHUNTER365.jpg', 'test-product', 0, 1, 12.00, 0, 0, '2026-05-16 08:34:36', '2026-05-18 06:17:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `fullname` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_general_ci,
  `avatar` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `fullname`, `phone`, `address`, `avatar`, `is_active`, `created_at`, `updated_at`) VALUES
(7, 'user', 'user004@gmail.com', '$2y$10$pXNkx8HSlA5M3Q7BiP4ffeJA1h21edjgMAi.KhPCWwgNQuSfR2zeq', 'Nguyễn Văn User', NULL, NULL, NULL, 1, '2026-05-06 05:59:46', '2026-05-06 05:59:46'),
(8, 'vinh', 'vinh123@gmail.com', '$2y$10$zfTVSiYrwi7iV.KyL06cl.G8KoZCEAL/xOQVjVWVRcyN9L1Hi9rNO', 'Hữu Vinh', NULL, NULL, NULL, 1, '2026-05-14 08:17:40', '2026-05-16 09:57:13'),
(9, 'hao', 'hao123@gmail.com', '$2y$10$YmCti9ZYjeqjddzV7BnTt.2bMYFH796S7gSWwXtbVOITpWCJGHjcG', 'Vũ Minh Hào', NULL, NULL, NULL, 1, '2026-05-21 07:50:27', '2026-05-21 07:50:27'),
(10, 'long', 'long123@gmail.com', '$2y$10$N1jrd8EeYkz2AfX.Cqn/NO.lHw0wpmcLRbJ01mDK7d6TrI6DtSecC', 'Ngô Hoàng Long', NULL, NULL, NULL, 1, '2026-05-21 07:53:49', '2026-05-21 07:53:49'),
(11, 'v2', 'v2@gmail.com', '$2y$10$dHK5YhDzo48Sw2qZJJA5juYOL.4M0x.IpxU/CWL1Kh0o/Krq2/00i', 'Nguyễn Văn Vinh', NULL, NULL, NULL, 1, '2026-05-28 08:28:45', '2026-05-28 08:28:45'),
(12, 'cao', 'cao@gmail.com', '$2y$10$ui/lvzwpZOtpUxsn8HNdpOuzDHhDevL3DHrbLshh5BkqhaPFpD3Oq', 'Vũ Trọng Cao', NULL, NULL, NULL, 1, '2026-05-28 08:29:26', '2026-05-28 08:29:26'),
(13, 'tu', 'tu@gmail.com', '$2y$10$.Qjut4HIYR/4tNzd8LOHheRS/3XkbkxefEJ8J54lkFzH5y8Ms/Mxe', 'Ngô Minh Tú', NULL, NULL, NULL, 1, '2026-05-28 08:30:11', '2026-05-28 08:30:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_username` (`username`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_active` (`is_active`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_product` (`user_id`,`product_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `idx_user` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `idx_name` (`name`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_code` (`order_code`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_order_code` (`order_code`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_created` (`created_at`),
  ADD KEY `idx_order_status` (`status`),
  ADD KEY `idx_order_payment` (`payment_status`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `idx_order` (`order_id`);

--
-- Indexes for table `order_requests`
--
ALTER TABLE `order_requests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_order_type` (`order_id`,`request_type`),
  ADD KEY `admin_id` (`admin_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_order` (`order_id`),
  ADD KEY `idx_type` (`request_type`);

--
-- Indexes for table `order_status_history`
--
ALTER TABLE `order_status_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `changed_by` (`changed_by`),
  ADD KEY `idx_order` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `idx_category` (`category_id`),
  ADD KEY `idx_featured` (`is_featured`),
  ADD KEY `idx_new` (`is_new`),
  ADD KEY `idx_product_price` (`price`),
  ADD KEY `idx_product_discount` (`discount_percent`);
ALTER TABLE `products` ADD FULLTEXT KEY `ft_name_desc` (`name`,`description`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `order_requests`
--
ALTER TABLE `order_requests`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_status_history`
--
ALTER TABLE `order_status_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=317;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `order_requests`
--
ALTER TABLE `order_requests`
  ADD CONSTRAINT `order_requests_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_requests_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_requests_ibfk_3` FOREIGN KEY (`admin_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_status_history`
--
ALTER TABLE `order_status_history`
  ADD CONSTRAINT `order_status_history_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_status_history_ibfk_2` FOREIGN KEY (`changed_by`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
