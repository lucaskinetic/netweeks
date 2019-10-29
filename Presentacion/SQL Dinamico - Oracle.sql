CREATE TABLE `Usuarios` (
  `Id_Usuario`                   INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Usuario`                      VARCHAR(20) NOT NULL,
  `Clave`                        VARCHAR(255) NOT NULL,
  `Email`                        VARCHAR(100),
  `Habilitado`                   BOOL DEFAULT True,
  `Fecha_Ult_Acceso`             DATETIME,
CONSTRAINT `Pk_Usuarios` PRIMARY KEY (`Id_Usuario`)
);

SELECT CONCAT(
	'ALTER TABLE ', table_name, CONCAT(' ADD COLUMN (ID_USUARIO_APP INT UNSIGNED NOT NULL);',
	'ALTER TABLE ', table_name, ' ADD CONSTRAINT Fk_', table_name, '_USUARIOS FOREIGN KEY (ID_USUARIO_APP) REFERENCES USUARIOS (ID_USUARIO);',
	'ALTER TABLE ', table_name, ' ADD COLUMN (FECHA_ALTA DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP);',
	'ALTER TABLE ', table_name, ' ADD COLUMN (FECHA_MODIF DATETIME);',
	'ALTER TABLE ', CONCAT(table_name, ' ADD COLUMN (FECHA_BAJA DATETIME);')
)
FROM sys.ALL_TABLES;