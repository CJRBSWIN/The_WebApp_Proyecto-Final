DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS devices;
DROP TABLE IF EXISTS devices_in_use;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS users (
    user_Id INTEGER UNIQUE NOT NULL uuid PRIMARY KEY DEFAULT  uuid_generate_v4(),
    name_user TEXT NOT NULL,
    username TEXT NOT NULL UNIQUE, 
    email TEXT NOT NULL UNIQUE,
    deparment_user TEXT NOT NULL,
    creation_date DATE DATFAULT NOW NOT NULL,
    user_role TEXT NOT NULL,
);

CREATE TABLE IF NOT EXISTS devices (
    device_Id uuid INTEGER UNIQUE NOT NULL uuid PRIMARY KEY DEFAULT  uuid_generate_v4(),
    category_devices TEXT NOT NUL
    devices_name TEXT NOT NULL,
    serial_number TEXT NOT NULL UNIQUE,
    creation_date DATE DATFAULT NOW NOT NULL,
    status_devices TEXT NOT NULL,
);

CREATE TABLE IF NOT EXISTS devices_in_use (
    name_user TEXT NO NULL,
    username TEXT NO NULL,
    devices_name TEXT NOT NULL,
    device_id TEXT NOT NULL UNIQUE,
    assignment_date DATE DATFAULT NOW NOT NULL,
    status_devices TEXT NOT NULL,
);

INSERT INTO users (
    user_id, name_user, username, email, deparment_user, creation_date, user_role
) VALUES (
    ('0001', 'Rodríguez Carlos', RODRIBCJ, 'cjrbswin@gmail.com', Logistica, '08/07/2023', 'Administrador'),
    ('0002', 'González Jessica', GONZADJM, 'jmgd0804@gmail.com', Recuersos Humanos, '08/07/2023', 'Usuario'),
    ('0003', 'Rodríguez Carlos', BETANRCJ, 'cjswinprofe@hotmail.com', Informatica, '08/07/2023', 'Usiario')
    );

INSERT INTO devices (
    device_Id, category_devices, devices_name, serial_number, creation_date, status_devices
) VALUES (
    ('0001', 'Laptop', HP EliteBook 840 G6, '5CG8322K09', '08/07/2023', 'Activo'),
    ('0002', 'Laptop', Lenovo Ideapad 11gen, 'PF2ZTSCY', '08/07/2023', 'Activo'),
    ('0003', 'Desktop', HP Desk 800 G9, '5CG1234XXX', '08/07/2023', 'Almacén')
    );

INSERT INTO devices_in_use (
    name_user, username, devices_name, devices_id, assignment_date, status_devices
) VALUES (
    ('Rodríguez Carlos', 'RODRIBCJ', HP EliteBook 840 G6, '0001', '08/07/2023', 'Activo'),
    ('González Jessica', 'GONZADJM', Lenovo Ideapad 11gen, '0002', '08/07/2023', 'Activo'),
    );