-- Création des bases de données
CREATE DATABASE IF NOT EXISTS client_db;
CREATE DATABASE IF NOT EXISTS produit_db;
CREATE DATABASE IF NOT EXISTS commande_db;

-- Utiliser la base de données client_db
USE client_db;

-- Création de la table clients
CREATE TABLE IF NOT EXISTS clients (
    ClientID INT AUTO_INCREMENT PRIMARY KEY,
    Nom VARCHAR(255) NOT NULL,
    Prenom VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Telephone VARCHAR(20),
    Adresse VARCHAR(255),
    Ville VARCHAR(255),
    CodePostal VARCHAR(10),
    Pays VARCHAR(255)
);

-- Insertion de 5 valeurs dans clients
INSERT INTO clients (Nom, Prenom, Email, Telephone, Adresse, Ville, CodePostal, Pays) VALUES
('John', 'Doe', 'john.doe@example.com', '123456789', '123 Rue Principale', 'Paris', '75001', 'France'),
('Jane', 'Smith', 'jane.smith@example.com', '987654321', '456 Avenue des Champs', 'Lyon', '69001', 'France'),
('Alice', 'Johnson', 'alice.johnson@example.com', '555123456', '789 Boulevard de la Liberté', 'Marseille', '13001', 'France'),
('Bob', 'Williams', 'bob.williams@example.com', '444987654', '321 Rue de la Paix', 'Bordeaux', '33000', 'France'),
('Charlie', 'Brown', 'charlie.brown@example.com', '333789123', '654 Rue Victor Hugo', 'Toulouse', '31000', 'France');

-- Utiliser la base de données produit_db
USE produit_db;

-- Création de la table produits
CREATE TABLE IF NOT EXISTS produits (
    ProduitID INT AUTO_INCREMENT PRIMARY KEY,
    Nom VARCHAR(255) NOT NULL,
    Description TEXT,
    Prix DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL,
    Categorie VARCHAR(255)
);

-- Insertion de 5 valeurs dans produits
INSERT INTO produits (Nom, Description, Prix, Stock, Categorie) VALUES
('Produit A', 'Description du produit A', 10.99, 100, 'Catégorie 1'),
('Produit B', 'Description du produit B', 20.50, 200, 'Catégorie 2'),
('Produit C', 'Description du produit C', 15.75, 150, 'Catégorie 1'),
('Produit D', 'Description du produit D', 30.99, 300, 'Catégorie 3'),
('Produit E', 'Description du produit E', 25.00, 250, 'Catégorie 2');

-- Utiliser la base de données commande_db
USE commande_db;

-- Création de la table commandes
CREATE TABLE IF NOT EXISTS commandes (
    CommandeID INT AUTO_INCREMENT PRIMARY KEY,
    ClientID INT NOT NULL,
    ProduitID INT NOT NULL,
    DateCommande DATE NOT NULL,
    Statut VARCHAR(100) DEFAULT 'En cours',
    MontantTotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ClientID) REFERENCES client_db.clients(ClientID),
    FOREIGN KEY (ProduitID) REFERENCES produit_db.produits(ProduitID)
);

-- Insertion de 5 valeurs dans commandes
INSERT INTO commandes (ClientID, ProduitID, DateCommande, Statut, MontantTotal) VALUES
(1, 1, '2024-09-01', 'En cours', 21.98),
(2, 2, '2024-09-02', 'Livrée', 41.00),
(3, 3, '2024-09-03', 'Annulée', 31.50),
(4, 4, '2024-09-04', 'En cours', 61.98),
(5, 5, '2024-09-05', 'En cours', 50.00);
