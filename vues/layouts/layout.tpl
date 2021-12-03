<?php  
	global $controle;  
	global $action;
?>

<!DOCTYPE html>
    <head>
        <meta charset="utf-8">
   
        <title>Sauveteurs du Dunkerquois</title>

        <meta name="HandheldFriendly" content="true"/>
        <meta name="viewport" content="width=device-width, height=device-height"/>
        <link rel="canonical" href="https://sauveteurdudunkerquois.fr/">
        <link href="./vues/styles/style.css" rel="stylesheet"/>
        <link href="./vues/styles/styleh.css" rel="stylesheet" media="screen and (max-width: 1200px)"/>
    </head>

    <body>
        <?php require('menu.tpl'); ?>

        <main> 
		    <?php require("./vues/" . $controle . "/" . $action . ".tpl"); ?>  
	    </main>
        <footer>
            <p>Dans le cadre de la nuit de l'info
            <br>Les Serpents Australiens Du Pacifique On Découpe Toujours Tah Ninjago : Le Retour (On a appris le PHP)</p>
        </footer>
    </body>
</html>