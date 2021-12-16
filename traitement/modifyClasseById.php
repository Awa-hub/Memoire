<?php
    require_once "Traitement.php";
    
    $traitement->modifyClasseById($_GET['id'], $_POST['libelle'], $_POST['montant']);

    header('Location: ../LClasse.php');

?>