Instrucciones de Instalación:

1. Asegúrate de tener instalado PHP y un servidor de base de datos (por ejemplo, MySQL), Como recomendacion, ocupar programas como Wamp o Xampp (Este ultimo fue ocupado en este proyecto).

2. Clona este repositorio en tu máquina local o descarga el archivo ZIP y extráelo en una carpeta de tu elección.

3. Si estas ocupando Xampp debes agregar la carpeta del proyecto en C:\xampp\htdocs\ (Si esta con la ruta de instalación por defecto)

4. Importar el script votacion.sql de la carpeta SQL para tener la base de datos del proyecto(Se agregaron 2 comunas por Region para no cargar tanto la vista de la web y la base de datos)

5. Abre el archivo `db_connection.php` ubicado en la carpeta `php` y actualiza los valores de `$servername`, `$username`, `$password` y `$dbname` con la información de tu servidor de base de datos y la base de datos que tengas.

6. Abre un navegador web y navega a la carpeta donde instalaste el proyecto. Por ejemplo, si estás utilizando XAMPP, la URL podría ser `http://localhost/nombre_de_carpeta`.

7. Deberías ver la página principal del proyecto. Completa el formulario de votación y envía tu voto.

Versión de PHP: [PHP Version 8.2.12]
Base de Datos: [MariaDB 10.4.32]


