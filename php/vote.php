<?php
include 'db_connection.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $name = isset($_POST['name']) ? $_POST['name'] : '';
    $alias = isset($_POST['alias']) ? $_POST['alias'] : '';
    $rut = isset($_POST['rut']) ? $_POST['rut'] : '';
    $email = isset($_POST['email']) ? $_POST['email'] : '';
    $region = isset($_POST['region']) ? $_POST['region'] : '';
    $comuna = isset($_POST['comuna']) ? $_POST['comuna'] : '';
    $candidato = isset($_POST['candidato']) ? $_POST['candidato'] : '';
    $how_heard = isset($_POST['how_heard']) ? implode(", ", $_POST['how_heard']) : '';


    $stmt = $conn->prepare("SELECT COUNT(*) AS count FROM votantes WHERE rut = ?");
    $stmt->bind_param('s', $rut);
    $stmt->execute();
    $result = $stmt->get_result();
    $row = $result->fetch_assoc();
    $count = $row['count'];

    if ($count > 0) {
        echo "Error: Este RUT ya ha sido utilizado para votar.";
    } else {
        if ($name && $alias && $rut && $email && $region && $comuna && $candidato && $how_heard) {

            $stmt = $conn->prepare("INSERT INTO votantes (nombre, alias, rut, email, region_id, comuna_id, candidato_id, como_se_entero) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");


            $stmt->bind_param('ssssiiis', $name, $alias, $rut, $email, $region, $comuna, $candidato, $how_heard);


            if ($stmt->execute()) {
                echo "Gracias por votar, $name. Hemos registrado tu voto.";
            } else {
                echo "Error: " . $stmt->error;
            }

            $stmt->close();
        } else {
            echo "Error: Por favor completa todos los campos del formulario.";
        }
    }


    $conn->close();
} else {
    echo "Error: método de solicitud no permitido.";
}
