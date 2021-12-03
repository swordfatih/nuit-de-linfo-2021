<link href="./vues/styles/utilisateur/rechercher.css" rel="stylesheet"/>

<?php if($flop) {
    echo '<p>Easter egg !</p>';
    echo '<img src="./vues/assets/photo.jpg"/>';

} else if($detraque) {
    echo '<p>Oh le giga détraqué !</p>';
    echo '<img src="./vues/assets/detraque.jpg"/>';
} else { ?>
<h1>Résultat de recherche pour <?php echo $search; ?>.</h1>
<h3><?php echo $cpt; ?> occurences trouvés</h3>
<?php
    echo "<table>";
    foreach($elements as $element) {
        foreach($element as $colonne) {
            for($i = 0, $count = count($colonne) / 2; $i < $count; ++$i) {
				unset($colonne[$i]);
			}

            echo "<tr>";
            foreach($colonne as $ligne) {
                echo "<td>$ligne</td>";
            }
            echo "</tr>";
        }
    }
    echo "</table>";
?>
<?php } ?>