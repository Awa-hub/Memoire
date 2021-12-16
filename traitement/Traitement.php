<?php
    //On demarre la session si elle ne l'est pas
    if (session_status() === PHP_SESSION_NONE)
    {
        session_start();
    }

    class Traitement
    {
        public $myPdo;

        function __construct()
        {
            try
            {
                $this->myPdo = new PDO("mysql:host=localhost;dbname=gestion", "root", "");
            }
            catch (PDOException $e)
            {
                echo "Erreur !: " . $e->getMessage() . "<br/>";
                die();
            }
        }

        public function verifyLogin($username, $password)
        {
            try
            {
                $req = $this->myPdo->prepare("SELECT `username`, `comptable_password` FROM comptable;");
                $req->execute();
    
                $result = $req->fetchAll();
    
                foreach($result as $res)
                {
                    if($username == $res['username'] and $password == $res['comptable_password'])
                    {
                        $user = $this->getComptableByUsername($username);
                        $_SESSION['username'] = $username;
                        $_SESSION['prenom'] = $user['prenom'];
                        $_SESSION['nom'] = $user['nom'];
                        
                        header("Location: ../index.php");
                    }
                    else
                    {
                        header("Location: ../login.php");
                    }
                }
            }
            catch (PDOException $e)
            {
                echo "Erreur !: " . $e->getMessage() . "<br/>";
                die();
            }
            
        }

        public function getComptableByUsername($username)
        {
            $req = $this->myPdo->prepare("SELECT `prenom`, `nom` FROM comptable;");
            $req->execute();
    
            $result = $req->fetch();
            return $result;
        }

        public function getClasseById($id)
        {
            $req = $this->myPdo->prepare("SELECT `libelle` FROM classe WHERE id_classe = $id;");
            $req->execute();
            $result = $req->fetch();
            return $result;
        }

        public function getClasseByIdAndName()
        {
            $req = $this->myPdo->prepare("SELECT `id_classe`, `libelle` FROM classe;");
            $req->execute();
            $result = $req->fetchAll();
            return $result;
        }

        public function addEleve($nom, $prenom, $date, $lieu, $adresse, $sexe, $annee, $pere, $mere, $contact, $id_classe)
        {
            $myReq = "INSERT INTO eleve(nom, prenom, date_naiss, lieu_naiss, adresse, sexe, annee, pere, mere, contact, id_classe) VALUES('$nom', '$prenom', '$date', '$lieu', '$adresse', '$sexe', '$annee', '$pere', '$mere', '$contact', '$id_classe');";
            $req = $this->myPdo->prepare($myReq);
            $req->execute();
        }

        public function getAllEleve()
        {
            $req = $this->myPdo->prepare("SELECT * FROM eleve;");
            $req->execute();
            $result = $req->fetchAll();
            return $result;
        }

        public function deleteEleveById($id)
        {
            $req = $this->myPdo->prepare("DELETE FROM eleve WHERE id_eleve = $id;");
            $req->execute();
        }

        public function getEleveById($id)
        {
            $req = $this->myPdo->prepare("SELECT * FROM eleve WHERE id_eleve = $id;");
            $req->execute();
            $result = $req->fetch();
            return $result;
        }

        public function modifyEleveById($id_eleve, $nom, $prenom, $date, $lieu, $adresse, $sexe, $annee, $pere, $mere, $contact, $id_classe)
        {
            $myReq = "UPDATE eleve SET nom = '$nom', prenom = '$prenom', date_naiss = '$date', lieu_naiss = '$lieu', adresse = '$adresse', sexe = '$sexe', annee = '$annee', pere = '$pere', mere = '$mere', contact = $contact, id_classe = $id_classe WHERE id_eleve = $id_eleve;";
            $req = $this->myPdo->prepare($myReq);
            $req->execute();
        }

        public function addClasse($libelle, $montant)
        {
            $myReq = "INSERT INTO classe(libelle, montant_total) VALUES('$libelle', '$montant');";
            $req = $this->myPdo->prepare($myReq);
            $req->execute();
        }

        public function getAllClasse()
        {
            $req = $this->myPdo->prepare("SELECT * FROM classe;");
            $req->execute();
            $result = $req->fetchAll();
            return $result;
        }

        public function getEleveByIdclasse($id)
        {
            $req = $this->myPdo->prepare("SELECT * FROM eleve WHERE id_classe = $id");
            $req->execute();
            $result = $req->fetchAll();
            return $result;
        }

        public function getAllPaiement()
        {
            $req = $this->myPdo->prepare("SELECT * FROM paiement;");
            $req->execute();
            $result = $req->fetchAll();
            return $result;
        }

        public function getEleveBySexe($sexe)
        {
            $req = $this->myPdo->prepare("SELECT * FROM eleve WHERE sexe = '$sexe';");
            $req->execute();
            $result = $req->fetchAll();
            return $result;
        }

        public function getEleveBySexeAndClasse($sexe,$id_classe)
        {
            $req = $this->myPdo->prepare("SELECT * FROM eleve WHERE sexe = '$sexe' AND id_classe = $id_classe;");
            $req->execute();
            $result = $req->fetchAll();
            return $result; 
        }

        public function deleteClasseById($id)
        {
            $req = $this->myPdo->prepare("DELETE FROM classe WHERE id_classe = $id;");
            $req->execute();
        }

        public function modifyClasseById($id_classe, $libelle, $montant)
        {
            $myReq = "UPDATE classe SET libelle = '$libelle', montant_total = '$montant', WHERE id_classe = $id_classe;";
            $req = $this->myPdo->prepare($myReq);
            $req->execute();
        }
    }

    $traitement = new Traitement();

?>