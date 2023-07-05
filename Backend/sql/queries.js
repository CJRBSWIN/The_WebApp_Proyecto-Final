const { sql } = require('slonik')


const registerUser = ( user_id, name_user, username, email, dpdeparment_user, creation_date, user_role ) => sql.unsafe `
INSERT INTO users (
    user_Id, name_user, username, email, deparment_user, creation_date, user_role 
) VALUES (

)
`
const selectUser = (id, username, user_role) => sql.unsafe `

    SELECT user_Id, name_user, username, email, deparment_user, creation_date, user_role 
    FROM users
    WHERE
`

const registerDevices = (device_Id, category_devices, devices_name, serial_number, creation_date, status_devices) => sql.unsafe `
INSERT INTO devices (
    device_Id, category_devices, devices_name, serial_number, creation_date, status_devices
) VALUES ( )
`
const selectDevices = (device_Id, category_devices, devices_name, serial_number, creation_date, status_devices) => sql.unsafe `

    SELECT device_Id, category_devices, devices_name, serial_number, creation_date, status_devices
    FROM devices
    WHERE
`
module.exports = {
    registerUser,
    selectUser,
    registerDevices,
    selectDevices,
}

