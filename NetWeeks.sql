/*============================================================================*/
/* DBMS: MySQL 8*/
/* Created on : 10/16/2019 5:21:15 p. m.                                           */
/*============================================================================*/


/*============================================================================*/
/*                                  TABLES                                    */
/*============================================================================*/
CREATE TABLE `CUENTAS` (            
  `ID_CUENTA`               INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `NUMERO_CUENTA`           VARCHAR(20) NOT NULL,
  `CBU`                     VARCHAR(40) NOT NULL,
CONSTRAINT `PK_CUENTAS` PRIMARY KEY (`ID_CUENTA`)
)                                 
;
                                              
CREATE TABLE `INGRESOS` (
  `ID_INGRESO`              INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `FECHA`                   DATETIME(2) NOT NULL,
  `MONTO`                   DECIMAL(2,2) UNSIGNED NOT NULL,
  `OBSERVACION`             VARCHAR(100),
  `ID_CUENTA`               INT(10) unsigned not NULL,
CONSTRAINT `PK_INGRESOS` PRIMARY KEY (`ID_INGRESO`)
)
;

CREATE TABLE `GASTOS` (
  `ID_GASTO`                INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `FECHA`                   DATETIME(2) NOT NULL,
  `MONTO`                   DECIMAL(10,2) UNSIGNED NOT NULL,
  `OBSERVACION`             VARCHAR(100),
  `ID_CUENTA`               INT(10) unsigned not NULL,
CONSTRAINT `PK_GASTOS` PRIMARY KEY (`ID_GASTO`)
)
;

CREATE TABLE `TRANSFERENCIA` (
  `ID_TRANSFERENCIA`        INT(10) UNSIGNED NOT NULL,
  `ID_CUENTA_ORIGEN`        INT(10) UNSIGNED NOT NULL,
  `ID_CUENTA_DESTINO`       INT(10) UNSIGNED NOT NULL,
  `MONTO`                   DECIMAL(10,2) UNSIGNED NOT NULL,
  `FECHA`                   DATETIME(2) NOT NULL,
  `OBSERVACION`             VARCHAR(100),
  `AUTORIZADA`              INT(1) UNSIGNED DEFAULT 0 NOT NULL,
CONSTRAINT `PK_TRANSFERENCIA` PRIMARY KEY (`ID_TRANSFERENCIA`)
)
;

/*============================================================================*/
/*                               FOREIGN KEYS                                 */
/*============================================================================*/
ALTER TABLE `INGRESOS` 
    ADD CONSTRAINT `FK_REFERENCE_2`
        FOREIGN KEY (`ID_CUENTA`)
            REFERENCES `CUENTAS` (`ID_CUENTA`)
 ;


ALTER TABLE `GASTOS`
    ADD CONSTRAINT `FK_REFERENCE_1`
        FOREIGN KEY (`ID_CUENTA`)
            REFERENCES `CUENTAS` (`ID_CUENTA`)
 ;


ALTER TABLE `TRANSFERENCIA`
    ADD CONSTRAINT `FK_REFERENCE_5`
        FOREIGN KEY (`ID_CUENTA_ORIGEN`)
            REFERENCES `CUENTAS` (`ID_CUENTA`)
 ;

ALTER TABLE `TRANSFERENCIA`
    ADD CONSTRAINT `FK_REFERENCE_6`
        FOREIGN KEY (`ID_CUENTA_DESTINO`)
            REFERENCES `CUENTAS` (`ID_CUENTA`)
 ;

