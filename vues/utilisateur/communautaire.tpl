<link href="./vues/styles/utilisateur/communautaire.css" rel="stylesheet"/>
<div>
<!-- 
  <h3>Ajouter un Sauveteur </h3> 

    <form action="./index.php?controle=utilisateur&action=communautaire" method = "POST">
        <input type="texte" name="nom" placeholder="Nom"></input>
        <input type="texte" name="prenom" placeholder="Prénom"></input>
        <input onfocus="(this.type='date')" name="date" placeholder="Date de naissance"></input>
        <input type="submit" name="ajouter" value="Ajouter"></input>
    </form>  -->
    <h3>Ajouter un bateau   </h3> 
    <form action="./index.php?controle=utilisateur&action=communautaire" method = "POST" >

        <input type="texte" name="pavillon" placeholder="Pavillon"></input>
        <input type="texte" name="resultat" placeholder="Resultat"></input>               
        <input type="texte" name="type" placeholder="Type"></input>
        <input type="texte" name="categorie" placeholder="Catégorie"></input>
        <input type="texte" name="matriculation" placeholder="imatriculation"></input>
        <input type="submit" name="ajouter_bateau" value="Ajouter"></input>
    </form> 
    <div id="pp-gradient"></div>
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="#0099ff" fill-opacity="1" d="M0,160L30,133.3C60,107,120,53,180,58.7C240,64,300,128,360,170.7C420,213,480,235,540,224C600,213,660,171,720,170.7C780,171,840,213,900,240C960,267,1020,277,1080,245.3C1140,213,1200,139,1260,101.3C1320,64,1380,64,1410,64L1440,64L1440,320L1410,320C1380,320,1320,320,1260,320C1200,320,1140,320,1080,320C1020,320,960,320,900,320C840,320,780,320,720,320C660,320,600,320,540,320C480,320,420,320,360,320C300,320,240,320,180,320C120,320,60,320,30,320L0,320Z"></path></svg><div id='pp-gradient'>
    
   
    <h3>Affichez une table</h3>

    <select id="selector" onchange="getValAndExec();">
        <option value ="default">Choisissez une option</option>
        <option value ="opt1">Opérations</option>
        <option value = "opt2">Résultats Humains</option>
        <option value = "opt3">Flotteurs</option>
        <option value = "opt4">Statistiques des opérations</option>
    </select> 

    <p id=entries></p>
<div id="table">
    </div> 
    
    <p id=currPage></p>
    <button id="btn1" type="button" onclick="prevPage();">Page Précédente</button>
    <button id="btn2" type="button" onclick="nextPage();">Page Suivante</button>


    <script>
    let btn1 = document.getElementById("btn1");
    let btn2 = document.getElementById("btn2");

    if(document.getElementById("selector").options["default"].value == true) {
        btn1.style.display = "none";
        btn2.style.display = "none";
    } else {
        btn1.style.display = "block";    
        btn2.style.display = "block";
    }
    </script>




</div>
