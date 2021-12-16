-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 15 nov. 2021 à 17:11
-- Version du serveur : 10.4.20-MariaDB
-- Version de PHP : 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion`
--

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

CREATE TABLE `classe` (
  `id_classe` int(11) NOT NULL,
  `libelle` varchar(25) NOT NULL,
  `montant_total` float NOT NULL,
  `solde_a_payer` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `comptable`
--

CREATE TABLE `comptable` (
  `id_comptable` int(11) NOT NULL,
  `nom` varchar(25) NOT NULL,
  `prenom` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `comptable_password` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `comptable`
--

INSERT INTO `comptable` (`id_comptable`, `nom`, `prenom`, `username`, `comptable_password`) VALUES
(1, 'KEITA', 'Awa', 'awak', 'test');

-- --------------------------------------------------------

--
-- Structure de la table `eleve`
--

CREATE TABLE `eleve` (
  `id_eleve` int(11) NOT NULL,
  `nom` varchar(25) NOT NULL,
  `prenom` varchar(25) NOT NULL,
  `date_naiss` date NOT NULL,
  `lieu_naiss` varchar(25) NOT NULL,
  `addresse` varchar(25) NOT NULL,
  `pere` varchar(25) NOT NULL,
  `mere` varchar(25) NOT NULL,
  `contact` varchar(25) NOT NULL,
  `id_classe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `eleve_paiement`
--

CREATE TABLE `eleve_paiement` (
  `id_eleve_paiement` int(11) NOT NULL,
  `n_recu` int(11) NOT NULL,
  `date_paiement` date NOT NULL,
  `annee_scolaire` varchar(25) DEFAULT NULL,
  `montant_fixe` float NOT NULL,
  `id_eleve` int(11) NOT NULL,
  `id_comptable` int(11) NOT NULL,
  `id_paiement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

CREATE TABLE `paiement` (
  `id_paiement` int(11) NOT NULL,
  `type_paiement` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`id_classe`);

--
-- Index pour la table `comptable`
--
ALTER TABLE `comptable`
  ADD PRIMARY KEY (`id_comptable`);

--
-- Index pour la table `eleve`
--
ALTER TABLE `eleve`
  ADD PRIMARY KEY (`id_eleve`),
  ADD KEY `id_classe` (`id_classe`);

--
-- Index pour la table `eleve_paiement`
--
ALTER TABLE `eleve_paiement`
  ADD PRIMARY KEY (`id_eleve_paiement`),
  ADD KEY `id_eleve` (`id_eleve`),
  ADD KEY `id_comptable` (`id_comptable`),
  ADD KEY `id_paiement` (`id_paiement`);

--
-- Index pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD PRIMARY KEY (`id_paiement`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `classe`
--
ALTER TABLE `classe`
  MODIFY `id_classe` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `comptable`
--
ALTER TABLE `comptable`
  MODIFY `id_comptable` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `eleve`
--
ALTER TABLE `eleve`
  MODIFY `id_eleve` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `eleve_paiement`
--
ALTER TABLE `eleve_paiement`
  MODIFY `id_eleve_paiement` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `eleve`
--
ALTER TABLE `eleve`
  ADD CONSTRAINT `eleve_ibfk_1` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`);

--
-- Contraintes pour la table `eleve_paiement`
--
ALTER TABLE `eleve_paiement`
  ADD CONSTRAINT `eleve_paiement_ibfk_1` FOREIGN KEY (`id_eleve`) REFERENCES `eleve` (`id_eleve`),
  ADD CONSTRAINT `eleve_paiement_ibfk_2` FOREIGN KEY (`id_comptable`) REFERENCES `comptable` (`id_comptable`),
  ADD CONSTRAINT `eleve_paiement_ibfk_3` FOREIGN KEY (`id_paiement`) REFERENCES `paiement` (`id_paiement`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
