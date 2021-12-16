<?php
    require_once "Traitement.php";
    
    $traitement->addClasse($_POST['libelle'], $_POST['montant_total']);

    header('Location: ../LClasse.php');

?>