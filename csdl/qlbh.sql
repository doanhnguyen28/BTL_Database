-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 21, 2023 lúc 03:27 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ban_sach`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `sex` tinyint(4) DEFAULT NULL COMMENT '0 là nữ 1 là nam 2 là khác',
  `birthday` date DEFAULT NULL,
  `type` tinyint(4) DEFAULT 0 COMMENT '0 là khách hàng, 1 là quản trị viên',
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`id`, `name`, `email`, `phone`, `password`, `address`, `image`, `sex`, `birthday`, `type`, `created`, `updated`) VALUES
(1, 'Doanh Nguyen', 'admin', '0913144019', '21232f297a57a5a743894a0e4a801fc3', 'Hà Nội', '1.jpg', NULL, '2004-11-13', 1, '2023-11-17 05:50:47', '2023-11-17 05:50:47'),
(2, 'Nguyễn Đăng Doanh', 'doanh@gmail.com', '0913144019', 'e10adc3949ba59abbe56e057f20f883e', 'Hà nội', NULL, NULL, '2004-12-11', 0, '2023-11-17 05:54:30', '2023-11-17 05:54:30'),
(3, 'Nguyễn Đăng Doanh', '123@gmail.com', '0913144019', '25f9e794323b453885f5181f1b624d0b', 'Hà nội', NULL, NULL, '2004-11-13', 0, '2023-11-17 08:43:23', '2023-11-17 08:43:23'),
(4, 'Pham Quan', 'zzzz@gmail.com', '0987416637', NULL, 'Hanoi', NULL, NULL, '3004-11-02', 0, '2023-11-21 03:34:04', '2023-11-21 03:34:04'),
(5, 'bla', 'bls@gmail.com', '32423', NULL, 'fewfew', NULL, NULL, '2023-11-30', 0, '2023-11-21 03:40:46', '2023-11-21 03:40:46'),
(6, 'bla bla', 'chien@gmail.com', '532532423', NULL, 'Hanoi', NULL, NULL, '2023-11-01', 0, '2023-11-21 03:43:32', '2023-11-21 03:43:32'),
(7, 'Nguyễn Hoài Nam', 'doanh22@gmail.com', '0912748374', NULL, 'hà nội ', NULL, NULL, '2023-11-02', 0, '2023-11-21 03:45:21', '2023-11-21 03:45:21'),
(8, 'Hà Trung Chiến', 'doanh1311@gmail.com', '0913131313', NULL, 'hà nội ', NULL, NULL, '2023-10-31', 0, '2023-11-21 03:48:30', '2023-11-21 03:48:30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(1) DEFAULT 0 COMMENT '0 là hiện 1 là ẩn',
  `parent_id` int(11) DEFAULT 0,
  `ordering` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`, `status`, `parent_id`, `ordering`) VALUES
