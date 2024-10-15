<?php
    session_start();
    if(!empty($_SESSION['active'])) {
        header('Location: administrador/');
    }else if(!empty($_SESSION['activeP'])) {
        header('Location: profesor');
    }else if(!empty($_SESSION['activeA'])){
        header('Location: alumnos');
    }
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <title>INGRESO AL SISTEMA</title>
</head>

<body>
    <div class="container">
        <!-- Sección de la imagen -->
        <div class="image-section">
            <img src="images/school.svg" alt="image school">
        </div>

        <!-- Sección del formulario -->
        <div class="login-section">
            <h1>BIENVENID@</h1>
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" 
                    type="button" role="tab" aria-controls="home" aria-selected="true">ADMINISTRADOR</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" 
                    type="button" role="tab" aria-controls="profile" aria-selected="false">PROFESOR</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="alumno-tab" data-bs-toggle="tab" data-bs-target="#alumno" 
                    type="button" role="tab" aria-controls="alumno" aria-selected="false">ALUMNO</button>
                </li>
            </ul>

            <div class="tab-content" id="myTabContent">
                <!-- Tab para Administrador -->
                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                    <form action=""  onsubmit="return validar()">
                        <label for="usuario">USUARIO</label>
                        <input type="text" name="usuario" id="usuario" placeholder="Nombre de Usuario">
                        <label for="password">CONTRASEÑA</label>
                        <input type="password" name="pass" id="pass" placeholder="Contraseña">
                        <div id="messageUsuario"></div>
                        <button id="loginUsuario" type="button">INICIAR SESIÓN</button>
                    </form>
                </div>
                
                <!-- Tab para Profesor -->
                <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                    <form action="" onsubmit="return validar()">
                        <label for="usuario">USUARIO</label>
                        <input type="text" name="usuarioProfesor" id="usuarioProfesor" placeholder="Nombre de Usuario">
                        <label for="password">CONTRASEÑA</label>
                        <input type="password" name="passProfesor" id="passProfesor" placeholder="Contraseña">
                        <div id="messageProfesor"></div>
                        <button id="loginProfesor" type="button">INICIAR SESIÓN</button>
                    </form>
                </div>

                <!-- Tab para Alumno -->
                <div class="tab-pane fade" id="alumno" role="tabpanel" aria-labelledby="alumno-tab">
                    <form action=""  onsubmit="return validar()">
                        <label for="usuario">USUARIO</label>
                        <input type="text" name="usuarioAlumno" id="usuarioAlumno" placeholder="Nombre de Usuario">
                        <label for="password">CONTRASEÑA</label>
                        <input type="password" name="passAlumno" id="passAlumno" placeholder="Contraseña">
                        <div id="messageAlumno"></div>
                        <button id="loginAlumno" type="button">INICIAR SESIÓN</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="js/jquery-3.7.0.min.js"></script>
    <script src="js/login.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>

</body>

</html>
