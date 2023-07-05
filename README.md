# Web_App Control de Inventario Proyecto-Final
## Definición Cliente

Esto es una WebApp para controlar un almacén logístico de dispositivos tecnológicos. 
El usuario final de está WebApp, tendra necesariamente un rol de administrador, por lo que debera registrarse desde la organización, con los accesos creados para ello o en su defecto con un perfil especifico para ejercer dicho rol.

Como usuario, al acceder a la aplicación debo ver la página de registro.
Si no tengo cuenta deberé comunicarme con los encargados de la WebApp, de manera que me creen un perfil con accesos a la misma, para poder acceder a la página principal.
Si tengo cuenta, puedo ir a la página de login para acceder.

Una vez logado, la aplicación deberá redirigirme automáticamente a la página principal, donde veré varios campos de texto para introducir el usuario que voy a registrar, en caso de que no esté registrado o el desplegable para seleccionar el usuario existente, en el siguiente campo se selecciona del desplegable el departamento al que pertenece dicho usuario, en e siguiente campo se registra el dispositivo que se le va asignar en caso de que no este registrado o se selleciona del desplegable si ya esta registrado. Por último, por medio de un botón se registran y se guardan los campos rellenados u otro boton para solo guardar cambios de dispositivos o usuarios ya existentes.

Luego de cada registro realizado o cambio guardado, eso registros o cambios deben aparecer en una lista compuesta por los datos que se ingresaron, además de contener la fecha y hora del momento de registro.

En dicha lista, también debería aparecer el número de cambios totales que ha sido reasignado el dispositivo, el número de veces que el usuario la ha usado y el número de veces que otros usuarios

En dicha lista en el campo usuario, deberán aparecer los dispositivos que cada usuario tiene registrado.

Cada vez que se registre un usuario o un dispositivo, la lista de usuarios o de dispositivos, debería actualizarse añadiendo la recién creada.
## Definición técnica

### Backend
### Debemos tener un nuevo modelo, "Usuario", para guardar todos los usuarios registrados y dados de alta en la organización. Deberá tener los siguientes campos:
- User_Id (integer, unique not null)
- Deparment_User (text, not null) 
- Devices_name (text)
- creation_date (date, default now)
- user_role (text, not null)
### Debemos tener un nuevo modelo, "Dispositivos", para guardar todos los dispositivos registrados en estado almacén o activo. Deberá tener los siguientes campos:
- id (uuid v4, PK)
- Devices_name (text, not null)
- Serial_number_Devices (text, not null)
- Status_Devices (text, not null)
- Creation_date (date, default now)
### Debemos tener un nuevo modelo, "Dispositivo en uso", para guardar todos los cambios que se realicen al asignar un dispositivo registrado a un usuario registrados y dados de alta en la organización. Deberá tener los siguientes campos:
- name_user (TEXT NO NULL)
- username (TEXT NO NULL)
- devices_name (TEXT NOT NULL)
- device_id (TEXT NOT NULL UNIQUE)
- assignment_date (DATE DATFAULT NOW NOT NULL)
- status_devices (TEXT NOT NULL)
### Crea una nuevo endpoint POST
- Generará una nueva entrada en la tabla "Dispositivo" con un nuevo id, Devices_name, Serial_number_Devices, Status_Devices y Creation_date
- Generará una nueva entrada en la tabla "Usuario" con un nuevo User_Id, Deparment_User, Devices_name y Creation_date
- Generará una nueva entrada en la tabla "Dispositivos en uso" con el name_user, username, devices_name, device_id, assignment_date, status_devices
### Crea una nuevo endpoint GET 
- Actualiza la tabla sumando 1 a "Usuario"
- Actualiza la tabla sumando 1 a "Dispositivo"
- Actualiza la tabla modificando a "Dispositivo en uso "
### Modifica el endpoint para obtener la información del usuario y que satisfaga las necesidades de la parte cliente (Panel) en caso de ser necesario.
### Frontend

*Empieza el proyecto pensando y maquetando siempre en móvil, luego en escritorio, sin embargo en el caso de esta WebApp la prioridad debe darse a la versión escritorio.
### Debemos tener 2 páginas:
- Login (Sin proteger, pero si estamos logados, nos redirigirá al Panel)
- Control de inventario (Protegida, si no estamos logados, nos redirigirá al Login)
### La página "Login" contendrá un formulario:
- Título h1 "Login"
- Campo UserId (requerido)
- Campo password (requerido, longitud mínima de 8 caracteres)
- Campo acceder (si todo va bien, redirigir a Panel)
### La página "Control de inventario, sección REGISTRO" contendrá en el centro:
- Título h1 "Controla tu inventario"
- Campo para introducir el UserId que se quiere registrar, en caso de no aparecer en el desplegable.
- Campo para seleccionar el departamento que aparecerá en el desplegable, en caso de nuevo registro, si ya está registrado aparecera automaticamente.
- Campo para introducir el dispositivo que se quiere registrar, en caso de no aparecer en el desplegable.
- Campo para introducir el estado del dispositivo (Activo o Almacén) que se quiere registrar, en caso de no aparecer en el desplegable del campo anterior, si ya está registrado aparecera automaticamente.
- Campo para introducir el serial number del dispositivo que se quiere registrar, en caso de no aparecer en el desplegable del campo anterior.
- Botón "Registrar y Guardar" (en caso de ser un alta nueva, tanto de usuario como de dispositivo, o ambos inclusive), botón guardar (en caso de ser usuario y dispositivo ya registrados.
### La página "Control de Inventario, sección USUARIO", esquina superior (derecha del escritorio) contendrá:
- Lista con todos los usuarios registrados.
- Cuando se registre un nuevo usuario, esta lista deberá actualizarse con el nuevo registro.
- Si clickamos en alguno de estos usuarios, el valor seleccionado cambiara de color y nos mostrará todos los dispositivos asociados a este usuario seleccionado.
- Al seleccionar un usuario de la lista, deberán aparecer todos los datos asociados a su registro ( User_Id, Deparment_User, Devices_name y Creation_date ).
- En caso de que un usuario tenga dispositivos asignados, debe poderse clickar y aparecer en la sección de dispositivos, toda la información referente al mismo.
### La página "Control de Inventario, sección dispositivo", esquina inferior (izquierda del escritorio) contendrá:
- Lista con todos los dispositivos registrados.
- Cuando se registre un nuevo dispositivo, esta lista deberá actualizarse con el nuevo registro.
- Si clickamos en alguno de estos dispositivos, el valor seleccionado cambiara de color y nos mostrará todos los datos historicos asociados a este dispositivo seleccionado.
- Al seleccionar un dispositivo de la lista, deberán aparecer todos los datos asociados a su registro ( id, Devices_name, Serial_number_Devices, Status_Devices y Creation_date ).
- En caso de que un disposotivosea clickado, deberá aparecer en el campo status de color verde si está activo, amarillo si esta en almacén y en rojo si está roto.
- En caso de que un Dispositivo este asignados a un usuario en status activo (verde), debe poderse clickar sobre el mismo y aparecer en la sección de usuarios, toda la información referente al mismo.
