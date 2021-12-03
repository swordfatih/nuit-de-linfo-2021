CREATE TABLE operations_stats(
    operation_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    dateOp VARCHAR(50),
    annee INTEGER,
    mois  INTEGER,
    jour INTEGER,
    mois_texte VARCHAR(50),
    semaine INTEGER,
    annee_semaine VARCHAR(50),
    jour_semaine VARCHAR(50),
    est_weekend boolean,
    est_jour_ferie boolean,
    est_vacances_scolaires boolean,
    phase_journee VARCHAR(50),
    concerne_plongee boolean,
    avec_clandestins boolean,
    distance_cote_metres INTEGER,
    distance_cote_milles_nautiques FLOAT,
    est_dans_stm boolean,
    nom_stm VARCHAR(50),
    est_dans_dst boolean,
    nom_dst VARCHAR(50),
    prefecture_maritime VARCHAR(50),
    maree_port VARCHAR(50),
    maree_coefficient VARCHAR(50),
    maree_categorie VARCHAR(50),
    nombre_personnes_blessees INTEGER,
    nombre_personnes_assistees INTEGER,
    nombre_personnes_decedees INTEGER,
    nombre_personnes_decedees_accidentellement INTEGER,
    nombre_personnes_decedees_naturellement INTEGER,
    nombre_personnes_disparues INTEGER,
    nombre_personnes_impliquees_dans_fausse_alerte INTEGER,
    nombre_personnes_retrouvees INTEGER,
    nombre_personnes_secourues INTEGER,
    nombre_personnes_tirees_daffaire_seule INTEGER,
    nombre_personnes_tous_deces INTEGER,
    nombre_personnes_tous_deces_ou_disparues INTEGER,
    nombre_personnes_impliquees INTEGER,
    nombre_personnes_blessees_sans_clandestins INTEGER,
    nombre_personnes_assistees_sans_clandestins INTEGER,
    nombre_personnes_decedees_sans_clandestins INTEGER,
    nombre_personnes_decedees_accidentellement_sans_clandestins INTEGER,
    nombre_personnes_decedees_naturellement_sans_clandestins INTEGER,
    nombre_personnes_disparues_sans_clandestins INTEGER,
    nombre_personnes_impliquees_dans_fausse_alerte_sans_clandestins INTEGER,
    nombre_personnes_retrouvees_sans_clandestins INTEGER,
    nombre_personnes_secourues_sans_clandestins INTEGER,
    nombre_personnes_tirees_daffaire_seule_sans_clandestins INTEGER,
    nombre_personnes_tous_deces_sans_clandestins INTEGER,
    nombre_personnes_tous_deces_ou_disparues_sans_clandestins INTEGER,
    nombre_personnes_impliquees_sans_clandestins INTEGER,
    nombre_flotteurs_commerce_impliques INTEGER,
    nombre_flotteurs_peche_impliques INTEGER,
    nombre_flotteurs_plaisance_impliques INTEGER,
    nombre_flotteurs_loisirs_nautiques_impliques INTEGER,
    nombre_aeronefs_impliques INTEGER,
    nombre_flotteurs_autre_impliques INTEGER,
    nombre_flotteurs_annexe_impliques INTEGER,
    nombre_flotteurs_autre_loisir_nautique_impliques INTEGER,
    nombre_flotteurs_canoe_kayak_aviron_impliques INTEGER,
    nombre_flotteurs_engin_de_plage_impliques INTEGER,
    nombre_flotteurs_kitesurf_impliques INTEGER,
    nombre_flotteurs_plaisance_voile_legere_impliques INTEGER,
    nombre_flotteurs_plaisance_a_moteur_moins_8m_impliques INTEGER,    
    nombre_flotteurs_plaisance_a_moteur_plus_8m_impliques  INTEGER,  
    nombre_flotteurs_plaisance_a_voile_impliques    INTEGER,
    nombre_flotteurs_planche_a_voile_impliques  INTEGER,  
    nombre_flotteurs_ski_nautique_impliques  INTEGER,  
    nombre_flotteurs_surf_impliques  INTEGER,  
    nombre_flotteurs_vehicule_nautique_a_moteur_impliques  INTEGER,  
    sans_flotteur_implique boolean


);

CREATE TABLE resultats_humain(
    operation_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    categorie_personne VARCHAR(50),
    resultat_humain VARCHAR(50),
    nombre INTEGER,
    dont_nombre_blesse INTEGER
);

CREATE TABLE flotteurs(
    operation_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    numero_ordre INTEGER NOT NULL,
    pavillon VARCHAR(50),
    resultat_flotteur VARCHAR(50),
    type_flotteur VARCHAR(50),
    categorie_flotteur VARCHAR(50),
    numero_immatriculation VARCHAR(100),
);

CREATE TABLE operations(  
    operation_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    type_operation VARCHAR(50),
    pourquoi_alerte VARCHAR(50),
    moyen_alerte VARCHAR(50),
    qui_alerte VARCHAR(50),
    categorie_qui_alerte VARCHAR(50),
    crossName VARCHAR(50),
    departement VARCHAR(50),
    est_metropolitain VARCHAR(50), 
    evenement VARCHAR(50), 
    categorie_evenement VARCHAR(50),
    autorite VARCHAR(50),
    seconde_autorite VARCHAR(50),
    zone_responsabilite VARCHAR(50),
    latitude FLOAT,
    longitude FLOAT,
    vent_direction INTEGER,
    vent_direction_categorie VARCHAR(50),
    vent_force INTEGER,
    mer_force INTEGER,
    date_heure_reception_alerte VARCHAR(50),
    date_heure_fin_operation VARCHAR(50),
    numero_sitrep INTEGER,
    cross_sitrep VARCHAR(50),
    fuseau_horaire VARCHAR(50)  
);

{
  operation_id: '-111055',
  type_operation: 'SAR',
  pourquoi_alerte: '',
  moyen_alerte: 'VHF phonie',
  qui_alerte: 'Navire impliqué',
  categorie_qui_alerte: 'Navire à la mer',
  cross: 'La Garde',
  departement: 'Var',
  est_metropolitain: 'True',
  evenement: 'Plongée avec bouteille',
  categorie_evenement: 'Accidents individuels à personnes',
  autorite: 'Préfet maritime',
  seconde_autorite: '',
  zone_responsabilite: 'Eaux territoriales',
  latitude: '43.1895',
  longitude: '6.7017',
  vent_direction: '194',
  vent_direction_categorie: 'sud',
  vent_force: '2',
  mer_force: '2',
  date_heure_reception_alerte: '2019-08-10T08:31:00Z',
  date_heure_fin_operation: '2019-08-10T11:35:00Z',
  numero_sitrep: '1992',
  cross_sitrep: 'La Garde 2019/1992',
  fuseau_horaire: 'Europe/Paris'
}