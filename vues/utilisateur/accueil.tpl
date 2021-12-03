<head>
        <meta charset="utf-8">
        <meta name="HandheldFriendly" content="true"/>
        <meta name="viewport" content="width=device-width, height=device-height"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="./vues/styles/utilisateur/accueil.css">
        <link rel="stylesheet" href="./vues/styles/main.scss">
</head>

<section>
    
<form action="./index.php?controle=utilisateur&action=rechercher" method="POST">
    <input type="text" name="search" placeholder="Rechercher des flotteurs, des opérations, des statistiques.."></input>
    <input type="submit" value="Rechercher"></input>
</form> 

<div id="stats">
<p>La plus grande archive de données !
<br>Nombre de flotteurs enregistrés : <b><?php echo $nb_flotteurs; ?></b>
<br>Nombre d'opérations de sauvetage enregistrés : <b><?php echo $nb_operations; ?></b>
<br>Nombre de statistiques enregistrés : <b><?php echo $nb_stats; ?></b>
<br>Nombre de sauvés enregistrés : <b><?php echo $nb_humain; ?></p></b>

</div>


</section>
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="#0099ff" fill-opacity="1" d="M0,160L30,133.3C60,107,120,53,180,58.7C240,64,300,128,360,170.7C420,213,480,235,540,224C600,213,660,171,720,170.7C780,171,840,213,900,240C960,267,1020,277,1080,245.3C1140,213,1200,139,1260,101.3C1320,64,1380,64,1410,64L1440,64L1440,320L1410,320C1380,320,1320,320,1260,320C1200,320,1140,320,1080,320C1020,320,960,320,900,320C840,320,780,320,720,320C660,320,600,320,540,320C480,320,420,320,360,320C300,320,240,320,180,320C120,320,60,320,30,320L0,320Z"></path></svg><div id='pp-gradient'>
<div id ="bulles"></div>
<div id="pp-gradient"></div>
<div class="col-6 flex-column">
    <div id="boxe1">
            <h2>Qui sommes-nous?</h2>
            <p>Un groupe d’étudiants voulant contribuer à l’amélioration du site « Sauveteur du Dunkerquois » en proposant une fonctionnalité unique de recherche et de contribution aux missions de sauvetages passées. Parce qu’il est primordial d’obtenir plus facilement les informations au détail près dans une optique d’amélioration de cette encyclopédie de sauvetages et que la mémoire de ces sauveteurs soit reconnue.</p>
        </div></div>

        <br>

        <div class="col-6 flex-column">
        <div id="boxe2">
            <h2>Une fonction de recherche ?</h2>
            <p>Nous nous sommes mobilisés pour, comme vous le savez maintenant, développer une fonction de recherche mais, à quoi consiste-t-elle vraiment ? En plus de vous permettre d’obtenir de l’information plus précise et rapide : Vous, visiteur du site, peuvent désormais contribuer à l’ajouts et la correction des informations des différentes pages. Il vous suffit de cliquer sur le crayon présent sur chaque page disponible. Vos connaissances nous sont précieuses !</p>
        </div></div>
    </div>
</div>

<div class="animation-wrapper">
    <div class="water">
        <ul class="waves">
            <li class="wave-one" style="background-image: url('https://i.postimg.cc/7LtCC11Y/wave1.png');"></li>
            <li class="wave-two" style="background-image: url('https://i.postimg.cc/P5hv05rh/wave2.png');"></li>
            <li class="wave-three" style="background-image: url('https://i.postimg.cc/63Dyc91k/wave3.png');"></li>
            <li class="wave-four" style="background-image: url('https://i.postimg.cc/1tg8DgM0/wave4.png');"></li>
        </ul>
    </div>
    <div class="boat" style="background-image: url('https://i.postimg.cc/GmQTRnHD/boat2.png');"></div>
    <div class="cloud" style="background-image: url('https://i.postimg.cc/VNkrLZCV/cloud-md.png');"></div>
    <div class="cloud2" style="background-image: url('https://i.postimg.cc/VNkrLZCV/cloud-md.png');"></div>
</div>