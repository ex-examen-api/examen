-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-05-2024 a las 17:32:21
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `examen`
--
CREATE DATABASE IF NOT EXISTS `examen` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `examen`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `sp_agregar_cita`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_agregar_cita` (IN `_citas` VARCHAR(200))   BEGIN
INSERT INTO cita(citas) VALUES (_citas);
END$$

DROP PROCEDURE IF EXISTS `sp_eliminar_cita`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminar_cita` (IN `_idcita` INT)   BEGIN
DELETE FROM cita
WHERE idcita = _idcita;
END$$

DROP PROCEDURE IF EXISTS `sp_listar_cita`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listar_cita` ()   BEGIN
SELECT idcita,citas FROM cita;
END$$

DROP PROCEDURE IF EXISTS `sp_modificar_cita`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_modificar_cita` (IN `_idcita` INT, IN `_citas` VARCHAR(200))   BEGIN
UPDATE cita 
SET citas = _citas
WHERE idcita= _idcita;
END$$

DROP PROCEDURE IF EXISTS `sp_mostrar_cita`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrar_cita` (IN `_idcita` INT)   BEGIN 
SELECT citas FROM cita
WHERE idcita = _idcita;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

DROP TABLE IF EXISTS `cita`;
CREATE TABLE `cita` (
  `idcita` int NOT NULL,
  `citas` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `cita`
--

INSERT INTO `cita` (`idcita`, `citas`) VALUES
(2, 'm'),
(3, 'cabeza\r\n'),
(4, 'nose'),
(5, 'enter'),
(6, 'dermatass'),
(7, 'dermatassd');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`idcita`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `idcita` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
