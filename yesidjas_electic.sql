-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Servidor: localhost:3306
-- Tiempo de generación: 15-02-2016 a las 09:27:19
-- Versión del servidor: 5.6.26-cll-lve
-- Versión de PHP: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `yesidjas_electic`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elt_acciones`
--

CREATE TABLE IF NOT EXISTS `elt_acciones` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `estado` tinyint(4) DEFAULT '1',
  `nombre` varchar(50) DEFAULT NULL,
  `modulo_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `modulo_id` (`modulo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `elt_acciones`
--

INSERT INTO `elt_acciones` (`id`, `estado`, `nombre`, `modulo_id`) VALUES
(1, 1, 'ver', 1),
(2, 1, 'ver', 2),
(3, 1, 'ver', 3),
(4, 1, 'ver', 4),
(5, 1, 'ver', 5),
(6, 1, 'ver', 6),
(7, 1, 'ver', 7),
(8, 1, 'ver', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elt_compromisos`
--

CREATE TABLE IF NOT EXISTS `elt_compromisos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `estado` tinyint(4) NOT NULL DEFAULT '1',
  `grupos_id` bigint(20) DEFAULT NULL,
  `tarea_id` bigint(20) NOT NULL,
  `delegado_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_compromisos_Grupos1_idx` (`grupos_id`),
  KEY `fk_compromisos_Tareas1_idx` (`tarea_id`),
  KEY `fk_compromisos_Personas1_idx` (`delegado_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Volcado de datos para la tabla `elt_compromisos`
--

INSERT INTO `elt_compromisos` (`id`, `estado`, `grupos_id`, `tarea_id`, `delegado_id`) VALUES
(1, 1, NULL, 1, 3),
(2, 1, NULL, 2, NULL),
(3, 1, NULL, 2, 4),
(4, 1, 1, 10, NULL),
(5, 1, NULL, 14, 5),
(6, 1, NULL, 14, 7),
(9, 1, NULL, 15, 5),
(10, 1, NULL, 17, 11),
(11, 1, NULL, 17, 5),
(12, 1, NULL, 17, 10),
(13, 1, NULL, 18, 10),
(14, 1, NULL, 19, 10),
(15, 1, NULL, 22, 10),
(16, 1, NULL, 24, 12),
(17, 1, NULL, 18, 15),
(18, 1, NULL, 17, 14),
(19, 1, NULL, 17, 12),
(20, 1, NULL, 25, 12),
(21, 1, NULL, 27, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elt_grupos`
--

CREATE TABLE IF NOT EXISTS `elt_grupos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lider_id` bigint(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text,
  `estado` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_Grupos_Personas1_idx` (`lider_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `elt_grupos`
--

INSERT INTO `elt_grupos` (`id`, `lider_id`, `nombre`, `descripcion`, `estado`) VALUES
(1, 4, 'Grupo de Mujeres', 'Equipo de gestoras de campaña', 1),
(2, 3, 'Grupo Ejemplo Gestor', '', -1),
(3, 16, 'Logistica', '', 1),
(4, 15, 'Grupo Prueba', '', -1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elt_insumos`
--

CREATE TABLE IF NOT EXISTS `elt_insumos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `estado` tinyint(4) DEFAULT '1',
  `tarea_id` bigint(20) DEFAULT NULL,
  `valor_estimado` float DEFAULT '0',
  `valor_real` float DEFAULT '0',
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Volcado de datos para la tabla `elt_insumos`
--

INSERT INTO `elt_insumos` (`id`, `estado`, `tarea_id`, `valor_estimado`, `valor_real`, `nombre`) VALUES
(4, -1, 17, 500, 900, 'Sonido'),
(3, 1, 23, NULL, NULL, 'dsdsd'),
(5, -1, 17, 400, 500, 'Tarima'),
(6, -1, 28, NULL, NULL, 'sasAS'),
(7, -1, 27, NULL, NULL, 'dasdsad'),
(8, -1, 27, NULL, NULL, 'bb'),
(9, -1, 28, NULL, NULL, 'ddd'),
(10, -1, 28, 450, 450, 'asas'),
(11, -1, 28, NULL, NULL, 'asas'),
(12, -1, 28, NULL, NULL, 'xxzxz'),
(13, -1, 27, 0, 0, 'ewewewq'),
(14, 1, 27, 300, 300, 'ewewewq'),
(15, -1, 28, 3400, 323, 'xdds'),
(16, 1, 28, 30, 600, 'sas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elt_miembros`
--

CREATE TABLE IF NOT EXISTS `elt_miembros` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `grupo_id` bigint(20) NOT NULL,
  `persona_id` bigint(20) NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_miembros_Grupos1_idx` (`grupo_id`),
  KEY `fk_miembros_Personas1_idx` (`persona_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Volcado de datos para la tabla `elt_miembros`
--

INSERT INTO `elt_miembros` (`id`, `grupo_id`, `persona_id`, `estado`) VALUES
(1, 1, 5, 1),
(2, 1, 7, 1),
(3, 1, 3, 1),
(4, 2, 4, -1),
(5, 2, 10, -1),
(6, 2, 10, -1),
(7, 2, 4, -1),
(8, 2, 8, -1),
(9, 3, 15, -1),
(10, 3, 15, 1),
(11, 4, 12, -1),
(12, 3, 14, 1),
(13, 3, 16, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elt_modulos`
--

CREATE TABLE IF NOT EXISTS `elt_modulos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `URI` text NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '1',
  `padre_id` bigint(20) NOT NULL DEFAULT '0',
  `iconCls` varchar(50) DEFAULT NULL,
  `expanded` tinyint(1) DEFAULT '0',
  `selectable` tinyint(1) DEFAULT '0',
  `orden` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `elt_modulos`
--

INSERT INTO `elt_modulos` (`id`, `nombre`, `URI`, `estado`, `padre_id`, `iconCls`, `expanded`, `selectable`, `orden`) VALUES
(1, 'Personas', 'modules.personas.Personas', 1, 0, 'x-fa fa-user', 0, 0, 2),
(2, 'Grupos de Campaña', 'modules.grupos.Grupos', 1, 0, 'x-fa fa-group', 0, 0, 3),
(3, 'Registro de Adeptos', 'modules.adeptos.Adeptos', 1, 0, 'x-fa fa-male', 0, 0, 4),
(4, 'Agenda de Tareas', 'modules.tareas.Tareas', 1, 0, 'x-fa fa-calendar-o', 0, 0, 7),
(5, 'Calendario de Eventos', 'modules.eventos.Eventos', 1, 0, 'x-fa fa-calendar', 0, 0, 5),
(6, 'Costo de Actividades', 'modules.finanzas.Finanzas', 1, 0, 'x-fa fa-dollar', 0, 0, 6),
(7, 'Mi Agenda', 'modules.tareas.TareasEstado', 1, 0, 'x-fa fa-tasks', 0, 0, 1),
(8, 'Organigrama', 'pages.OrganigramaWindow', 1, 0, 'x-fa fa-sitemap', 0, 0, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elt_parametros`
--

CREATE TABLE IF NOT EXISTS `elt_parametros` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `elt_parametros`
--

INSERT INTO `elt_parametros` (`id`, `nombre`, `estado`) VALUES
(1, 'Fases', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elt_perfiles`
--

CREATE TABLE IF NOT EXISTS `elt_perfiles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `elt_perfiles`
--

INSERT INTO `elt_perfiles` (`id`, `nombre`, `estado`) VALUES
(1, 'Super Administradores', 1),
(2, 'Administradores', 1),
(3, 'Lideres', 1),
(4, 'Comités', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elt_permisos`
--

CREATE TABLE IF NOT EXISTS `elt_permisos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `accion_id` bigint(20) NOT NULL,
  `perfil_id` bigint(20) NOT NULL,
  `estado` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_Permisos_Modulos_idx` (`accion_id`),
  KEY `fk_Permisos_Perfiles1_idx` (`perfil_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Volcado de datos para la tabla `elt_permisos`
--

INSERT INTO `elt_permisos` (`id`, `accion_id`, `perfil_id`, `estado`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 1),
(3, 3, 1, 1),
(4, 4, 1, 1),
(5, 5, 1, 1),
(6, 6, 1, 1),
(7, 7, 1, 1),
(9, 1, 2, 1),
(10, 2, 2, 1),
(11, 3, 2, 1),
(12, 4, 2, 1),
(13, 5, 2, 1),
(14, 6, 2, 1),
(15, 7, 2, 1),
(18, 2, 3, 1),
(19, 3, 3, 1),
(20, 4, 3, 1),
(21, 5, 3, 1),
(22, 6, 3, 1),
(23, 7, 3, 1),
(24, 8, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elt_personas`
--

CREATE TABLE IF NOT EXISTS `elt_personas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipo_EAP` enum('miembro','adepto') DEFAULT 'miembro',
  `perfil_id` bigint(20) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `clave` varchar(100) DEFAULT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '1',
  `primer_nombre` varchar(50) NOT NULL,
  `segundo_nombre` varchar(50) DEFAULT NULL,
  `primer_apellido` varchar(50) NOT NULL,
  `segundo_apellido` varchar(50) DEFAULT NULL,
  `identificacion` varchar(50) NOT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `celular` varchar(45) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `barrio` varchar(50) DEFAULT NULL,
  `padre_id` bigint(20) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Personas_Perfiles1_idx` (`perfil_id`),
  KEY `padre_id` (`padre_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Volcado de datos para la tabla `elt_personas`
--

INSERT INTO `elt_personas` (`id`, `tipo_EAP`, `perfil_id`, `usuario`, `clave`, `estado`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `identificacion`, `telefono`, `celular`, `email`, `direccion`, `barrio`, `padre_id`, `foto`) VALUES
(1, NULL, 1, 'super', 'e10adc3949ba59abbe56e057f20f883e', 1, 'super', '', 'admin', '', '123', '', '', 'super@g.com', '', NULL, NULL, 'resources/images/user-profile/Zm90by0x.png'),
(2, 'miembro', 2, 'admin', 'c4ca4238a0b923820dcc509a6f75849b', -1, 'admin', '', 'admin', '', '456', NULL, NULL, NULL, NULL, NULL, NULL, 'resources/images/user-profile/Zm90by0y.png'),
(3, 'miembro', 3, 'gestor', 'c4ca4238a0b923820dcc509a6f75849b', -1, 'GESTOR', '', 'UNO', '', '123456', '', '', 'A2@a.com', '', NULL, NULL, NULL),
(4, 'miembro', 3, 'mpatino', 'e10adc3949ba59abbe56e057f20f883e', -1, 'Maria', 'De Jesús', 'Patiño', 'Garcia', '1079914355', '', '', 'maria@gmail.com', 'Carrera 14 # 18 - 15', NULL, NULL, 'resources/images/user-profile/Zm90by00.png'),
(5, 'miembro', 3, 'fvargas', 'e10adc3949ba59abbe56e057f20f883e', -1, 'Fabian', 'Enrique', 'Vargas', 'Fontalvo', '10779912244', '3333', '', 'okiloco2@gmail.com', '', NULL, NULL, 'resources/images/user-profile/Zm90by01.png'),
(6, 'miembro', 3, 'ovargas', 'e10adc3949ba59abbe56e057f20f883e', -1, 'Oscar', 'Eduardo', 'Vargas', 'Fontalvo', '19078234', '3333', '', 'estefi3088@gmail.com', '', NULL, NULL, NULL),
(7, 'miembro', 3, 'estefi3088', 'e10adc3949ba59abbe56e057f20f883e', -1, 'Estefani', 'Segundo Nombre', 'Julio', 'De Arcos', '109914344', '', '', 'estefi3088@gmail.com', '', NULL, NULL, NULL),
(8, 'miembro', 3, 'asas', 'c4ca4238a0b923820dcc509a6f75849b', -1, 'XSDSDSD', 'Segundo Nombre', 'qaeae', 'Segundo Apellido', '322', '323232', '', 'd@g.com', '', NULL, NULL, 'resources/images/user-profile/Zm90by04.png'),
(9, 'miembro', 3, 'jvargas', '202cb962ac59075b964b07152d234b70', -1, 'Juan', 'David', 'Vargas', 'Pacheco', '21212323', '', '', 'juanchy@gmail.com', '', NULL, NULL, 'resources/images/user-profile/Zm90by05.png'),
(10, 'miembro', 3, 'jvelez', 'e10adc3949ba59abbe56e057f20f883e', 1, 'Jonathan', 'Segundo Nombre', 'Velez', 'Segundo Apellido', '1047338191', '', '3008814995', 'javc2009@gmail.com', 'calle 123', NULL, 3, NULL),
(11, 'miembro', 3, 'a1988', 'c4ca4238a0b923820dcc509a6f75849b', -1, 'Diana', 'Segundo Nombre', 'Barros', 'Segundo Apellido', '987654321', '123', '', 'a@a1988.com', '', NULL, NULL, NULL),
(12, 'miembro', 2, 'beleno', '6bbdc40bdbd10a8b20d875fa2d5e5fd3', 1, 'Carmelo', '', 'Beleño', 'De Leon', '73268678', '', '3002260551', 'beleno75@hotmail.com', 'Calle 21 # 4-67', NULL, 13, NULL),
(13, 'adepto', NULL, '', 'd41d8cd98f00b204e9800998ecf8427e', 1, 'Lineth', '', 'Sagbini', 'Castro', '30843377', '', '3216531515', '', 'Calle 21 # 4 - 67', '', 16, NULL),
(14, 'miembro', 2, 'silviavergara', '0ba996b2e6576f4e3f3fa9a477be62a4', 1, 'Silvia', 'Del Carme', 'Vergara', 'De Jassir', '45430145', '', '3012584951', 'silviavergara54@hotmail.com', 'Calle 22 # 1 - 35', NULL, NULL, NULL),
(15, 'miembro', 3, 'jvelez', 'c4ca4238a0b923820dcc509a6f75849b', 1, 'Jonathan', '', 'Velez', '', '1047338191', '', '', 'javc2009@gmail.com', '', NULL, NULL, NULL),
(16, 'miembro', 3, 'yessid1975', '495bcac544d1f6bc56b62508a836aadc', 1, 'Yessid', 'Rafael', 'De Leon', 'Cantillo', '73268177', '', '3002281334', 'yessid1975@hotmail.com', '', NULL, 12, NULL),
(17, 'miembro', 2, 'leonorreales', '5f83ce5d598bf30b6ecdfcd5559eec56', 1, 'Leonor', 'Patricia', 'Reales', 'Molinares', '30896605', '', '3116987718', 'leoreales@yahoo.com', 'Cr 2 #21-73', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elt_tareas`
--

CREATE TABLE IF NOT EXISTS `elt_tareas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creador_id` bigint(20) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `descripcion` text,
  `tipo_EAP` enum('tarea','compromiso','evento','item') NOT NULL DEFAULT 'tarea',
  `prioridad_EAP` enum('normal','bajo','medio','alto') DEFAULT 'normal',
  `situacion_id` bigint(20) DEFAULT NULL,
  `fecha_hora_inicio` datetime DEFAULT NULL,
  `fecha_hora_final` datetime DEFAULT NULL,
  `fecha_hora_creacion` datetime NOT NULL,
  `ubicacion` varchar(255) DEFAULT NULL,
  `color` tinyint(5) DEFAULT '0',
  `estado` tinyint(4) DEFAULT '1',
  `valor_real` float DEFAULT NULL,
  `valor_estimado` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Tareas_Personas1_idx` (`creador_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Volcado de datos para la tabla `elt_tareas`
--

INSERT INTO `elt_tareas` (`id`, `creador_id`, `nombre`, `descripcion`, `tipo_EAP`, `prioridad_EAP`, `situacion_id`, `fecha_hora_inicio`, `fecha_hora_final`, `fecha_hora_creacion`, `ubicacion`, `color`, `estado`, `valor_real`, `valor_estimado`) VALUES
(1, 1, 'Presentación Pública Plan de Gobierno', '', 'evento', '', 0, '2015-08-20 10:30:00', '2015-08-20 11:30:00', '2015-08-15 11:24:54', 'Plaza Principal', NULL, -1, NULL, NULL),
(2, 1, 'Trabajo de campo', 'Visita casa a casa, en el barrio San José, de Pivijay.', 'tarea', '', 0, '2015-08-20 07:00:00', '2015-08-20 07:30:00', '2015-08-16 11:56:25', '', NULL, -1, 0, 0),
(3, 1, 'Friar Hoy es na Obligación', '', 'tarea', NULL, NULL, '2015-08-20 00:00:00', NULL, '2015-08-15 11:31:18', NULL, NULL, -1, NULL, NULL),
(4, 1, 'Nueva Tarea', '', 'tarea', '', 0, '2015-08-19 07:00:00', '2015-08-19 07:30:00', '2015-08-16 14:38:58', NULL, NULL, -1, 0, 0),
(5, 1, 'XSD', '', 'tarea', '', 0, '2015-08-19 07:00:00', '0000-00-00 00:00:00', '2015-08-16 14:55:57', NULL, NULL, -1, 0, 0),
(6, 1, 'CDFFF', '', 'tarea', '', 0, '2015-08-20 07:00:00', '0000-00-00 00:00:00', '2015-08-16 14:58:43', NULL, NULL, -1, 0, 0),
(7, 1, 'XXXX', '', 'tarea', '', 0, '2015-08-20 07:00:00', '0000-00-00 00:00:00', '2015-08-16 15:00:29', NULL, NULL, -1, 0, 0),
(8, 1, 'aas', '', 'tarea', '', 0, '2015-08-20 07:00:00', '0000-00-00 00:00:00', '2015-08-16 16:01:46', NULL, NULL, -1, 0, 0),
(9, 1, 'XSDSD', '', 'evento', '', 0, '2015-08-19 07:00:00', '2015-08-19 07:30:00', '2015-08-16 16:15:39', 'asas', NULL, -1, NULL, NULL),
(10, 1, 'XSDSD', '', 'evento', '', 0, '2015-08-19 07:00:00', '2015-08-19 07:30:00', '2015-08-16 16:24:52', 'asas', NULL, -1, NULL, NULL),
(11, 1, 'Compromiso 1', '', 'tarea', NULL, NULL, '2015-08-20 00:00:00', NULL, '2015-08-16 16:32:21', NULL, NULL, -1, NULL, NULL),
(12, 1, 'sasasa', '', 'tarea', NULL, NULL, '2015-08-20 00:00:00', NULL, '2015-08-16 16:37:02', NULL, NULL, -1, NULL, NULL),
(13, 1, 'ddd', '', 'tarea', NULL, NULL, '2015-08-19 00:00:00', NULL, '2015-08-16 17:04:28', NULL, NULL, -1, NULL, NULL),
(14, 1, 'Pruebas del Sistema', 'Probar la funcionalidad de los Módulos del Sistema', 'tarea', '', 1, '2015-08-21 08:00:00', '2015-08-21 22:00:00', '2015-08-21 20:24:36', NULL, NULL, -1, 0, 0),
(15, 1, 'Prueba 1', '', 'tarea', '', 1, '2015-08-22 07:00:00', '0000-00-00 00:00:00', '2015-08-22 18:40:23', NULL, NULL, -1, 0, 0),
(16, 1, 'Prueba 2', '', 'tarea', NULL, NULL, '2015-08-22 00:00:00', NULL, '2015-08-22 18:06:43', NULL, NULL, -1, NULL, NULL),
(17, 1, 'Logistica Presentacion Plaza Central', '', 'tarea', '', 0, '2015-08-25 07:00:00', '2015-08-25 07:30:00', '2015-08-23 12:22:17', NULL, NULL, 1, 0, 300000),
(18, 1, 'Evento 1', '', 'evento', '', 0, '2015-08-27 07:00:00', '2015-08-31 07:30:00', '2015-08-22 19:15:56', '', NULL, -1, NULL, NULL),
(19, 3, 'Prueba', '', 'evento', '', 0, '2015-08-22 07:00:00', '2015-08-25 07:30:00', '2015-08-22 19:21:36', '4', NULL, -1, NULL, NULL),
(20, 1, 'Prueba 5', '', 'tarea', '', 0, '2015-08-27 07:00:00', '0000-00-00 00:00:00', '2015-08-22 19:51:24', NULL, NULL, -1, 0, 0),
(21, 1, 'Prueba 5', '', 'tarea', '', 0, '2015-08-27 07:00:00', '0000-00-00 00:00:00', '2015-08-22 19:51:34', NULL, NULL, -1, 0, 0),
(22, 1, 'Prueba 7', '', 'tarea', '', 0, '2015-08-27 07:00:00', '2015-08-31 07:30:00', '2015-08-22 19:56:57', NULL, NULL, -1, 0, 0),
(23, 5, 'wewe', '', 'tarea', '', 0, '2015-08-23 07:00:00', '0000-00-00 00:00:00', '2015-08-23 03:05:13', NULL, NULL, -1, 0, 0),
(24, 1, 'Trabajo de Campo - Barranca Nueva', 'Visita casa a casa, para exponer el plan de gobierno.', 'evento', 'alto', 1, '2015-08-23 11:00:00', '2015-08-23 14:00:00', '2015-08-23 11:59:29', 'Barranca Nueva', NULL, 1, NULL, NULL),
(25, 1, 'Transportar el sonido', '', 'tarea', '', 0, '2015-08-25 00:00:00', '0000-00-00 00:00:00', '2015-08-23 12:21:52', NULL, NULL, 1, NULL, NULL),
(26, 12, 'Visita Yucal', 'Visitas', 'evento', '', 0, '2015-08-31 15:00:00', '2015-08-31 18:00:00', '2015-08-31 13:35:12', 'Yucal', NULL, 1, NULL, NULL),
(27, 1, 'Prueba', '', 'tarea', '', 1, '2015-09-05 07:00:00', '0000-00-00 00:00:00', '2015-09-05 17:46:44', NULL, NULL, -1, 0, 0),
(28, 1, 'Prueba', '', 'tarea', '', 0, '2015-09-05 07:00:00', '2015-09-30 07:30:00', '2015-09-05 17:12:00', NULL, NULL, -1, 0, 0),
(29, 1, 'sdsdasdsa', '', 'tarea', NULL, NULL, '2015-09-05 00:00:00', NULL, '2015-09-05 18:42:26', NULL, NULL, -1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elt_tareas_sub_tareas`
--

CREATE TABLE IF NOT EXISTS `elt_tareas_sub_tareas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `estado` tinyint(4) DEFAULT '1',
  `tarea_id` bigint(20) NOT NULL,
  `sub_tarea_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tarea_id` (`tarea_id`),
  KEY `sub_tarea_id` (`sub_tarea_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `elt_tareas_sub_tareas`
--

INSERT INTO `elt_tareas_sub_tareas` (`id`, `estado`, `tarea_id`, `sub_tarea_id`) VALUES
(1, -1, 2, 3),
(2, -1, 7, 11),
(3, -1, 8, 12),
(4, -1, 4, 13),
(5, -1, 15, 16),
(6, 1, 17, 25),
(7, -1, 28, 29);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elt_valorparametro`
--

CREATE TABLE IF NOT EXISTS `elt_valorparametro` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `estado` tinyint(20) NOT NULL DEFAULT '1',
  `parametro_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ValorParametro_Parametros1_idx` (`parametro_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `elt_valorparametro`
--

INSERT INTO `elt_valorparametro` (`id`, `nombre`, `estado`, `parametro_id`) VALUES
(1, 'Inicio', 1, 1),
(2, 'Fin', 1, 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `elt_acciones`
--
ALTER TABLE `elt_acciones`
  ADD CONSTRAINT `elt_acciones_ibfk_1` FOREIGN KEY (`modulo_id`) REFERENCES `elt_modulos` (`id`);

--
-- Filtros para la tabla `elt_compromisos`
--
ALTER TABLE `elt_compromisos`
  ADD CONSTRAINT `elt_compromisos_ibfk_1` FOREIGN KEY (`grupos_id`) REFERENCES `elt_grupos` (`id`),
  ADD CONSTRAINT `elt_compromisos_ibfk_2` FOREIGN KEY (`delegado_id`) REFERENCES `elt_personas` (`id`),
  ADD CONSTRAINT `fk_compromisos_Tareas1` FOREIGN KEY (`tarea_id`) REFERENCES `elt_tareas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `elt_grupos`
--
ALTER TABLE `elt_grupos`
  ADD CONSTRAINT `fk_Grupos_Personas1` FOREIGN KEY (`lider_id`) REFERENCES `elt_personas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `elt_miembros`
--
ALTER TABLE `elt_miembros`
  ADD CONSTRAINT `fk_miembros_Grupos1` FOREIGN KEY (`grupo_id`) REFERENCES `elt_grupos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_miembros_Personas1` FOREIGN KEY (`persona_id`) REFERENCES `elt_personas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `elt_permisos`
--
ALTER TABLE `elt_permisos`
  ADD CONSTRAINT `elt_permisos_ibfk_1` FOREIGN KEY (`accion_id`) REFERENCES `elt_acciones` (`id`),
  ADD CONSTRAINT `fk_Permisos_Perfiles1` FOREIGN KEY (`perfil_id`) REFERENCES `elt_perfiles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `elt_personas`
--
ALTER TABLE `elt_personas`
  ADD CONSTRAINT `fk_Personas_Perfiles1` FOREIGN KEY (`perfil_id`) REFERENCES `elt_perfiles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `personas_ibfk_1` FOREIGN KEY (`padre_id`) REFERENCES `elt_personas` (`id`);

--
-- Filtros para la tabla `elt_tareas`
--
ALTER TABLE `elt_tareas`
  ADD CONSTRAINT `fk_Tareas_Personas1` FOREIGN KEY (`creador_id`) REFERENCES `elt_personas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `elt_tareas_sub_tareas`
--
ALTER TABLE `elt_tareas_sub_tareas`
  ADD CONSTRAINT `elt_tareas_sub_tareas_ibfk_1` FOREIGN KEY (`tarea_id`) REFERENCES `elt_tareas` (`id`),
  ADD CONSTRAINT `elt_tareas_sub_tareas_ibfk_2` FOREIGN KEY (`sub_tarea_id`) REFERENCES `elt_tareas` (`id`);

--
-- Filtros para la tabla `elt_valorparametro`
--
ALTER TABLE `elt_valorparametro`
  ADD CONSTRAINT `fk_ValorParametro_Parametros1` FOREIGN KEY (`parametro_id`) REFERENCES `elt_parametros` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