(1, 'Sách văn học', 0, 0, 0),
(2, 'Thơ', 0, 1, 0),
(3, 'Truyện cổ tích - ngụ ngôn', 0, 1, 0),
(4, 'Truyện cười', 0, 1, 0),
(5, 'Truyện ngắn', 0, 1, 0),
(6, 'Ca dao tục ngữ', 0, 1, 0),
(7, 'Sách kinh tế', 0, 0, 0),
(8, 'Bài học kinh doanh', 0, 7, 0),
(9, 'Sách doanh nhân', 0, 7, 0),
(10, 'Sách khởi nghiệp', 0, 7, 0),
(11, 'Sách kinh tế học', 0, 7, 0),
(12, 'Sách kĩ năng làm việc', 0, 7, 0),
(13, 'Truyện - tranh', 0, 0, 0),
(14, 'Naruto', 0, 13, 0),
(15, 'One Punch Man', 0, 13, 0),
(16, 'One Piece', 0, 13, 0),
(17, 'Doraemon', 0, 13, 0),
(18, 'Truyện ngôn tình', 0, 13, 0),
(19, 'Tiểu thuyết', 0, 0, 0),
(20, 'Trong nước', 0, 19, 0),
(21, 'Nước ngoài', 0, 19, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `acc_id` int(11) DEFAULT 0,
  `proc_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT 0,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `img_link` varchar(200) NOT NULL,
  `ordering` tinyint(4) DEFAULT 0,
  `type` tinyint(4) DEFAULT 0 COMMENT '0 là slide, 1 là banner, 2 là post',
  `status` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `image`
--

INSERT INTO `image` (`id`, `title`, `content`, `img_link`, `ordering`, `type`, `status`) VALUES
(4, '', '', '1700429481_banner.png', 4, 0, 0),
(5, 'G. Meyer Books & Spiritual Traveler Press', '', '30.jpg', 0, 1, 0),
(6, 'G. Meyer Books & Spiritual Traveler Press', '', '5.jpg', 0, 1, 0),
(7, 'G. Meyer Books & Spiritual Traveler Press', 'Sale up to 30% off', '5.jpg', 0, 1, 0),
(8, 'G. Meyer Books & Spiritual Traveler Press', '', '33.jpg', 0, 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `author` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0 COMMENT '0 là hiện, 1 là ẩn',
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `news`
--

INSERT INTO `news` (`id`, `author`, `title`, `content`, `ordering`, `status`, `created`) VALUES
(1, 1, 'Khuyến mãi 20% cho các mẫu sách cũ', 'Nhân ngày 20/11 shop khuyễn mãi 20% các mặt hàng', 0, 0, '2023-11-17 05:50:47'),
(2, 1, 'Khuyến mãi tưng bừng', 'Sale sập sàn', 0, 0, '2023-11-17 05:50:47');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nxb`
--

CREATE TABLE `nxb` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nxb`
--

INSERT INTO `nxb` (`id`, `name`, `email`, `phone`, `address`) VALUES
(1, 'NXB kim đồng', '', '', ''),
(2, 'NXB tuổi trẻ', '', '', ''),
(3, 'NXB báo lao động ', '', '', ''),
(4, 'NXB thành công', '', '', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `acc_id` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `deliveri` timestamp NOT NULL DEFAULT current_timestamp(),
  `name` varchar(150) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `amount` float DEFAULT 0,
  `status` tinyint(4) DEFAULT 0 COMMENT '0 là chưa duyệt, 1 đang giao hàng, 2 là Hủy, 3 là đã giao hàng'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `acc_id`, `payment_id`, `created`, `deliveri`, `name`, `phone`, `address`, `amount`, `status`) VALUES
(1, 2, NULL, '2023-11-17 05:54:30', '2023-11-17 05:54:30', 'Nguyễn Đăng Doanh', '0913144019', 'Hà nội', 0, 3),
(2, 3, NULL, '2023-11-17 08:43:23', '2023-11-17 08:43:23', 'Nguyễn Đăng Doanh', '0913144019', 'Hà nội', 0, 3),
(3, 1, NULL, '2023-11-20 20:58:15', '2023-11-20 20:58:15', 'Doanh Nguyen', '0913144019', 'Hà Nội', 0, 0),
(4, 4, NULL, '2023-11-21 03:34:04', '2023-11-21 03:34:04', 'Pham Quan', '0987416637', 'Hanoi', 0, 0),
(5, 5, NULL, '2023-11-21 03:40:46', '2023-11-21 03:40:46', 'bla', '32423', 'fewfew', 0, 0),
(7, 7, NULL, '2023-11-21 03:45:21', '2023-11-21 03:45:21', 'Nguyễn Hoài Nam', '0912748374', 'hà nội ', 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders_detail`
--

CREATE TABLE `orders_detail` (
  `orders_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders_detail`
--

INSERT INTO `orders_detail` (`orders_id`, `prod_id`, `quantity`, `price`) VALUES
(1, 2, 1, 70000),
(2, 28, 1, 100000),
(3, 47, 1, 190000),
(4, 35, 3, 25000),
(5, 47, 1, 190000),
(7, 47, 1, 190000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `name` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `price` float DEFAULT 0,
  `sale_price` float DEFAULT 0,
  `view` int(11) DEFAULT 0,
  `mota` text DEFAULT NULL,
  `status` tinyint(4) DEFAULT 0 COMMENT '0 là hiện, 1 là ẩn, 2 là sản phẩm mới',
  `anh_bia` varchar(200) DEFAULT NULL,
  `anh_phu` text DEFAULT '',
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NOT NULL DEFAULT current_timestamp(),
  `quantity` int(11) DEFAULT 0,
  `lang` varchar(50) DEFAULT NULL,
  `cate_id` int(11) NOT NULL,
  `tacgia_id` int(11) NOT NULL,
  `nxb_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `sale_price`, `view`, `mota`, `status`, `anh_bia`, `anh_phu`, `created`, `updated`, `quantity`, `lang`, `cate_id`, `tacgia_id`, `nxb_id`) VALUES
(2, 'Truyện Cười Thế Giới - Tập 2', 100000, 70000, 0, '', 0, '1700540984-tham-tu-lung-danh-conan_bia_tap-101.jpg', '', '2023-11-17 05:50:47', '2023-11-21 04:29:44', 200, 'Tiếng Việt', 4, 4, 4),
(28, 'Khéo Ăn Nói Sẽ Có Được Thiên Hạ', 100000, 0, 0, '', 2, '1700474949-sachkns1.jpg', '', '2023-11-17 05:50:47', '2023-11-20 10:09:09', 200, 'Tiếng Nhật', 12, 4, 3),
(32, 'Doraemon Truyện Ngắn Tập 19', 22000, 0, 0, 'Doraemon', 0, '1700421808_dỏemon1.jpg', '', '2023-11-19 19:23:28', '2023-11-19 19:23:28', 200, 'Tiếng Việt ', 17, 4, 1),
(33, 'Doraemon Truyện ngắn Tập 6', 18000, 0, 0, '', 0, '1700423183_doraemon tap 6.jpg', '', '2023-11-19 19:46:23', '2023-11-19 19:46:23', 0, 'Tiếng Việt ', 17, 4, 1),
(34, 'One Piece 100', 136000, 0, 0, '', 0, '1700423362_onepiece100.jpg', '', '2023-11-19 19:49:22', '2023-11-19 19:49:22', 0, 'Tiếng Việt ', 16, 4, 1),
(35, 'Naruto - Tập 46: Naruto Trở Về!! ', 25000, 0, 0, '', 0, '1700423841_naruto46.jpg', '', '2023-11-19 19:57:21', '2023-11-19 19:57:21', 200, 'Tiếng Việt ', 14, 4, 1),
(36, 'One Punch Man 14', 120000, 0, 0, '', 0, '1700424300_opm14.jpg', '', '2023-11-19 20:05:00', '2023-11-19 20:05:00', 200, 'Tiếng Việt ', 15, 4, 1),
(37, 'Nhà Giả Kim', 70000, 0, 0, '', 0, '1700424437_nhagiakim.jpg', '', '2023-11-19 20:07:17', '2023-11-19 20:07:17', 200, 'Tiếng Việt ', 20, 4, 2),
(41, 'Thơ Cho Thiếu Nhi', 50000, 20000, 0, '', 2, '1700473487_tho.jpg', '', '2023-11-20 09:44:47', '2023-11-20 09:44:47', 200, 'Tiếng Việt ', 2, 4, 1),
(42, 'Khi Bạn Đang Mơ Thì Người Khác Đang Nỗ Lực', 300000, 200000, 0, '', 2, '1700493708_13.jpg', '', '2023-11-20 15:21:48', '2023-11-20 15:21:48', 200, 'Tiếng Việt ', 21, 1, 1),
(43, 'One Piece 99', 150000, 100000, 0, '', 2, '1700494106_op99.jpg', '', '2023-11-20 15:28:26', '2023-11-20 15:28:26', 200, 'Tiếng Việt ', 16, 4, 1),
(44, 'One Piece 54', 160000, 140000, 0, '', 0, '1700510743_op54.jpg', '', '2023-11-20 20:05:43', '2023-11-20 20:05:43', 200, 'Tiếng Việt ', 16, 4, 1),
(45, 'One Piece 19', 160000, 140000, 0, '', 2, '1700511287_op19.jpg', '', '2023-11-20 20:14:47', '2023-11-20 20:14:47', 200, 'Tiếng Việt ', 16, 4, 1),
(46, 'One Piece 104', 160000, 140000, 0, '', 2, '1700511466_op104.jpg', '', '2023-11-20 20:17:46', '2023-11-20 20:17:46', 200, 'Tiếng Việt ', 16, 4, 1),
(47, 'Đám Trẻ Ở Đại Dương Đen', 390000, 190000, 0, '', 2, '1700511520_2r.jpg', '', '2023-11-20 20:18:40', '2023-11-20 20:18:40', 200, 'Tiếng Việt ', 20, 4, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tacgia`
--

CREATE TABLE `tacgia` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `tieu_su` text DEFAULT NULL,
  `hinh_anh` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tacgia`
--

INSERT INTO `tacgia` (`id`, `name`, `tieu_su`, `hinh_anh`, `email`, `phone`, `address`) VALUES
(1, 'Nguyễn du', '', '1.jpg', '', '', ''),
(4, 'Nguyễn tuấn anh ', '', '1.jpg', '', '', '');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proc_id` (`proc_id`),
  ADD KEY `acc_id` (`acc_id`);

--
-- Chỉ mục cho bảng `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author` (`author`);

--
-- Chỉ mục cho bảng `nxb`
--
ALTER TABLE `nxb`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `acc_id` (`acc_id`),
  ADD KEY `payment_id` (`payment_id`);

--
-- Chỉ mục cho bảng `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD PRIMARY KEY (`orders_id`,`prod_id`),
  ADD KEY `prod_id` (`prod_id`);

--
-- Chỉ mục cho bảng `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cate_id` (`cate_id`),
  ADD KEY `tacgia_id` (`tacgia_id`),
  ADD KEY `nxb_id` (`nxb_id`);

--
-- Chỉ mục cho bảng `tacgia`
--
ALTER TABLE `tacgia`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `nxb`
--
ALTER TABLE `nxb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT cho bảng `tacgia`
--
ALTER TABLE `tacgia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`proc_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`acc_id`) REFERENCES `account` (`id`);

--
-- Các ràng buộc cho bảng `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`author`) REFERENCES `account` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`acc_id`) REFERENCES `account` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`);

--
-- Các ràng buộc cho bảng `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD CONSTRAINT `orders_detail_ibfk_1` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `orders_detail_ibfk_2` FOREIGN KEY (`prod_id`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`cate_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`tacgia_id`) REFERENCES `tacgia` (`id`),
  ADD CONSTRAINT `product_ibfk_3` FOREIGN KEY (`nxb_id`) REFERENCES `nxb` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
