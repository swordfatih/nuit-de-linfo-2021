<?php
function recuperer() {
    require("./modeles/utilisateurBD.php");

    header('Content-Type: application/json; charset=utf-8');

    $numero = isset($_GET['num']) ? $_GET['num'] : null;
    $table = isset($_GET['table']) ? $_GET['table'] : null;

    if($numero == null || $table == null) {
        die('Numéro ou table invalide');
    }

    if($table == 'operations')
        $resultat = get_table_by_offset('operations', $numero);
    if($table == 'resultats_humain')
        $resultat = get_table_by_offset('resultats_humain', $numero);
    if($table == 'flotteurs')
        $resultat = get_table_by_offset('flotteurs', $numero);
    if($table == 'operations_stats')
        $resultat = get_table_by_offset('operations_stats', $numero);

    die(json_encode($resultat));
}

return array('recuperer');
?>