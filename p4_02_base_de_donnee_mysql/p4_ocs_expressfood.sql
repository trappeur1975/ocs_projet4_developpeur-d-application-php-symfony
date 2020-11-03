-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  sam. 31 oct. 2020 à 12:22
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.4.3-dev

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `p4_ocs_expressfood`
--

-- --------------------------------------------------------

--
-- Structure de la table `chef`
--

DROP TABLE IF EXISTS `chef`;
CREATE TABLE IF NOT EXISTS `chef` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade` varchar(50) NOT NULL,
  `utilisateur_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cleEtranger_chef-utilisateur` (`utilisateur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `chef`
--

INSERT INTO `chef` (`id`, `grade`, `utilisateur_id`) VALUES
(1, 'une étoile', 1),
(2, 'une étoile', 2),
(3, 'deux étoile', 3),
(4, 'trois étoile', 4),
(5, 'quatre étoile', 5),
(6, 'une étoile', 7),
(7, 'une étoile', 9),
(8, 'deux étoile', 11);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qualite` varchar(50) NOT NULL,
  `utilisateur_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cleEtranger_client-utilisateur` (`utilisateur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `qualite`, `utilisateur_id`) VALUES
(1, 'bronze', 11),
(2, 'silver', 12),
(3, 'silver', 13),
(4, 'gold', 14),
(5, 'silver', 15),
(6, 'silver', 2),
(7, 'bronze', 8);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `livraison_id` int(11) NOT NULL,
  `statutDeLaCommande_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `livreur_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cleEtranger_commande-livraison` (`livraison_id`),
  KEY `cleEtranger_commande-statutDeLaCommande` (`statutDeLaCommande_id`),
  KEY `cleEtranger_commande-client` (`client_id`),
  KEY `cleEtranger_commande-livreur` (`livreur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `date`, `livraison_id`, `statutDeLaCommande_id`, `client_id`, `livreur_id`) VALUES
(1, '2020-10-24', 1, 4, 1, 1),
(2, '2020-10-24', 2, 2, 2, 3),
(3, '2020-10-24', 3, 1, 3, NULL),
(4, '2020-10-24', 4, 4, 4, 2),
(5, '2020-10-24', 5, 3, 5, 2),
(6, '2020-10-24', 6, 1, 2, NULL),
(7, '2020-10-04', 7, 5, 5, NULL),
(8, '2020-10-04', 8, 4, 4, 2),
(9, '2020-10-04', 9, 2, 3, 4),
(10, '2020-09-24', 10, 3, 2, 6),
(11, '2020-09-24', 11, 4, 5, 5),
(12, '2020-09-24', 12, 4, 1, 3),
(13, '2020-09-24', 2, 1, 4, 7),
(14, '2020-09-14', 12, 2, 2, 4),
(15, '2020-09-14', 1, 4, 5, 8),
(16, '2020-09-14', 10, 4, 4, 2),
(17, '2020-10-14', 3, 4, 4, 4),
(18, '2020-10-14', 9, 4, 2, 8);

-- --------------------------------------------------------

--
-- Structure de la table `geolocalisation`
--

DROP TABLE IF EXISTS `geolocalisation`;
CREATE TABLE IF NOT EXISTS `geolocalisation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `longitude` int(11) NOT NULL,
  `latitude` int(11) NOT NULL,
  `livreur_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cleEtranger_geolocalisation-livreur` (`livreur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `geolocalisation`
--

