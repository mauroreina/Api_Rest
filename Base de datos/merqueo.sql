-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-07-2020 a las 19:35:38
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `merqueo`
--

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `calcular_inventario`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `calcular_inventario` (
`id` int(11)
,`name` varchar(50)
,`cantidad` decimal(33,0)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `id_prod` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `inventory`
--

INSERT INTO `inventory` (`id`, `id_prod`, `fecha`, `cantidad`) VALUES
(1, 1, '2019-03-01', 3),
(2, 2, '2019-03-01', 3),
(3, 3, '2019-03-01', 7),
(4, 4, '2019-03-01', 8),
(5, 5, '2019-03-01', 10),
(6, 6, '2019-03-01', 15),
(7, 7, '2019-03-01', 26),
(8, 8, '2019-03-01', 11),
(9, 9, '2019-03-01', 1),
(10, 10, '2019-03-01', 8),
(11, 11, '2019-03-01', 7),
(12, 12, '2019-03-01', 8),
(13, 13, '2019-03-01', 2),
(14, 14, '2019-03-01', 1),
(15, 15, '2019-03-01', 1),
(16, 16, '2019-03-01', 9),
(17, 17, '2019-03-01', 17),
(18, 18, '2019-03-01', 8),
(19, 19, '2019-03-01', 9),
(20, 20, '2019-03-01', 9),
(21, 21, '2019-03-01', 3),
(22, 22, '2019-03-01', 6),
(23, 23, '2019-03-01', 9),
(24, 24, '2019-03-01', 9),
(25, 25, '2019-03-01', 10),
(26, 26, '2019-03-01', 40),
(27, 27, '2019-03-01', 2),
(28, 28, '2019-03-01', 3),
(29, 29, '2019-03-01', 2),
(30, 30, '2019-03-01', 1),
(31, 31, '2019-03-01', 9),
(32, 32, '2019-03-01', 10),
(33, 33, '2019-03-01', 2),
(34, 34, '2019-03-01', 3),
(35, 35, '2019-03-01', 3),
(36, 36, '2019-03-01', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `id_prod` int(11) NOT NULL,
  `id_prioridad` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `user` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `deliveryDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id`, `id_prod`, `id_prioridad`, `address`, `user`, `quantity`, `deliveryDate`) VALUES
(1, 1, 1, 'KR 14 # 87 - 20 ', 'Sofia', 1, '2019-03-01'),
(1, 2, 1, 'KR 14 # 87 - 20 ', 'Sofia', 21, '2019-03-01'),
(1, 3, 1, 'KR 14 # 87 - 20 ', 'Sofia', 10, '2019-03-01'),
(1, 4, 1, 'KR 14 # 87 - 20 ', 'Sofia', 5, '2019-03-01'),
(1, 37, 1, 'KR 14 # 87 - 20 ', 'Sofia', 7, '2019-03-01'),
(2, 5, 1, 'KR 20 # 164A - 5 ', 'Angel', 100, '2019-03-01'),
(2, 6, 1, 'KR 20 # 164A - 5 ', 'Angel', 60, '2019-03-01'),
(3, 7, 3, 'KR 13 # 74 - 38 ', 'Hocks', 4, '2019-03-01'),
(3, 8, 3, 'KR 13 # 74 - 38 ', 'Hocks', 3, '2019-03-01'),
(3, 9, 3, 'KR 13 # 74 - 38 ', 'Hocks', 4, '2019-03-01'),
(3, 10, 3, 'KR 13 # 74 - 38 ', 'Hocks', 8, '2019-03-01'),
(3, 11, 3, 'KR 13 # 74 - 38 ', 'Hocks', 5, '2019-03-01'),
(4, 4, 1, 'CL 93 # 12 - 9 ', 'Michael', 2, '2019-03-01'),
(4, 12, 1, 'CL 93 # 12 - 9 ', 'Michael', 3, '2019-03-01'),
(4, 13, 1, 'CL 93 # 12 - 9 ', 'Michael', 2, '2019-03-01'),
(4, 14, 1, 'CL 93 # 12 - 9 ', 'Michael', 4, '2019-03-01'),
(4, 15, 1, 'CL 93 # 12 - 9 ', 'Michael', 3, '2019-03-01'),
(5, 16, 1, 'CL 71 # 3 - 74 ', 'Bar de Alex', 1500, '2019-03-01'),
(6, 15, 2, 'KR 20 # 134A - 5 ', 'Sabor Criollo', 2, '2019-03-01'),
(6, 17, 2, 'KR 20 # 134A - 5 ', 'Sabor Criollo', 2, '2019-03-01'),
(6, 18, 2, 'KR 20 # 134A - 5 ', 'Sabor Criollo', 3, '2019-03-01'),
(6, 19, 2, 'KR 20 # 134A - 5 ', 'Sabor Criollo', 2, '2019-03-01'),
(6, 20, 2, 'KR 20 # 134A - 5 ', 'Sabor Criollo', 3, '2019-03-01'),
(7, 21, 2, 'CL 80 # 14 - 38 ', 'El Pollo Rojo', 3, '2019-03-01'),
(7, 22, 2, 'CL 80 # 14 - 38 ', 'El Pollo Rojo', 2, '2019-03-01'),
(7, 23, 2, 'CL 80 # 14 - 38 ', 'El Pollo Rojo', 2, '2019-03-01'),
(7, 24, 2, 'CL 80 # 14 - 38 ', 'El Pollo Rojo', 15, '2019-03-01'),
(7, 39, 2, 'CL 80 # 14 - 38 ', 'El Pollo Rojo', 4, '2019-03-01'),
(8, 5, 7, 'KR 14 # 98 - 74 ', 'All Salad', 1, '2019-03-01'),
(8, 22, 7, 'KR 14 # 98 - 74 ', 'All Salad', 4, '2019-03-01'),
(8, 25, 7, 'KR 14 # 98 - 74 ', 'All Salad', 3, '2019-03-01'),
(8, 26, 7, 'KR 14 # 98 - 74 ', 'All Salad', 2, '2019-03-01'),
(8, 27, 7, 'KR 14 # 98 - 74 ', 'All Salad', 1, '2019-03-01'),
(9, 22, 1, 'KR 58 # 93 - 1 ', 'Parrilla y sabor', 1, '2019-03-01'),
(10, 7, 1, 'CL 93B # 17 - 12 ', 'restaurante yerbabuena ', 1, '2019-03-01'),
(11, 17, 10, 'KR 68D # 98A - 11 ', 'Luis David', 1, '2019-03-01'),
(11, 19, 10, 'KR 68D # 98A - 11 ', 'Luis David', 6, '2019-03-01'),
(11, 29, 10, 'KR 68D # 98A - 11 ', 'Luis David', 1, '2019-03-01'),
(11, 30, 10, 'KR 68D # 98A - 11 ', 'Luis David', 1, '2019-03-01'),
(11, 41, 10, 'KR 68D # 98A - 11 ', 'Luis David', 1, '2019-03-01'),
(12, 5, 2, 'AC 72 # 20 - 45 ', 'David Carruyo', 1, '2019-03-01'),
(12, 7, 2, 'AC 72 # 20 - 45 ', 'David Carruyo', 1, '2019-03-01'),
(12, 25, 2, 'AC 72 # 20 - 45 ', 'David Carruyo', 2, '2019-03-01'),
(12, 31, 2, 'AC 72 # 20 - 45 ', 'David Carruyo', 25, '2019-03-01'),
(13, 28, 3, 'KR 22 # 122 - 57 ', 'MARIO', 2, '2019-03-01'),
(13, 30, 3, 'KR 22 # 122 - 57 ', 'MARIO', 1, '2019-03-01'),
(13, 32, 3, 'KR 22 # 122 - 57 ', 'MARIO', 1, '2019-03-01'),
(13, 33, 3, 'KR 22 # 122 - 57 ', 'MARIO', 1, '2019-03-01'),
(13, 43, 3, 'KR 22 # 122 - 57 ', 'MARIO', 1, '2019-03-01'),
(14, 12, 8, 'KR 88 # 72A - 26 ', 'Harold', 1, '2019-03-01'),
(14, 16, 8, 'KR 88 # 72A - 26 ', 'Harold', 3, '2019-03-01'),
(14, 34, 8, 'KR 88 # 72A - 26 ', 'Harold', 3, '2019-03-01'),
(14, 35, 8, 'KR 88 # 72A - 26 ', 'Harold', 3, '2019-03-01'),
(14, 36, 8, 'KR 88 # 72A - 26 ', 'Harold', 1, '2019-03-01'),
(15, 28, 9, 'KR 14 # 87 - 20 ', 'Sofia', 1, '2019-03-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `priority`
--

CREATE TABLE `priority` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `priority`
--

INSERT INTO `priority` (`id`, `name`) VALUES
(1, 'Alta'),
(2, 'Media'),
(3, 'Baja'),
(7, '7'),
(8, '8'),
(9, '9'),
(10, '10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `id_prov` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `id_prov`, `name`) VALUES
(1, 1, 'Leche'),
(2, 1, 'Huevos'),
(3, 1, 'Manzana Verde'),
(4, 1, 'Pepino Cohombro'),
(5, 1, 'Pimenton Rojo'),
(6, 3, 'Kiwi'),
(7, 3, 'Cebolla Cabezona Blanca Limpia'),
(8, 3, 'Habichuela'),
(9, 3, 'Mango Tommy Maduro'),
(10, 3, 'Tomate Chonto Pinton'),
(11, 3, 'Zanahoria Grande'),
(12, 3, 'Aguacate Maduro'),
(13, 3, 'Kale o Col Rizada'),
(14, 3, 'Cebolla Cabezona Roja Limpia'),
(15, 3, 'Tomate Chonto Maduro'),
(16, 2, 'Acelga'),
(17, 2, 'Espinaca Bogotana x 500grs'),
(18, 3, 'Ahuyama'),
(19, 3, 'Cebolla Cabezona Blanca Sin Pelar'),
(20, 3, 'Melon'),
(21, 3, 'Cebolla Cabezona Roja Sin Pelar'),
(22, 3, 'Cebolla Larga Junca x 500grs'),
(23, 3, 'Hierbabuena x 500grs'),
(24, 1, 'Lechuga Crespa Verde'),
(25, 1, 'Limon Tahiti'),
(26, 1, 'Mora de Castilla'),
(27, 1, 'Pimenton Verde'),
(28, 2, 'Tomate Larga Vida Maduro'),
(29, 2, 'Cilantro x 500grs'),
(30, 2, 'Fresa Jugo'),
(31, 2, 'Papa R-12 Mediana'),
(32, 2, 'Curuba '),
(33, 2, 'Brocoli'),
(34, 2, 'Aguacate Hass Pinton'),
(35, 2, 'Aguacate Hass Maduro '),
(36, 2, 'Aguacate Pinton'),
(37, 4, 'Pan Bimbo'),
(39, 4, 'Lechuga Crespa Morada'),
(41, 4, 'Banano'),
(43, 4, 'Banano2'),
(45, 1, 'Guanabana'),
(46, 1, 'Anon'),
(47, 2, 'Chirimolla');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `providers`
--

CREATE TABLE `providers` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `providers`
--

INSERT INTO `providers` (`id`, `name`) VALUES
(1, 'Ruby'),
(2, 'Raul'),
(3, 'Agelica'),
(4, 'Generico');

-- --------------------------------------------------------

--
-- Estructura para la vista `calcular_inventario`
--
DROP TABLE IF EXISTS `calcular_inventario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `calcular_inventario`  AS  select `products`.`id` AS `id`,`products`.`name` AS `name`,sum(`orders`.`quantity`) * -1 AS `cantidad` from (`orders` join `products`) where `orders`.`id_prod` = `products`.`id` and `orders`.`deliveryDate` = '2019-03-01' group by `products`.`id`,`products`.`name` union select `products`.`id` AS `id`,`products`.`name` AS `name`,sum(`inventory`.`cantidad`) AS `cantidad` from (`inventory` join `products`) where `inventory`.`id_prod` = `products`.`id` and `inventory`.`fecha` = '2019-03-01' group by `products`.`id`,`products`.`name` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_prod` (`id_prod`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`,`id_prod`),
  ADD KEY `id_prod` (`id_prod`),
  ADD KEY `orders_ibfk_1` (`id_prioridad`);

--
-- Indices de la tabla `priority`
--
ALTER TABLE `priority`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_prov` (`id_prov`);

--
-- Indices de la tabla `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`id_prod`) REFERENCES `products` (`id`);

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_prioridad`) REFERENCES `priority` (`id`);

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_prov`) REFERENCES `providers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
