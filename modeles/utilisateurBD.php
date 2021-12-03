<?php
	function recherche($search) {
		require('./modeles/connectBD.php');

		$search = "%" . $search . "%";

		$sql_flotteur = 'SELECT `pavillon`, `resultat_flotteur`, `type_flotteur` FROM `flotteurs` WHERE CONCAT(`resultat_flotteur`, `type_flotteur`) LIKE :search LIMIT 500';
		$sql_operations = 'SELECT `moyen_alerte`, `qui_alerte`, `categorie_qui_alerte` FROM `operations` WHERE CONCAT(`moyen_alerte`, `categorie_qui_alerte`, `departement`, `crossName`, `evenement`, `categorie_evenement`) LIKE :search LIMIT 500';
		$sql_operations_stats = 'SELECT `operation_id`, `dateOp`, `nombre_personnes_blessees` FROM `operations_stats` WHERE CONCAT(`dateOp`, `operation_id`) LIKE :search LIMIT 500';
		$sql_resultats_humain = 'SELECT `categorie_personne`, `resultat_humain`, `nombre`, `dont_nombre_blesse` FROM `resultats_humain` WHERE CONCAT(`categorie_personne`, `resultat_humain`) LIKE :search LIMIT 500';

		$resultat = array();

		$stmt = $pdo->prepare($sql_flotteur);
		$stmt->bindParam('search', $search, PDO::PARAM_STR);
		$stmt->execute();
		array_push($resultat, $stmt->fetchAll());

		$stmt = $pdo->prepare($sql_operations);
		$stmt->bindParam('search', $search, PDO::PARAM_STR);
		$stmt->execute();
		array_push($resultat, $stmt->fetchAll());

		$stmt = $pdo->prepare($sql_operations_stats);
		$stmt->bindParam('search', $search, PDO::PARAM_STR);
		$stmt->execute();
		array_push($resultat, $stmt->fetchAll());

		$stmt = $pdo->prepare($sql_resultats_humain);
		$stmt->bindParam('search', $search, PDO::PARAM_STR);
		$stmt->execute();
		array_push($resultat, $stmt->fetchAll());

		return $resultat;
	}



	function ajouter_sauveteur($idSauv, $prenomSauv,$nomSauv, $dateSauv){
		require('./modeles/connectBD.php');
		$sql = "INSERT INTO `sauveteur` (`idSauvteur`, `prenomSauvteur`, `nomSauvteur`, `dateNaiss`) VALUES (NULL, ?, ?, ?)";
		try{
			$req = $pdo->prepare($sql);
			$bool = $req->execute(array($prenomSauv,$nomSauv, $dateSauv));
			if ($bool) {
				return true;
			}else{
				echo 'erreur !';
			}

		}catch(PDOException $e) {
			echo utf8_encode("Echec d'ajout' : " . $e->getMessage() . "\n");
			die(); // On arrête tout.
		}
	}


	function ajouter_pavillon($pavillon, $resultat, $type, $categorie, $imatriculation){
		require('./modeles/connectBD.php');

		try{
			$stmt = $pdo->prepare("INSERT INTO `flotteurs` (`operation_id`, `numero_ordre`, `pavillon`, `resultat_flotteur`,`type_flotteur`,`categorie_flotteur`,`numero_immatriculation` ) VALUES (NULL,1,:pavillon, :resultat_flotteur, :type_flotteur, :categorie_flotteur, :numero_immatriculation);");

			$stmt->bindParam('pavillon', $pavillon, PDO::PARAM_STR);
			$stmt->bindParam('resultat_flotteur',  $resultat, PDO::PARAM_STR);
			$stmt->bindParam('type_flotteur', $type, PDO::PARAM_STR);
			$stmt->bindParam('categorie_flotteur', $categorie, PDO::PARAM_STR);
			$stmt->bindParam('numero_immatriculation', $imatriculation, PDO::PARAM_STR);
			$stmt->execute();

		}catch(PDOException $e) {
			echo utf8_encode("Echec d'ajout' : " . $e->getMessage() . "\n");
			die(); // On arrête tout.
		}
	}

	function supprimer_sauveteur($idSauv){ // Récuperer $idSauv depuis la vue

		require('./modeles/connectBD.php');
		$sql = "DELETE FROM sauveteur WHERE :idSauv"; // Jsuis pas sur de ce sql, il a l'air claqué un peu 
		try {
			$stmt = $pdo->prepare($sql);
			$stmt->bindParam('idSauv', $idSauv, PDO::PARAM_INT);
			$stmt->execute();

			return $stmt->fetchAll();
		} catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die(); // On arrête tout.
		}
	}

	function nb_table($nom){
		require('./modeles/connectBD.php');
		$sql = "SELECT COUNT(*) FROM $nom";
		try {
			$stmt = $pdo->prepare($sql);
			$stmt->execute();
			return $stmt->fetchAll()[0][0];
		} catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die(); // On arrête tout.
		}
	}
		
    function authentifier($data) 
	{
		require('./modeles/connectBD.php');
		
		$stmt = $pdo->prepare('SELECT * FROM `client` WHERE email=:email AND mdp=:mdp;');
		$stmt->bindParam('email', $data['email'], PDO::PARAM_STR);
		$stmt->bindParam('mdp', $data['mdp'], PDO::PARAM_STR);
		$stmt->execute();

		$resultat = $stmt->fetchAll();
	
		if(count($resultat) > 0) 
		{
			$_SESSION["client"] = result_to_client($resultat);
			return true;
		}
		
		return false;
	}

	function inscrire($data) 
	{
		require('./modeles/connectBD.php');

		try {
			if(client_by_email($data['email']) != null)
				return "Un compte a déjà été crée avec l'email donné.";

			$stmt = $pdo->prepare('INSERT INTO `client` (`pseudo`, `nom`, `adresse`, `email`, `mdp`) VALUES (:pseudo, :nom, :adresse, :email, :mdp);');
			$stmt->bindParam('pseudo', $data['pseudo'], PDO::PARAM_STR);
			$stmt->bindParam('nom', $data['nom'], PDO::PARAM_STR);
			$stmt->bindParam('adresse', $data['adresse'], PDO::PARAM_STR);
			$stmt->bindParam('email', $data['email'], PDO::PARAM_STR);
			$stmt->bindParam('mdp', $data['mdp'], PDO::PARAM_STR);

			$stmt->execute();

			$_SESSION["client"] = client_by_email($data['email']);

			return 0;
		} catch( PDOException $e ) {
			echo "Erreur SQL :", $e->getMessage();
		}
		
		return 'Une erreur est survenue lors de votre inscription.';
	}

	function result_to_client($resultat) 
    {
        $client = array();
                
        $client["cli_id"] = $resultat[0]['cli_id'];
        $client["nom"] = $resultat[0]['nom'];
        $client["adresse"] = $resultat[0]['adresse'];
        $client["pseudo"] = $resultat[0]['pseudo'];
        $client["email"] = $resultat[0]['email'];
        
        return $client;
    }

	function get_operations() 
    {
        require('./modeles/connectBD.php');
		
		try {
			$stmt = $pdo->prepare('SELECT * FROM `operations`;');
            $stmt->execute();

            return $stmt->fetchAll();
            
            
		} catch( PDOException $e ) {
			echo "Erreur SQL :", $e->getMessage();
		}

		return null;
    }

	function get_table_by_offset($table, $offset) 
	{
        require('./modeles/connectBD.php');
		
		try {
			$stmt = $pdo->prepare("SELECT * FROM $table LIMIT 1 OFFSET :offset;");
			$stmt->bindParam('offset', $offset, PDO::PARAM_INT);
            $stmt->execute();

			$result = $stmt->fetchAll()[0];

			for($i = 0, $count = count($result) / 2; $i < $count; ++$i) {
				unset($result[$i]);
			}

            return $result;
		} catch( PDOException $e ) {
			echo "Erreur SQL :", $e->getMessage();
		}

		return null;
    }
?>