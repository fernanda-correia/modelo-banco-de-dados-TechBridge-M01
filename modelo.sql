-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'user'
-- 
-- ---

DROP TABLE IF EXISTS `user`;
		
CREATE TABLE `user` (
  `email` VARCHAR NULL AUTO_INCREMENT DEFAULT NULL,
  `senha` VARCHAR NULL DEFAULT NULL,
  `username` VARCHAR NULL DEFAULT NULL,
  `nome` VARCHAR NULL DEFAULT NULL,
  `data_nascimento` DATE NULL DEFAULT NULL,
  `universidade` VARCHAR NULL DEFAULT NULL,
  `código país + telefone` INTEGER NULL DEFAULT NULL,
  `nacionalidade` MEDIUMTEXT NULL DEFAULT NULL,
  `segunda nacionalidade` CHAR NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
);

-- ---
-- Table 'estudante'
-- 
-- ---

DROP TABLE IF EXISTS `estudante`;
		
CREATE TABLE `estudante` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `email_user` VARCHAR NULL DEFAULT NULL,
  `curso` CHAR NULL DEFAULT NULL,
  `linkedin` VARCHAR NULL DEFAULT NULL,
  `facebook` VARCHAR NULL DEFAULT NULL,
  `instagram` VARCHAR NULL DEFAULT NULL,
  `linguagens` VARCHAR NULL DEFAULT NULL,
  `interesses` VARCHAR NULL DEFAULT NULL,
  `biografia` VARCHAR NULL DEFAULT NULL,
  `universo_grupo` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'tutor'
-- 
-- ---

DROP TABLE IF EXISTS `tutor`;
		
CREATE TABLE `tutor` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `email_user` VARCHAR NULL DEFAULT NULL,
  `biografia` VARCHAR NULL DEFAULT NULL,
  `linguagens` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'medidor_de_felicidade'
-- 
-- ---

DROP TABLE IF EXISTS `medidor_de_felicidade`;
		
CREATE TABLE `medidor_de_felicidade` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `valor` INTEGER NULL DEFAULT NULL,
  `numero_round` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'estudante_medidor_de_felicidade'
-- 
-- ---

DROP TABLE IF EXISTS `estudante_medidor_de_felicidade`;
		
CREATE TABLE `estudante_medidor_de_felicidade` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_medidor_de_felicidade` INTEGER NULL DEFAULT NULL,
  `id_estudante` INTEGER NULL DEFAULT NULL,
  `id_tutor` INTEGER NULL DEFAULT NULL,
  `universo_grupo` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'grupo'
-- 
-- ---

DROP TABLE IF EXISTS `grupo`;
		
CREATE TABLE `grupo` (
  `universo` VARCHAR NULL AUTO_INCREMENT DEFAULT NULL,
  `cor` VARCHAR NULL DEFAULT NULL,
  `id_estudante1` INTEGER NULL DEFAULT NULL,
  `id_estudante2` INTEGER NULL DEFAULT NULL,
  `id_estudante3` INTEGER NULL DEFAULT NULL,
  `id_estudante4` INTEGER NULL DEFAULT NULL,
  `id_estudante5` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`universo`)
);

-- ---
-- Table 'tutor_grupo'
-- 
-- ---

DROP TABLE IF EXISTS `tutor_grupo`;
		
CREATE TABLE `tutor_grupo` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_tutor` INTEGER NULL DEFAULT NULL,
  `universo_grupo` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'respostas_formularios'
-- 
-- ---

DROP TABLE IF EXISTS `respostas_formularios`;
		
CREATE TABLE `respostas_formularios` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `nome_formulário` VARCHAR NULL DEFAULT NULL,
  `respostas` MEDIUMTEXT NULL DEFAULT NULL,
  `numero_round` INTEGER NULL DEFAULT NULL,
  `id_formularios` INTEGER NULL DEFAULT NULL,
  `id_questoes_formularios` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'estudante_respostas_formularios'
-- 
-- ---

DROP TABLE IF EXISTS `estudante_respostas_formularios`;
		
CREATE TABLE `estudante_respostas_formularios` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_estudante` INTEGER NULL DEFAULT NULL,
  `id_respostas_formularios` INTEGER NULL DEFAULT NULL,
  `universo_grupo` VARCHAR NULL DEFAULT NULL,
  `id_tutor_grupo` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'round'
-- 
-- ---

DROP TABLE IF EXISTS `round`;
		
CREATE TABLE `round` (
  `numero` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `data_inicio` DATE NULL DEFAULT NULL,
  `data_fim` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`numero`)
);

-- ---
-- Table 'questoes_formularios'
-- 
-- ---

DROP TABLE IF EXISTS `questoes_formularios`;
		
CREATE TABLE `questoes_formularios` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_formularios` INTEGER NULL DEFAULT NULL,
  `perguntas` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'formularios'
-- 
-- ---

DROP TABLE IF EXISTS `formularios`;
		
CREATE TABLE `formularios` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `nome_formulario` VARCHAR NULL DEFAULT NULL,
  `numero_round` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `estudante` ADD FOREIGN KEY (email_user) REFERENCES `user` (`email`);
