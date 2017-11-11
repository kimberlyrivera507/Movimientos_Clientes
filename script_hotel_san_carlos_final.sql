-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema hotelSanCarlos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hotelSanCarlos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hotelSanCarlos` DEFAULT CHARACTER SET latin1 ;
USE `hotelSanCarlos` ;

-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`empleado` (
  `idEmpleado` INT(11) NOT NULL AUTO_INCREMENT,
  `dpi` VARCHAR(50) NULL DEFAULT NULL,
  `nit` VARCHAR(50) NULL DEFAULT NULL,
  `primerNombre` VARCHAR(50) NULL DEFAULT NULL,
  `segundoNombre` VARCHAR(50) NULL DEFAULT NULL,
  `apellidoPaterno` VARCHAR(50) NULL DEFAULT NULL,
  `apellidoMaterno` VARCHAR(50) NULL DEFAULT NULL,
  `edad` INT(11) NULL DEFAULT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  `contactoEmergencia` VARCHAR(50) NULL DEFAULT NULL,
  `telefono` VARCHAR(50) NULL DEFAULT NULL,
  `direccionDomicilio` VARCHAR(50) NULL DEFAULT NULL,
  `fechaCreacionEmpleado` VARCHAR(50) NULL DEFAULT NULL,
  `nivelAcedemico` VARCHAR(50) NULL DEFAULT NULL,
  `noCuenta` INT(11) NULL DEFAULT NULL,
  `cuentabanco_idBanco` INT(11) NOT NULL,
  PRIMARY KEY (`idEmpleado`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`horario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`horario` (
  `idHorario` INT(11) NOT NULL AUTO_INCREMENT,
  `horaEntrada` DATETIME NOT NULL,
  `horaSalida` DATETIME NOT NULL,
  `diasDescanso` INT NOT NULL,
  PRIMARY KEY (`idHorario`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`departamento` (
  `idDepartamento` INT(11) NOT NULL AUTO_INCREMENT,
  `nombreDepartamento` VARCHAR(55) NOT NULL,
  `jefeDepartamento` VARCHAR(55) NOT NULL,
  PRIMARY KEY (`idDepartamento`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`puesto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`puesto` (
  `idPuesto` INT(11) NOT NULL AUTO_INCREMENT,
  `nombrePuesto` VARCHAR(55) NOT NULL,
  `idDepartamento` INT(11) NOT NULL,
  `departamentoIdDepartamento` INT(11) NOT NULL,
  PRIMARY KEY (`idPuesto`),
  INDEX `fk_puesto_departamento1_idx` (`departamentoIdDepartamento` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`contrato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`contrato` (
  `idContrato` INT(10) NOT NULL AUTO_INCREMENT,
  `fechaCreacionContrato` VARCHAR(50) NULL DEFAULT NULL,
  `estadoCivil` VARCHAR(45) NULL DEFAULT NULL,
  `lugar` VARCHAR(45) NULL DEFAULT NULL,
  `inicioRelacionTrabajo` VARCHAR(50) NULL DEFAULT NULL,
  `duracionContrato` VARCHAR(45) NULL DEFAULT NULL,
  `serviciosTrabajador` VARCHAR(50) NULL DEFAULT NULL,
  `jornadaTrabajador` VARCHAR(45) NULL DEFAULT NULL,
  `clausulasContrato` VARCHAR(50) NULL DEFAULT NULL,
  `nombreEmpleador` VARCHAR(45) NULL DEFAULT NULL,
  `horasLaboralesDiarias` INT(11) NULL DEFAULT NULL,
  `sueldoBase` DECIMAL(9,2) NULL DEFAULT NULL,
  `empleado_idEmpleado` INT(11) NOT NULL,
  `horario_idHorario` INT(11) NOT NULL,
  `puesto_idPuesto` INT(11) NOT NULL,
  PRIMARY KEY (`idContrato`),
  INDEX `fk_contrato_empleado1_idx` (`empleado_idEmpleado` ASC),
  INDEX `fk_contrato_horario1_idx` (`horario_idHorario` ASC),
  INDEX `fk_contrato_puesto1_idx` (`puesto_idPuesto` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`aguinaldo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`aguinaldo` (
  `idAguinaldo` INT(11) NOT NULL AUTO_INCREMENT,
  `fecha_aguinaldo_pago` DATETIME NOT NULL,
  `valorPercepcion` FLOAT NOT NULL,
  `estadoPago` INT(11) NOT NULL,
  `contrato_idContrato` INT(10) NOT NULL,
  PRIMARY KEY (`idAguinaldo`),
  INDEX `fk_aguinaldo_contrato1_idx` (`contrato_idContrato` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`porcentajeCompra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`porcentajeCompra` (
  `idPorcentaje` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NULL,
  `dato` DOUBLE NULL,
  PRIMARY KEY (`idPorcentaje`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`vendedor` (
  `idVendedor` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  PRIMARY KEY (`idVendedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`cliente` (
  `idCliente` INT(11) NOT NULL AUTO_INCREMENT,
  `nitCliente` INT(11) NOT NULL,
  `nombreCliente` VARCHAR(50) NOT NULL,
  `apellidoCliente` VARCHAR(50) NOT NULL,
  `direccionCliente` VARCHAR(45) NOT NULL,
  `ciudadCliente` VARCHAR(45) NOT NULL,
  `paisCliente` VARCHAR(45) NOT NULL,
  `telefonoCliente` INT(15) NOT NULL,
  `correoCliente` VARCHAR(45) NULL DEFAULT NULL,
  `porcentajeCompra_idPorcentaje` INT NOT NULL,
  `vendedor_idVendedor` INT NOT NULL,
  PRIMARY KEY (`idCliente`, `porcentajeCompra_idPorcentaje`, `vendedor_idVendedor`),
  INDEX `fk_cliente_porcentajeCompra1_idx` (`porcentajeCompra_idPorcentaje` ASC),
  INDEX `fk_cliente_vendedor1_idx` (`vendedor_idVendedor` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`tipohabitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`tipohabitacion` (
  `idTipoHabitacion` INT(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoHabitacion` VARCHAR(50) NOT NULL,
  `costoTipoHabitacion` FLOAT NOT NULL,
  `capacidadTipoHabitacion` INT(11) NOT NULL,
  `descripcionTipoHabitacion` VARCHAR(120) NULL DEFAULT NULL,
  PRIMARY KEY (`idTipoHabitacion`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`habitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`habitacion` (
  `idHabitacion` INT(11) NOT NULL AUTO_INCREMENT,
  `numeroHabitacion` INT(4) NOT NULL,
  `estatusHabitacion` VARCHAR(45) NOT NULL,
  `tipohabitacion_idTipoHabitacion` INT(11) NOT NULL,
  PRIMARY KEY (`idHabitacion`, `tipohabitacion_idTipoHabitacion`),
  INDEX `fk_habitacion_tipohabitacion1_idx` (`tipohabitacion_idTipoHabitacion` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`asignacionhabitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`asignacionhabitacion` (
  `idAsignacionHabitacion` INT(11) NOT NULL AUTO_INCREMENT,
  `fechaInicio` DATE NULL DEFAULT NULL,
  `fechaFinal` DATE NULL DEFAULT NULL,
  `cliente_idCliente` INT(11) NOT NULL,
  `habitacion_idHabitacion` INT(11) NOT NULL,
  PRIMARY KEY (`idAsignacionHabitacion`),
  INDEX `fk_asignacionhabitacion_cliente1_idx` (`cliente_idCliente` ASC),
  INDEX `fk_asignacionhabitacion_habitacion1_idx` (`habitacion_idHabitacion` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`banco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`banco` (
  `idBanco` INT(11) NOT NULL,
  `nombre` VARCHAR(25) NULL DEFAULT NULL,
  PRIMARY KEY (`idBanco`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`bodega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`bodega` (
  `idBodega` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion` VARCHAR(45) NULL DEFAULT NULL,
  `nivel` VARCHAR(45) NULL DEFAULT NULL,
  `capacidad` VARCHAR(45) NULL DEFAULT NULL,
  `encargado` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idBodega`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`comprasdetalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`comprasdetalle` (
  `idComprasDetalle` INT(11) NOT NULL,
  `id_productos` INT(11) NULL DEFAULT NULL,
  `cantidad` INT(11) NULL DEFAULT NULL,
  `subtotal` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`idComprasDetalle`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`comprasencabezado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`comprasencabezado` (
  `idComprasEncabezado` INT(11) NOT NULL,
  `id_proveedor` INT(11) NULL DEFAULT NULL,
  `fecha` VARCHAR(45) NULL DEFAULT NULL,
  `idComprasDetalle` INT(11) NULL DEFAULT NULL,
  `total` DOUBLE NULL DEFAULT NULL,
  `comprasdetalle_idComprasDetalle` INT(11) NOT NULL,
  PRIMARY KEY (`idComprasEncabezado`),
  INDEX `fk_comprasencabezado_comprasdetalle1_idx` (`comprasdetalle_idComprasDetalle` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`moneda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`moneda` (
  `idMoneda` INT(11) NOT NULL,
  `moneda` VARCHAR(10) NULL DEFAULT NULL,
  `valor` FLOAT NULL DEFAULT NULL,
  `cuentabanco_idBanco` INT(11) NOT NULL,
  PRIMARY KEY (`idMoneda`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`cuentabanco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`cuentabanco` (
  `noCuenta` VARCHAR(15) NOT NULL,
  `nombre` VARCHAR(60) NULL DEFAULT NULL,
  `saldoActual` FLOAT NULL DEFAULT NULL,
  `saldoDisponible` FLOAT NULL DEFAULT NULL,
  `tipoCuenta` VARCHAR(25) NULL DEFAULT NULL,
  `tipoMoneda` VARCHAR(25) NULL DEFAULT NULL,
  `banco_idBanco` INT(11) NOT NULL,
  `moneda_idMoneda` INT(11) NOT NULL,
  PRIMARY KEY (`noCuenta`),
  INDEX `fk_cuentabanco_banco1_idx` (`banco_idBanco` ASC),
  INDEX `fk_cuentabanco_moneda1_idx` (`moneda_idMoneda` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`cuentacontabilidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`cuentacontabilidad` (
  `nomenclatura` INT(11) NOT NULL,
  `nombre` VARCHAR(40) NULL DEFAULT NULL,
  `saldo` VARCHAR(9) NULL DEFAULT NULL,
  `nivel` INT(11) NULL DEFAULT NULL,
  `saldoAnterior` DOUBLE NULL DEFAULT NULL,
  `cargoMes` DOUBLE NULL DEFAULT NULL,
  `abonoMes` DOUBLE NULL DEFAULT NULL,
  `saldoActual` DOUBLE NULL DEFAULT NULL,
  `cargoAcumulado` DOUBLE NULL DEFAULT NULL,
  `abonoAcumulado` DOUBLE NULL DEFAULT NULL,
  `presupuestado` DOUBLE NULL DEFAULT NULL,
  `naturaleza` VARCHAR(45) NULL,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nomenclatura`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`tipoDepreciacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`tipoDepreciacion` (
  `idTipoDepreciacion` INT NOT NULL,
  `descripcion` VARCHAR(75) NULL,
  `valor` DOUBLE NULL,
  PRIMARY KEY (`idTipoDepreciacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`tipoProducto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`tipoProducto` (
  `idTipoProducto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idTipoProducto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`productos` (
  `idProducto` INT(11) NOT NULL,
  `descripcion` VARCHAR(50) NULL DEFAULT NULL,
  `precio` INT(11) NULL DEFAULT NULL,
  `categoriaProducto` VARCHAR(45) NOT NULL,
  `comprasdetalle_idComprasDetalle` INT(11) NOT NULL,
  `tipoProducto_idTipoProducto` INT NOT NULL,
  PRIMARY KEY (`idProducto`),
  INDEX `fk_productos_comprasdetalle1_idx` (`comprasdetalle_idComprasDetalle` ASC),
  INDEX `fk_productos_tipoProducto1_idx` (`tipoProducto_idTipoProducto` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`inventario` (
  `codigoInventario` INT(11) NOT NULL,
  `unidadMedida` VARCHAR(45) NOT NULL,
  `cantidad` VARCHAR(45) NULL DEFAULT NULL,
  `precioCompra` INT NULL DEFAULT NULL,
  `precioVenta` INT NULL,
  `productos_idProducto` INT(11) NOT NULL,
  PRIMARY KEY (`codigoInventario`),
  INDEX `fk_inventario_productos1_idx` (`productos_idProducto` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`depreciacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`depreciacion` (
  `totalArticulo` DOUBLE NULL DEFAULT NULL,
  `fechaCompra` DATE NULL DEFAULT NULL,
  `totalDepreciado` DOUBLE NULL DEFAULT NULL,
  `cuentacontabilidad_nomenclatura` INT(11) NOT NULL,
  `tipoDepreciacion_idTipoDepreciacion` INT NOT NULL,
  `inventario_codigoInventario` INT(11) NOT NULL,
  PRIMARY KEY (`cuentacontabilidad_nomenclatura`, `inventario_codigoInventario`),
  INDEX `fk_depreciacion_cuentacontabilidad1_idx` (`cuentacontabilidad_nomenclatura` ASC),
  INDEX `fk_depreciacion_tipoDepreciacion1_idx` (`tipoDepreciacion_idTipoDepreciacion` ASC),
  INDEX `fk_depreciacion_inventario1_idx` (`inventario_codigoInventario` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`despido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`despido` (
  `idDespido` INT(11) NOT NULL AUTO_INCREMENT,
  `causaDespido` VARCHAR(75) NOT NULL,
  `fechaDespido` DATETIME NOT NULL,
  `montoIndem` FLOAT NOT NULL,
  `contrato_idContrato` INT(10) NOT NULL,
  PRIMARY KEY (`idDespido`),
  INDEX `fk_despido_contrato1_idx` (`contrato_idContrato` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`servicio` (
  `idServicio` INT(11) NOT NULL AUTO_INCREMENT,
  `nombreServicio` VARCHAR(50) NOT NULL,
  `costo_servicio` FLOAT NOT NULL,
  `descripcionServicio` VARCHAR(150) NULL DEFAULT NULL,
  `tipohabitacion_idTipoHabitacion` INT(11) NOT NULL,
  PRIMARY KEY (`idServicio`),
  INDEX `fk_servicio_tipohabitacion1_idx` (`tipohabitacion_idTipoHabitacion` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`detalleasignacionservicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`detalleasignacionservicio` (
  `idAsignacionHabitacion` INT(11) NOT NULL,
  `diasServicio` INT(11) NOT NULL,
  `servicio_idServicio` INT(11) NOT NULL,
  PRIMARY KEY (`idAsignacionHabitacion`),
  INDEX `fk_detalleasignacionservicio_servicio1_idx` (`servicio_idServicio` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`mantenimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`mantenimiento` (
  `idMantenimiento` INT(11) NOT NULL AUTO_INCREMENT,
  `nombreMantenimiento` VARCHAR(45) NOT NULL,
  `descripcionMantenimiento` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`idMantenimiento`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`detallemantenimientohabitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`detallemantenimientohabitacion` (
  `fechaUltimoMantenimiento` DATE NOT NULL,
  `mantenimiento_idMantenimiento` INT(11) NOT NULL,
  `habitacion_idHabitacion` INT(11) NOT NULL,
  INDEX `fk_detallemantenimientohabitacion_mantenimiento1_idx` (`mantenimiento_idMantenimiento` ASC),
  INDEX `fk_detallemantenimientohabitacion_habitacion1_idx` (`habitacion_idHabitacion` ASC),
  PRIMARY KEY (`mantenimiento_idMantenimiento`, `habitacion_idHabitacion`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`periodo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`periodo` (
  `idPeriodo` INT(11) NOT NULL AUTO_INCREMENT,
  `fechaInicio` DATETIME NULL DEFAULT NULL,
  `fechaFin` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`idPeriodo`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`nomina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`nomina` (
  `idNomina` INT(11) NOT NULL AUTO_INCREMENT,
  `fechaEmision` DATETIME NOT NULL,
  `nombreEmpresa` VARCHAR(55) NOT NULL,
  `periodo_idPeriodo` INT(11) NOT NULL,
  `totalDeducido` FLOAT NOT NULL,
  `totalPercibidoPagar` FLOAT NOT NULL,
  `estado` INT NOT NULL,
  PRIMARY KEY (`idNomina`),
  INDEX `fk_nomina_periodo1_idx` (`periodo_idPeriodo` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`percepcionDeduccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`percepcionDeduccion` (
  `id_PD` INT(11) NOT NULL AUTO_INCREMENT,
  `nombrePD` VARCHAR(10) NOT NULL,
  `valorPorcentaje` FLOAT NULL,
  `descripcionPD` VARCHAR(128) NULL,
  `flagOperacion` INT NOT NULL,
  PRIMARY KEY (`id_PD`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`detallenomina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`detallenomina` (
  `nominIdNomina` INT(11) NOT NULL,
  `contratoIdContrato` INT(10) NOT NULL,
  `id_PD` INT(11) NOT NULL,
  `valorPDcalculado` FLOAT NOT NULL,
  INDEX `fk_detallenomina_nomina1_idx` (`nominIdNomina` ASC),
  INDEX `fk_detallenomina_contrato1_idx` (`contratoIdContrato` ASC),
  PRIMARY KEY (`nominIdNomina`, `contratoIdContrato`, `id_PD`),
  INDEX `fk_detallenomina_percepcion1_idx` (`id_PD` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`partida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`partida` (
  `idPartida` VARCHAR(12) NOT NULL,
  `numeroPartida` INT(11) NOT NULL,
  `definicionPartida` VARCHAR(300) NULL DEFAULT NULL,
  `total` DOUBLE NULL DEFAULT NULL,
  `fecha` DATE NULL,
  `estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPartida`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`detallepartida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`detallepartida` (
  `numeroDetallePartida` INT(11) NOT NULL,
  `total` DOUBLE NULL DEFAULT NULL,
  `cuentacontabilidad_nomenclatura` INT(11) NOT NULL,
  `tipoPartida` VARCHAR(45) NOT NULL,
  `partida_idPartida` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`numeroDetallePartida`, `partida_idPartida`),
  INDEX `fk_detallepartida_cuentacontabilidad1_idx` (`cuentacontabilidad_nomenclatura` ASC),
  INDEX `fk_detallepartida_partida1_idx` (`partida_idPartida` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`mesa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`mesa` (
  `idMesa` INT(11) NOT NULL AUTO_INCREMENT,
  `noMesa` INT(11) NOT NULL,
  `capacidad` INT(11) NOT NULL,
  PRIMARY KEY (`idMesa`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`pedidoRestaurante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`pedidoRestaurante` (
  `idPedidoRestaurante` INT(11) NOT NULL AUTO_INCREMENT,
  `fechaPedido` DATE NOT NULL,
  `mesa_idMesa` INT(11) NOT NULL,
  `cliente_idCliente` INT(11) NOT NULL,
  PRIMARY KEY (`idPedidoRestaurante`, `mesa_idMesa`, `cliente_idCliente`),
  INDEX `fk_pedido_mesa1_idx` (`mesa_idMesa` ASC),
  INDEX `fk_pedido_cliente1_idx` (`cliente_idCliente` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`detallepedidobebida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`detallepedidobebida` (
  `cantidadBebida` INT(11) NOT NULL,
  `pedidoRestaurante_idPedido` INT(11) NOT NULL,
  `productos_idProducto` INT(11) NOT NULL,
  INDEX `fk_detallepedidobebida_pedidoRestaurante1_idx` (`pedidoRestaurante_idPedido` ASC),
  PRIMARY KEY (`pedidoRestaurante_idPedido`, `productos_idProducto`),
  INDEX `fk_detallepedidobebida_productos1_idx` (`productos_idProducto` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`receta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`receta` (
  `idReceta` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Procedimiento` LONGTEXT NULL,
  `tiempoPreparacion` VARCHAR(12) NULL,
  `numeroPersonas` INT NULL,
  PRIMARY KEY (`idReceta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`platillo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`platillo` (
  `idPlatillo` INT(11) NOT NULL AUTO_INCREMENT,
  `nombrePlatillo` VARCHAR(45) NOT NULL,
  `descripcionPlatillo` VARCHAR(200) NOT NULL,
  `costoPlatillo` FLOAT NOT NULL,
  `receta_idReceta` INT NOT NULL,
  PRIMARY KEY (`idPlatillo`),
  INDEX `fk_platillo_receta1_idx` (`receta_idReceta` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`detallepedidoplatillo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`detallepedidoplatillo` (
  `cantidadPlatillo` INT(11) NOT NULL,
  `platillo_idPlatillo` INT(11) NOT NULL,
  `pedidoRestaurante_idPedido` INT(11) NOT NULL,
  INDEX `fk_detallepedidoplatillo_platillo1_idx` (`platillo_idPlatillo` ASC),
  INDEX `fk_detallepedidoplatillo_pedidoRestaurante1_idx` (`pedidoRestaurante_idPedido` ASC),
  PRIMARY KEY (`platillo_idPlatillo`, `pedidoRestaurante_idPedido`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`reservacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`reservacion` (
  `idReservacion` INT(11) NOT NULL AUTO_INCREMENT,
  `fechaInicioReservacion` DATE NOT NULL,
  `fechaFinalReservacion` DATE NOT NULL,
  `costoReservacion` FLOAT NOT NULL,
  `estadoReserva` VARCHAR(45) NOT NULL,
  `cliente_idCliente` INT(11) NOT NULL,
  PRIMARY KEY (`idReservacion`, `cliente_idCliente`),
  INDEX `fk_reservacion_cliente1_idx` (`cliente_idCliente` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`detallereservacionservicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`detallereservacionservicio` (
  `servicio_idServicio` INT(11) NOT NULL,
  `reservacion_idReservacion` INT(11) NOT NULL,
  INDEX `fk_detallereservacionservicio_servicio1_idx` (`servicio_idServicio` ASC),
  INDEX `fk_detallereservacionservicio_reservacion1_idx` (`reservacion_idReservacion` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`historialmoneda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`historialmoneda` (
  `idHistorial` INT(11) NOT NULL,
  `idMoneda` INT(11) NULL DEFAULT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `valor` FLOAT NULL DEFAULT NULL,
  `moneda_idMoneda` INT(11) NOT NULL,
  PRIMARY KEY (`idHistorial`),
  INDEX `fk_historialmoneda_moneda1_idx` (`moneda_idMoneda` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`horaextra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`horaextra` (
  `idHorasExtra` INT(11) NOT NULL,
  `fechaHoras` DATETIME NOT NULL,
  `cantidadHoras` INT NULL DEFAULT NULL,
  `personaAutorizo` VARCHAR(45) NULL DEFAULT NULL,
  `contrato_idContrato` INT(10) NOT NULL,
  PRIMARY KEY (`idHorasExtra`, `fechaHoras`),
  INDEX `fk_horaextra_contrato1_idx` (`contrato_idContrato` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`proveedores` (
  `idProveedores` INT(11) NOT NULL,
  `nombreProveedor` VARCHAR(45) NULL DEFAULT NULL,
  `direccion` VARCHAR(45) NULL,
  `representante` VARCHAR(45) NULL,
  `nit_proveedor` VARCHAR(45) NULL,
  PRIMARY KEY (`idProveedores`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`registroigss`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`registroigss` (
  `noCarnetIgss` INT(11) NOT NULL,
  `contrato_idContrato` INT(10) NOT NULL,
  PRIMARY KEY (`noCarnetIgss`),
  INDEX `fk_registroigss_contrato1_idx` (`contrato_idContrato` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`registroirtra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`registroirtra` (
  `carneIrtra` INT(11) NOT NULL AUTO_INCREMENT,
  `contrato_idContrato` INT(10) NOT NULL,
  PRIMARY KEY (`carneIrtra`),
  INDEX `fk_registroirtra_contrato1_idx` (`contrato_idContrato` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`suspension`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`suspension` (
  `idregistroSuspension` INT(11) NOT NULL AUTO_INCREMENT,
  `fecha_inicioSuspencion` DATETIME NULL DEFAULT NULL,
  `fechaCulminacionSuspension` DATETIME NULL DEFAULT NULL,
  `motivoSuspension` VARCHAR(45) NULL DEFAULT NULL,
  `cantidadDiasSuspension` INT(11) NULL DEFAULT NULL,
  `autorizo` VARCHAR(45) NULL DEFAULT NULL,
  `estadoSus` INT(11) NULL DEFAULT NULL,
  `contrato_idContrato` INT(10) NOT NULL,
  PRIMARY KEY (`idregistroSuspension`),
  INDEX `fk_suspension_contrato1_idx` (`contrato_idContrato` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`tipopago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`tipopago` (
  `idTipoPago` INT(11) NOT NULL,
  `nombre` VARCHAR(25) NULL DEFAULT NULL,
  PRIMARY KEY (`idTipoPago`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`tipotransaccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`tipotransaccion` (
  `idTipoTransaccion` INT(11) NOT NULL,
  `nombre` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`idTipoTransaccion`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`Conciliacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`Conciliacion` (
  `CorrConciliacion` INT NOT NULL,
  `noTransaccion` INT NULL,
  `fecha` DATE NULL,
  `valor` FLOAT NULL,
  PRIMARY KEY (`CorrConciliacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`transaccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`transaccion` (
  `noTransaccion` INT(11) NOT NULL,
  `valor` FLOAT NULL DEFAULT NULL,
  `idCuenta` INT(11) NULL DEFAULT NULL,
  `banco_idBanco` INT(11) NOT NULL,
  `cuentabanco_idBanco` INT(11) NOT NULL,
  `tipopago_idTipoPago` INT(11) NOT NULL,
  `Conciliacion_CorrConciliacion` INT NOT NULL,
  PRIMARY KEY (`noTransaccion`),
  INDEX `fk_transaccion_banco1_idx` (`banco_idBanco` ASC),
  INDEX `fk_transaccion_tipopago1_idx` (`tipopago_idTipoPago` ASC),
  INDEX `fk_transaccion_Conciliacion1_idx` (`Conciliacion_CorrConciliacion` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`vacaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`vacaciones` (
  `idVacaciones` INT(11) NOT NULL AUTO_INCREMENT,
  `fechaInicioVacaciones` DATETIME NULL DEFAULT NULL,
  `fechaCulminacionVacaciones` DATETIME NULL DEFAULT NULL,
  `mesSolicitado` INT NULL DEFAULT NULL,
  `cantidadDiasHabiles` INT(11) NULL DEFAULT NULL,
  `estadoVacaciones` INT NULL DEFAULT NULL,
  `encargadoAutorizacion` VARCHAR(45) NULL DEFAULT NULL,
  `contrato_idContrato` INT(10) NOT NULL,
  PRIMARY KEY (`idVacaciones`),
  INDEX `fk_vacaciones_contrato1_idx` (`contrato_idContrato` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`bono14`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`bono14` (
  `idBono` INT NOT NULL AUTO_INCREMENT,
  `fechaBono14` DATETIME NOT NULL,
  `valorPercepcion` FLOAT NOT NULL,
  `estadoBono` INT NOT NULL,
  `contrato_idContrato` INT(10) NOT NULL,
  PRIMARY KEY (`idBono`),
  INDEX `fk_bono14_contrato1_idx` (`contrato_idContrato` ASC),
  CONSTRAINT `fk_bono14_contrato1`
    FOREIGN KEY (`contrato_idContrato`)
    REFERENCES `hotelSanCarlos`.`contrato` (`idContrato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`pedido` (
  `idPedido` INT NOT NULL AUTO_INCREMENT,
  `fecha` VARCHAR(45) NULL,
  `productos_idProducto` INT(11) NOT NULL,
  PRIMARY KEY (`idPedido`),
  INDEX `fk_pedido_productos1_idx` (`productos_idProducto` ASC),
  CONSTRAINT `fk_pedido_productos1`
    FOREIGN KEY (`productos_idProducto`)
    REFERENCES `hotelSanCarlos`.`productos` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`detallepedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`detallepedido` (
  `idDetallePedido` INT NOT NULL AUTO_INCREMENT,
  `pedido_idPedido` INT NOT NULL,
  `productos_idProducto` INT(11) NOT NULL,
  PRIMARY KEY (`idDetallePedido`),
  INDEX `fk_detallepedido_pedido1_idx` (`pedido_idPedido` ASC),
  INDEX `fk_detallepedido_productos1_idx` (`productos_idProducto` ASC),
  CONSTRAINT `fk_detallepedido_pedido1`
    FOREIGN KEY (`pedido_idPedido`)
    REFERENCES `hotelSanCarlos`.`pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detallepedido_productos1`
    FOREIGN KEY (`productos_idProducto`)
    REFERENCES `hotelSanCarlos`.`productos` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`factura` (
  `idFactura` INT NOT NULL AUTO_INCREMENT,
  `fechaFactura` VARCHAR(45) NULL,
  `fechaVencimiento` VARCHAR(45) NULL,
  `totalFactura` VARCHAR(45) NULL,
  `Facturador` VARCHAR(45) NULL,
  `cliente_idCliente` INT(11) NOT NULL,
  PRIMARY KEY (`idFactura`),
  INDEX `fk_factura_cliente1_idx` (`cliente_idCliente` ASC),
  CONSTRAINT `fk_factura_cliente1`
    FOREIGN KEY (`cliente_idCliente`)
    REFERENCES `hotelSanCarlos`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`detallefactura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`detallefactura` (
  `cantidadFacturado` INT NOT NULL,
  `precioFacturado` INT NULL,
  `factura_idFactura` INT NOT NULL,
  `productos_idProducto` INT(11) NOT NULL,
  INDEX `fk_detallefactura_factura1_idx` (`factura_idFactura` ASC),
  INDEX `fk_detallefactura_productos1_idx` (`productos_idProducto` ASC),
  CONSTRAINT `fk_detallefactura_factura1`
    FOREIGN KEY (`factura_idFactura`)
    REFERENCES `hotelSanCarlos`.`factura` (`idFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detallefactura_productos1`
    FOREIGN KEY (`productos_idProducto`)
    REFERENCES `hotelSanCarlos`.`productos` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`trasladobodega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`trasladobodega` (
  `idTraslado` INT NOT NULL AUTO_INCREMENT,
  `bodegaEntra` VARCHAR(45) NULL,
  `bodegaSale` VARCHAR(45) NULL,
  `productos_idProducto` INT(11) NOT NULL,
  PRIMARY KEY (`idTraslado`),
  INDEX `fk_trasladobodega_productos1_idx` (`productos_idProducto` ASC),
  CONSTRAINT `fk_trasladobodega_productos1`
    FOREIGN KEY (`productos_idProducto`)
    REFERENCES `hotelSanCarlos`.`productos` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`tipoMedida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`tipoMedida` (
  `idTipoMedida` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idTipoMedida`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`detallebodega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`detallebodega` (
  `idDetalleBodega` INT NOT NULL AUTO_INCREMENT,
  `productos_idProducto` INT(11) NOT NULL,
  `bodega_idBodega` INT(11) NOT NULL,
  `cantidad` VARCHAR(45) NULL,
  `tipoMedida_idTipoMedida` INT NOT NULL,
  PRIMARY KEY (`idDetalleBodega`),
  INDEX `fk_detallebodega_productos1_idx` (`productos_idProducto` ASC),
  INDEX `fk_detallebodega_bodega1_idx` (`bodega_idBodega` ASC),
  INDEX `fk_detallebodega_tipoMedida1_idx` (`tipoMedida_idTipoMedida` ASC),
  CONSTRAINT `fk_detallebodega_productos1`
    FOREIGN KEY (`productos_idProducto`)
    REFERENCES `hotelSanCarlos`.`productos` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detallebodega_bodega1`
    FOREIGN KEY (`bodega_idBodega`)
    REFERENCES `hotelSanCarlos`.`bodega` (`idBodega`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detallebodega_tipoMedida1`
    FOREIGN KEY (`tipoMedida_idTipoMedida`)
    REFERENCES `hotelSanCarlos`.`tipoMedida` (`idTipoMedida`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`cotizacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`cotizacion` (
  `idCotizacion` INT NOT NULL AUTO_INCREMENT,
  `productos_idProducto` INT(11) NOT NULL,
  `cantidad` INT NULL,
  `fechaCotizacion` VARCHAR(45) NULL,
  `total` INT NULL,
  `empleado_idEmpleado` INT(11) NOT NULL,
  PRIMARY KEY (`idCotizacion`),
  INDEX `fk_cotizacion_productos1_idx` (`productos_idProducto` ASC),
  INDEX `fk_cotizacion_empleado1_idx` (`empleado_idEmpleado` ASC),
  CONSTRAINT `fk_cotizacion_productos1`
    FOREIGN KEY (`productos_idProducto`)
    REFERENCES `hotelSanCarlos`.`productos` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cotizacion_empleado1`
    FOREIGN KEY (`empleado_idEmpleado`)
    REFERENCES `hotelSanCarlos`.`empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`cierreNomina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`cierreNomina` (
  `idCierre` INT NOT NULL AUTO_INCREMENT,
  `nomina_idNomina` INT(11) NOT NULL,
  `fechaCierre` DATETIME NOT NULL,
  `totalPercibido` FLOAT NOT NULL,
  `totalDeducido` FLOAT NOT NULL,
  INDEX `fk_cierreNomina_nomina1_idx` (`nomina_idNomina` ASC),
  PRIMARY KEY (`idCierre`),
  CONSTRAINT `fk_cierreNomina_nomina1`
    FOREIGN KEY (`nomina_idNomina`)
    REFERENCES `hotelSanCarlos`.`nomina` (`idNomina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`Transacciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`Transacciones` (
  `cod_transacciones` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NULL,
  `cod_cuenta` INT NULL,
  `accion` VARCHAR(45) NULL,
  `cuentacontabilidad_nomenclatura` INT(11) NOT NULL,
  PRIMARY KEY (`cod_transacciones`),
  INDEX `fk_Transacciones_cuentacontabilidad1_idx` (`cuentacontabilidad_nomenclatura` ASC),
  CONSTRAINT `fk_Transacciones_cuentacontabilidad1`
    FOREIGN KEY (`cuentacontabilidad_nomenclatura`)
    REFERENCES `hotelSanCarlos`.`cuentacontabilidad` (`nomenclatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`Movimientos_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`Movimientos_cliente` (
  `Id_mov_cliente` INT NOT NULL AUTO_INCREMENT,
  `cod_transaccion` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `total_cobro` FLOAT NULL,
  `saldo` FLOAT NULL,
  `fecha` DATE NULL,
  `Transacciones_cod_transacciones` INT NOT NULL,
  `cliente_idCliente` INT(11) NOT NULL,
  `fechaVencimiento` DATE NULL,
  PRIMARY KEY (`Id_mov_cliente`),
  INDEX `fk_Movimientos_cliente_Transacciones1_idx` (`Transacciones_cod_transacciones` ASC),
  INDEX `fk_Movimientos_cliente_cliente1_idx` (`cliente_idCliente` ASC),
  CONSTRAINT `fk_Movimientos_cliente_Transacciones1`
    FOREIGN KEY (`Transacciones_cod_transacciones`)
    REFERENCES `hotelSanCarlos`.`Transacciones` (`cod_transacciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Movimientos_cliente_cliente1`
    FOREIGN KEY (`cliente_idCliente`)
    REFERENCES `hotelSanCarlos`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`Reporte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`Reporte` (
  `id_reporte` INT NOT NULL,
  `fecha` DATE NULL,
  `observaciones` VARCHAR(45) NULL,
  PRIMARY KEY (`id_reporte`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`Movimientos_proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`Movimientos_proveedor` (
  `Id_mov_proveedor` INT NOT NULL,
  `cod_transaccion` INT NULL,
  `id_proveedor` INT NULL,
  `total_pago` FLOAT NULL,
  `saldo` FLOAT NULL,
  `fecha` DATE NULL,
  `Transacciones_cod_transacciones` INT NOT NULL,
  `proveedores_idProveedores` INT(11) NOT NULL,
  PRIMARY KEY (`Id_mov_proveedor`),
  INDEX `fk_Movimientos_proveedor_Transacciones1_idx` (`Transacciones_cod_transacciones` ASC),
  INDEX `fk_Movimientos_proveedor_proveedores1_idx` (`proveedores_idProveedores` ASC),
  CONSTRAINT `fk_Movimientos_proveedor_Transacciones1`
    FOREIGN KEY (`Transacciones_cod_transacciones`)
    REFERENCES `hotelSanCarlos`.`Transacciones` (`cod_transacciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Movimientos_proveedor_proveedores1`
    FOREIGN KEY (`proveedores_idProveedores`)
    REFERENCES `hotelSanCarlos`.`proveedores` (`idProveedores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`historial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`historial` (
  `idHistorial` INT NOT NULL,
  `fecha` DATE NULL,
  `valor` DOUBLE NULL,
  `cuentacontabilidad_nomenclatura` INT(11) NOT NULL,
  PRIMARY KEY (`idHistorial`),
  INDEX `fk_historial_cuentacontabilidad1_idx` (`cuentacontabilidad_nomenclatura` ASC),
  CONSTRAINT `fk_historial_cuentacontabilidad1`
    FOREIGN KEY (`cuentacontabilidad_nomenclatura`)
    REFERENCES `hotelSanCarlos`.`cuentacontabilidad` (`nomenclatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`detalletransaccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`detalletransaccion` (
  `CorrDetTransaccion` INT NOT NULL,
  `TipoOperacion` TINYINT NULL,
  `transaccion_noTransaccion` INT(11) NOT NULL,
  `tipotransaccion_idTipoTransaccion` INT(11) NOT NULL,
  PRIMARY KEY (`CorrDetTransaccion`),
  INDEX `fk_detalletransaccion_transaccion1_idx` (`transaccion_noTransaccion` ASC),
  INDEX `fk_detalletransaccion_tipotransaccion1_idx` (`tipotransaccion_idTipoTransaccion` ASC),
  CONSTRAINT `fk_detalletransaccion_transaccion1`
    FOREIGN KEY (`transaccion_noTransaccion`)
    REFERENCES `hotelSanCarlos`.`transaccion` (`noTransaccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalletransaccion_tipotransaccion1`
    FOREIGN KEY (`tipotransaccion_idTipoTransaccion`)
    REFERENCES `hotelSanCarlos`.`tipotransaccion` (`idTipoTransaccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`detalleHabitacionReservacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`detalleHabitacionReservacion` (
  `reservacion_idReservacion` INT(11) NOT NULL,
  `habitacion_idHabitacion` INT(11) NOT NULL,
  INDEX `fk_detalleHabitacionReservacion_reservacion1_idx` (`reservacion_idReservacion` ASC),
  INDEX `fk_detalleHabitacionReservacion_habitacion1_idx` (`habitacion_idHabitacion` ASC),
  CONSTRAINT `fk_detalleHabitacionReservacion_reservacion1`
    FOREIGN KEY (`reservacion_idReservacion`)
    REFERENCES `hotelSanCarlos`.`reservacion` (`idReservacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalleHabitacionReservacion_habitacion1`
    FOREIGN KEY (`habitacion_idHabitacion`)
    REFERENCES `hotelSanCarlos`.`habitacion` (`idHabitacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`tipoHuesped`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`tipoHuesped` (
  `idTipoHuesped` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoHuesped`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`detalleTipoHuepedReservacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`detalleTipoHuepedReservacion` (
  `reservacion_idReservacion` INT(11) NOT NULL,
  `tipoHuesped_idTipoHuesped` INT NOT NULL,
  `cantidad` INT NOT NULL,
  INDEX `fk_detalleTipoHuepedReservacion_reservacion1_idx` (`reservacion_idReservacion` ASC),
  INDEX `fk_detalleTipoHuepedReservacion_tipoHuesped1_idx` (`tipoHuesped_idTipoHuesped` ASC),
  CONSTRAINT `fk_detalleTipoHuepedReservacion_reservacion1`
    FOREIGN KEY (`reservacion_idReservacion`)
    REFERENCES `hotelSanCarlos`.`reservacion` (`idReservacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalleTipoHuepedReservacion_tipoHuesped1`
    FOREIGN KEY (`tipoHuesped_idTipoHuesped`)
    REFERENCES `hotelSanCarlos`.`tipoHuesped` (`idTipoHuesped`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`detalleRecetaIngrediente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`detalleRecetaIngrediente` (
  `receta_idReceta` INT NOT NULL,
  `pesoOcantidad` VARCHAR(45) NOT NULL,
  `productos_idProducto` INT(11) NOT NULL,
  INDEX `fk_detalleRecetaIngrediente_receta1_idx` (`receta_idReceta` ASC),
  PRIMARY KEY (`receta_idReceta`, `productos_idProducto`),
  INDEX `fk_detalleRecetaIngrediente_productos1_idx` (`productos_idProducto` ASC),
  CONSTRAINT `fk_detalleRecetaIngrediente_receta1`
    FOREIGN KEY (`receta_idReceta`)
    REFERENCES `hotelSanCarlos`.`receta` (`idReceta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalleRecetaIngrediente_productos1`
    FOREIGN KEY (`productos_idProducto`)
    REFERENCES `hotelSanCarlos`.`productos` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`vehiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`vehiculo` (
  `idVehiculo` INT NOT NULL,
  `tipo` VARCHAR(45) NULL,
  `capacidad` VARCHAR(45) NULL,
  `placa` VARCHAR(45) NULL,
  PRIMARY KEY (`idVehiculo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`piloto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`piloto` (
  `idpiloto` INT NOT NULL,
  `nombre` VARCHAR(50) NULL,
  `dpi` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  PRIMARY KEY (`idpiloto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`viaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`viaje` (
  `idViaje` INT NOT NULL AUTO_INCREMENT,
  `fechaPrevistaOperacion` VARCHAR(45) NULL,
  `observaciones` VARCHAR(45) NULL,
  `vehiculo_idVehiculo` INT NOT NULL,
  `bodegaProcedencia` VARCHAR(45) NULL,
  `bodegaDestino` VARCHAR(45) NULL,
  `piloto_idpiloto` INT NOT NULL,
  PRIMARY KEY (`idViaje`),
  INDEX `fk_viaje_vehiculo1_idx` (`vehiculo_idVehiculo` ASC),
  INDEX `fk_viaje_piloto1_idx` (`piloto_idpiloto` ASC),
  CONSTRAINT `fk_viaje_vehiculo1`
    FOREIGN KEY (`vehiculo_idVehiculo`)
    REFERENCES `hotelSanCarlos`.`vehiculo` (`idVehiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_viaje_piloto1`
    FOREIGN KEY (`piloto_idpiloto`)
    REFERENCES `hotelSanCarlos`.`piloto` (`idpiloto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`mercaderiaEnvio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`mercaderiaEnvio` (
  `idmercaderiaEnvio` INT NOT NULL AUTO_INCREMENT,
  `pesoMercaderia` INT NULL,
  `cantidadProducto` VARCHAR(45) NULL,
  `productos_idProducto` INT(11) NOT NULL,
  `observaciones` VARCHAR(45) NULL,
  `viaje_idViaje` INT NOT NULL,
  PRIMARY KEY (`idmercaderiaEnvio`),
  INDEX `fk_notaEnvio_productos1_idx` (`productos_idProducto` ASC),
  INDEX `fk_mercaderiaEnvio_viaje1_idx` (`viaje_idViaje` ASC),
  CONSTRAINT `fk_notaEnvio_productos1`
    FOREIGN KEY (`productos_idProducto`)
    REFERENCES `hotelSanCarlos`.`productos` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mercaderiaEnvio_viaje1`
    FOREIGN KEY (`viaje_idViaje`)
    REFERENCES `hotelSanCarlos`.`viaje` (`idViaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`comisiones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`comisiones` (
  `idComision` INT NOT NULL AUTO_INCREMENT,
  `porcentaje` FLOAT NULL,
  `inventario_codigoInventario` INT(11) NOT NULL,
  `empleado_idEmpleado` INT(11) NOT NULL,
  PRIMARY KEY (`idComision`),
  INDEX `fk_comisiones_inventario1_idx` (`inventario_codigoInventario` ASC),
  INDEX `fk_comisiones_empleado1_idx` (`empleado_idEmpleado` ASC),
  CONSTRAINT `fk_comisiones_inventario1`
    FOREIGN KEY (`inventario_codigoInventario`)
    REFERENCES `hotelSanCarlos`.`inventario` (`codigoInventario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comisiones_empleado1`
    FOREIGN KEY (`empleado_idEmpleado`)
    REFERENCES `hotelSanCarlos`.`empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`transaccionesInventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`transaccionesInventario` (
  `idTransaccionesInventario` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `efecto` VARCHAR(45) NULL,
  `cuentacontabilidad_nomenclatura` INT(11) NOT NULL,
  `estatus` VARCHAR(45) NULL,
  `fechaTransaccion` DATE NULL,
  PRIMARY KEY (`idTransaccionesInventario`),
  INDEX `fk_transaccionesInventario_cuentacontabilidad1_idx` (`cuentacontabilidad_nomenclatura` ASC),
  CONSTRAINT `fk_transaccionesInventario_cuentacontabilidad1`
    FOREIGN KEY (`cuentacontabilidad_nomenclatura`)
    REFERENCES `hotelSanCarlos`.`cuentacontabilidad` (`nomenclatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`TipoMovimientoIventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`TipoMovimientoIventario` (
  `idTipoMovimientoIventario` INT NOT NULL AUTO_INCREMENT,
  `nombreTipoMovimiento` VARCHAR(45) NULL,
  `Ingresoosalida` INT NULL,
  PRIMARY KEY (`idTipoMovimientoIventario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`movimientoInventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`movimientoInventario` (
  `codigoMovimientoInventario` INT NOT NULL,
  `descripcion` VARCHAR(45) NULL,
  `costo` INT NULL,
  `fecha` VARCHAR(45) NULL,
  `transaccionesInventario_idTransaccionesInventario` INT NOT NULL,
  `TipoMovimientoIventario_idTipoMovimientoIventario` INT NOT NULL,
  `bodega_idBodegaOrigen` INT(11) NOT NULL,
  `bodega_idBodegaDestino` INT(11) NOT NULL,
  PRIMARY KEY (`codigoMovimientoInventario`),
  INDEX `fk_movimientoInventario_transaccionesInventario1_idx` (`transaccionesInventario_idTransaccionesInventario` ASC),
  INDEX `fk_movimientoInventario_TipoMovimientoIventario1_idx` (`TipoMovimientoIventario_idTipoMovimientoIventario` ASC),
  INDEX `fk_movimientoInventario_bodega1_idx` (`bodega_idBodegaOrigen` ASC),
  INDEX `fk_movimientoInventario_bodega2_idx` (`bodega_idBodegaDestino` ASC),
  CONSTRAINT `fk_movimientoInventario_transaccionesInventario1`
    FOREIGN KEY (`transaccionesInventario_idTransaccionesInventario`)
    REFERENCES `hotelSanCarlos`.`transaccionesInventario` (`idTransaccionesInventario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movimientoInventario_TipoMovimientoIventario1`
    FOREIGN KEY (`TipoMovimientoIventario_idTipoMovimientoIventario`)
    REFERENCES `hotelSanCarlos`.`TipoMovimientoIventario` (`idTipoMovimientoIventario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movimientoInventario_bodega1`
    FOREIGN KEY (`bodega_idBodegaOrigen`)
    REFERENCES `hotelSanCarlos`.`bodega` (`idBodega`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movimientoInventario_bodega2`
    FOREIGN KEY (`bodega_idBodegaDestino`)
    REFERENCES `hotelSanCarlos`.`bodega` (`idBodega`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`polizaInventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`polizaInventario` (
  `codigoPolizaInventario` INT NOT NULL,
  `ivaxCobrar` INT NULL,
  `ivaxPagar` INT NULL,
  `totalDebe` INT NULL,
  `totalHaber` INT NULL,
  `fechaInicial` VARCHAR(45) NULL,
  `fechaFinal` VARCHAR(45) NULL,
  `movimientoInventario_codigoMovimientoInventario` INT NOT NULL,
  PRIMARY KEY (`codigoPolizaInventario`),
  INDEX `fk_polizaInventario_movimientoInventario1_idx` (`movimientoInventario_codigoMovimientoInventario` ASC),
  CONSTRAINT `fk_polizaInventario_movimientoInventario1`
    FOREIGN KEY (`movimientoInventario_codigoMovimientoInventario`)
    REFERENCES `hotelSanCarlos`.`movimientoInventario` (`codigoMovimientoInventario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`perfil` (
  `idPerfil` INT NOT NULL AUTO_INCREMENT,
  `nombrePerfil` VARCHAR(45) NULL,
  `descripcionPerfil` VARCHAR(45) NULL,
  PRIMARY KEY (`idPerfil`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`reporteador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`reporteador` (
  `idReporte` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `path` VARCHAR(45) NULL,
  `fecha` VARCHAR(45) NULL,
  PRIMARY KEY (`idReporte`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`aplicacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`aplicacion` (
  `idAplicacion` INT NOT NULL,
  `nombreAplicacion` VARCHAR(45) NULL,
  `descripcionAplicacion` VARCHAR(45) NULL,
  `habilitarAplicacion` VARCHAR(45) NULL,
  `reporteador_idReporte` INT NOT NULL,
  PRIMARY KEY (`idAplicacion`),
  INDEX `fk_aplicacion_reporteador1_idx` (`reporteador_idReporte` ASC),
  CONSTRAINT `fk_aplicacion_reporteador1`
    FOREIGN KEY (`reporteador_idReporte`)
    REFERENCES `hotelSanCarlos`.`reporteador` (`idReporte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`detallePerfilAplicacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`detallePerfilAplicacion` (
  `aplicacion_idAplicacion` INT NOT NULL,
  `perfil_idPerfil` INT NOT NULL,
  INDEX `fk_detallePerfilAplicacion_aplicacion1_idx` (`aplicacion_idAplicacion` ASC),
  INDEX `fk_detallePerfilAplicacion_perfil1_idx` (`perfil_idPerfil` ASC),
  CONSTRAINT `fk_detallePerfilAplicacion_aplicacion1`
    FOREIGN KEY (`aplicacion_idAplicacion`)
    REFERENCES `hotelSanCarlos`.`aplicacion` (`idAplicacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detallePerfilAplicacion_perfil1`
    FOREIGN KEY (`perfil_idPerfil`)
    REFERENCES `hotelSanCarlos`.`perfil` (`idPerfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`usuario` (
  `idUsuario` INT NOT NULL,
  `usuario` VARCHAR(45) NULL,
  `nombreUsuario` VARCHAR(45) NULL,
  `apellidoUsuario` VARCHAR(45) NULL,
  `contrasena` VARCHAR(45) NULL,
  `correoUsuario` VARCHAR(45) NULL,
  `telefonoUsuario` VARCHAR(45) NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`detalleUsuarioPerfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`detalleUsuarioPerfil` (
  `perfil_idPerfil` INT NOT NULL,
  `usuario_idUsuario` INT NOT NULL,
  INDEX `fk_detalleUsuarioAplicacion_perfil1_idx` (`perfil_idPerfil` ASC),
  INDEX `fk_detalleUsuarioAplicacion_usuario1_idx` (`usuario_idUsuario` ASC),
  CONSTRAINT `fk_detalleUsuarioAplicacion_perfil1`
    FOREIGN KEY (`perfil_idPerfil`)
    REFERENCES `hotelSanCarlos`.`perfil` (`idPerfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalleUsuarioAplicacion_usuario1`
    FOREIGN KEY (`usuario_idUsuario`)
    REFERENCES `hotelSanCarlos`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`detalleAplicacionDerecho`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`detalleAplicacionDerecho` (
  `ingresar` TINYINT NULL,
  `modificar` TINYINT NULL,
  `eliminar` TINYINT NULL,
  `imprimir` TINYINT NULL,
  `consultar` TINYINT NULL,
  `usuario_idUsuario` INT NOT NULL,
  `aplicacion_idAplicacion` INT NOT NULL,
  INDEX `fk_detalleAplicacionDerecho_usuario1_idx` (`usuario_idUsuario` ASC),
  INDEX `fk_detalleAplicacionDerecho_aplicacion1_idx` (`aplicacion_idAplicacion` ASC),
  CONSTRAINT `fk_detalleAplicacionDerecho_usuario1`
    FOREIGN KEY (`usuario_idUsuario`)
    REFERENCES `hotelSanCarlos`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalleAplicacionDerecho_aplicacion1`
    FOREIGN KEY (`aplicacion_idAplicacion`)
    REFERENCES `hotelSanCarlos`.`aplicacion` (`idAplicacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`bitacora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`bitacora` (
  `idBitacora` INT NOT NULL,
  `fechaBitacora` DATE NULL,
  `horaBitacora` TIME NULL,
  `accionUsuario` VARCHAR(45) NULL,
  `resultadoBitacora` VARCHAR(45) NULL,
  `errorBitacora` VARCHAR(45) NULL,
  `ipPc` VARCHAR(45) NULL,
  `usuario_idUsuario` INT NOT NULL,
  `aplicacion_idAplicacion` INT NOT NULL,
  PRIMARY KEY (`idBitacora`),
  INDEX `fk_bitacora_usuario1_idx` (`usuario_idUsuario` ASC),
  INDEX `fk_bitacora_aplicacion1_idx` (`aplicacion_idAplicacion` ASC),
  CONSTRAINT `fk_bitacora_usuario1`
    FOREIGN KEY (`usuario_idUsuario`)
    REFERENCES `hotelSanCarlos`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bitacora_aplicacion1`
    FOREIGN KEY (`aplicacion_idAplicacion`)
    REFERENCES `hotelSanCarlos`.`aplicacion` (`idAplicacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`ordenedecompra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`ordenedecompra` (
  `idOrdenesCompra` INT NOT NULL,
  `proveedores_idProveedores` INT(11) NOT NULL,
  `productos_idProducto` INT(11) NOT NULL,
  `categoria` VARCHAR(45) NULL,
  PRIMARY KEY (`idOrdenesCompra`),
  INDEX `fk_ordenedecompra_proveedores1_idx` (`proveedores_idProveedores` ASC),
  INDEX `fk_ordenedecompra_productos1_idx` (`productos_idProducto` ASC),
  CONSTRAINT `fk_ordenedecompra_proveedores1`
    FOREIGN KEY (`proveedores_idProveedores`)
    REFERENCES `hotelSanCarlos`.`proveedores` (`idProveedores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordenedecompra_productos1`
    FOREIGN KEY (`productos_idProducto`)
    REFERENCES `hotelSanCarlos`.`productos` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`controldevolucion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`controldevolucion` (
  `idControlDevolucion` INT NOT NULL,
  `devaluacionAutorizada` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  `ordenedecompra_idOrdenesCompra` INT NOT NULL,
  PRIMARY KEY (`idControlDevolucion`),
  INDEX `fk_controldevolucion_ordenedecompra1_idx` (`ordenedecompra_idOrdenesCompra` ASC),
  CONSTRAINT `fk_controldevolucion_ordenedecompra1`
    FOREIGN KEY (`ordenedecompra_idOrdenesCompra`)
    REFERENCES `hotelSanCarlos`.`ordenedecompra` (`idOrdenesCompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`controldemoras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`controldemoras` (
  `idControlDemoras` INT NOT NULL,
  `fechaInicial` DATE NULL,
  `fechaPrevistaDeRecibido` DATE NULL,
  `demora` VARCHAR(45) NULL,
  `ordenedecompra_idOrdenesCompra` INT NOT NULL,
  PRIMARY KEY (`idControlDemoras`),
  INDEX `fk_controldemoras_ordenedecompra1_idx` (`ordenedecompra_idOrdenesCompra` ASC),
  CONSTRAINT `fk_controldemoras_ordenedecompra1`
    FOREIGN KEY (`ordenedecompra_idOrdenesCompra`)
    REFERENCES `hotelSanCarlos`.`ordenedecompra` (`idOrdenesCompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelSanCarlos`.`DetalleMovimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelSanCarlos`.`DetalleMovimiento` (
  `idDetalleMovimiento` INT NOT NULL AUTO_INCREMENT,
  `Cantidad` INT NULL,
  `CostoUnitario` INT NULL,
  `CostoTotal` INT NULL,
  `movimientoInventario_codigoMovimientoInventario` INT NOT NULL,
  `productos_idProducto` INT(11) NOT NULL,
  PRIMARY KEY (`idDetalleMovimiento`),
  INDEX `fk_DetalleMovimiento_movimientoInventario1_idx` (`movimientoInventario_codigoMovimientoInventario` ASC),
  INDEX `fk_DetalleMovimiento_productos1_idx` (`productos_idProducto` ASC),
  CONSTRAINT `fk_DetalleMovimiento_movimientoInventario1`
    FOREIGN KEY (`movimientoInventario_codigoMovimientoInventario`)
    REFERENCES `hotelSanCarlos`.`movimientoInventario` (`codigoMovimientoInventario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DetalleMovimiento_productos1`
    FOREIGN KEY (`productos_idProducto`)
    REFERENCES `hotelSanCarlos`.`productos` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

describe cliente;
insert into cliente values(100,3183280,"Jackeline Andrea","Lopez Alvarado","Guatemala","Guatemala","Guatemala",22331145,"alguien@gmail.com",13,600);
insert into cliente(nitCliente,nombreCliente,apellidoCliente,direccionCliente,ciudadCliente,paisCliente,telefonoCliente,correoCliente,porcentajeCompra_idPorcentaje,vendedor_idVendedor) values(3183280,"Jackeline Andrea","Lopez Alvarado","Guatemala","Guatemala","Guatemala",22331145,"alguien@gmail.com",13,600);
insert into cliente(nitCliente,nombreCliente,apellidoCliente,direccionCliente,ciudadCliente,paisCliente,telefonoCliente,correoCliente,porcentajeCompra_idPorcentaje,vendedor_idVendedor) values(1231404,"Karina","Aguilar","Guatemala","Guatemala","Guatemala",22331145,"alguien@gmail.com",13,600);
insert into cliente(nitCliente,nombreCliente,apellidoCliente,direccionCliente,ciudadCliente,paisCliente,telefonoCliente,correoCliente,porcentajeCompra_idPorcentaje,vendedor_idVendedor) values(7841520,"Andrea","Romero","Guatemala","Guatemala","Guatemala",22331145,"alguien@gmail.com",13,600);
insert into cliente(nitCliente,nombreCliente,apellidoCliente,direccionCliente,ciudadCliente,paisCliente,telefonoCliente,correoCliente,porcentajeCompra_idPorcentaje,vendedor_idVendedor) values(7841200,"Lucia","Muralles","Guatemala","Guatemala","Guatemala",22331145,"alguien@gmail.com",13,600);
insert into cliente(nitCliente,nombreCliente,apellidoCliente,direccionCliente,ciudadCliente,paisCliente,telefonoCliente,correoCliente,porcentajeCompra_idPorcentaje,vendedor_idVendedor) values(4851201,"Domingo","Alvarez","Guatemala","Guatemala","Guatemala",22331145,"alguien@gmail.com",13,600);
insert into cliente(nitCliente,nombreCliente,apellidoCliente,direccionCliente,ciudadCliente,paisCliente,telefonoCliente,correoCliente,porcentajeCompra_idPorcentaje,vendedor_idVendedor) values(3205412,"Alejandra","Palencia","Guatemala","Guatemala","Guatemala",22331145,"alguien@gmail.com",13,600);
insert into cliente(nitCliente,nombreCliente,apellidoCliente,direccionCliente,ciudadCliente,paisCliente,telefonoCliente,correoCliente,porcentajeCompra_idPorcentaje,vendedor_idVendedor) values(2146324,"Stephanie","Gamboa","Guatemala","Guatemala","Guatemala",22331145,"alguien@gmail.com",13,600);
insert into cliente(nitCliente,nombreCliente,apellidoCliente,direccionCliente,ciudadCliente,paisCliente,telefonoCliente,correoCliente,porcentajeCompra_idPorcentaje,vendedor_idVendedor) values(3546214,"Eva Maria","Cante","Guatemala","Guatemala","Guatemala",22331145,"alguien@gmail.com",13,600);
insert into cliente(nitCliente,nombreCliente,apellidoCliente,direccionCliente,ciudadCliente,paisCliente,telefonoCliente,correoCliente,porcentajeCompra_idPorcentaje,vendedor_idVendedor) values(6982010,"Katherine","Rios","Guatemala","Guatemala","Guatemala",22331145,"alguien@gmail.com",13,600);

describe cuentacontabilidad;
insert into cuentacontabilidad values(87654321,"nomenclatura_nombre","Saldo",5,3500,300,250,3550,600,400,700,"naturaleza","tipo");
insert into cuentacontabilidad values(12354050,"nomenclatura_nombre","Saldo",5,3500,300,250,3550,600,400,700,"naturaleza","tipo");
insert into cuentacontabilidad values(85410210,"nomenclatura_nombre","Saldo",5,3500,300,250,3550,600,400,700,"naturaleza","tipo");
insert into cuentacontabilidad values(78110220,"nomenclatura_nombre","Saldo",5,3500,300,250,3550,600,400,700,"naturaleza","tipo");
insert into cuentacontabilidad values(32010255,"nomenclatura_nombre","Saldo",5,3500,300,250,3550,600,400,700,"naturaleza","tipo");
insert into cuentacontabilidad values(21321312,"nomenclatura_nombre","Saldo",5,3500,300,250,3550,600,400,700,"naturaleza","tipo");
insert into cuentacontabilidad values(15426634,"nomenclatura_nombre","Saldo",5,3500,300,250,3550,600,400,700,"naturaleza","tipo");
insert into cuentacontabilidad values(94101202,"nomenclatura_nombre","Saldo",5,3500,300,250,3550,600,400,700,"naturaleza","tipo");
insert into cuentacontabilidad values(61014004,"nomenclatura_nombre","Saldo",5,3500,300,250,3550,600,400,700,"naturaleza","tipo");

describe transacciones;
insert into transacciones(cod_transacciones,descripcion,accion,cuentacontabilidad_nomenclatura) values(103,"nota de debito","+",87654321);
insert into transacciones(descripcion,accion,cuentacontabilidad_nomenclatura) values("nota de debito","+",87654321);
select * from transacciones;

describe movimientos_cliente;
insert into movimientos_cliente(Id_mov_cliente,Transacciones_cod_transacciones,cliente_idCliente,total_cobro,saldo,fecha,fechaVencimiento,actual) values(200,101,100,600,2000,"2017-10-16","2017-12-12",1);
insert into movimientos_cliente(Transacciones_cod_transacciones,cliente_idCliente,total_cobro,saldo,fecha,fechaVencimiento,actual) values(101,100,600,2000,"2017-10-16","2017-12-12",1);
select * from movimientos_cliente;

drop view vista_transacciones;
create view vista_transacciones as select t.cod_transacciones as CODIGO, t.descripcion AS DESCRIPCION, t.cuentacontabilidad_nomenclatura AS CUENTA
from transacciones t inner join  cuentacontabilidad c on t.cuentacontabilidad_nomenclatura=c.nomenclatura;
select * from vista_transacciones;


drop view vista_movimientos;
create view vista_movimientos as select m.Id_mov_cliente AS CODIGO,c.nombreCliente AS NOMBRE, c.apellidoCliente AS APELLIDO, t.descripcion AS DESCRIPCION, 
m.total_cobro AS ULTIMO_PAGO,m.saldo AS SALDO_PENDIENTE, m.fecha AS FECHA_DE_PAGO_REALIZADO, m.fechaVencimiento AS FECHA_DE_VENCIMIENTO, m.actual AS ACTUAL
from cliente c join movimientos_cliente m on c.idCliente = m.cliente_idCliente join transacciones t on m.Transacciones_cod_transacciones = t.cod_transacciones 
order by c.nombreCliente asc, m.Id_mov_cliente desc;
select * from vista_movimientos;


select m.total_cobro,m.saldo,m.fecha,m.Transacciones_cod_transacciones,m.cliente_idCliente,m.fechaVencimiento,m.actual from movimientos_cliente m where Id_mov_cliente = 203;
               
select m.total_cobro,m.saldo,m.fecha,m.Transacciones_cod_transacciones,m.cliente_idCliente,m.fechaVencimiento from movimientos_cliente m
where Id_mov_cliente=202;

select fecha from movimientos_cliente;
select accion from transacciones where cod_transacciones=103;

select saldo from movimientos_cliente where cliente_idCliente=100 and actual=1;


select * from movimientos_cliente;


#esteee
select sum(saldo) as TOTAL_DEUDA from movimientos_cliente where cliente_idCliente=100 and actual=1;
#es lo mismo que estee
select Id_mov_cliente from movimientos_cliente where total_cobro=600 and saldo=2000;

select * from cliente;

select c.idCliente, c.nombreCliente from cliente c where c.nombreCliente like "Xiomara";

select c.idCliente from cliente c where c.nombreCliente like "Xiomara";

select c.idCliente from cliente c where c.apellidoCliente like "Katherine";

select saldo from movimientos_cliente where cliente_idCliente=110;

select * from cuentacontabilidad;

select * from transacciones;

SELECT nomenclatura + ' ' + nombre as NOM_COMPLETO, nombre from cuentacontabilidad;

SELECT  CONCAT(nomenclatura,', ', nombre) AS DatosCombinados FROM cuentacontabilidad;

SELECT CONCAT(cod_transacciones,', ', descripcion) AS DatosCombinados1 FROM transacciones;

SELECT CONCAT(idCliente,', ', nombreCliente,' ', apellidoCliente) AS DatosCombinados2 FROM cliente;


create view reporte_movs as select * from movimientos_cliente;

select * from reporte_movs;


select * from cliente;

SELECT nombreCliente FROM cliente where idCliente = 102;



drop view vista_cliente;

create view vista_cliente as select c.nombreCliente, c.apellidoCliente from cliente c join movimientos_cliente m 
on c.idCliente = m.cliente_idCliente and m.Id_mov_cliente=221;

select * from vista_cliente;

select c.nombreCliente from cliente c join movimientos_cliente m 
on c.idCliente = m.cliente_idCliente and m.Id_mov_cliente=221;

select idCliente,nombreCliente, apellidoCliente from cliente where idCliente= 102;

truncate movimientos_cliente;

###################################################333
create view reporte_trans as select * from transacciones;

select * from reporte_trans;

select cod_transacciones,descripcion,accion,cuentacontabilidad_nomenclatura from transacciones;

create view reporte_movs as select * from movimientos_cliente;

select * from reporte_movs;


create view vista_transacciones as select t.cod_transacciones as CODIGO, t.descripcion AS DESCRIPCION, t.cuentacontabilidad_nomenclatura AS CUENTA
from transacciones t inner join  cuentacontabilidad c on t.cuentacontabilidad_nomenclatura=c.nomenclatura;


select * from vista_transacciones;


create view vista_movimientos as select m.Id_mov_cliente AS CODIGO,c.nombreCliente AS NOMBRE, c.apellidoCliente AS APELLIDO, t.descripcion AS DESCRIPCION, 
m.total_cobro AS ULTIMO_PAGO,m.saldo AS SALDO_PENDIENTE, m.fecha AS FECHA_DE_PAGO_REALIZADO, m.fechaVencimiento AS FECHA_DE_VENCIMIENTO, m.actual AS ACTUAL
from cliente c join movimientos_cliente m on c.idCliente = m.cliente_idCliente join transacciones t on m.Transacciones_cod_transacciones = t.cod_transacciones 
order by c.nombreCliente asc, m.Id_mov_cliente desc;


select * from vista_movimientos;



