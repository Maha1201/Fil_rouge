DROP DATABASE IF EXISTS E_Commerce;
CREATE DATABASE E_Commerce;

CREATE TABLE Fournisseurs(
   ID_fourni INT NOT NULL AUTO_INCREMENT,
   Ref_fourni VARCHAR(255) NOT NULL,
   Nom_fourni VARCHAR(255),
   Prenom_fourni VARCHAR(255),
   Mail_fourni VARCHAR(255),
   PRIMARY KEY(ID_fourni)
);

CREATE TABLE Produit(
   ID_prod INT NOT NULL AUTO_INCREMENT,
   P_lib_court VARCHAR(255),
   P_lib_long VARCHAR(255),
   P_prix_achat DECIMAL(15,2),
   P_quantite_totale INT,
   P_photo VARCHAR(255),
   ID_fourni_prod INT NOT NULL,
   PRIMARY KEY(ID_prod),
   FOREIGN KEY (ID_fourni) REFERENCES Fournisseurs(ID_fourni)
);

CREATE TABLE Commercial(
   ID_com INT NOT NULL AUTO_INCREMENT,
   Nom_com VARCHAR(255),
   Prenom_com VARCHAR(255),
   Mail_com VARCHAR(255),
   PRIMARY KEY(ID_com)
);

CREATE TABLE Rubrique(
   ID_rub INT NOT NULL AUTO_INCREMENT,
   Nom_rub VARCHAR(255),
   PRIMARY KEY(ID_rub)
);

CREATE TABLE Responsables(
   ID_resp INT NOT NULL AUTO_INCREMENT,
   Nom_resp VARCHAR(255),
   Prenom_resp VARCHAR(255),
   Mail_resp VARCHAR(255),
   PRIMARY KEY(ID_resp)
);

CREATE TABLE Adresse_livraison(
   ID_adr INT NOT NULL AUTO_INCREMENT,
   Rue_adr VARCHAR(255),
   Intitule_adr VARCHAR(255),
   Ville_adr VARCHAR(255),
   Pays_adr VARCHAR(255),
   Complement_adr VARCHAR(255),
   Cp_adr VARCHAR(255),
   PRIMARY KEY(ID_adr)
);

CREATE TABLE Adresse_paiement(
   ID_adr_paie INT NOT NULL AUTO_INCREMENT,
   Rue_adr_paie VARCHAR(255),
   Intitule_adr_paie VARCHAR(255),
   Ville_adr_paie VARCHAR(255),
   Pays_adr_paie VARCHAR(255),
   Complement_adr_paie VARCHAR(255),
   Cp_adr_paie VARCHAR(255),
   PRIMARY KEY(ID_adr_paie)
);

CREATE TABLE Client(
   ID_client INT NOT NULL AUTO_INCREMENT,
   Ref_client VARCHAR(255) NOT NULL,
   Cat_client VARCHAR(255),
   Nom_client VARCHAR(255),
   Prenom_client VARCHAR(255),
   Mail_client VARCHAR(255),
   Tel_client VARCHAR(255),
   ID_com INT,
   PRIMARY KEY(ID_client),
   FOREIGN KEY(ID_com) REFERENCES Commercial(ID_com)
);

CREATE TABLE Commande(
   ID_com INT NOT NULL AUTO_INCREMENT,
   Moyen_paiement VARCHAR(255),
   Num_commande VARCHAR(255) NOT NULL,
   Date_com DATE,
   Adr_livraison VARCHAR(255),
   Ville_livr_com VARCHAR(255),
   Pays_livr_com VARCHAR(255),
   Cp_livr_com VARCHAR(255),
   Adr_paiement VARCHAR(255),
   Ville_paie_com VARCHAR(255),
   Pays_paie_com VARCHAR(255),
   Cp_paie_com VARCHAR(255),
   ID_client INT NOT NULL,
   PRIMARY KEY(ID_com),
   FOREIGN KEY(ID_client) REFERENCES Client(ID_client)
);

CREATE TABLE Livraison(
   ID_livr INT NOT NULL AUTO_INCREMENT,
   Date_livr_finie DATE,
   ID_com INT NOT NULL,
   PRIMARY KEY(ID_livr),
   FOREIGN KEY(ID_com) REFERENCES Commande(ID_com)
);

CREATE TABLE Fournit(
   ID_prod INT,
   ID_fourni INT,
   PRIMARY KEY(ID_prod, ID_fourni),
   FOREIGN KEY(ID_prod) REFERENCES Produit(ID_prod),
   FOREIGN KEY(ID_fourni) REFERENCES Fournisseurs(ID_fourni)
);

CREATE TABLE Est_acheté(
   ID_prod INT,
   ID_com INT,
   P_quantite VARCHAR(255),
   Prix_vendu DECIMAL(15,2),
   PRIMARY KEY(ID_prod, ID_com),
   FOREIGN KEY(ID_prod) REFERENCES Produit(ID_prod),
   FOREIGN KEY(ID_com) REFERENCES Commande(ID_com)
);

CREATE TABLE Appartient(
   ID_prod_r INT,
   ID_rub_r INT,
   PRIMARY KEY(ID_prod, ID_rub),
   FOREIGN KEY(ID_prod) REFERENCES Produit(ID_prod),
   FOREIGN KEY(ID_rub) REFERENCES Rubrique(ID_rub)
);

CREATE TABLE Correspondent(
   ID_fourni INT,
   ID_resp INT,
   PRIMARY KEY(ID_fourni, ID_resp),
   FOREIGN KEY(ID_fourni) REFERENCES Fournisseurs(ID_fourni),
   FOREIGN KEY(ID_resp) REFERENCES Responsables(ID_resp)
);

CREATE TABLE Sous_rubrique(
   ID_rub_est_une_sousR INT,
   ID_rub_possède_une_R INT,
   PRIMARY KEY(ID_rub_est_une_sousR, ID_rub_possède_une_R),
   FOREIGN KEY(ID_rub_est_une_sousR) REFERENCES Rubrique(ID_rub),
   FOREIGN KEY(ID_rub_possède_une_R) REFERENCES Rubrique(ID_rub)
);

CREATE TABLE Possède(
   ID_client INT,
   ID_adr_ex___famille INT,
   PRIMARY KEY(ID_client, ID_adr_ex___famille),
   FOREIGN KEY(ID_client) REFERENCES Client(ID_client),
   FOREIGN KEY(ID_adr_ex___famille) REFERENCES Adresse_livraison(ID_adr)
);

CREATE TABLE Client_pro(
   ID_client INT,
   Reduction DECIMAL(15,2),
   ID_com INT NOT NULL,
   PRIMARY KEY(ID_client),
   FOREIGN KEY(ID_client) REFERENCES Client(ID_client),
   FOREIGN KEY(ID_com) REFERENCES Commercial(ID_com)
);

CREATE TABLE Livre(
   ID_prod INT,
   ID_livr INT,
   P_quantite_2 VARCHAR(255),
   Date_livr DATE,
   PRIMARY KEY(ID_prod, ID_livr),
   FOREIGN KEY(ID_prod) REFERENCES Produit(ID_prod),
   FOREIGN KEY(ID_livr) REFERENCES Livraison(ID_livr)
);

CREATE TABLE Possède_2(
   ID_client INT,
   ID_adr_paie INT,
   PRIMARY KEY(ID_client, ID_adr_paie),
   FOREIGN KEY(ID_client) REFERENCES Client(ID_client),
   FOREIGN KEY(ID_adr_paie) REFERENCES Adresse_paiement(ID_adr_paie)
);
