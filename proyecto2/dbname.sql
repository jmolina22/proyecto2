-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: db
-- Tiempo de generación: 05-02-2024 a las 16:03:50
-- Versión del servidor: 8.0.36
-- Versión de PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbname`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `assignatura`
--

CREATE TABLE `assignatura` (
  `Codi` int NOT NULL,
  `Nom` varchar(20) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `assignatura`
--

INSERT INTO `assignatura` (`Codi`, `Nom`) VALUES
(290384, 'Matematicas'),
(564821, 'Biologia'),
(93843, 'Fisica'),
(983022, 'Castellano'),
(2134, 'Catalan');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Bicicleta`
--

CREATE TABLE `Bicicleta` (
  `ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `Bicicleta`
--

INSERT INTO `Bicicleta` (`ID`) VALUES
(1),
(2),
(3),
(4),
(5),
(6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Classe`
--

CREATE TABLE `Classe` (
  `ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `Classe`
--

INSERT INTO `Classe` (`ID`) VALUES
(932765),
(664674),
(932745),
(999345),
(764231);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Estudiant`
--

CREATE TABLE `Estudiant` (
  `DNI` varchar(8) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `Nom` varchar(20) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `Cognom` varchar(20) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `Direccio` varchar(40) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `Telefon` int NOT NULL,
  `DataNaixement` date NOT NULL,
  `NumExpedient` int NOT NULL,
  `IDBicicleta` int NOT NULL,
  `Inici` date NOT NULL,
  `Final` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `Estudiant`
--

INSERT INTO `Estudiant` (`DNI`, `Nom`, `Cognom`, `Direccio`, `Telefon`, `DataNaixement`, `NumExpedient`, `IDBicicleta`, `Inici`, `Final`) VALUES
('9283731H', 'Alejandro', 'Vilchez', 'Laietana', 934565412, '1991-02-14', 809280, 1, '2023-02-07', '2024-06-15'),
('5543013F', 'Eleazar', 'Bermudez', 'Valldemosa', 934560983, '2014-07-11', 980673, 2, '2023-02-01', '2024-02-15'),
('7845354I', 'Carlos', 'Ballester', 'Pou', 934569412, '2000-02-05', 98321, 3, '2023-02-09', '2024-05-07'),
('9375987T', 'Sandor', 'Ragel', 'PereIV', 938485743, '2010-09-13', 9087654, 6, '2024-03-11', '2024-05-15'),
('0984567G', 'Darius', 'Seneca', 'Trafalgar', 939098431, '1988-02-20', 923424, 5, '2023-01-23', '2023-07-27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Imparteix`
--

CREATE TABLE `Imparteix` (
  `DNIprofessor` char(8) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `CodiAssignatura` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `Imparteix`
--

INSERT INTO `Imparteix` (`DNIprofessor`, `CodiAssignatura`) VALUES
('5675632O', 290384),
('0123784W', 93843),
('2743914N', 2134),
('4389709A', 983022),
('4324245N', 564821);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Matricula`
--

CREATE TABLE `Matricula` (
  `DNIEstudiant` char(8) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `CodiAssignatura` int NOT NULL,
  `Data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `President`
--

CREATE TABLE `President` (
  `DNIEstudiant` varchar(8) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `DNIPresident` varchar(8) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `IDClasse` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Professor`
--

CREATE TABLE `Professor` (
  `DNI` char(8) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `Nom` varchar(20) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `Cognom` varchar(20) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `Direccio` varchar(12) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `Professor`
--

INSERT INTO `Professor` (`DNI`, `Nom`, `Cognom`, `Direccio`) VALUES
('5675632O', 'Fernando', 'Robles', 'Bruc'),
('0123784W', 'Francisco', 'Goya', 'Tres Torres'),
('2743914N', 'Pau', 'Perez', 'Victoria'),
('4389709A', 'Dani', 'Santos', 'Vallcarca'),
('4324245N', 'Soledicis', 'Ramos', 'Diagonal');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

