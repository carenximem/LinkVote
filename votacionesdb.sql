-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-11-2024 a las 21:21:22
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `votacionesdb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidatos`
--

CREATE TABLE `candidatos` (
  `id_candidato` bigint(20) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `partido` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `imagen_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `candidatos`
--

INSERT INTO `candidatos` (`id_candidato`, `nombre`, `partido`, `descripcion`, `imagen_url`) VALUES
(1, 'Carlos Fernando Galan Pachon', 'PARTIDO POLO DEMOCRÁTICO ALTERNATIVO\r\n', 'Político y periodista, hijo del líder Luis Carlos Galán. Ha sido senador y concejal de Bogotá, destacándose por su trabajo en transparencia y reformas políticas. Lidera el partido \"Nuevo Liberalismo\" y promueve iniciativas para combatir la corrupción y fortalecer la democracia', 'https://forocsu.udistrital.edu.co/sites/foro-csu/files/imagenes/personal/csu/2024/alcalde-carlos-galan.jpeg.jpg'),
(2, 'Juan Daniel Oviedo Arango', 'PARTIDO CENTRO DEMOCRÁTICO\r\n', 'Economista y exdirector del DANE, conocido por modernizar la entidad y por su estilo claro al comunicar datos estadísticos. Destacado por su gestión eficiente y transparente, mejoró la calidad de las estadísticas públicas y promovió la inclusión de temas de género y diversidad en los censos nacionales', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrqC3IYpOoxtLKqvh32H2XzzvfxY7Y_gbuqg&s'),
(3, 'Claudia Nayibe Lopez Hernandez', 'Alianza Verde', 'Política y exsenadora, reconocida por su activismo en temas de anticorrupción, igualdad de género y medio ambiente. Figura destacada en la Alianza Verde, ha impulsado políticas progresistas para mejorar la calidad de vida en Bogotá y promover la sostenibilidad', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhif8i819hif8vx85XbGc6qotCMIKNRFshLQ&s'),
(4, 'Gustavo Francisco Petro Urrego', 'Colombia Humana', 'Político y exsenador, conocido por su liderazgo en temas de justicia social y su enfoque progresista en políticas económicas y sociales. Ha promovido la equidad, la protección ambiental y la justicia económica, con un énfasis en la defensa de los derechos humanos', 'https://upload.wikimedia.org/wikipedia/commons/e/ef/Presidente_Gustavo_Petro_Urrego.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elecciones`
--

CREATE TABLE `elecciones` (
  `id_eleccion` bigint(20) NOT NULL,
  `nombre_eleccion` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `elecciones`
--

INSERT INTO `elecciones` (`id_eleccion`, `nombre_eleccion`, `descripcion`, `fecha_inicio`, `fecha_fin`) VALUES
(3, 'Elección Senado 2024', 'Elección para senadores', '2024-10-10 08:00:00', '2024-10-10 18:00:00'),
(5, 'Elección Presidencial 2028', 'Elección para presidente', '2028-10-01 08:00:00', '2028-10-02 18:00:00'),
(6, 'Elección Alcaldía 2028', 'Elección para alcalde', '2028-10-05 08:00:00', '2028-10-05 18:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` bigint(20) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contraseña_hash` varchar(256) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('activo','no activo') NOT NULL DEFAULT 'activo',
  `nombre_rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `email`, `contraseña_hash`, `direccion`, `fecha_registro`, `estado`, `nombre_rol`) VALUES
(20445394, 'Liliana Montaño', 'LILIANA.MONTANO1030@HOTMAIL.COM', '10302205', 'carrera 141 b 143-54\r\napartamento', '2024-11-21 06:32:10', 'no activo', 'votante'),
(1068954428, 'caren ximena', 'carenximenamalaver@gmail.com', NULL, 'Calle 132 C Bis #107 B25', '2024-11-21 05:00:00', 'activo', 'administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votos`
--

CREATE TABLE `votos` (
  `id_voto` bigint(20) NOT NULL,
  `id_usuario` bigint(20) DEFAULT NULL,
  `id_candidato` bigint(20) DEFAULT NULL,
  `id_eleccion` bigint(20) DEFAULT NULL,
  `fecha_voto` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `votos`
--

INSERT INTO `votos` (`id_voto`, `id_usuario`, `id_candidato`, `id_eleccion`, `fecha_voto`) VALUES
(3, 1068954428, 1, 5, '2024-11-21 06:14:06'),
(4, 1068954428, 3, 3, '2024-11-21 06:17:32'),
(5, 1068954428, 1, 6, '2024-11-21 06:28:01'),
(9, NULL, 3, NULL, '2024-11-21 19:01:40'),
(10, NULL, 1, NULL, '2024-11-21 19:11:19'),
(11, NULL, 1, NULL, '2024-11-21 19:12:55'),
(12, NULL, 3, NULL, '2024-11-21 19:13:09'),
(13, NULL, 3, NULL, '2024-11-21 19:13:11'),
(14, NULL, 4, NULL, '2024-11-21 19:13:27'),
(15, NULL, 4, NULL, '2024-11-21 19:13:30'),
(16, NULL, 1, NULL, '2024-11-21 19:15:42'),
(17, NULL, 2, NULL, '2024-11-21 19:17:31'),
(18, NULL, 2, NULL, '2024-11-21 19:17:35'),
(19, NULL, 1, NULL, '2024-11-21 19:21:14'),
(20, NULL, 3, NULL, '2024-11-21 19:23:05'),
(21, NULL, 1, NULL, '2024-11-21 19:24:12');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `candidatos`
--
ALTER TABLE `candidatos`
  ADD PRIMARY KEY (`id_candidato`);

--
-- Indices de la tabla `elecciones`
--
ALTER TABLE `elecciones`
  ADD PRIMARY KEY (`id_eleccion`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `votos`
--
ALTER TABLE `votos`
  ADD PRIMARY KEY (`id_voto`),
  ADD UNIQUE KEY `id_usuario` (`id_usuario`,`id_eleccion`),
  ADD KEY `id_candidato` (`id_candidato`),
  ADD KEY `id_eleccion` (`id_eleccion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `votos`
--
ALTER TABLE `votos`
  MODIFY `id_voto` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `votos`
--
ALTER TABLE `votos`
  ADD CONSTRAINT `votos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `votos_ibfk_2` FOREIGN KEY (`id_candidato`) REFERENCES `candidatos` (`id_candidato`),
  ADD CONSTRAINT `votos_ibfk_3` FOREIGN KEY (`id_eleccion`) REFERENCES `elecciones` (`id_eleccion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
