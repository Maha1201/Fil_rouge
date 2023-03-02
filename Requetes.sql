-- Créez une vue correspondant à la jointure Produits - Fournisseurs :

CREATE VIEW V_Prod_Fourni
AS
SELECT * FROM Produit
INNER JOIN Fournisseurs ON ID_fourni = ID_fourni_prod;

-- Créez une vue correspondant à la jointure Produits - Catégorie/Sous catégorie :

CREATE VIEW V_Prod_Rubrique
AS
SELECT * FROM Produit
INNER JOIN Appartient ON ID_prod_r = ID_prod
INNER JOIN Rubrique ON ID_rub_r = ID_rub;

-- Créez une procédure stockée qui sélectionne les commandes non soldées (en cours de livraison), 

DROP PROCEDURE IF EXISTS Com_non_soldee;

DELIMITER |

	CREATE PROCEDURE Com_non_soldee()

    BEGIN

    SELECT Commande.ID_com
    FROM Commande
    INNER JOIN Livraison ON Livraison.ID_com = Commande.ID_com
    WHERE Date_livr_finie IS NULL;

    END |

DELIMITER ;

-- puis une autre qui renvoie le délai moyen entre la date de commande et la date de facturation.

DROP PROCEDURE IF EXISTS Date_moyen_livr;

DELIMITER |

	CREATE PROCEDURE Date_moyen_livr()

    BEGIN

	SELECT Commande.ID_com, AVG(DATEDIFF(Date_livr_finie, Date_com)) AS Livraison_Moyenne
	FROM Commande
    INNER JOIN Livraison ON Livraison.ID_com = Commande.ID_com;

    END |

DELIMITER ;
	
-- 1 : Chiffre d'affaires mois par mois pour une année sélectionnée

SELECT SUM(P_quantite*Prix_vendu) AS CA, Date_com AS DateCommande
FROM Commande
INNER JOIN Est_acheté ON Commande.ID_com = Est_acheté.ID_com
GROUP BY MONTH(Date_com), YEAR(Date_com);

-- 2 : Chiffre d'affaires généré pour un fournisseur

SELECT SUM(P_quantite*Prix_vendu) AS CA, Ref_fourni
FROM Fournisseurs
INNER JOIN Produit ON Produit.ID_fourni = Fournisseurs.ID_fourni
INNER JOIN Est_acheté ON Est_acheté.ID_prod = Produit.ID_prod
GROUP BY Fournisseurs.Ref_fourni;

-- 3 : TOP 10 des produits les plus commandés pour une année sélectionnée (référence et nom du produit, quantité commandée, fournisseur)

SELECT SUM(P_quantite) AS Quantité, Produit.ID_prod, P_lib_court AS Nom, Ref_fourni
FROM Fournisseurs
INNER JOIN Produit ON ID_fourni_prod = ID_fourni
INNER JOIN Est_acheté ON Est_acheté.ID_prod = Produit.ID_prod
GROUP BY Produit.ID_prod;

-- 4 : TOP 10 des produits les plus rémunérateurs pour une année sélectionnée (référence et nom du produit, marge, fournisseur)

SELECT Produit.ID_prod, P_lib_court AS Nom, (Prix_vendu*P_quantite) AS Marge, Ref_fourni
FROM Fournisseurs
INNER JOIN Produit ON ID_fourni_prod = ID_fourni
INNER JOIN Est_acheté ON Est_acheté.ID_prod = Produit.ID_prod
INNER JOIN Commande ON Commande.ID_com = Est_acheté.ID_com
GROUP BY Produit.ID_prod
ORDER BY YEAR(Date_com);

-- 5 : Top 10 des clients en nombre de commandes ou chiffre d'affaires

SELECT Client.ID_Client, SUM(P_quantite*Prix_vendu) AS CA
FROM Client
INNER JOIN Commande ON Client.ID_Client = Commande.ID_Client
INNER JOIN Est_acheté ON Commande.ID_com = Est_acheté.ID_com
GROUP BY Commande.ID_com;

-- 6 : Répartition du chiffre d'affaires par type de client

SELECT Client.ID_Client, SUM(P_quantite*Prix_vendu) AS CA, Cat_client
FROM Client
INNER JOIN Commande ON Client.ID_Client = Commande.ID_Client
INNER JOIN Est_acheté ON Commande.ID_com = Est_acheté.ID_com
GROUP BY Cat_client;

-- 7 Nombre de commandes en cours de livraison.

SELECT Commande.ID_com
FROM Commande
INNER JOIN Livraison ON Livraison.ID_com = Commande.ID_com
WHERE Date_livr_finie IS NULL;