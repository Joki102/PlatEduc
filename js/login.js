$(document).ready(function(){
    $('#loginUsuario').on('click',function(){
        loginUsuario();
    });

    $('#loginProfesor').on('click',function(){
        loginProfesor();
    });

    $('#loginAlumno').on('click',function(){
        loginAlumno();
    });
})

function loginUsuario(){
    var login = $('#usuario').val();
    var pass = $('#pass').val();

    $.ajax({
        url: './includes/loginUsuario.php',
        method: 'POST',
        data:{
            login:login,
            pass:pass
        },
        success: function(data) {
            $('#messageUsuario').html(data);

            if(data.indexOf('Redirecting') >= 0){
                window.location = 'administrador/';
            }
        }
    })
}

function loginProfesor(){
    var loginProfesor = $('#usuarioProfesor').val();
    var passProfesor = $('#passProfesor').val();

    $.ajax({
        url: './includes/loginProfesor.php',
        method: 'POST',
        data:{
            loginProfesor:loginProfesor,
            passProfesor:passProfesor
        },
        success: function(data) {
            $('#messageProfesor').html(data);

            if(data.indexOf('Redirecting') >= 0){
                window.location = 'profesor/';
            }
        }
    })
}

function loginAlumno(){
    var loginAlumno = $('#usuarioAlumno').val();
    var passAlumno = $('#passAlumno').val();

    $.ajax({
        url: './includes/loginAlumno.php',
        method: 'POST',
        data:{
            loginAlumno:loginAlumno,
            passAlumno:passAlumno
        },
        success: function(data) {
            $('#messageAlumno').html(data);

            if(data.indexOf('Redirecting') >= 0){
                window.location = 'alumno/';
            }
        }
    })
}