<?php

$host = 'localhost';
$user = 'root';
$db = 'sistema-escolar';
$pass = 'JokinoJuan@10';

try {
    // Intenta realizar la conexión
    $pdo = new PDO('mysql:host='.$host.';dbname='.$db.';charset=utf8', $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Si la conexión es exitosa, muestra un mensaje
    echo "Conexión exitosa a la base de datos: " . $db;

} catch (Exception $e) {
    // Si hay un error en la conexión, muestra el mensaje de error
    echo 'Error al conectar con la base de datos: ' . $e->getMessage();
}
