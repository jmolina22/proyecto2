                                                                                                                                                                                                        <?php
$servername = "db";  // Nombre del servicio en Docker Compose
$port = "3306";  // Puerto por defecto de MySQL
$username = "ivan";
$password = "test";
$dbname = "dbname";  // Nombre de tu base de datos

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname, $port);

// Comprobar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}
?>
 

