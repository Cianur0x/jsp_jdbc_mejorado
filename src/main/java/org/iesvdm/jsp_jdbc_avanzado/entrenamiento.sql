USE `baloncesto`;

CREATE TABLE IF NOT EXISTS `entrenamiento`
(
    `entrenamientoID`    INT NOT NULL AUTO_INCREMENT,
    `tipo_entrenamiento` VARCHAR(40) COLLATE utf8mb4_spanish2_ci,
    `ubicacion`          VARCHAR(100),
    `fecha_realizacion`  DATE,
    PRIMARY KEY (`entrenamientoID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_spanish2_ci;