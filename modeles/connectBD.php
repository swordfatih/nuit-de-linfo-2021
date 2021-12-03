<?php
	$pdo = null;
	$hostname = "localhost";
	$bdd = "serpents";
	$username = "serpents";
	$password = "password";
	
	try
	{
		$pdo = new PDO("mysql:host=$hostname;dbname=$bdd", $username, $password);   
		$pdo->query("SET NAMES 'utf8';");
	} catch( PDOException $e ) {
		echo "Erreur de connection à la base de données SQL :", $e->getMessage();
		die();
	}
?>