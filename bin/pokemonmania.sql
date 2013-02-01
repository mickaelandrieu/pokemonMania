-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Ven 01 Février 2013 à 16:32
-- Version du serveur: 5.5.16-log
-- Version de PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `pokemonmania`
--

-- --------------------------------------------------------

--
-- Structure de la table `pokemons`
--

CREATE TABLE IF NOT EXISTS `pokemons` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) DEFAULT NULL,
  `picture` varchar(100) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `pokemons`
--

INSERT INTO `pokemons` (`id`, `name`, `picture`, `description`) VALUES
(1, 'pikachu', 'http://www.pokemontrash.com/pokedex/images/sprites/025.png', 'Numéro 25 du Pokédex, Pikachu est un Pokémon Souris, aussi appelé Pikachu en Amérique et Pikachuu au Japon. Il est de type Electrique .\r\n\r\nCette fiche va aider les dresseurs à en savoir plus sur Pikachu. Avec le détails de ses attaques, de ses statistiques, de ses capacités et de ses faiblesses, les stratèges pourront determiner si Pikachu vaut le coup qu''on l''intègre à son équipe. Pour les joueurs actuellement dans la quête, la localisation de Pikachu, ses possibilités de reproduction et ses stats Pokéathlon seront d''une grande utilité. Enfin pour les curieux, les descriptions du Pokémon, ses caractéristiques physiques et ses sprites vous permettont de mieux connaitre Pikachu.\r\n'),
(2, 'Carapuce', 'http://www.pokemontrash.com/pokedex/images/sprites/007.png', 'Numéro 7 du Pokédex, Carapuce est un Pokémon Minitortue, aussi appelé Squirtle en Amérique et Zenigame au Japon. Il est de type Eau .\r\n\r\nCette fiche va aider les dresseurs à en savoir plus sur Carapuce. Avec le détails de ses attaques, de ses statistiques, de ses capacités et de ses faiblesses, les stratèges pourront determiner si Carapuce vaut le coup qu''on l''intègre à son équipe. Pour les joueurs actuellement dans la quête, la localisation de Carapuce, ses possibilités de reproduction et ses stats Pokéathlon seront d''une grande utilité. Enfin pour les curieux, les descriptions du Pokémon, ses caractéristiques physiques et ses sprites vous permettont de mieux connaitre Carapuce.'),
(3, 'Salameche', 'http://www.pokemontrash.com/pokedex/images/sprites/004.png', 'Numéro 4 du Pokédex, Salamèche est un Pokémon Lezard, aussi appelé Charmander en Amérique et Hitokage au Japon. Il est de type Feu .\r\n\r\nCette fiche va aider les dresseurs à en savoir plus sur Salamèche. Avec le détails de ses attaques, de ses statistiques, de ses capacités et de ses faiblesses, les stratèges pourront determiner si Salamèche vaut le coup qu''on l''intègre à son équipe. Pour les joueurs actuellement dans la quête, la localisation de Salamèche, ses possibilités de reproduction et ses stats Pokéathlon seront d''une grande utilité. Enfin pour les curieux, les descriptions du Pokémon, ses caractéristiques physiques et ses sprites vous permettont de mieux connaitre Salamèche.\r\n'),
(4, 'Bulbizarre', 'http://www.pokemontrash.com/pokedex/images/sprites/001.png', 'Numéro 1 du Pokédex, Bulbizarre est un Pokémon Graine, aussi appelé Bulbasaur en Amérique et Fushigidane au Japon. Il est de type Plante Poison.\r\n\r\nCette fiche va aider les dresseurs à en savoir plus sur Bulbizarre. Avec le détails de ses attaques, de ses statistiques, de ses capacités et de ses faiblesses, les stratèges pourront determiner si Bulbizarre vaut le coup qu''on l''intègre à son équipe. Pour les joueurs actuellement dans la quête, la localisation de Bulbizarre, ses possibilités de reproduction et ses stats Pokéathlon seront d''une grande utilité. Enfin pour les curieux, les descriptions du Pokémon, ses caractéristiques physiques et ses sprites vous permettont de mieux connaitre Bulbizarre.\r\n');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
