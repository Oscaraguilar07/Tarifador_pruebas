-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-02-2024 a las 14:38:31
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tarificador`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `costo`
--

CREATE TABLE `costo` (
  `id` int(11) NOT NULL,
  `costo_recursos` varchar(256) NOT NULL,
  `costo` int(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `costo`
--

INSERT INTO `costo` (`id`, `costo_recursos`, `costo`) VALUES
(1, 'ARRIENDO Y ADECUACIONES\r\n', 577400),
(2, 'SERVICIOS PUBLICOS, ASEO Y CAFETERIA\r\n', 470000),
(3, 'PUESTO DE TRABAJO Y EQUIPOS COMPARTIDOS\r\n', 405900),
(4, 'COORDINACION\r\n', 1006400);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `id` int(11) NOT NULL,
  `perfil` varchar(256) NOT NULL,
  `costo_mes` int(200) NOT NULL,
  `costodia` int(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`id`, `perfil`, `costo_mes`, `costodia`) VALUES
(1, 'AUXILIAR BÁSICO SIN EQUIPOS (SALARIO BASE $908,526)\r\n', 3114, 10418300),
(2, 'TÉCNICO CON EQUIPO Y LECTORA (SALARIO BASE $965.300)\r\n', 326626700, 11859900),
(3, 'TÉCNICO CON EQUIPO, LECTORA Y SCANNER (SALARIO BASE $965.300)\r\n', 395213800, 13861100),
(4, 'TÉCNICO CON EQUIPO Y LECTORA (SALARIO BASE $1.100.000)\r\n', 356626700, 16260400),
(5, 'SUPERVISOR CAD CON EQUIPO PORTÁTIL (SALARIO BASE $1.851.337)\r\n', 0, 0),
(6, 'COORDINADOR CAD CON EQUIPO PORTÁTIL (SALARIO BASE $2.314.171)\r\n', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procesos_global`
--

