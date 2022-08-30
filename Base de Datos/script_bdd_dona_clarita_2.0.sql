-- MySQL Script generated by MySQL Workbench
-- Mon Aug 29 21:35:00 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`ESTADO_USUARIO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ESTADO_USUARIO` ;

CREATE TABLE IF NOT EXISTS `mydb`.`ESTADO_USUARIO` (
  `id_estado_user` INT NOT NULL,
  `estado_user` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_estado_user`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`USUARIO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`USUARIO` ;

CREATE TABLE IF NOT EXISTS `mydb`.`USUARIO` (
  `id_usuario` INT NOT NULL,
  `nombre_usuario` VARCHAR(45) NOT NULL,
  `tipo_usuario` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `pwd` VARCHAR(45) NOT NULL,
  `id_estado_u` INT NOT NULL,
  PRIMARY KEY (`id_usuario`, `id_estado_u`),
  INDEX `id_estado_idx` (`id_estado_u` ASC) VISIBLE,
  CONSTRAINT `id_estado_u`
    FOREIGN KEY (`id_estado_u`)
    REFERENCES `mydb`.`ESTADO_USUARIO` (`id_estado_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TIPO_CONTRATO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`TIPO_CONTRATO` ;

CREATE TABLE IF NOT EXISTS `mydb`.`TIPO_CONTRATO` (
  `id_tipo_contrato` INT NOT NULL,
  `tipo_contrato` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tipo_contrato`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ESTADO_CONTRATO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ESTADO_CONTRATO` ;

CREATE TABLE IF NOT EXISTS `mydb`.`ESTADO_CONTRATO` (
  `id_estado_contrato` INT NOT NULL,
  `estado_contrato` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_estado_contrato`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CONTRATO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`CONTRATO` ;

CREATE TABLE IF NOT EXISTS `mydb`.`CONTRATO` (
  `id_contrato` INT NOT NULL,
  `fecha_ini` DATE NOT NULL,
  `fecha_fin` DATE NULL,
  `cant_huesp` INT NOT NULL,
  `id_estado_contrato_c` INT NOT NULL,
  `id_tipo_contrato_c` INT NOT NULL,
  PRIMARY KEY (`id_contrato`, `id_estado_contrato_c`, `id_tipo_contrato_c`),
  INDEX `id_tipo_cotrato_idx` (`id_tipo_contrato_c` ASC) VISIBLE,
  INDEX `id_estado_contrato_idx` (`id_estado_contrato_c` ASC) VISIBLE,
  CONSTRAINT `id_tipo_cotrato_c`
    FOREIGN KEY (`id_tipo_contrato_c`)
    REFERENCES `mydb`.`TIPO_CONTRATO` (`id_tipo_contrato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_estado_contrato_c`
    FOREIGN KEY (`id_estado_contrato_c`)
    REFERENCES `mydb`.`ESTADO_CONTRATO` (`id_estado_contrato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CLIENTE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`CLIENTE` ;

CREATE TABLE IF NOT EXISTS `mydb`.`CLIENTE` (
  `id_cliente` INT NOT NULL,
  `rut_empresa` VARCHAR(45) NOT NULL,
  `nombre_empresa` VARCHAR(100) NOT NULL,
  `razon_social` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(200) NOT NULL,
  `id_usuario_c` INT NOT NULL,
  `id_contrato_c` INT NOT NULL,
  PRIMARY KEY (`id_cliente`, `id_usuario_c`, `id_contrato_c`),
  INDEX `id_usuario_idx` (`id_usuario_c` ASC) VISIBLE,
  INDEX `id_contrato_c_idx` (`id_contrato_c` ASC) VISIBLE,
  CONSTRAINT `id_usuario_c`
    FOREIGN KEY (`id_usuario_c`)
    REFERENCES `mydb`.`USUARIO` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_contrato_c`
    FOREIGN KEY (`id_contrato_c`)
    REFERENCES `mydb`.`CONTRATO` (`id_contrato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PROVEEDOR`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PROVEEDOR` ;

CREATE TABLE IF NOT EXISTS `mydb`.`PROVEEDOR` (
  `id_proveedor` INT NOT NULL,
  `nombre_prov` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(200) NOT NULL,
  `rubro` VARCHAR(200) NULL,
  PRIMARY KEY (`id_proveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CARGO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`CARGO` ;

CREATE TABLE IF NOT EXISTS `mydb`.`CARGO` (
  `id_cargo` INT NOT NULL,
  `cargo` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_cargo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EMPLEADO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`EMPLEADO` ;

CREATE TABLE IF NOT EXISTS `mydb`.`EMPLEADO` (
  `id_empleado` INT NOT NULL,
  `rut_empleado` VARCHAR(45) NOT NULL,
  `nombre_empleado` VARCHAR(45) NOT NULL,
  `p_apellido` VARCHAR(45) NOT NULL,
  `s_apellido` VARCHAR(45) NULL,
  `email` VARCHAR(45) NOT NULL,
  `fono` VARCHAR(45) NOT NULL,
  `id_usuario_e` INT NOT NULL,
  `id_cargo_e` INT NOT NULL,
  PRIMARY KEY (`id_empleado`, `id_usuario_e`, `id_cargo_e`),
  INDEX `id_usuario_idx` (`id_usuario_e` ASC) VISIBLE,
  INDEX `id_cargo_idx` (`id_cargo_e` ASC) VISIBLE,
  CONSTRAINT `id_usuario_e`
    FOREIGN KEY (`id_usuario_e`)
    REFERENCES `mydb`.`USUARIO` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_cargo_e`
    FOREIGN KEY (`id_cargo_e`)
    REFERENCES `mydb`.`CARGO` (`id_cargo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ORDEN_COMPRA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ORDEN_COMPRA` ;

CREATE TABLE IF NOT EXISTS `mydb`.`ORDEN_COMPRA` (
  `num_orden` INT NOT NULL,
  `nombre_empresa` VARCHAR(100) NOT NULL,
  `id_huesped` INT NOT NULL,
  `nombre_huesped` VARCHAR(200) NOT NULL,
  `id_factura` INT NOT NULL,
  `id_cliente_o` INT NOT NULL,
  PRIMARY KEY (`num_orden`, `id_cliente_o`),
  INDEX `id_cliente_idx` (`id_cliente_o` ASC) VISIBLE,
  CONSTRAINT `id_cliente_o`
    FOREIGN KEY (`id_cliente_o`)
    REFERENCES `mydb`.`CLIENTE` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TIPO_PLATO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`TIPO_PLATO` ;

CREATE TABLE IF NOT EXISTS `mydb`.`TIPO_PLATO` (
  `id_tipo_plato` INT NOT NULL,
  `tipo_plato` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tipo_plato`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PLATO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PLATO` ;

CREATE TABLE IF NOT EXISTS `mydb`.`PLATO` (
  `id_plato` INT NOT NULL,
  `nombre_plato` VARCHAR(45) NOT NULL,
  `id_minuta_p` INT NOT NULL,
  `id_tipo_plato_p` INT NOT NULL,
  PRIMARY KEY (`id_plato`, `id_minuta_p`, `id_tipo_plato_p`),
  INDEX `id_minuta_idx` (`id_minuta_p` ASC) VISIBLE,
  INDEX `id_tipo_plato_idx` (`id_tipo_plato_p` ASC) VISIBLE,
  CONSTRAINT `id_minuta_p`
    FOREIGN KEY (`id_minuta_p`)
    REFERENCES `mydb`.`MINUTA` (`id_minuta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_tipo_plato_p`
    FOREIGN KEY (`id_tipo_plato_p`)
    REFERENCES `mydb`.`TIPO_PLATO` (`id_tipo_plato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MINUTA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`MINUTA` ;

CREATE TABLE IF NOT EXISTS `mydb`.`MINUTA` (
  `id_minuta` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `precio` INT NOT NULL,
  `id_plato_m` INT NOT NULL,
  PRIMARY KEY (`id_minuta`, `id_plato_m`),
  INDEX `id_plato_idx` (`id_plato_m` ASC) VISIBLE,
  CONSTRAINT `id_plato_m`
    FOREIGN KEY (`id_plato_m`)
    REFERENCES `mydb`.`PLATO` (`id_plato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ESTADO_HAB`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ESTADO_HAB` ;

CREATE TABLE IF NOT EXISTS `mydb`.`ESTADO_HAB` (
  `id_estado_hab` INT NOT NULL,
  `estado_hab` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_estado_hab`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TIPO_CAMA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`TIPO_CAMA` ;

CREATE TABLE IF NOT EXISTS `mydb`.`TIPO_CAMA` (
  `id_tipo_cama` INT NOT NULL,
  `tipo_cama` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_tipo_cama`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TIPO_HAB`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`TIPO_HAB` ;

CREATE TABLE IF NOT EXISTS `mydb`.`TIPO_HAB` (
  `id_tipo_hab` INT NOT NULL,
  `tipo_hab` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tipo_hab`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ACCESORIO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ACCESORIO` ;

CREATE TABLE IF NOT EXISTS `mydb`.`ACCESORIO` (
  `id_accesorio` INT NOT NULL,
  `accesorio` VARCHAR(45) NOT NULL,
  `num_habitacion_a` INT NOT NULL,
  PRIMARY KEY (`id_accesorio`, `num_habitacion_a`),
  INDEX `num_habitacion_a_idx` (`num_habitacion_a` ASC) VISIBLE,
  CONSTRAINT `num_habitacion_a`
    FOREIGN KEY (`num_habitacion_a`)
    REFERENCES `mydb`.`HABITACION` (`num_habitacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`HABITACION`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`HABITACION` ;

CREATE TABLE IF NOT EXISTS `mydb`.`HABITACION` (
  `num_habitacion` INT NOT NULL,
  `precio` INT NOT NULL,
  `id_estado_hab_h` INT NOT NULL,
  `id_tipo_hab_h` INT NOT NULL,
  `id_tipo_cama_h` INT NOT NULL,
  `id_accesorio_h` INT NOT NULL,
  PRIMARY KEY (`num_habitacion`, `id_estado_hab_h`, `id_tipo_hab_h`, `id_tipo_cama_h`, `id_accesorio_h`),
  INDEX `id_estado_hab_idx` (`id_estado_hab_h` ASC) VISIBLE,
  INDEX `id_tipo_cama_idx` (`id_tipo_cama_h` ASC) VISIBLE,
  INDEX `id_tipo_hab_idx` (`id_tipo_hab_h` ASC) VISIBLE,
  INDEX `id_accesorio_h_idx` (`id_accesorio_h` ASC) VISIBLE,
  CONSTRAINT `id_estado_hab_h`
    FOREIGN KEY (`id_estado_hab_h`)
    REFERENCES `mydb`.`ESTADO_HAB` (`id_estado_hab`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_tipo_cama_h`
    FOREIGN KEY (`id_tipo_cama_h`)
    REFERENCES `mydb`.`TIPO_CAMA` (`id_tipo_cama`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_tipo_hab_h`
    FOREIGN KEY (`id_tipo_hab_h`)
    REFERENCES `mydb`.`TIPO_HAB` (`id_tipo_hab`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_accesorio_h`
    FOREIGN KEY (`id_accesorio_h`)
    REFERENCES `mydb`.`ACCESORIO` (`id_accesorio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`HUESPED`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`HUESPED` ;

CREATE TABLE IF NOT EXISTS `mydb`.`HUESPED` (
  `id_huesped` INT NOT NULL,
  `rut_huesped` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `p_apellido` VARCHAR(100) NOT NULL,
  `s_apellido` VARCHAR(100) NULL,
  `email` VARCHAR(100) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `id_cliente_h` INT NOT NULL,
  `num_orden_h` INT NOT NULL,
  `num_habitacion_h` INT NOT NULL,
  `id_minuta_h` INT NOT NULL,
  PRIMARY KEY (`id_huesped`, `num_orden_h`, `num_habitacion_h`, `id_minuta_h`),
  INDEX `num_orden_idx` (`num_orden_h` ASC) VISIBLE,
  INDEX `id_minuta_idx` (`id_minuta_h` ASC) VISIBLE,
  INDEX `num_habitacion_idx` (`num_habitacion_h` ASC) VISIBLE,
  CONSTRAINT `num_orden_h`
    FOREIGN KEY (`num_orden_h`)
    REFERENCES `mydb`.`ORDEN_COMPRA` (`num_orden`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_minuta_h`
    FOREIGN KEY (`id_minuta_h`)
    REFERENCES `mydb`.`MINUTA` (`id_minuta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `num_habitacion_h`
    FOREIGN KEY (`num_habitacion_h`)
    REFERENCES `mydb`.`HABITACION` (`num_habitacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FACTURA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`FACTURA` ;

CREATE TABLE IF NOT EXISTS `mydb`.`FACTURA` (
  `id_factura` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `nombre_empresa` VARCHAR(100) NOT NULL,
  `subtotal` INT NOT NULL,
  `iva` INT NOT NULL,
  `total` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `num_orden_f` INT NOT NULL,
  PRIMARY KEY (`id_factura`, `num_orden_f`),
  INDEX `num_orden_idx` (`num_orden_f` ASC) VISIBLE,
  CONSTRAINT `num_orden_f`
    FOREIGN KEY (`num_orden_f`)
    REFERENCES `mydb`.`ORDEN_COMPRA` (`num_orden`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SERVICIO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`SERVICIO` ;

CREATE TABLE IF NOT EXISTS `mydb`.`SERVICIO` (
  `id_servicio` INT NOT NULL,
  `servicio` VARCHAR(100) NOT NULL,
  `id_factura_s` INT NOT NULL,
  PRIMARY KEY (`id_servicio`, `id_factura_s`),
  INDEX `id_factura_idx` (`id_factura_s` ASC) VISIBLE,
  CONSTRAINT `id_factura_s`
    FOREIGN KEY (`id_factura_s`)
    REFERENCES `mydb`.`FACTURA` (`id_factura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ESTADO_PEDIDO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ESTADO_PEDIDO` ;

CREATE TABLE IF NOT EXISTS `mydb`.`ESTADO_PEDIDO` (
  `id_estado_p` INT NOT NULL,
  `estado_pedido` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_estado_p`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ORDEN_PEDIDO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ORDEN_PEDIDO` ;

CREATE TABLE IF NOT EXISTS `mydb`.`ORDEN_PEDIDO` (
  `num_pedido` INT NOT NULL,
  `fecha_pedido` DATE NOT NULL,
  `fecha_llegada` DATE NULL,
  `id_proveedor_o` INT NOT NULL,
  `id_estado_p_o` INT NOT NULL,
  PRIMARY KEY (`num_pedido`, `id_proveedor_o`, `id_estado_p_o`),
  INDEX `id_proveedor_idx` (`id_proveedor_o` ASC) VISIBLE,
  INDEX `id_estado_p_idx` (`id_estado_p_o` ASC) VISIBLE,
  CONSTRAINT `id_proveedor_o`
    FOREIGN KEY (`id_proveedor_o`)
    REFERENCES `mydb`.`PROVEEDOR` (`id_proveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_estado_p_o`
    FOREIGN KEY (`id_estado_p_o`)
    REFERENCES `mydb`.`ESTADO_PEDIDO` (`id_estado_p`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FAMILIA_PROD`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`FAMILIA_PROD` ;

CREATE TABLE IF NOT EXISTS `mydb`.`FAMILIA_PROD` (
  `id_familia_p` INT NOT NULL,
  `familia_p` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_familia_p`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TIPO_PROD`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`TIPO_PROD` ;

CREATE TABLE IF NOT EXISTS `mydb`.`TIPO_PROD` (
  `id_tipo_prod` INT NOT NULL,
  `tipo_prod` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_tipo_prod`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SKU_PRODUCTO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`SKU_PRODUCTO` ;

CREATE TABLE IF NOT EXISTS `mydb`.`SKU_PRODUCTO` (
  `id_sku` INT NOT NULL,
  `SKU` INT NOT NULL,
  `fecha_venc` INT NOT NULL,
  `id_proveedor_s` INT NOT NULL,
  `id_familia_s` INT NOT NULL,
  `id_tipo_producto_s` INT NOT NULL,
  PRIMARY KEY (`id_sku`, `id_proveedor_s`, `id_familia_s`, `id_tipo_producto_s`),
  INDEX `id_proveedor_idx` (`id_proveedor_s` ASC) VISIBLE,
  INDEX `id_familia_p_idx` (`id_familia_s` ASC) VISIBLE,
  INDEX `id_tipo_prod_idx` (`id_tipo_producto_s` ASC) VISIBLE,
  CONSTRAINT `id_proveedor_s`
    FOREIGN KEY (`id_proveedor_s`)
    REFERENCES `mydb`.`ORDEN_PEDIDO` (`id_proveedor_o`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_familia_p_s`
    FOREIGN KEY (`id_familia_s`)
    REFERENCES `mydb`.`FAMILIA_PROD` (`id_familia_p`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_tipo_prod_s`
    FOREIGN KEY (`id_tipo_producto_s`)
    REFERENCES `mydb`.`TIPO_PROD` (`id_tipo_prod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PRODUCTO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PRODUCTO` ;

CREATE TABLE IF NOT EXISTS `mydb`.`PRODUCTO` (
  `id_producto` INT NOT NULL,
  `fecha_venc` INT NOT NULL,
  `descripcion` VARCHAR(200) NOT NULL,
  `precio` INT NOT NULL,
  `stock` INT NOT NULL,
  `stock_critico` INT NOT NULL,
  `id_sku_p` INT NOT NULL,
  `id_plato_p` INT NOT NULL,
  PRIMARY KEY (`id_producto`, `id_sku_p`, `id_plato_p`),
  INDEX `id_sku_idx` (`id_sku_p` ASC) VISIBLE,
  INDEX `id_plato_p_idx` (`id_plato_p` ASC) VISIBLE,
  CONSTRAINT `id_sku_p`
    FOREIGN KEY (`id_sku_p`)
    REFERENCES `mydb`.`SKU_PRODUCTO` (`id_sku`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_plato_p`
    FOREIGN KEY (`id_plato_p`)
    REFERENCES `mydb`.`PLATO` (`id_plato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CAMA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`CAMA` ;

CREATE TABLE IF NOT EXISTS `mydb`.`CAMA` (
  `id_cama` INT NOT NULL,
  `cant_cojines` INT NOT NULL,
  `id_tipo_cama_c` INT NOT NULL,
  PRIMARY KEY (`id_cama`, `id_tipo_cama_c`),
  INDEX `id_tipo_cama_idx` (`id_tipo_cama_c` ASC) VISIBLE,
  CONSTRAINT `id_tipo_cama_c`
    FOREIGN KEY (`id_tipo_cama_c`)
    REFERENCES `mydb`.`TIPO_CAMA` (`id_tipo_cama`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
