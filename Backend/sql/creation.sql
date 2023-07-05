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
    device_Id uuid PRIMARY KEY DEFAULT  uuid_generate_v4(),
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
