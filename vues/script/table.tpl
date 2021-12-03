<script>


const nb_flotteurs = <?php echo $nb_flotteurs; ?>;
const nb_stats = <?php echo $nb_stats; ?>;
const nb_operations = <?php echo $nb_operations; ?>;
const nb_humain = <?php echo $nb_humain; ?>;

var currPage = 1;
let currPageName = "default";
let numOfEntries = 0;

// Affiche la table opérations par défaut
displayOperations();
currPageName = "operations";
numOfEntries = nb_operations;
//

function getValAndExec() {
    var doc = document.getElementById("selector").value;
    removeEntriesCount();
    removeTable();
    resetPageCount();
    currPage = 1;
    switch(doc) { // Lorsque l'id sélectionné à telle valeur, faire...
        case "opt1":
            displayOperations();
            currPageName = "operations";
            numOfEntries = nb_operations;
        break;
        case "opt2":
            displayResultats_Humain();
            currPageName = "resultats_humain";
            numOfEntries = nb_humain;
        break;
        case "opt3":
            displayFlotteurs();
            currPageName = "flotteurs";
            numOfEntries = nb_flotteurs;
        break;
        case "opt4":
            displayOperations_Stats();
            currPageName = "operations_stats";
            numOfEntries = nb_stats;
        break;
        case "default":
            currPageName = "default";
            numOfEntries = 0;
        break;
    }

    if (currPageName === "default") {
        removeEntriesCount();
        document.getElementById("currPage").innerHTML = "";
    } else {
        document.getElementById("entries").innerHTML = `${numOfEntries} résultats.`;
    }
}

function resetPageCount() {
    document.getElementById("currPage").innerHTML = 1;
}

function removeEntriesCount() {
    document.getElementById("entries").innerHTML = "";
}

function removeTable() {
    var tableDiv = document.getElementById("table");
    tableDiv.innerHTML = "";
}

function prevPage() {
    if(currPage != 1) {

        currPage -= 1;
         removeTable();

        switch(currPageName) {
            case "operations":
                displayOperations();
            break;

            case "resultats_humain":
                displayResultats_Humain();
            break;

            case "flotteurs":
                displayFlotteurs();
            break;

            case "operations_stats":
                displayOperations_Stats();
            break;
        }

        document.getElementById("currPage").innerHTML = currPage
    }
    console.log(currPage);
    
}

function nextPage() {
    currPage += 1;
    removeTable();
    console.log(currPage);

    switch(currPageName) {
        case "operations":
            displayOperations();
        break;

        case "resultats_humain":
            displayResultats_Humain();
        break;

        case "flotteurs":
            displayFlotteurs();
        break;

        case "operations_stats":
            displayOperations_Stats();
        break;
    }


    document.getElementById("currPage").innerHTML = currPage;
}

function displayFlotteurs() {
    var tableDiv = document.getElementById("table");

    let table = document.createElement('table');
    
    table.innerHTML += `<thead>
            <tr>
                <th>Pavillon</th>
                <th>Résultat</th>
                <th>Type de flotteur</th>
                <th>Catégorie de flotteur</th>
            </tr>
        </thead>`;

    tableDiv.appendChild(table);
    
    for(var i = (currPage*10)-10; i < (currPage*10); i++) {

        if(i >= nb_flotteurs) {
            break;
        }

        fetch(`https://serpents.deserte.fr/index.php?controle=operation&action=recuperer&table=flotteurs&num=${i}`)
        .then(function(response) {
            return response.json();
        })
        .then(function(data) { 

            let tr = document.createElement('tr');
            tr.innerHTML = `
                <td>${data.pavillon}</td>
                <td>${data.resultat_flotteur}</td>
                <td>${data.type_flotteur}</td>
                <td>${data.categorie_flotteur}</td>
            `

            table.appendChild(tr);
        })
        .catch(function(error) {
            throw error.message;
        });
    }
}

function displayOperations_Stats() {
    var tableDiv = document.getElementById("table");

    let table = document.createElement('table');
    
    table.innerHTML += `<thead>
            <tr>
                <th>Jour de la semaine</th>
                <th>Jour</th>
                <th>Mois</th>
                <th>Année</th>
                <th>Moment de la journée</th>
                <th>Nombre de personnes décédées</th>
                <th>Nombre de personnes bléssées</th>
            </tr>
        </thead>`;

    tableDiv.appendChild(table);
    
    for(var i = (currPage*10)-10; i < (currPage*10); i++) {

        if(i >= nb_stats) {
            break;
        }

        fetch(`https://serpents.deserte.fr/index.php?controle=operation&action=recuperer&table=operations_stats&num=${i}`)
        .then(function(response) {
            return response.json();
        })
        .then(function(data) { 

            let tr = document.createElement('tr');
            tr.innerHTML = `
                <td>${data.jour_semaine}</td>
                <td>${data.jour}</td>
                <td>${data.mois_texte}</td>
                <td>${data.annee}</td>
                <td>${data.phase_journee}</td>
                <td>${data.nombre_personnes_decedees}</td>
                <td>${data.nombre_personnes_blessees}</td>
            `

            table.appendChild(tr);
        })
        .catch(function(error) {
            throw error.message;
        });
    }
}

function displayResultats_Humain() {

    var tableDiv = document.getElementById("table");

    let table = document.createElement('table');

    table.innerHTML += `<thead>
            <tr>
                <th>Catégorie de personnes</th>
                <th>Résultat</th>
                <th>Victimes</th>
                <th>Victimes (dont blessées)</th>
            </tr>
        </thead>`;

    tableDiv.appendChild(table);

    for(var i = (currPage*10)-10; i < (currPage*10); i++) {

        if(i >= nb_humain) {
            break;
        }

        fetch(`https://serpents.deserte.fr/index.php?controle=operation&action=recuperer&table=resultats_humain&num=${i}`)
        .then(function(response) {
            return response.json();
        })
        .then(function(data) { 

            let tr = document.createElement('tr');
            tr.innerHTML = `
                <td>${data.categorie_personne}</td>
                <td>${data.resultat_humain}</td>
                <td>${data.nombre}</td>
                <td>${data.dont_nombre_blesse}</td>
            `

            table.appendChild(tr);
        })
        .catch(function(error) {
            throw error.message;
        });
    }
}

function displayOperations() {
    var tableDiv = document.getElementById("table");

    let table = document.createElement('table');
    
    table.innerHTML += `<thead>
            <tr>
                <th>Moyen alerte</th>
                <th>Qui alerte</th>
                <th>Catégorie qui alerte</th>
                <th>Département</th>
                <th>Evénement</th>
                <th>Catégorie événement</th>
                <th>Zone responsabilité</th>
            </tr>
        </thead>`;

    tableDiv.appendChild(table);
    
    for(var i = (currPage*10)-10; i < (currPage*10); i++) {

        if(i >= nb_operations) {
            break;
        }

        fetch(`https://serpents.deserte.fr/index.php?controle=operation&action=recuperer&table=operations&num=${i}`)
        .then(function(response) {
            return response.json();
        })
        .then(function(data) { 

            let tr = document.createElement('tr');
            tr.innerHTML = `
                <td>${data.moyen_alerte}</td>
                <td>${data.qui_alerte}</td>
                <td>${data.categorie_qui_alerte}</td>
                <td>${data.departement}</td>
                <td>${data.evenement}</td>
                <td>${data.categorie_evenement}</td>
                <td>${data.zone_responsabilite}</td>
            `

            table.appendChild(tr);
        })
        .catch(function(error) {
            throw error.message;
        });
    }
}
</script>