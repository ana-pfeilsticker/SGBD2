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
    PRIMARY KEY (id)
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
    max_sea_level_pressure DECIMAL(6, 2),
    mean_sea_level_pressure DECIMAL(6, 2),
    min_sea_level_pressure DECIMAL(6, 2),
    max_visibility_miles INT,
    mean_visibility_miles INT,
    min_visibility_miles INT,
    max_wind_Speed_mph INT,
    mean_wind_speed_mph INT,
    max_gust_speed_mph INT,
    precipitation_inches DECIMAL(6, 2),
    cloud_cover INT,
    events VARCHAR(100),
    wind_dir_degrees INT,
    PRIMARY KEY (date, zip_code)
);

CREATE TABLE status (
    station_id INT NOT NULL,
    time DATETIME NOT NULL,
    bikes_available INT NOT NULL,
    docks_available INT NOT NULL,
    PRIMARY KEY (station_id, time),
    FOREIGN KEY (station_id) REFERENCES station (id)
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
    PRIMARY KEY (id),
    FOREIGN KEY (start_station_id) REFERENCES station (id),
    FOREIGN KEY (end_station_id) REFERENCES station (id),
    FOREIGN KEY (date, zip_code) REFERENCES weather (date, zip_code)
);
