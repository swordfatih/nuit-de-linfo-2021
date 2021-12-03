<?php
    function accueil() {
        require("./modeles/utilisateurBD.php");

        $client = récupérer_client();
        if (count($_POST) > 0) {
            $elements = rechercher();
        }

        $nb_flotteurs = nb_table("flotteurs");
        $nb_stats = nb_table("operations_stats");
        $nb_humain = nb_table("resultats_humain");
        $nb_operations = nb_table("operations");

        require('./vues/layouts/layout.tpl');
    }

    function apropos() {
        require('./vues/layouts/layout.tpl');
    }

    function rechercher() {
        require("modeles/utilisateurBD.php");

        $search = isset($_POST['search']) ? $_POST['search'] : null;

        if($search == null)
            header('Location: ./index.php?controle=utilisateur&action=accueil');

        if($search == "flop") {
            $flop = true;
        }
        else if($search == "detraque") {
            $detraque = true;
        }
        else {
            $elements = recherche($search);

            $cpt = 0;
            foreach($elements as $element) {
                foreach($element as $ligne) {
                    $cpt++;
                }
            }
        }

        require('./vues/layouts/layout.tpl');
    }

    function communautaire() {
         require("./modeles/utilisateurBD.php");

        if(isset($_POST['ajouter'])){
            $id = htmlspecialchars($_POST['id']);
            $nom = htmlspecialchars($_POST['nom']);
            $prenom = htmlspecialchars($_POST['prenom']);
            $date = htmlspecialchars($_POST['date']);
            
            ajouter_sauveteur($id,$nom,$prenom,$date);
        } 

        if(isset($_POST['ajouter_bateau'])){
            $pavillon =  htmlspecialchars($_POST['pavillon']);
            $resultat =  htmlspecialchars($_POST['resultat']);
            $type =  htmlspecialchars($_POST['type']);
            $categorie =  htmlspecialchars($_POST['categorie']);
            $imatriculation =  htmlspecialchars($_POST['imatriculation']);

            ajouter_pavillon( $pavillon,$resultat, $type, $categorie, $imatriculation );
        }

        $nb_flotteurs = nb_table("flotteurs");
        $nb_stats = nb_table("operations_stats");
        $nb_humain = nb_table("resultats_humain");
        $nb_operations = nb_table("operations");

        require('./vues/layouts/layout.tpl');
        require('./vues/script/table.tpl');
    }

    function récupérer_client() {
        return isset($_SESSION["client"]) ? $_SESSION["client"] : null; 
    }

    return array('accueil', 'communautaire', 'apropos', 'rechercher');
?>
