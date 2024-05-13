-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'publicar'
-- 
-- ---

DROP TABLE IF EXISTS `publicar`;
		
CREATE TABLE `publicar` (
  `id_publicação` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `data` DATE NULL DEFAULT NULL,
  `horário` TIME NULL DEFAULT NULL,
  `id_publicador` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id_publicação`)
);

-- ---
-- Table 'página de OSC'
-- 
-- ---

DROP TABLE IF EXISTS `página de OSC`;
		
CREATE TABLE `página de OSC` (
  `id_OSC` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `CNPJ` INTEGER NULL DEFAULT NULL,
  `Nome` INTEGER NULL DEFAULT NULL,
  `área` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id_OSC`)
);

-- ---
-- Table 'usuário'
-- 
-- ---

DROP TABLE IF EXISTS `usuário`;
		
CREATE TABLE `usuário` (
  `nome` VARCHAR(100) NOT NULL DEFAULT 'NULL',
  `sobrenome` VARCHAR(100) NOT NULL DEFAULT 'NULL',
  `cidade` INTEGER NOT NULL DEFAULT NULL,
  `CPF` INTEGER NULL DEFAULT NULL,
  `área` MEDIUMTEXT NULL DEFAULT NULL,
  `gênero` MEDIUMTEXT NULL DEFAULT NULL,
  `id_usuário` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuário`)
);

-- ---
-- Table 'publicação'
-- 
-- ---

DROP TABLE IF EXISTS `publicação`;
		
CREATE TABLE `publicação` (
  `id_post` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `título` INTEGER NULL DEFAULT NULL,
  `descrição` INTEGER NULL DEFAULT NULL,
  `anexos` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id_post`)
);

-- ---
-- Table 'Oportunidades'
-- 
-- ---

DROP TABLE IF EXISTS `Oportunidades`;
		
CREATE TABLE `Oportunidades` (
  `área` MEDIUMTEXT NULL DEFAULT NULL,
  `cidade` INTEGER NULL DEFAULT NULL,
  `data` DATE NULL DEFAULT NULL,
  `carga horária` TIME NULL DEFAULT NULL,
  `id_oportunidade` INTEGER NOT NULL DEFAULT NULL,
  `modelo de trabalho` INTEGER NULL DEFAULT NULL,
  `id_publicação` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id_oportunidade`)
);

-- ---
-- Table 'Contraproposta'
-- 
-- ---

DROP TABLE IF EXISTS `Contraproposta`;
		
CREATE TABLE `Contraproposta` (
  `id_contraproposta` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `área` INTEGER NULL DEFAULT NULL,
  `cidade` INTEGER NULL DEFAULT NULL,
  `data` INTEGER NULL DEFAULT NULL,
  `carga horária` INTEGER NULL DEFAULT NULL,
  `modelo de trabalho` INTEGER NULL DEFAULT NULL,
  `id_oportunidade` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id_contraproposta`)
);

-- ---
-- Table 'aplicar'
-- 
-- ---

DROP TABLE IF EXISTS `aplicar`;
		
CREATE TABLE `aplicar` (
  `id_aplicação` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `data` DATE NULL DEFAULT NULL,
  `horário` TIME NULL DEFAULT NULL,
  `new field` INTEGER NULL DEFAULT NULL,
  `id_oportunidade` INTEGER NULL DEFAULT NULL,
  `id_voluntário` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id_aplicação`)
);

-- ---
-- Table 'enviar'
-- 
-- ---

DROP TABLE IF EXISTS `enviar`;
		
CREATE TABLE `enviar` (
  `id_envio` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_voluntario` INTEGER NULL DEFAULT NULL,
  `id_contraproposta` INTEGER NULL DEFAULT NULL,
  `data` INTEGER NULL DEFAULT NULL,
  `horário` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id_envio`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `publicar` ADD FOREIGN KEY (id_publicação) REFERENCES `publicação` (`id_post`);
ALTER TABLE `publicar` ADD FOREIGN KEY (id_publicação) REFERENCES `Oportunidades` (`id_oportunidade`);
ALTER TABLE `publicar` ADD FOREIGN KEY (id_publicador) REFERENCES `página de OSC` (`id_OSC`);
ALTER TABLE `publicar` ADD FOREIGN KEY (id_publicador) REFERENCES `usuário` (`id_usuário`);
ALTER TABLE `Oportunidades` ADD FOREIGN KEY (id_publicação) REFERENCES `publicar` (`id_publicação`);
ALTER TABLE `Contraproposta` ADD FOREIGN KEY (id_oportunidade) REFERENCES `Oportunidades` (`id_oportunidade`);
ALTER TABLE `aplicar` ADD FOREIGN KEY (id_oportunidade) REFERENCES `Oportunidades` (`id_oportunidade`);
ALTER TABLE `aplicar` ADD FOREIGN KEY (id_voluntário) REFERENCES `usuário` (`id_usuário`);
ALTER TABLE `enviar` ADD FOREIGN KEY (id_voluntario) REFERENCES `usuário` (`id_usuário`);
ALTER TABLE `enviar` ADD FOREIGN KEY (id_contraproposta) REFERENCES `Contraproposta` (`id_contraproposta`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `publicar` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `página de OSC` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `usuário` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `publicação` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Oportunidades` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Contraproposta` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `aplicar` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `enviar` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `publicar` (`id_publicação`,`data`,`horário`,`id_publicador`) VALUES
-- ('','','','');
-- INSERT INTO `página de OSC` (`id_OSC`,`CNPJ`,`Nome`,`área`) VALUES
-- ('','','','');
-- INSERT INTO `usuário` (`nome`,`sobrenome`,`cidade`,`CPF`,`área`,`gênero`,`id_usuário`) VALUES
-- ('','','','','','','');
-- INSERT INTO `publicação` (`id_post`,`título`,`descrição`,`anexos`) VALUES
-- ('','','','');
-- INSERT INTO `Oportunidades` (`área`,`cidade`,`data`,`carga horária`,`id_oportunidade`,`modelo de trabalho`,`id_publicação`) VALUES
-- ('','','','','','','');
-- INSERT INTO `Contraproposta` (`id_contraproposta`,`área`,`cidade`,`data`,`carga horária`,`modelo de trabalho`,`id_oportunidade`) VALUES
-- ('','','','','','','');
-- INSERT INTO `aplicar` (`id_aplicação`,`data`,`horário`,`new field`,`id_oportunidade`,`id_voluntário`) VALUES
-- ('','','','','','');
-- INSERT INTO `enviar` (`id_envio`,`id_voluntario`,`id_contraproposta`,`data`,`horário`) VALUES
-- ('','','','','');