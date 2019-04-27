-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 10 2019 г., 00:25
-- Версия сервера: 5.7.19
-- Версия PHP: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `practbd`
--

DELIMITER $$
--
-- Процедуры
--
CREATE DEFINER=`root`@`%` PROCEDURE `addclient` (IN `fio` VARCHAR(70))  MODIFIES SQL DATA
INSERT INTO `clients` (`id`, `fio`) VALUES (NULL, fio)$$

CREATE DEFINER=`root`@`%` PROCEDURE `addorder` (IN `client_id` INT(10) UNSIGNED, IN `service_id` INT(10) UNSIGNED, IN `date` DATE)  MODIFIES SQL DATA
INSERT INTO `orders` (`id`, `client_id`, `service_id`, `date`) VALUES (NULL, client_id, service_id, date)$$

CREATE DEFINER=`root`@`%` PROCEDURE `addservice` (IN `name` VARCHAR(50))  MODIFIES SQL DATA
INSERT INTO `services` (`id`, `name`) VALUES (NULL, name)$$

CREATE DEFINER=`root`@`%` PROCEDURE `changeclient` (IN `fio` VARCHAR(70), IN `id` INT(10) UNSIGNED)  MODIFIES SQL DATA
UPDATE `clients` SET `fio` = fio WHERE `clients`.`id` = id$$

CREATE DEFINER=`root`@`%` PROCEDURE `changeorder` (IN `client_id` INT(10) UNSIGNED, IN `service_id` INT(10) UNSIGNED, IN `date` DATE, IN `id` INT(10) UNSIGNED)  MODIFIES SQL DATA
UPDATE `orders` SET `client_id` = client_id, `service_id` = service_id, `date` = date WHERE `orders`.`id` = id$$

CREATE DEFINER=`root`@`%` PROCEDURE `changeservice` (IN `id` INT(10) UNSIGNED, IN `name` VARCHAR(50))  MODIFIES SQL DATA
UPDATE `services` SET `name` = name WHERE `services`.`id` = id$$

CREATE DEFINER=`root`@`%` PROCEDURE `deleteclient` (IN `id` INT(10) UNSIGNED)  MODIFIES SQL DATA
DELETE FROM `clients` WHERE `clients`.`id` = id$$

CREATE DEFINER=`root`@`%` PROCEDURE `deleteorder` (IN `id` INT(10) UNSIGNED)  MODIFIES SQL DATA
DELETE FROM `orders` WHERE `orders`.`id` = id$$

CREATE DEFINER=`root`@`%` PROCEDURE `deleteservice` (IN `id` INT(10) UNSIGNED)  MODIFIES SQL DATA
DELETE FROM `services` WHERE `services`.`id` = id$$

CREATE DEFINER=`root`@`%` PROCEDURE `getclient` (IN `id` INT(10) UNSIGNED)  READS SQL DATA
SELECT id as 'ID', fio as 'ФИО', age as 'Возраст' from clients WHERE `clients`.`id` = id$$

CREATE DEFINER=`root`@`%` PROCEDURE `getclients` ()  READS SQL DATA
SELECT id as 'ID', fio as 'ФИО', age as 'Возраст' from clients$$

CREATE DEFINER=`root`@`%` PROCEDURE `getorder` (IN `id` INT(10) UNSIGNED)  READS SQL DATA
SELECT orders.id AS 'ID', clients.fio AS 'Клиент', services.name AS 'Услуга', orders.date AS 'Дата' FROM `orders` JOIN clients on orders.client_id=clients.id JOIN services on orders.service_id=services.id WHERE orders.id=id$$

CREATE DEFINER=`root`@`%` PROCEDURE `getorders` ()  READS SQL DATA
SELECT orders.id AS 'ID', clients.fio AS 'Клиент', services.name AS 'Услуга', orders.date AS 'Дата' FROM `orders` JOIN clients on orders.client_id=clients.id JOIN services on orders.service_id=services.id$$

CREATE DEFINER=`root`@`%` PROCEDURE `getservice` (IN `id` INT(10) UNSIGNED)  READS SQL DATA
SELECT id as 'ID', name as 'Наименование', price as 'Стоимость' from services WHERE `services`.`id` = id$$

CREATE DEFINER=`root`@`%` PROCEDURE `getservices` ()  READS SQL DATA
SELECT id as 'ID', name as 'Наименование', price as 'Стоимость' from services$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `fio` varchar(30) NOT NULL,
  `age` varchar(15) NOT NULL DEFAULT '20'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `clients`
--

INSERT INTO `clients` (`id`, `fio`, `age`) VALUES
(1, 'Корепанов В.А.', '20'),
(2, 'Белкин А.В.', '26'),
(3, 'Измайлов Г.А.', '34'),
(4, 'Пушкин А.С.', '56');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `client_id`, `service_id`, `date`) VALUES
(1, 1, 3, '2019-04-10'),
(2, 3, 2, '2019-01-31'),
(3, 2, 1, '2019-02-16'),
(4, 4, 2, '2019-03-09'),
(5, 1, 2, '2019-01-25'),
(6, 2, 2, '2019-02-03'),
(7, 2, 3, '2019-02-01');

-- --------------------------------------------------------

--
-- Структура таблицы `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `price` int(15) NOT NULL DEFAULT '10000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `services`
--

INSERT INTO `services` (`id`, `name`, `price`) VALUES
(1, 'Продвижение канала YouTube', 20000),
(2, 'Накрутка просмотров', 100000),
(3, 'Оформление канала', 25000);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