ALTER TABLE `estudante` ADD FOREIGN KEY (universo_grupo) REFERENCES `grupo` (`universo`);
ALTER TABLE `tutor` ADD FOREIGN KEY (email_user) REFERENCES `user` (`email`);
ALTER TABLE `medidor_de_felicidade` ADD FOREIGN KEY (numero_round) REFERENCES `round` (`numero`);
ALTER TABLE `estudante_medidor_de_felicidade` ADD FOREIGN KEY (id_medidor_de_felicidade) REFERENCES `medidor_de_felicidade` (`id`);
ALTER TABLE `estudante_medidor_de_felicidade` ADD FOREIGN KEY (id_estudante) REFERENCES `estudante` (`id`);
ALTER TABLE `estudante_medidor_de_felicidade` ADD FOREIGN KEY (id_tutor) REFERENCES `tutor` (`id`);
ALTER TABLE `estudante_medidor_de_felicidade` ADD FOREIGN KEY (universo_grupo) REFERENCES `grupo` (`universo`);
ALTER TABLE `grupo` ADD FOREIGN KEY (id_estudante1) REFERENCES `estudante` (`id`);
ALTER TABLE `grupo` ADD FOREIGN KEY (id_estudante2) REFERENCES `estudante` (`id`);
ALTER TABLE `grupo` ADD FOREIGN KEY (id_estudante3) REFERENCES `estudante` (`id`);
ALTER TABLE `grupo` ADD FOREIGN KEY (id_estudante4) REFERENCES `estudante` (`id`);
ALTER TABLE `grupo` ADD FOREIGN KEY (id_estudante5) REFERENCES `estudante` (`id`);
ALTER TABLE `tutor_grupo` ADD FOREIGN KEY (id_tutor) REFERENCES `tutor` (`id`);
ALTER TABLE `tutor_grupo` ADD FOREIGN KEY (universo_grupo) REFERENCES `grupo` (`universo`);
ALTER TABLE `respostas_formularios` ADD FOREIGN KEY (numero_round) REFERENCES `round` (`numero`);
ALTER TABLE `respostas_formularios` ADD FOREIGN KEY (id_formularios) REFERENCES `formularios` (`id`);
ALTER TABLE `respostas_formularios` ADD FOREIGN KEY (id_questoes_formularios) REFERENCES `questoes_formularios` (`id`);
ALTER TABLE `estudante_respostas_formularios` ADD FOREIGN KEY (id_estudante) REFERENCES `estudante` (`id`);
ALTER TABLE `estudante_respostas_formularios` ADD FOREIGN KEY (id_respostas_formularios) REFERENCES `respostas_formularios` (`id`);
ALTER TABLE `estudante_respostas_formularios` ADD FOREIGN KEY (universo_grupo) REFERENCES `grupo` (`universo`);
ALTER TABLE `estudante_respostas_formularios` ADD FOREIGN KEY (id_tutor_grupo) REFERENCES `tutor_grupo` (`id`);
ALTER TABLE `questoes_formularios` ADD FOREIGN KEY (id_formularios) REFERENCES `formularios` (`id`);
ALTER TABLE `formularios` ADD FOREIGN KEY (numero_round) REFERENCES `round` (`numero`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `user` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `estudante` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `tutor` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `medidor_de_felicidade` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `estudante_medidor_de_felicidade` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `grupo` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `tutor_grupo` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `respostas_formularios` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `estudante_respostas_formularios` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `round` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `questoes_formularios` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `formularios` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `user` (`email`,`senha`,`username`,`nome`,`data_nascimento`,`universidade`,`código país + telefone`,`nacionalidade`,`segunda nacionalidade`) VALUES
-- ('','','','','','','','','');
-- INSERT INTO `estudante` (`id`,`email_user`,`curso`,`linkedin`,`facebook`,`instagram`,`linguagens`,`interesses`,`biografia`,`universo_grupo`) VALUES
-- ('','','','','','','','','','');
-- INSERT INTO `tutor` (`id`,`email_user`,`biografia`,`linguagens`) VALUES
-- ('','','','');
-- INSERT INTO `medidor_de_felicidade` (`id`,`valor`,`numero_round`) VALUES
-- ('','','');
-- INSERT INTO `estudante_medidor_de_felicidade` (`id`,`id_medidor_de_felicidade`,`id_estudante`,`id_tutor`,`universo_grupo`) VALUES
-- ('','','','','');
-- INSERT INTO `grupo` (`universo`,`cor`,`id_estudante1`,`id_estudante2`,`id_estudante3`,`id_estudante4`,`id_estudante5`) VALUES
-- ('','','','','','','');
-- INSERT INTO `tutor_grupo` (`id`,`id_tutor`,`universo_grupo`) VALUES
-- ('','','');
-- INSERT INTO `respostas_formularios` (`id`,`nome_formulário`,`respostas`,`numero_round`,`id_formularios`,`id_questoes_formularios`) VALUES
-- ('','','','','','');
-- INSERT INTO `estudante_respostas_formularios` (`id`,`id_estudante`,`id_respostas_formularios`,`universo_grupo`,`id_tutor_grupo`) VALUES
-- ('','','','','');
-- INSERT INTO `round` (`numero`,`data_inicio`,`data_fim`) VALUES
-- ('','','');
-- INSERT INTO `questoes_formularios` (`id`,`id_formularios`,`perguntas`) VALUES
-- ('','','');
-- INSERT INTO `formularios` (`id`,`nome_formulario`,`numero_round`) VALUES
-- ('','','');