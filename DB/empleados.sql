SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


# Base de datos: `registro`

CREATE DATABASE registro;

USE registro;



# Estructura de tabla para la tabla `empleados`


CREATE TABLE `empleados` (
  `Id` int(11) NOT NULL,
  `DNI` char(12) NOT NULL,
  `Nombres` varchar(255) NOT NULL,
  `Apellidos` varchar(255) NOT NULL,
  `Cargo` varchar(255) NOT NULL,
  `Sexo` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


# Volcado de datos para la tabla `empleados`


INSERT INTO `empleados` (`Id`, `DNI`, `Nombres`,`Apellidos`,`Cargo`,`Sexo`) VALUES
(1, '1013686570', 'Manuela', 'Garcia Monsalve', 'Ing. Desarrollo', 'M'),
(2, '123456789', 'Camilo Andres', 'Camargo Convers', 'Ing. Desarrollo', 'H'),
(5, '987654321', 'Fernando', 'Perez', 'Aux. Administrativo', 'H'),
(6, '98121110', 'Laura', 'Montero', 'Jefe Calidad', 'M'),
(7, '9182992', 'Rosa', 'Rojas', 'Analista de datos', 'M');


# Llave primaria para la tabla `empleados`

ALTER TABLE `empleados`
  ADD PRIMARY KEY (`Id`);


# AUTO_INCREMENT de la tabla `empleados`

ALTER TABLE `empleados`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;
