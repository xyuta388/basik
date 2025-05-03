-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Апр 22 2025 г., 10:27
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `is221`
--

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `fio` varchar(120) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(120) NOT NULL,
  `all_sum` float NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `fio`, `address`, `phone`, `email`, `all_sum`, `created`) VALUES
(1, 'Гончаров Денис Дмитревич', 'Барнаульская 31А', '89953159909', 'enderdenis43@gmail.com', 21499, '2025-04-08 12:04:50'),
(2, 'Гончаров Денис Дмитревич', 'Барнаульская 31А', '89953159909', 'enderdenis43@gmail.com', 10000, '2025-04-17 13:40:31'),
(3, 'Гончаров Денис Дмитревич', 'Барнаульская 31А', '89953159909', 'defyonurzo@gufum.com', 10000, '2025-04-21 14:22:29'),
(4, 'Гончаров Денис Дмитревич', 'Барнаульская 31А', '89953159909', 'defyonurzo@gufum.com', 10000, '2025-04-21 15:02:05'),
(5, 'Гончаров Денис Дмитревич', 'Барнаульская 31А', '89953159909', 'enderdenis43@gmail.com', 15000, '2025-04-21 15:11:19');

-- --------------------------------------------------------

--
-- Структура таблицы `order_item`
--

CREATE TABLE `order_item` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `count_item` int(11) NOT NULL,
  `price_item` float NOT NULL,
  `sum_item` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `order_item`
--

INSERT INTO `order_item` (`id`, `order_id`, `product_id`, `count_item`, `price_item`, `sum_item`) VALUES
(1, 1, 2, 1, 10000, 10000),
(2, 1, 4, 1, 4500, 4500),
(3, 1, 5, 1, 6999, 6999),
(4, 2, 1, 1, 10000, 10000),
(5, 3, 1, 1, 10000, 10000),
(6, 4, 1, 1, 10000, 10000),
(7, 5, 3, 1, 15000, 15000);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(120) NOT NULL,
  `price` float NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `image`, `price`, `created`, `updated`) VALUES
(1, 'детский бассейн', 'детский бассейн 1-14 лет', 'myreport/images/детский.jpg', 700, '2025-04-07 13:12:52', '2025-04-07 13:12:52'),
(2, 'взрослый бассейн', 'взрослый бассейн 14-100 лет', 'myreport/images/взрослые не группа.jpg', 1500, '2025-04-07 13:17:45', '2025-04-07 13:17:45'),
(3, 'групповые занятия с детьми', 'обучение плаванью группой', 'myreport/images/группа дети.jpg', 1700, '2025-04-07 13:17:45', '2025-04-07 13:17:45'),
(4, 'занятия для взрослых', 'обучение плаванью группой', 'myreport/images/взрослый.jpg', 1700, '2025-04-07 13:17:45', '2025-04-07 13:17:45');
(5, 'соревнования по плаванью', 'покупка билета для зрителей', 'myreport/images/соревнования.jpg', 1000, '2025-04-07 13:17:45', '2025-04-07 13:17:45'),

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `is_verified` tinyint(1) DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `token`, `is_verified`, `created_at`) VALUES
(1, 'spl', 'enderdenis43@gmail.com', '$2y$10$fpj.3iFszwkZMw/Jezvd6.84Oo/ohTEhtSA/ew6S367eVVCMXpTiG', '07f41c2c2cee813377bd6389c241429e', NULL, '2025-04-15 12:26:51'),
(2, 'hop', 'enderdenig43@gmail.com', '$2y$10$T8aojPK2Ah8J4ARLwc8AFuRjYPITpBCqrDQHRBau4x1QMq.IdZDSG', '3aaca2dd5419bc5accc8e6ad42b785b2', NULL, '2025-04-15 12:28:21'),
(3, 'hop', 'enderdenii43@gmail.com', '$2y$10$o.hkfnloJ6I0pT07.op07ezXZ4HymHVyMp.JDhIQRd3YHo5Ndkd0C', '0da5a3bfe9527b1822030efdb82125b9', NULL, '2025-04-17 13:17:58'),
(5, 'hop11', 'enderden11ii43@gmail.com', '$2y$10$4nfFJGygWGCG7ujerP0UCe54gjqaMHW25TRe2JL9eJuQSU33BFQRK', 'ae8de9400569b604cf4932afc802d451', NULL, '2025-04-17 15:03:48'),
(6, '', 'ekaterinav1108@gmail.com', '$2y$10$P5acG5NPGZNqEpRdZgp8z.swFhCrn7NH3AyqxAQ6ftiuI/bW/9pV2', '5223790a16525fe82c9429f99c43ccf2', NULL, '2025-04-19 14:55:08'),
(14, 'Da', '', '$2y$10$.N5tN6osIPQeWgvbAvH1ceErEop8T3ZcOWFMFabj5SnHx3.ZNOcVO', 'e2a04eb3d75e75325e8fc256b8972136', NULL, '2025-04-21 14:44:33'),
(15, 'spl', 'enderdenis42@gmail.com', '$2y$10$pEF/2RROSmOJsZ6idSYJ1ecL34l2mRPlYfhjB3az2N0kOsz9bSKsa', 'd289f498d00319fe8abd38be323a6023', NULL, '2025-04-21 14:45:41'),
(42, '55555', 'nestedalta@gufum.com', '$2y$10$CVVVWFK8DTrqDrp8Ta7xLur/rQ86TZiwnOjho6wTmd1ZeftHzAx.S', '', 1, '2025-04-22 12:44:48');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `order_item`
--
ALTER TABLE `order_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
