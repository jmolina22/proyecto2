<?php
include('ConexBD.php');

echo "<h2>Profesores con 7 letras o más:</h2>";

// Consulta SQL
$sql_profesores = "SELECT * FROM Professor WHERE LENGTH(Nom) >= 7";
$result_profesores = $conn->query($sql_profesores);

if ($result_profesores->num_rows > 0) {
    // Procesar los datos
    while ($row_profesores = $result_profesores->fetch_assoc()) {
        echo "Nombre: " . $row_profesores["Nom"] . " - Dirección: " . $row_profesores["Direccio"] . "<br>";
    }
} else {
    echo "No se encontraron resultados de profesores.";
}
// Consulta SQL
$sql_b = "SELECT * FROM Estudiant WHERE DATEDIFF(CURDATE(), DataNaixement) / 365.25 > 30 ORDER BY DataNaixement ASC";

// Ejecutar la consulta
$result_b = $conn->query($sql_b);

// Verificar si hay resultados
if ($result_b->num_rows > 0) {
    // Mostrar los resultados
    echo "<h2>Estudiantes mayores de 30 años:</h2>";
    echo "<ul>";
    while ($row_b = $result_b->fetch_assoc()) {
        echo "<li>{$row_b['Nom']} ({$row_b['DataNaixement']})</li>";
    }
    echo "</ul>";
} else {
    echo "<p>No se encontraron estudiantes mayores de 30 años.</p>";
}
// Consulta SQL
$sql_c = "SELECT * FROM Estudiant WHERE IDBicicleta IS NOT NULL";

// Ejecutar la consulta
$result_c = $conn->query($sql_c);

// Verificar si hay resultados
if ($result_c->num_rows > 0) {
    // Mostrar los resultados
    echo "<h2>Estudiantes que van en bicicleta a la universidad:</h2>";
    echo "<ul>";
    while ($row_c = $result_c->fetch_assoc()) {
        echo "<li>{$row_c['Nom']} (Bicicleta ID: {$row_c['IDBicicleta']})</li>";
    }
    echo "</ul>";
} else {
    echo "<p>No se encontraron estudiantes que vayan en bicicleta a la universidad.</p>";
}
// Añadimos el código para listar estudiantes y permitir eliminarlos
include ('ConexBD.php');

// Función para eliminar un estudiante por su DNI
function eliminarEstudiante($conn, $dniEstudiante) {
    $sql = "DELETE FROM Estudiant WHERE DNI = '$dniEstudiante'";
    $conn->query($sql);

    // También puedes añadir código para eliminar registros de otras tablas relacionadas si es necesario
}

// Verificar si se ha enviado la solicitud de eliminación
if(isset($_POST['eliminar'])) {
    $dniEstudianteAEliminar = $_POST['dni_estudiante'];
    eliminarEstudiante($conn, $dniEstudianteAEliminar);
    echo "Estudiante eliminado correctamente.";
}

// Obtener la lista de estudiantes
$sqlListaEstudiantes = "SELECT DNI, Nom, Cognom, Telefon, DataNaixement, IDBicicleta, Inici, Final FROM Estudiant";
$resultListaEstudiantes = $conn->query($sqlListaEstudiantes);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listado de Estudiantes y Profesores</title>
</head>
<body>

<h2>Listado de Estudiantes</h2>

<?php
if ($resultListaEstudiantes->num_rows > 0) {
    echo "<table border='1'>";
    echo "<tr><th>DNI</th><th>Nombre</th><th>Apellido</th><th>Teléfono</th><th>Fecha de Nacimiento</th><th>ID Bicicleta</th><th>Inicio</th><th>Final</th><th>Eliminar</th></tr>";
    while($row = $resultListaEstudiantes->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row["DNI"] . "</td>";
        echo "<td>" . $row["Nom"] . "</td>";
        echo "<td>" . $row["Cognom"] . "</td>";
        echo "<td>" . $row["Telefon"] . "</td>";
        echo "<td>" . $row["DataNaixement"] . "</td>";
        echo "<td>" . $row["IDBicicleta"] . "</td>";
        echo "<td>" . $row["Inici"] . "</td>";
        echo "<td>" . $row["Final"] . "</td>";
        echo "<td>
                <form action='' method='POST'>
                    <input type='hidden' name='dni_estudiante' value='" . $row["DNI"] . "'>
                    <input type='submit' name='eliminar' value='Eliminar'>
                </form>
              </td>";
        echo "</tr>";
    }
    echo "</table>";
} else {
    echo "No hay datos de estudiantes para mostrar.";
}

// Función para eliminar un profesor por su DNI
function eliminarProfessor($conn, $dniProfessor) {
    $sql = "DELETE FROM Professor WHERE DNI = '$dniProfessor'";
    $conn->query($sql);
}
// Verificar si se ha enviado la solicitud de eliminación
if(isset($_POST['eliminar']) && isset($_POST['dni_professor'])) {
    $dniProfessorAEliminar = $_POST['dni_professor'];
    eliminarProfessor($conn, $dniProfessorAEliminar);
    echo "Profesor eliminado correctamente.";
}
?>
<h2>Listado de Profesores</h2>
<?php
$sqlListaProfesores = "SELECT DNI, Nom, Cognom, Direccio FROM Professor";
$resultListaProfesores = $conn->query($sqlListaProfesores);



if ($resultListaProfesores->num_rows > 0) {
    echo "<table border='1'>";
    echo "<tr><th>Cognom</th><th>Direccio</th><th>DNI</th><th>Nom</th><th><th>Eliminar</th></tr>";
    while($row = $resultListaProfesores->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row["Cognom"] . "</td>";
        echo "<td>" . $row["Direccio"] . "</td>";
        echo "<td>" . $row["DNI"] . "</td>";
        echo "<td>" . $row["Nom"] . "</td>";
        echo "<td>
                <form action='' method='POST'>
                    <input type='hidden' name='dni_professor' value='" . $row["DNI"] . "'>
                    <input type='submit' name='eliminar' value='Eliminar'>
                </form>
              </td>";
        echo "</tr>";
    }
    echo "</table>";
} else {
    echo "No hay datos de profesores.";
}

// Cerrar conexión
$conn->close();
?>

</body>
</html>