INSERT INTO `geolocalisation` (`id`, `date`, `longitude`, `latitude`, `livreur_id`) VALUES
(1, '2020-10-24 20:00:00', 50, 60, 1),
(2, '2020-10-24 20:11:00', 55, 63, 1),
(3, '2020-10-24 20:12:00', 60, 70, 1),
(4, '2020-10-24 20:15:00', 80, 120, 1),
(5, '2020-10-24 20:17:00', 82, 63, 1),
(6, '2020-10-31 20:20:00', 90, 35, 1),
(7, '2020-10-24 12:10:00', 10, 20, 3),
(8, '2020-10-24 12:20:00', 12, 30, 3),
(9, '2020-10-24 12:25:00', 30, 22, 3),
(10, '2020-10-24 13:08:00', 66, 44, 2),
(11, '2020-10-24 13:10:00', 55, 11, 2),
(12, '2020-10-24 13:20:00', 88, 99, 2),
(13, '2020-10-24 19:01:00', 56, 99, 2),
(14, '2020-10-24 19:10:00', 33, 77, 2),
(15, '2020-10-04 12:00:00', 88, 6, 2),
(16, '2020-10-04 12:13:00', 32, 61, 2),
(17, '2020-10-04 21:00:00', 94, 62, 4),
(18, '2020-10-04 21:15:00', 51, 84, 4),
(19, '2020-10-04 21:17:00', 95, 41, 4),
(20, '2020-09-24 13:08:00', 62, 33, 6),
(21, '2020-09-24 13:00:00', 2, 67, 5),
(22, '2020-09-24 11:53:00', 93, 76, 3),
(23, '2020-09-24 13:24:00', 52, 96, 7),
(24, '2020-09-14 19:20:00', 39, 28, 4),
(25, '2020-09-14 22:00:00', 51, 59, 8),
(26, '2020-09-14 12:40:00', 48, 43, 2),
(27, '2020-10-14 19:42:00', 67, 62, 4),
(28, '2020-10-14 13:41:00', 34, 39, 8);

-- --------------------------------------------------------

--
-- Structure de la table `ligneplatcommande`
--

