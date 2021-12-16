<?php
    require_once('Traitement.php');

    $traitement->deleteClasseById($_GET['id']); //Delete classe by Id
    header('Location: ../LClasse.php');
?>