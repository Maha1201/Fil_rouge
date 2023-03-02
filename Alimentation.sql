INSERT INTO Responsables(Nom_resp, Prenom_resp, Mail_resp)
VALUES 
('Un', 'Hugo', 'Hugo.Un@mail.fr'),
('Deux', 'Ines', 'Ines.Deux@mail.fr'),
('Trois', 'Margot', 'Margot.Trois@mail.fr');

INSERT INTO Fournisseurs(Ref_fourni, Nom_fourni, Prenom_fourni, Mail_fourni)
VALUES
('123ABC', 'Uno', 'Sabri', 'Sabri.Uno@mail.fr'),
('456DEF', 'Dos', 'Liam', 'Liam.Dos@mail.fr'),
('789GHI', 'Tres', 'Lucas', 'Lucas.Tres@mail.fr');

INSERT INTO Rubrique(Nom_rub)
VALUES
('Occasions'),
('Amour'),
('Deuil'),
('Mariage'),
('Anniversaire'),
('Bouquets');

INSERT INTO Produit(P_lib_court, P_lib_long, P_prix_achat, P_quantite_totale, P_photo, ID_fourni)
VALUES
('Rose rouge (10 tiges)', 'Un bouquet de 10 roses rouges', '17.99', '20', '', '1'),
('Rose rouge (20 tiges)', 'Un bouquet de 20 roses rouges', '29.00', '20', '', '1'),
('Brassée de pivoines', 'Un bouquet de 10 pivoines blanches ou roses', '31.99', '15', '', '3'),
('Pivoines & Roses', 'Un bouquet de 6 pivoines blanches et 10 roses rouges', '38.00', '10', '', '2');

INSERT INTO Client(Ref_client, Cat_client, Nom_client, Prenom_client, Mail_client, Tel_client)
VALUES
('987IHG', 'Particulier', 'Mine', 'Steve', 'Steve.Mine@mail.fr', '06 57 31 31 12'),
('654FED', 'Professionnel', 'Craft', 'Alex', 'Alex.Craft@mail.fr', '07 82 45 96 37'),
('321CBA', 'Particulier', 'Brine', 'Hero', 'Hero.Brine@mail.fr', '06 01 10 00 11');

INSERT INTO Commercial(Nom_com, Prenom_com, Mail_com)
VALUES
('One', 'Rim', 'Rim.One@mail.fr'),
('Two', 'Denis', 'Denis.Two@mail.fr'),
('Three', 'Maggie', 'Maggie.Three@mail.fr');

INSERT INTO Adresse_livraison(Rue_adr, Intitule_adr, Ville_adr, Pays_adr, Complement_adr, Cp_adr)
VALUES
('542', 'de Cardonnette', 'Caen', 'France', '', '14118'),
('236', 'Pierre Curie', 'Reims', 'France', 'Apt 45', '51454'),
('45', 'Le Souflade', 'Valence', 'France', 'Bat Les Violettes', '26362');

INSERT INTO Adresse_paiement(Rue_adr_paie, Intitule_adr_paie, Ville_adr_paie, Pays_adr_paie, Complement_adr_paie, Cp_adr_paie)
VALUES
('84', 'Jean Moulin', 'Lyon', 'France', '', '69000'),
('236', 'Pierre Curie', 'Reims', 'France', 'Apt. 45', '51454'),
('45', 'Le Souflade', 'Valence', 'France', 'Bat. Les Violettes', '26362');

INSERT INTO Commande(Moyen_paiement, Num_commande, Date_com, Adr_livraison, Ville_livr_com, Pays_livr_com, Cp_livr_com, Adr_paiement, Ville_paie_com, Pays_paie_com, Cp_paie_com, ID_client)
VALUES
('Carte Bancaire', '00001', '2023-03-01', '45 rue Le Souflade', 'Valence', 'France', '26362', '45 rue Le Souflade', 'Valence', 'France', '26362', '1'),
('Carte Bancaire', '00002', '2023-02-27', '542 rue de Cardonnette', 'Caen', 'France', '14118', '84 rue Jean Moulin', 'Lyon', 'France', '69000', '2');

INSERT INTO Est_acheté(ID_prod, ID_com, P_quantite, Prix_vendu)
VALUES
('2', '1', '2', '29.00'),
('3', '2', '1', '31.99'),
('2', '2', '1', '29.00');

INSERT INTO Livraison(Date_livr_finie, ID_com)
VALUES
('2023-03-02', '1')
('', '2');