CREATE TABLE `procesos_global` (
  `id` int(11) NOT NULL,
  `nombre` varchar(256) NOT NULL,
  `etiquetas_cj` enum('Sí','No') NOT NULL,
  `etiquetas_ud` enum('Sí','No') NOT NULL,
  `Unidad_de_medida` varchar(256) NOT NULL,
  `Prod_x_dia_x_rrhh` int(15) NOT NULL,
  `dias_holgura` int(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `procesos_global`
--

INSERT INTO `procesos_global` (`id`, `nombre`, `etiquetas_cj`, `etiquetas_ud`, `Unidad_de_medida`, `Prod_x_dia_x_rrhh`, `dias_holgura`) VALUES
(1, 'EMPAQUE O REEMPAQUE DE INFORMACION EN CAJAS\r\n', 'Sí', 'No', 'CAJA\r\n', 143, 0),
(2, 'CLASIFICACION DE ARCHIVO Y UNIFICACION DE EXPEDIENTES\r\n', 'No', 'No', 'UNIDAD DOCUMENTAL\r\n', 130, 3),
(3, 'RECEPCIÓN POR PUNTEO DE UNIDADES DOCUMENTALES\r\n', 'Sí', 'Sí', 'UNIDAD DOCUMENTAL\r\n', 1150, 0),
(4, 'RECEPCIÓN POR CONTEO DE UNIDADES DOCUMENTALES\r\n', 'Sí', 'Sí', 'UNIDAD DOCUMENTAL\r\n', 1470, 0),
(5, 'RECEPCIÓN POR PUNTEO DE CAJAS\r\n', 'Sí', 'No', 'CAJA\r\n', 370, 0),
(6, 'CORRELACIÓN DE CODIGOS DE BARRAS\r\n', 'Sí', 'Sí', 'UNIDAD DOCUMENTAL\r\n', 1500, 1),
(7, 'CONFORMACIÓN DE UNIDADES DOCUMENTALES\r\n', 'No', 'No', 'UNIDAD DOCUMENTAL\r\n', 240, 1),
(8, 'VALIDACION DE INVENTARIO HASTA 2 CAMPOS\r\n', 'Sí', 'Sí', 'UNIDAD DOCUMENTAL\r\n', 660, 2),
(9, 'VALIDACION DE INVENTARIO HASTA 3 CAMPOS\r\n', 'Sí', 'Sí', 'UNIDAD DOCUMENTAL\r\n', 500, 2),
(10, 'VALIDACION DE INVENTARIO HASTA 4 CAMPOS\r\n', 'Sí', 'Sí', 'UNIDAD DOCUMENTAL\r\n', 400, 2),
(11, 'LEVANTAMIENTO DE INVENTARIO 2 CAMPOS DESCRIPTIVOS\r\n', 'Sí', 'Sí', 'UNIDAD DOCUMENTAL\r\n', 540, 1),
(12, 'LEVANTAMIENTO DE INVENTARIO 3 CAMPOS DESCRIPTIVOS\r\n', 'Sí', 'Sí', 'UNIDAD DOCUMENTAL\r\n', 402, 1),
(13, 'LEVANTAMIENTO DE INVENTARIO 4 CAMPOS DESCRIPTIVOS\r\n', 'Sí', 'Sí', 'UNIDAD DOCUMENTAL\r\n', 323, 1),
(14, 'LEVANTAMIENTO DE INVENTARIO 6 CAMPOS DESCRIPTIVOS\r\n', 'Sí', 'Sí', 'UNIDAD DOCUMENTAL\r\n', 230, 2),
(15, 'LEVANTAMIENTO DE INVENTARIO EN ESTADO NATURAL\r\n', 'Sí', 'Sí', 'UNIDAD DOCUMENTAL\r\n', 100, 3),
(16, 'LEVANTAMIENTO DE INVENTARIO FUID\r\n', 'Sí', 'Sí', 'UNIDAD DOCUMENTAL\r\n', 75, 3),
(17, 'INSERCIÓN DE DOCUMENTOS EN EXPEDIENTES CONFORMADOS\r\n', 'No', 'No', 'DOCUMENTO\r\n', 120, 1),
(18, 'REUBICACIÓN DE UNIDADES DOCUMENTALES ENTRE FONDOS CONTENEDORES\r\n', 'No', 'No', 'UNIDAD DOCUMENTAL\r\n', 1300, 1),
(19, 'DIGITALIZACIÓN CON INDEXACION DE HASTA CUATRO CAMPOS POR UNIDAD DOCUMENTAL\r\n', 'No', 'No', 'IMAGEN\r\n', 2900, 3),
(20, 'DIGITALIZACIÓN CON AUTOINDEXACION POR UNIDAD DOCUMENTAL\r\n', 'No', 'No', 'IMAGEN\r\n', 3200, 3),
(21, 'ORGANIZACIÓN TECNICA SIN HOJA DE CONTROL\r\n', 'Sí', 'Sí', 'METRO LINEAL\r\n', 0, 5),
(22, 'ORGANIZACIÓN TECNICA CON HOJA DE CONTROL\r\n', 'Sí', 'Sí', 'METRO LINEAL\r\n', 0, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `correo_electronico` varchar(254) NOT NULL,
  `contrasena_hash` varchar(255) NOT NULL,
  `tipo_usuario` varchar(20) NOT NULL,
  `username` varchar(200) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `fecha_creacion_token` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `apellido`, `correo_electronico`, `contrasena_hash`, `tipo_usuario`, `username`, `token`, `fecha_creacion_token`) VALUES
(1, 'manuel', 'berdugo', 'manuel@example.com', '189dc919781ad912e1a1c8c6139865429c3aa6b2bb8f3b8991fb2010d98c04d6', 'admin', 'manuelberdugo', 'TOKEN_GENERADO', '2024-02-20 00:00:00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `costo`
--
ALTER TABLE `costo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo_electronico` (`correo_electronico`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `username_unique` (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `costo`
--
ALTER TABLE `costo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
