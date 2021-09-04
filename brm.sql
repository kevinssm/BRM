-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-09-2021 a las 08:44:54
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `brm`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `dv_id` int(11) NOT NULL,
  `dv_idPv` int(11) NOT NULL,
  `dt_nombre` varchar(50) NOT NULL,
  `dt_cantidad` int(11) NOT NULL,
  `dt_idProducto` int(11) NOT NULL,
  `dt_precio` int(11) NOT NULL,
  `dt_fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `inv_id` int(11) NOT NULL,
  `inv_idProducto` int(11) NOT NULL,
  `inv_idLote` int(11) NOT NULL,
  `inv_cantidad` int(11) NOT NULL,
  `inv_fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`inv_id`, `inv_idProducto`, `inv_idLote`, `inv_cantidad`, `inv_fecha`) VALUES
(84, 7, 1, 20, '2021-09-04 03:47:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lote`
--

CREATE TABLE `lote` (
  `lot_id` int(11) NOT NULL,
  `lot_nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `lote`
--

INSERT INTO `lote` (`lot_id`, `lot_nombre`) VALUES
(1, 'numero1'),
(2, 'numero2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pre_venta`
--

CREATE TABLE `pre_venta` (
  `pv_id` int(11) NOT NULL,
  `pv_precio` int(11) NOT NULL,
  `pv_idProducto` int(11) NOT NULL,
  `pv_cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `prod_id` int(11) NOT NULL,
  `prod_nombre` varchar(100) NOT NULL,
  `prod_stock` int(11) NOT NULL,
  `prod_fechavencimiento` date NOT NULL,
  `prod_precio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`prod_id`, `prod_nombre`, `prod_stock`, `prod_fechavencimiento`, `prod_precio`) VALUES
(7, 'producto4', 1090, '2021-09-08', 3100),
(23, 'producto5', 3400, '2021-09-01', 12000),
(24, 'producto6', 4400, '2021-09-02', 22000),
(25, 'producto7', 5400, '2021-09-02', 22001),
(26, 'producto8', 6400, '2021-09-02', 22002),
(27, 'producto9', 7400, '2021-09-02', 22003),
(28, 'producto10', 8400, '2021-09-02', 22004),
(29, 'producto11', 9400, '2021-09-02', 22005),
(31, 'nuevo2', 2000, '2021-09-01', 3400);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`dv_id`),
  ADD KEY `dt_idProducto` (`dt_idProducto`),
  ADD KEY `dv_idPv` (`dv_idPv`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`inv_id`),
  ADD KEY `inv_idProducto` (`inv_idProducto`,`inv_idLote`),
  ADD KEY `inv_idLote` (`inv_idLote`);

--
-- Indices de la tabla `lote`
--
ALTER TABLE `lote`
  ADD PRIMARY KEY (`lot_id`);

--
-- Indices de la tabla `pre_venta`
--
ALTER TABLE `pre_venta`
  ADD PRIMARY KEY (`pv_id`),
  ADD KEY `pv_idProducto` (`pv_idProducto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`prod_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `dv_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `inv_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT de la tabla `lote`
--
ALTER TABLE `lote`
  MODIFY `lot_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pre_venta`
--
ALTER TABLE `pre_venta`
  MODIFY `pv_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`dt_idProducto`) REFERENCES `productos` (`prod_id`),
  ADD CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`dv_idPv`) REFERENCES `pre_venta` (`pv_id`);

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`inv_idProducto`) REFERENCES `productos` (`prod_id`),
  ADD CONSTRAINT `inventario_ibfk_2` FOREIGN KEY (`inv_idLote`) REFERENCES `lote` (`lot_id`);

--
-- Filtros para la tabla `pre_venta`
--
ALTER TABLE `pre_venta`
  ADD CONSTRAINT `pre_venta_ibfk_1` FOREIGN KEY (`pv_idProducto`) REFERENCES `productos` (`prod_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
