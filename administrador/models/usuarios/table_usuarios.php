<?php
require_once '../../../includes/conexion.php';

$sql = 'SELECT * FROM usuarios WHERE estado != 0';
$query = $pdo->prepare($sql);
$query->execute();

$consulta = $query->fetchAll(PDO::FETCH_ASSOC);

for($i = 0;$i < count($consulta);$i++){
    if($consulta[$i]['estado'] == 1) {
        $consulta[$i]['estado'] = '<span class="badge badge-success">Activo</span>';
    }else {
        $consulta[$i]['estado'] = '<span class="badge badge-danger">Inactivo</span>';
    }
    $consulta[$i]['acciones'] = '
            <button class="btn btn-primary" type="Editar" onclick="editarUsuario('.$consulta[$i]['usuario_id'].')">Editar</button> 
            <button class="btn btn-danger" type="Eliminar" onclick="eliminarUsuario('.$consulta[$i]['usuario_id'].')">Eliminar</button> ';
}

echo json_encode($consulta,JSON_UNESCAPED_UNICODE);