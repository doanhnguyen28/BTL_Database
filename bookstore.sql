

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;



CREATE TABLE `orderdetails` (
  `order_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------



CREATE TABLE `bookdetails` (
  `id` int(11) NOT NULL,
  `languages` varchar(20) DEFAULT NULL,
  `publishers` varchar(50) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `pages` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `intro` text DEFAULT NULL,
  `image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------



CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `orderedDate` date DEFAULT NULL,
  `shippedDate` date DEFAULT NULL,
  `expextedDate` date DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------



CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `gender` bit(1) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------



CREATE TABLE `depot` (
  `book_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `sold` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------



CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `publishDate` date NOT NULL,
  `author` varchar(50) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------



CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------



CREATE TABLE `book_category` (
  `book_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`order_id`);


ALTER TABLE `bookdetails`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_book_orders` (`book_id`),
  ADD KEY `FK_customer_orders` (`customer_id`);


ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `depot`
  ADD PRIMARY KEY (`book_id`);


ALTER TABLE `book`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `book_category`
  ADD KEY `FK_category_book` (`book_id`),
  ADD KEY `FK_category` (`category_id`);



ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;




ALTER TABLE `orderdetails`
  ADD CONSTRAINT `FK_order_detail` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);


ALTER TABLE `bookdetails`
  ADD CONSTRAINT `FK_book` FOREIGN KEY (`id`) REFERENCES `book` (`id`),
  ADD CONSTRAINT `FK_detail_book` FOREIGN KEY (`id`) REFERENCES `book` (`id`);


ALTER TABLE `orders`
  ADD CONSTRAINT `FK_customer_order` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `FK_book_order` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`);


ALTER TABLE `depot`
  ADD CONSTRAINT `FK_book_depot` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`);


ALTER TABLE `book_category`
  ADD CONSTRAINT `FK_category_book` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  ADD CONSTRAINT `FK_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
