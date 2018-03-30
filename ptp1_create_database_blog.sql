CREATE DATABASE p2p_blog CHARACTER SET 'utf8';
USE p2p_blog;

-- Creation des tables
CREATE TABLE Categorie (
	id INT UNSIGNED AUTO_INCREMENT,
	nom VARCHAR(150) NOT NULL,
	description TEXT NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE Categorie_article (
	categorie_id INT UNSIGNED,
	article_id INT UNSIGNED,
	PRIMARY KEY (categorie_id, article_id)
);

-- Début des modifications.
CREATE TABLE Articles (
	id_article INT UNSIGNED AUTO_INCREMENT,
	titre VARCHAR(100) NOT NULL,
	auteur INT UNSIGNED NOT NULL,
	texte_article LONGTEXT NOT NULL,
	Resume_article TEXT,
	date_article DATETIME NOT NULL,
	PRIMARY KEY (id_article)
);
-- Par choix, l'éditon d'un résumé lors du post de l'article est falcultatif, Resume_article peut-être NULL

CREATE TABLE Utilisateurs (
	id_utilisateur INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	pseudo_u VARCHAR(50) NOT NULL,
	mdp_u VARCHAR(30), NOT NULL,
	email_u VARCHAR(150) NOT NULL
);

CREATE TABLE Commentaires_blog (
	id_commentaire INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	id_article INT UNSIGNED NOT NULL,
	auteur INT UNSIGNED,
	commentaire LONGTEXT NOT NULL,
	date_post DATETIME NOT NULL
);


	

-- Creation DES INDEX.
ALTER TABLE Utilisateurs
ADD FULLTEXT ind_pseudo (pseudo_u);

ALTER TABLE Utilisateurs 
ADD UNIQUE ind_unique_pseudo (pseudo_u);

ALTER TABLE Utilisateurs
ADD UNIQUE ind_email (email_u);

ALTER TABLE Commentaires_blog
ADD UNIQUE ind_date_post (date_post);

ALTER TABLE Articles
ADD UNIQUE ind_date_article (date_article);


-- Creation des clés étrangères	

ALTER TABLE Categorie_article
ADD CONSTRAINT fk_categorie_id_id FOREIGN KEY (categorie_id) REFERENCES Categorie(id);

ALTER TABLE Categorie_article
ADD CONSTRAINT fk_article_id_id_articule FOREIGN KEY (article_id) REFERENCES Articles(id_Article);

ALTER TABLE Articles
ADD CONSTRAINT fk_auteur_utilisateur FOREIGN KEY (auteur) REFERENCES Utilisateurs(id_utilisateur);

ALTER TABLE Commentaires_blog
ADD CONSTRAINT fk_id_article_commentaire FOREIGN KEY (id_article) REFERENCES Articles(id_Article);



-- FIN Activité numéro 1.