DROP TABLE IF EXISTS `ligneplatcommande`;
CREATE TABLE IF NOT EXISTS `ligneplatcommande` (
  `commande_id` int(11) NOT NULL,
  `plat_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  PRIMARY KEY (`commande_id`,`plat_id`),
  KEY `cleEtranger_lignePlatCommande-plat` (`plat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ligneplatcommande`
--

INSERT INTO `ligneplatcommande` (`commande_id`, `plat_id`, `quantite`) VALUES
(1, 1, 2),
(1, 2, 2),
(2, 1, 1),
(2, 2, 1),
(2, 3, 3),
(2, 4, 3),
(3, 1, 1),
(3, 2, 1),
(4, 3, 5),
(4, 4, 5),
(5, 1, 3),
(5, 2, 3),
(6, 1, 8),
(6, 2, 8),
(7, 5, 2),
(7, 6, 2),
(8, 5, 3),
(8, 6, 3),
(9, 7, 1),
(9, 8, 1),
(10, 9, 5),
(10, 10, 5),
(11, 11, 2),
(11, 12, 2),
(12, 11, 4),
(12, 12, 4),
(13, 11, 1),
(13, 12, 1),
(14, 13, 1),
(14, 14, 1),
(15, 15, 2),
(15, 16, 2),
(16, 15, 3),
(16, 16, 3),
(17, 17, 1),
(17, 18, 1),
(18, 19, 1),
(18, 20, 1);

-- --------------------------------------------------------

--
-- Structure de la table `ligneplatmenudujour`
--

DROP TABLE IF EXISTS `ligneplatmenudujour`;
CREATE TABLE IF NOT EXISTS `ligneplatmenudujour` (
  `menuDuJour_id` int(11) NOT NULL,
  `plat_id` int(11) NOT NULL,
  `quantiteProduite` int(11) NOT NULL,
  `stockActuel` int(11) NOT NULL,
  PRIMARY KEY (`menuDuJour_id`,`plat_id`),
  KEY `cleEtrangerLignePlatMenuDuJour-plat` (`plat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ligneplatmenudujour`
--

INSERT INTO `ligneplatmenudujour` (`menuDuJour_id`, `plat_id`, `quantiteProduite`, `stockActuel`) VALUES
(1, 1, 300, 50),
(1, 2, 350, 90),
(1, 3, 400, 100),
(1, 4, 600, 10),
(2, 5, 150, 0),
(2, 6, 320, 45),
(2, 7, 280, 120),
(2, 8, 233, 13),
(3, 9, 189, 22),
(3, 10, 500, 153),
(3, 11, 287, 68),
(3, 12, 239, 61),
(4, 13, 134, 63),
(4, 14, 294, 146),
(4, 15, 372, 25),
(4, 16, 265, 87),
(5, 17, 266, 111),
(5, 18, 237, 158),
(5, 19, 246, 72),
(5, 20, 229, 8);

-- --------------------------------------------------------

--
-- Structure de la table `livraison`
--

DROP TABLE IF EXISTS `livraison`;
CREATE TABLE IF NOT EXISTS `livraison` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adresse` text NOT NULL,
  `codeClientLivraison` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livraison`
--

INSERT INTO `livraison` (`id`, `adresse`, `codeClientLivraison`) VALUES
(1, '22 allée des lilas\r\n97450 saint pierre', 'codeClientLivraison1'),
(2, '45 rue des marins\r\n97460 saint gilles', 'codeClientLivraison2'),
(3, '85 rue des voiliers\r\n97489 saint joseph', 'codeClientLivraison3'),
(4, '10 rue des goelands\r\n97432 saint denis', 'codeClientLivraison4'),
(5, '85 rue des voiliers\r\n97489 saint joseph', 'codeClientLivraison5'),
(6, '56 rue des tulipes\r\n97410 sainte marie', 'codeClientLivraison6'),
(7, '85 rue des voiliers\r\n97489 saint joseph', 'codeClientLivraison7'),
(8, '23 rue des gendarmes\r\n97480 saint tropez', 'codeClientLivraison8'),
(9, '11 rue des aviateurs\r\n97470 saint benoit', 'codeClientLivraison9'),
(10, '33 rue des alberts\r\n97477 saint martin', 'codeClientLivraison10'),
(11, '99 rue des clovis\r\n97463 petite ile', 'codeClientLivraison11'),
(12, '44 rues des arc en ciel\r\n97483 possession', 'codeClientLivraison12');

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

DROP TABLE IF EXISTS `livreur`;
CREATE TABLE IF NOT EXISTS `livreur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statut` varchar(20) NOT NULL,
  `utilisateur_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cleEtranger_livreur-utilisateur` (`utilisateur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livreur`
--

INSERT INTO `livreur` (`id`, `statut`, `utilisateur_id`) VALUES
(1, 'connecte', 6),
(2, 'connecte', 7),
(3, 'en livraison', 8),
(4, 'en livraison', 9),
(5, 'en livraison', 10),
(6, 'non connecte', 2),
(7, 'non connecte', 17),
(8, 'non connecte', 18),
(9, 'connecte', 4),
(10, 'non connecte', 11),
(11, 'non connecte', 13);

-- --------------------------------------------------------

--
-- Structure de la table `menudujour`
--

DROP TABLE IF EXISTS `menudujour`;
CREATE TABLE IF NOT EXISTS `menudujour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `nom` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `menudujour`
--

INSERT INTO `menudujour` (`id`, `date`, `nom`) VALUES
(1, '2020-10-24', 'menu suprise'),
(2, '2020-10-04', 'menu wonderfull'),
(3, '2020-09-24', 'menu saveur de folie'),
(4, '2020-09-14', 'menu energyze'),
(5, '2020-10-14', 'menu halloween');

-- --------------------------------------------------------

--
-- Structure de la table `photo`
--

DROP TABLE IF EXISTS `photo`;
CREATE TABLE IF NOT EXISTS `photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `descriptif` text NOT NULL,
  `stocker` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `photo`
--

INSERT INTO `photo` (`id`, `nom`, `descriptif`, `stocker`) VALUES
(1, 'photo_1', 'photo prise au concours des 3 chefs', 'image/photo_1.jpg'),
(2, 'photo_2', 'photo prise au restaurant le petit suisse', 'image/photo_2.jpg'),
(3, 'photo_3', 'photo en noir et blanc de lisa del', 'image/photo_3.jpg'),
(4, 'photo_4', 'photo tout en couleur prise dans le restaurant etoilé le grand chef', 'image/photo_4.jpg'),
(5, 'photo_5', 'photo qui a inspirer par la suite legrand chef paul bocuse', 'image/photo_5.jpg'),
(6, 'photo_6', 'photo prise par simon duret', 'image/photo_6.jpg'),
(7, 'photo_7', 'photo macro prise en contre vue', 'image/photo_7.jpg'),
(8, 'photo_8', 'photo du chef d\'oeuvre de chef albert fritz', 'image/photo_8.jpg'),
(9, 'photo_9', 'photo realiser dans l\'hotel restaurant le crillon', 'image/photo_9.jpg'),
(10, 'photo_10', 'photo prise en presence du president les roi des cuistots', 'image/photo_10.jpg'),
(11, 'photo_11', 'photo qui a gagner le grand prix du mois de la photo categorie culinaire', 'image/photo_11.jpg'),
(12, 'photo_12', 'photo qui a eu la 3éme place au mondial de la photo', 'image/photo_12.jpg'),
(13, 'photo_13', 'photo en première page de cuistot magasine', 'image/photo_13.jpg'),
(14, 'photo_14', 'photo de la collection personnel de christine millie', 'image/photo_14.jpg'),
(15, 'photo_15', 'photo pris a l auberge les 5 fourchettes', 'image/photo_15.jpg'),
(16, 'photo_16', 'photo de greg lessieur', 'image/photo_16.jpg'),
(17, 'photo_17', 'photo de balma de victor', 'image/photo_17.jpg'),
(18, 'photo_18', 'photo realisé au studio alban', 'image/photo_18.jpg'),
(19, 'photo_19', 'photo issu de l illustration les grands chef', 'image/photo_19.jpg'),
(20, 'photo_20', 'photo de simon bart', 'image/photo_20.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `plat`
--

DROP TABLE IF EXISTS `plat`;
CREATE TABLE IF NOT EXISTS `plat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `desactiver` date DEFAULT NULL,
  `typeDeRepas_id` int(11) NOT NULL,
  `photo_id` int(11) NOT NULL,
  `tarifPlat_id` int(11) NOT NULL,
  `chef_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cleEtranger_plat-typeDeRepas` (`typeDeRepas_id`),
  KEY `cleEtranger_plat-photo` (`photo_id`),
  KEY `cleEtranger_plat-tarifPlat` (`tarifPlat_id`),
  KEY `cleEtranger_plat-chef` (`chef_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `plat`
--

INSERT INTO `plat` (`id`, `nom`, `description`, `desactiver`, `typeDeRepas_id`, `photo_id`, `tarifPlat_id`, `chef_id`) VALUES
(1, 'banana split', 'pour les amoureux du chocolat', NULL, 2, 1, 1, 1),
(2, 'sanglier d\'afrique', 'pour les pationnés d\'afrique et de nouveauté', NULL, 1, 2, 2, 1),
(3, 'montagne de glace', 'un dessert rafraichissant', NULL, 2, 3, 3, 3),
(4, 'poisson d\'asie', 'un poisson au mille et une saveur', NULL, 1, 4, 4, 2),
(5, 'tarte tatin', 'un classique que l on adore', NULL, 2, 5, 5, 3),
(6, 'peollet paysan', 'un plat remplit de légume et de bonne humeur', NULL, 1, 6, 6, 4),
(7, 'tarte au citron', 'juste ce qu\'il faut pour aciduler votre journée', NULL, 2, 7, 7, 2),
(8, 'volaille aigre douce', 'un plat plein de rondeur et de saveur qui ravira vos papilles', NULL, 1, 8, 8, 2),
(9, 'salade de fruit', 'un dessert nature plain de vitamine et de fraicheur', NULL, 2, 9, 9, 1),
(10, 'merou de la reunion', 'un plat qui sent bon les iles et le petit punch', NULL, 1, 10, 10, 5),
(11, 'tarte au fraise', 'un classique qui fait toujours plaisir', NULL, 2, 11, 11, 2),
(12, 'faisan de l\'ardéche', 'un plat bien de chez nous cuisiné avec pation et amoure rien que pour vous', NULL, 1, 12, 12, 2),
(13, 'fontaine au chocolat', 'du chocolat encore et encore', NULL, 2, 13, 13, 1),
(14, 'pizza aux olives', 'un plat typique de l\'italie, mamamilla', NULL, 1, 14, 14, 2),
(15, 'poire belena', 'une poire tout en rondeur pour votre plus grand plaisir', NULL, 2, 15, 15, 2),
(16, 'truite au citron', 'une truite d\'une qualité inégalé pecher le jour même', NULL, 1, 16, 16, 3),
(17, 'tarte au poire', 'une delicieuse tarte fondante a souhait', '2020-10-22', 2, 9, 17, 1),
(18, 'mouton au vin', 'plat tendre et savoureux un vrai délice', NULL, 1, 18, 18, 5),
(19, 'tarte a la banane', 'succulent et delicieux a consommer sans moderation', '2020-10-22', 2, 19, 19, 1),
(20, 'requin citron', 'manger le avant qu il ne vous mange', '2020-10-21', 1, 20, 20, 1);

-- --------------------------------------------------------

--
-- Structure de la table `statutdelacommande`
--

DROP TABLE IF EXISTS `statutdelacommande`;
CREATE TABLE IF NOT EXISTS `statutdelacommande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statut` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `statutdelacommande`
--

INSERT INTO `statutdelacommande` (`id`, `statut`) VALUES
(1, 'initier'),
(2, 'en livraison'),
(3, 'livrer'),
(4, 'payer'),
(5, 'annuler');

-- --------------------------------------------------------

--
-- Structure de la table `stockplatlivreur`
--

DROP TABLE IF EXISTS `stockplatlivreur`;
CREATE TABLE IF NOT EXISTS `stockplatlivreur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantiteDeDepart` int(11) NOT NULL,
  `quantiteActuel` int(11) NOT NULL,
  `livreur_id` int(11) NOT NULL,
  `plat_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cleEtranger_stockPlatLivreur-livreur` (`livreur_id`),
  KEY `cleEtranger_stockPlatLivreur-plat` (`plat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `stockplatlivreur`
--

INSERT INTO `stockplatlivreur` (`id`, `quantiteDeDepart`, `quantiteActuel`, `livreur_id`, `plat_id`) VALUES
(1, 30, 10, 1, 1),
(2, 20, 2, 1, 2),
(3, 15, 6, 1, 3),
(4, 20, 7, 1, 4),
(5, 10, 6, 2, 1),
(6, 13, 9, 2, 2),
(7, 11, 3, 2, 3),
(8, 15, 8, 2, 4),
(9, 9, 0, 3, 5),
(10, 20, 10, 3, 6),
(11, 23, 4, 3, 7),
(12, 17, 8, 3, 8),
(13, 17, 17, 4, 9),
(14, 14, 13, 4, 10),
(15, 18, 3, 4, 11),
(16, 12, 1, 1, 5),
(17, 23, 5, 1, 6),
(18, 24, 4, 1, 7),
(19, 9, 3, 1, 8),
(20, 7, 0, 4, 12),
(21, 24, 20, 5, 13),
(22, 8, 2, 5, 14),
(23, 14, 7, 5, 15),
(24, 16, 8, 5, 16),
(25, 12, 7, 6, 17),
(26, 7, 3, 6, 18),
(27, 15, 4, 6, 19),
(28, 13, 9, 6, 16),
(29, 15, 6, 4, 13),
(30, 20, 10, 4, 14),
(31, 18, 3, 4, 15),
(32, 23, 9, 4, 16);

-- --------------------------------------------------------

--
-- Structure de la table `tarifplat`
--

DROP TABLE IF EXISTS `tarifplat`;
CREATE TABLE IF NOT EXISTS `tarifplat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `prix` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tarifplat`
--

INSERT INTO `tarifplat` (`id`, `date`, `prix`) VALUES
(1, '2020-10-24', 5),
(2, '2020-10-24', 10),
(3, '2020-10-24', 6),
(4, '2020-10-24', 13),
(5, '2020-10-04', 4),
(6, '2020-10-04', 15),
(7, '2020-10-04', 3),
(8, '2020-10-04', 17),
(9, '2020-09-24', 5),
(10, '2020-09-24', 12),
(11, '2020-09-24', 7),
(12, '2020-09-24', 13),
(13, '2020-09-14', 8),
(14, '2020-09-14', 11),
(15, '2020-09-14', 4),
(16, '2020-09-14', 24),
(17, '2020-10-14', 7),
(18, '2020-10-14', 18),
(19, '2020-10-14', 9),
(20, '2020-10-14', 19);

-- --------------------------------------------------------

--
-- Structure de la table `typederepas`
--

DROP TABLE IF EXISTS `typederepas`;
CREATE TABLE IF NOT EXISTS `typederepas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `typederepas`
--

INSERT INTO `typederepas` (`id`, `type`) VALUES
(1, 'plat'),
(2, 'dessert');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prenom` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `adresse` text NOT NULL,
  `telephone` int(11) NOT NULL,
  `identifiant` varchar(20) NOT NULL,
  `login` varchar(20) NOT NULL,
  `desactiver` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `prenom`, `nom`, `adresse`, `telephone`, `identifiant`, `login`, `desactiver`) VALUES
(1, 'marc', 'hoareau', '22 rue des alizé\r\n97450 saint louis', 269356963, 'identifiant1', 'login1', NULL),
(2, 'alizé', 'corneille', '45 rue des bananier\r\n97410 saint pierre', 692457896, 'identifiant2', 'login2', NULL),
(3, 'lucien', 'dometo', '89 rue des palmier\r\n97420 saint denis', 262136479, 'identifiant3', 'login3', NULL),
(4, 'nicolas', 'favera', '6 rue des buse\r\n92470 saint paul', 262893645, 'identifiant4', 'login4', NULL),
(5, 'sophie', 'duplantier', '78 rue des baleines bleus\r\n97456 saint gilles', 692458632, 'identifiant5', 'login5', NULL),
(6, 'carine', 'lemarchand', '36 rue des poissons\r\n97456 hermitage', 262458936, 'identifiant6', 'login6', NULL),
(7, 'christophe', 'barin', '2 rue des zazalé\r\n92436 possession', 262782395, 'identifiant7', 'login7', NULL),
(8, 'astrid', 'barbant', '64 rue des macatia\r\n9784 salazie', 262123652, 'identifiant8', 'login8', NULL),
(9, 'isabelle', 'leduc', '62 rue des avions\r\n9763 cilaos', 692428692, 'identifiant9', 'login9', NULL),
(10, 'remi', 'barbier', '47 rue des bateaux rouges\r\n97468 saint benoit', 262558899, 'identifiant10', 'login 10', NULL),
(11, 'jennifer', 'lukas', '22 rue des etoiles\r\n97461 sainte lucie', 692441135, 'identifiant11', 'login11', NULL),
(12, 'vanessa', 'bellot', '22 rue des albatros\r\n97423 saint joseph', 262336251, 'identifiant12', 'login12', NULL),
(13, 'barbara', 'schmitt', '44 rue des resistants\r\n97488 petite ile', 262316497, 'identifiant13', 'login13', NULL),
(14, 'zora', 'larousse', '43 rue des fibustiers\r\n97412 sainte maxime', 692114477, 'identifiant14', 'login14', NULL),
(15, 'sebastien', 'lemor', '63 rue des alambiques\r\n7452 saint joseph', 262225588, 'identifiant15', 'login15', NULL),
(16, 'isabelle', 'boulay', '66 route des pailles en queue\r\n97421 saint francois', 262119922, 'identifiant16', 'login16', '2020-10-13'),
(17, 'paul', 'lepoulpe', '88 rue des artichaut\r\n97412 saint maxim', 262786645, 'identifiant17', 'login17', '2020-08-21'),
(18, 'sylvie', 'camailleux', '96 rue des manguiers\r\n97433 saint patrick', 692453655, 'identifiant18', 'login18', '2020-10-13');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `chef`
--
ALTER TABLE `chef`
  ADD CONSTRAINT `cleEtranger_chef-utilisateur` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `cleEtranger_client-utilisateur` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `cleEtranger_commande-client` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `cleEtranger_commande-livraison` FOREIGN KEY (`livraison_id`) REFERENCES `livraison` (`id`),
  ADD CONSTRAINT `cleEtranger_commande-livreur` FOREIGN KEY (`livreur_id`) REFERENCES `livreur` (`id`),
  ADD CONSTRAINT `cleEtranger_commande-statutDeLaCommande` FOREIGN KEY (`statutDeLaCommande_id`) REFERENCES `statutdelacommande` (`id`);

--
-- Contraintes pour la table `geolocalisation`
--
ALTER TABLE `geolocalisation`
  ADD CONSTRAINT `cleEtranger_geolocalisation-livreur` FOREIGN KEY (`livreur_id`) REFERENCES `livreur` (`id`);

--
-- Contraintes pour la table `ligneplatcommande`
--
ALTER TABLE `ligneplatcommande`
  ADD CONSTRAINT `cleEtranger_lignePlatCommande-commande` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`),
  ADD CONSTRAINT `cleEtranger_lignePlatCommande-plat` FOREIGN KEY (`plat_id`) REFERENCES `plat` (`id`);

--
-- Contraintes pour la table `ligneplatmenudujour`
--
ALTER TABLE `ligneplatmenudujour`
  ADD CONSTRAINT `cleEtrangerLignePlatMenuDuJour-plat` FOREIGN KEY (`plat_id`) REFERENCES `plat` (`id`),
  ADD CONSTRAINT `cleEtranger_lignePlatMenuDuJour-menuDuJour` FOREIGN KEY (`menuDuJour_id`) REFERENCES `menudujour` (`id`);

--
-- Contraintes pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD CONSTRAINT `cleEtranger_livreur-utilisateur` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `plat`
--
ALTER TABLE `plat`
  ADD CONSTRAINT `cleEtranger_plat-chef` FOREIGN KEY (`chef_id`) REFERENCES `chef` (`id`),
  ADD CONSTRAINT `cleEtranger_plat-photo` FOREIGN KEY (`photo_id`) REFERENCES `photo` (`id`),
  ADD CONSTRAINT `cleEtranger_plat-tarifPlat` FOREIGN KEY (`tarifPlat_id`) REFERENCES `tarifplat` (`id`),
  ADD CONSTRAINT `cleEtranger_plat-typeDeRepas` FOREIGN KEY (`typeDeRepas_id`) REFERENCES `typederepas` (`id`);

--
-- Contraintes pour la table `stockplatlivreur`
--
ALTER TABLE `stockplatlivreur`
  ADD CONSTRAINT `cleEtranger_stockPlatLivreur-livreur` FOREIGN KEY (`livreur_id`) REFERENCES `livreur` (`id`),
  ADD CONSTRAINT `cleEtranger_stockPlatLivreur-plat` FOREIGN KEY (`plat_id`) REFERENCES `plat` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
