<?php
    require_once('Traitement.php');

    $traitement->deleteEleveById($_GET['id']); //Delete eleve by Id
    header('Location: ../LEleve.php');
?>