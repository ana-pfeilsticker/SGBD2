-- =====  << Tecnologias de Banco de Dados >>  =====
-- 
--        SCRIPT DE APAGAR (DDL)
--
-- Data Criacao ...........: 24/04/2026
-- Autor(es) ..............: Ana Tristao e Bianca Castro
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: bike_share_db
--
-- PROJETO => 01 Base de Dados
--         => 04 tabelas
-- 
-- 
-- ULTIMAS ATUALIZACOES
--   24/04/2026 => Criacao do script para deletar as tabelas respeitando as FKs (de baixo para cima).
--
-- ---------------------------------------------------------

USE bike_share_db;
DROP TABLE IF EXISTS trip;
DROP TABLE IF EXISTS status;
DROP TABLE IF EXISTS weather;
DROP TABLE IF EXISTS station;

