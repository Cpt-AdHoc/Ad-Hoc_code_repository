-- Debut activite 2

SET lc_time_names = 'fr_FR';

-- Affichage de la page acceuil

SELECT titre, DATE_FORMAT(date_publication, '%d/%m/%Y') AS Cree_le, Utilisateur.pseudo AS Auteur, resume, COUNT(Commentaire.id) AS nombre_commentaires
FROM Article
INNER JOIN Utilisateur ON Utilisateur.id = Article.auteur_id
INNER JOIN Commentaire ON Commentaire.article_id = Article.id
GROUP BY Article.titre
ORDER BY DATE(date_publication) DESC;

		-- Remarque : Avec la colonne resume l'affichage sur la console est incomprehensible.

-- Auteur - id de l’auteur = 2

-- Il faut la date de publication (format “12 octobre ‘14” - attention à l’apostrophe devant l’année à deux chiffres)
-- , pseudo de l’auteur, titre et résumé de chaque article (triés du plus récent au plus vieux) 
-- écrits par l’auteur 2.


SELECT DATE_FORMAT(date_publication, '%d %M ''%y') AS date_de_publication, Utilisateur.pseudo AS Auteur, titre, resume
FROM Article
INNER JOIN Utilisateur ON Utilisateur.id = Article.auteur_id
WHERE Article.auteur_id = '2'
ORDER BY date_de_publication DESC;

-- Remarque : Avec la colonne resume l'affichage sur la console est incomprehensible.

-- Categorie - id de la catégorie = 3

-- Il faut la date de publication (format “12/10/2014 - 17:47”), 
-- pseudo de l’auteur, titre et résumé de chaque article (triés du plus récent au plus vieux) 
-- de la catégorie 3.

SELECT DATE_FORMAT(date_publication, '%d/%m/%Y - %H:%i') AS date_publication, Utilisateur.pseudo AS Auteur, titre, resume, Categorie.nom AS Categorie
FROM Article
INNER JOIN Utilisateur ON Utilisateur.id = Article.auteur_id
INNER JOIN Categorie_article ON Article.id = Categorie_article.article_id
INNER JOIN Categorie ON Categorie_article.categorie_id = Categorie.id
WHERE Categorie.id = '3'
ORDER BY date_publication DESC;

-- Remarque : Avec la colonne resume l'affichage sur la console est incomprehensible.

-- Article - id de l’article = 4

-- récupérer la date de publication (format “12 octobre 2014 à 17 heures 47”),
-- le titre, le contenu, les noms des catégories de l’article 4, ainsi que le pseudo de son auteur.

SELECT DATE_FORMAT(date_publication, '%e %M %Y à %H heures %i') AS Publie_le, titre, contenu, Utilisateur.pseudo AS Auteur, GROUP_CONCAT(Categorie.nom) AS Categories
FROM Article 
LEFT JOIN Utilisateur ON Utilisateur.id = Article.auteur_id
LEFT JOIN Categorie_article ON Article.id = Categorie_article.article_id
LEFT JOIN Categorie ON Categorie_article.categorie_id = Categorie.id
WHERE Article.id = '4'
ORDER By Publie_le DESC;

-- Remarque : Avec la colonne contenu l'affichage sur la console est incomprehensible.

-- Recuperation de la page commentaire (récupérer du sujet)

SELECT Commentaire.contenu,
              DATE_FORMAT(Commentaire.date_commentaire, '%d/%m/%Y') AS Publie_le, Utilisateur.pseudo
FROM Commentaire
LEFT JOIN Utilisateur ON Commentaire.auteur_id = Utilisateur.id
WHERE Commentaire.article_id = 2
ORDER BY Commentaire.date_commentaire;
