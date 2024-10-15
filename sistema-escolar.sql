-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 15-10-2024 a las 02:17:10
-- Versión del servidor: 9.0.1
-- Versión de PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema-escolar`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

DROP TABLE IF EXISTS `actividad`;
CREATE TABLE IF NOT EXISTS `actividad` (
  `actividad_id` int NOT NULL AUTO_INCREMENT,
  `nombre_actividad` varchar(100) NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`actividad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
CREATE TABLE IF NOT EXISTS `alumnos` (
  `alumno_id` int NOT NULL AUTO_INCREMENT,
  `nombre_alumno` varchar(100) NOT NULL,
  `edad` int NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `telefono` bigint NOT NULL,
  `correo` varchar(100) NOT NULL,
  `fecha_nac` date NOT NULL,
  `fecha_registro` date NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`alumno_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aulas`
--

DROP TABLE IF EXISTS `aulas`;
CREATE TABLE IF NOT EXISTS `aulas` (
  `aula_id` int NOT NULL AUTO_INCREMENT,
  `nombre_aula` varchar(100) NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`aula_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones`
--

DROP TABLE IF EXISTS `calificaciones`;
CREATE TABLE IF NOT EXISTS `calificaciones` (
  `calificacion_id` int NOT NULL AUTO_INCREMENT,
  `alumno_id` int NOT NULL,
  `materia_id` int NOT NULL,
  `periodo_id` int NOT NULL,
  PRIMARY KEY (`calificacion_id`),
  KEY `alumno_id` (`alumno_id`),
  KEY `materia_id` (`materia_id`),
  KEY `periodo_id` (`periodo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grados`
--

DROP TABLE IF EXISTS `grados`;
CREATE TABLE IF NOT EXISTS `grados` (
  `grado_id` int NOT NULL AUTO_INCREMENT,
  `nombre_grado` varchar(100) NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`grado_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

DROP TABLE IF EXISTS `materias`;
CREATE TABLE IF NOT EXISTS `materias` (
  `materia_id` int NOT NULL AUTO_INCREMENT,
  `nombre_materia` varchar(100) NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`materia_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

DROP TABLE IF EXISTS `notas`;
CREATE TABLE IF NOT EXISTS `notas` (
  `nota_id` int NOT NULL AUTO_INCREMENT,
  `materia_id` int NOT NULL,
  `alumno_id` int NOT NULL,
  `actividad_id` int NOT NULL,
  `valor_nota` int NOT NULL,
  `periodo_id` int NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`nota_id`),
  KEY `materia_id` (`materia_id`),
  KEY `alumno_id` (`alumno_id`),
  KEY `actividad_id` (`actividad_id`),
  KEY `periodo_id` (`periodo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodos`
--

DROP TABLE IF EXISTS `periodos`;
CREATE TABLE IF NOT EXISTS `periodos` (
  `periodo_id` int NOT NULL AUTO_INCREMENT,
  `nombre_periodo` varchar(100) NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`periodo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procesoalumno`
--

DROP TABLE IF EXISTS `procesoalumno`;
CREATE TABLE IF NOT EXISTS `procesoalumno` (
  `procesoa_id` int NOT NULL AUTO_INCREMENT,
  `alumno_id` int NOT NULL,
  `proceso_id` int NOT NULL,
  `estadop` int NOT NULL,
  PRIMARY KEY (`procesoa_id`),
  KEY `alumno_id` (`alumno_id`),
  KEY `proceso_id` (`proceso_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procesoprofesor`
--

DROP TABLE IF EXISTS `procesoprofesor`;
CREATE TABLE IF NOT EXISTS `procesoprofesor` (
  `proceso_id` int NOT NULL AUTO_INCREMENT,
  `grado_id` int NOT NULL,
  `aula_id` int NOT NULL,
  `profesor_id` int NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`proceso_id`),
  KEY `grado_id` (`grado_id`),
  KEY `aula_id` (`aula_id`),
  KEY `profesor_id` (`profesor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

DROP TABLE IF EXISTS `profesor`;
CREATE TABLE IF NOT EXISTS `profesor` (
  `profesor_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `telefono` bigint NOT NULL,
  `correo` varchar(100) NOT NULL,
  `nivel_est` varchar(100) NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`profesor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE IF NOT EXISTS `rol` (
  `rol_id` int NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(100) NOT NULL,
  PRIMARY KEY (`rol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`rol_id`, `nombre_rol`) VALUES
(1, 'Administrador'),
(2, 'Asistente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `usuario_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `rol` int NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`usuario_id`),
  KEY `rol` (`rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `nombre`, `usuario`, `clave`, `rol`, `estado`) VALUES
(1, 'Luis Noguera', 'admin', '$2y$10$0R6PdfuRSnsORi1WtYlTAuxZcEHS2t0b97OuhmTBDbf2c6zNphFhC', 1, 1),
(2, 'Jesus Mireles', 'jesus1', '$2y$10$jCtsfOfFwiKBwKvESViukuA0YSg4W3MbZIJTQNmDx.au2EqDXBtv.', 2, 0),
(3, 'Andres', 'andres1', '$2y$10$NRNhbzPgwxb8TKqrVqZopu7Pwe.9eJVtK7srAcJWSSAtGXKv03nx.', 1, 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`materia_id`) REFERENCES `materias` (`materia_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notas_ibfk_2` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`alumno_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notas_ibfk_3` FOREIGN KEY (`actividad_id`) REFERENCES `actividad` (`actividad_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notas_ibfk_4` FOREIGN KEY (`periodo_id`) REFERENCES `periodos` (`periodo_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `procesoalumno`
--
ALTER TABLE `procesoalumno`
  ADD CONSTRAINT `procesoalumno_ibfk_1` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`alumno_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `procesoalumno_ibfk_2` FOREIGN KEY (`proceso_id`) REFERENCES `procesoprofesor` (`proceso_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `procesoprofesor`
--
ALTER TABLE `procesoprofesor`
  ADD CONSTRAINT `procesoprofesor_ibfk_1` FOREIGN KEY (`aula_id`) REFERENCES `aulas` (`aula_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `procesoprofesor_ibfk_2` FOREIGN KEY (`grado_id`) REFERENCES `grados` (`grado_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `procesoprofesor_ibfk_3` FOREIGN KEY (`profesor_id`) REFERENCES `profesor` (`profesor_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`rol`) REFERENCES `rol` (`rol_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
