-- Crear la base de datos si no existe
CREATE DATABASE IF NOT EXISTS `votacion`;
USE `votacion`;

-- Tabla de candidatos
CREATE TABLE IF NOT EXISTS `candidatos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insertar datos en la tabla candidatos
INSERT INTO `candidatos` (`nombre`) VALUES
('Pedro Pérez'),
('María González'),
('Juan Rodríguez'),
('Ana Martínez'),
('Luis García'),
('Laura Sánchez'),
('Diego Fernández'),
('Carla López'),
('José Ramírez'),
('Sofía Torres');

-- Tabla de regiones
CREATE TABLE IF NOT EXISTS `regiones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insertar datos en la tabla regiones
INSERT INTO `regiones` (`nombre`) VALUES
('Región de Arica y Parinacota'),
('Región de Tarapacá'),
('Región de Antofagasta'),
('Región de Atacama'),
('Región de Coquimbo'),
('Región de Valparaíso'),
('Región Metropolitana de Santiago'),
('Región del Libertador General Bernardo O''Higgins'),
('Región del Maule'),
('Región de Ñuble'),
('Región del Biobío'),
('Región de La Araucanía'),
('Región de Los Ríos'),
('Región de Los Lagos'),
('Región de Aysén del General Carlos Ibáñez del Campo'),
('Región de Magallanes y de la Antártica Chilena');

-- Tabla de comunas
CREATE TABLE IF NOT EXISTS `comunas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `region_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `region_id` (`region_id`),
  CONSTRAINT `fk_comunas_region_id` FOREIGN KEY (`region_id`) REFERENCES `regiones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insertar datos en la tabla comunas
INSERT INTO `comunas` (`nombre`, `region_id`) VALUES
('Arica', 1),
('Camarones', 1),
('Iquique', 2),
('Alto Hospicio', 2),
('Antofagasta', 3),
('Mejillones', 3),
('Copiapó', 4),
('Caldera', 4),
('La Serena', 5),
('Coquimbo', 5),
('Valparaíso', 6),
('Casablanca', 6),
('Puente Alto', 7),
('La Florida', 7),
('Rancagua', 8),
('Codegua', 8),
('Talca', 9),
('Curepto', 9),
('Chillán', 10),
('Bulnes', 10),
('Concepción', 11),
('Coronel', 11),
('Temuco', 12),
('Carahue', 12),
('Valdivia', 13),
('Corral', 13),
('Puerto Montt', 14),
('Calbuco', 14),
('Coyhaique', 15),
('Aysén', 15),
('Punta Arenas', 16),
('Laguna Blanca', 16);

-- Tabla de votantes
CREATE TABLE IF NOT EXISTS `votantes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `rut` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `region_id` int(11) DEFAULT NULL,
  `comuna_id` int(11) DEFAULT NULL,
  `candidato_id` int(11) DEFAULT NULL,
  `como_se_entero` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_votantes_region_id` (`region_id`),
  KEY `fk_votantes_comuna_id` (`comuna_id`),
  KEY `fk_votantes_candidato_id` (`candidato_id`),
  CONSTRAINT `fk_votantes_region_id` FOREIGN KEY (`region_id`) REFERENCES `regiones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_votantes_comuna_id` FOREIGN KEY (`comuna_id`) REFERENCES `comunas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_votantes_candidato_id` FOREIGN KEY (`candidato_id`) REFERENCES `candidatos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

