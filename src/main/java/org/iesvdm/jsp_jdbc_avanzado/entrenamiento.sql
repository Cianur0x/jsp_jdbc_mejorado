USE `baloncesto`;
DROP TABLE IF EXISTS `entrenamientos`;
CREATE TABLE IF NOT EXISTS `entrenamientos` (
    `entrenamientoID` INT NOT NULL,
    `tipo_entrenamiento` VARCHAR(40) COLLATE utf8mb4_spanish2_ci,
    `ubicacion` VARCHAR(100),
    `fecha_realizacion` DATE,
    PRIMARY KEY (`entrenamientoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;