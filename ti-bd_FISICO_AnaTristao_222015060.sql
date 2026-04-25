-- =====  << Tecnologias de Banco de Dados >>  =====
-- 
--         SCRIPT DE CRIACAO (DDL)
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
--   24/04/2026 =>  Criacao inicial do script de tabelas.
--
-- ---------------------------------------------------------

CREATE DATABASE IF NOT EXISTS bike_share_db;
USE bike_share_db;

CREATE TABLE station (
    id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    lat DECIMAL(10, 6) NOT NULL,
    `long` DECIMAL(10, 6) NOT NULL,
    dock_count INT NOT NULL,
    city VARCHAR(50) NOT NULL,
    installation_date DATE,
    CONSTRAINT station_PK PRIMARY KEY (id)
); 

CREATE TABLE weather (
    date DATE NOT NULL,
    zip_code VARCHAR(20) NOT NULL,
    max_temperature_f INT,
    mean_temperature_f INT,
    min_temperature_f INT,
    max_dew_point_f INT,
    mean_dew_point_f INT,
    min_dew_point_f INT,
    max_humidity INT,
    mean_humidity INT,
    min_humidity INT,
    max_sea_level_pressure DECIMAL(6 , 2 ),
    mean_sea_level_pressure DECIMAL(6 , 2 ),
    min_sea_level_pressure DECIMAL(6 , 2 ),
    max_visibility_miles INT,
    mean_visibility_miles INT,
    min_visibility_miles INT,
    max_wind_Speed_mph INT,
    mean_wind_speed_mph INT,
    max_gust_speed_mph INT,
    precipitation_inches DECIMAL(6 , 2 ),
    cloud_cover INT,
    events VARCHAR(100),
    wind_dir_degrees INT,
    CONSTRAINT weather_PK PRIMARY KEY (date , zip_code)
);

CREATE TABLE status (
    station_id INT NOT NULL,
    time DATETIME NOT NULL,
    bikes_available INT NOT NULL,
    docks_available INT NOT NULL,
    CONSTRAINT status_PK PRIMARY KEY (station_id , time),
    CONSTRAINT status_station_FK FOREIGN KEY (station_id)
        REFERENCES station (id)
);

CREATE TABLE trip (
    id INT NOT NULL,
    duration INT NOT NULL,
    start_date DATETIME NOT NULL,
    start_station_name VARCHAR(100) NOT NULL,
    end_date DATETIME NOT NULL,
    end_station_name VARCHAR(100) NOT NULL,
    bike_id INT NOT NULL,
    subscription_type VARCHAR(50) NOT NULL,
    start_station_id INT NOT NULL,
    end_station_id INT NOT NULL,
    date DATE,
    zip_code VARCHAR(20),
    CONSTRAINT trip_PK PRIMARY KEY (id),
    CONSTRAINT trip_station_start_FK FOREIGN KEY (start_station_id)
        REFERENCES station (id),
    CONSTRAINT trip_station_end_FK FOREIGN KEY (end_station_id)
        REFERENCES station (id),
    CONSTRAINT trip_weather_FK FOREIGN KEY (date , zip_code)
        REFERENCES weather (date , zip_code)
);
