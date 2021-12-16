--
-- Base de données : `gestion`
--
DROP DATABASE `gestion`;
CREATE DATABASE `gestion`;

Use `gestion`;

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--
CREATE TABLE `classe` (
  `id_classe` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `libelle` varchar(25) NOT NULL,
  `montant_total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `classe`
--

INSERT INTO `classe` (`libelle`, `montant_total`) VALUES
('1ère année', 150000),
('2ème année', 150000),
('3ème année', 150000),
('4ème année', 150000),
('5ème année', 150000),
('6ème année', 150000);

-- --------------------------------------------------------

--
-- Structure de la table `comptable`
--

CREATE TABLE `comptable` (
  `id_comptable` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `nom` varchar(25) NOT NULL,
  `prenom` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `comptable_password` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `comptable`
--

INSERT INTO `comptable` (`nom`, `prenom`, `username`, `comptable_password`) VALUES
('KEITA', 'Awa', 'awak', 'test');

-- --------------------------------------------------------

--
-- Structure de la table `eleve`
--

CREATE TABLE `eleve` (
  `id_eleve` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `nom` varchar(25) NOT NULL,
  `prenom` varchar(25) NOT NULL,
  `date_naiss` date NOT NULL,
  `lieu_naiss` varchar(25) NOT NULL,
  `adresse` varchar(25) NOT NULL,
  `sexe` varchar(25) NOT NULL,
  `annee` varchar(25) NOT NULL,
  `pere` varchar(25) NOT NULL,
  `mere` varchar(25) NOT NULL,
  `contact` int NOT NULL,
  `id_classe` int(11) NOT NULL,
  FOREIGN KEY (`id_classe`) REFERENCES `classe`(`id_classe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

CREATE TABLE `paiement` (
  `id_paiement` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `type_paiement` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `paiement` (`type_paiement`)
VALUES('Entier'),
('Trimestre');

-- --------------------------------------------------------

--
-- Structure de la table `eleve_paiement`
--

CREATE TABLE `eleve_paiement` (
  `id_eleve_paiement` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `n_recu` int(11) NOT NULL UNIQUE,
  `reference` varchar(30) NOT NULL,
  `date_paiement` date NOT NULL,
  `annee_scolaire` varchar(25) NOT NULL,
  `frais_inscription` float NOT NULL,
  `montant_a_payer` float NOT NULL,
  `solde_restant_a_payer` float NOT NULL,
  `id_eleve` int(11) NOT NULL,
  `id_comptable` int(11) NOT NULL,
  `id_paiement` int(11) NOT NULL,
  FOREIGN KEY (`id_eleve`) REFERENCES `eleve`(`id_eleve`),
  FOREIGN KEY (`id_comptable`) REFERENCES `comptable`(`id_comptable`),
  FOREIGN KEY (`id_paiement`) REFERENCES `paiement`(`id_paiement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

