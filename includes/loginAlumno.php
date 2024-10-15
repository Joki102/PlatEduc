<?php
session_start();  

if (!empty($_POST)) {

    if (empty($_POST['loginAlumno']) || empty($_POST['passAlumno'])) {
        echo '<div class="alert alert-danger"><button type="button" class="close" data-dismiss="alert"></button>Todos los campos son necesarios</div>';
    } else {
        require_once 'conexion.php';
        $login = $_POST['loginAlumno'];
        $pass = $_POST['passAlumno'];

        $sql = 'SELECT * FROM alumnos WHERE cedula = ?';
        $query = $pdo->prepare($sql);
        $query->execute(array($login));
        $result = $query->fetch(PDO::FETCH_ASSOC);

        if ($query->rowCount() > 0) {
            if (password_verify($pass, $result['clave'])) {
                $_SESSION['activeA'] = true;
                $_SESSION['alumno_id'] = $result['alumno_id'];
                $_SESSION['nombre_alumno'] = $result['nombre_alumno'];
                $_SESSION['cedula'] = $result['cedula'];

                echo '<div class="alert alert-success"><button type="button" class="close" data-dismiss="alert"></button>Redirecting</div>';

            } else {
                echo '<div class="alert alert-danger"><button type="button" class="close" data-dismiss="alert"></button>Usuario o Contraseña incorrectos</div>';
            }
        } else {
            echo '<div class="alert alert-danger"><button type="button" class="close" data-dismiss="alert"></button>Usuario o Contraseña incorrectos</div>';
        }
    }
}