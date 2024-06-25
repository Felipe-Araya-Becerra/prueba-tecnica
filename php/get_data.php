<?php
include 'db_connection.php';

header('Content-Type: application/json');

$response = array();


$sqlRegiones = "SELECT id, nombre FROM regiones";
$resultRegiones = $conn->query($sqlRegiones);

$regiones = array();
if ($resultRegiones->num_rows > 0) {
    while ($row = $resultRegiones->fetch_assoc()) {
        $regiones[] = $row;
    }
}
$response['regiones'] = $regiones;

$sqlComunas = "SELECT id, nombre,region_id FROM comunas";
$resultComuna = $conn->query($sqlComunas);

$comunas = array();
if ($resultComuna->num_rows > 0) {
    while ($row = $resultComuna->fetch_assoc()) {
        $comunas[] = $row;
    }
}

$response['comunas'] = $comunas;




$sqlCandidatos = "SELECT id, nombre FROM candidatos";
$resultCandidatos = $conn->query($sqlCandidatos);

$candidatos = array();
if ($resultCandidatos->num_rows > 0) {
    while ($row = $resultCandidatos->fetch_assoc()) {
        $candidatos[] = $row;
    }
}
$response['candidatos'] = $candidatos;

echo json_encode($response);

$conn->close();
