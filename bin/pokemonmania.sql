-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Jeu 07 Février 2013 à 16:50
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
  `criticite` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `pokemons`
--

INSERT INTO `pokemons` (`id`, `name`, `picture`, `description`, `criticite`) VALUES
(2, 'Carapuce', 'http://www.pokemontrash.com/pokedex/images/sprites/007.png', 'Numéro 7 du Pokédex, Carapuce est un Pokémon Minitortue, aussi appelé Squirtle en Amérique et Zenigame au Japon. Il est de type Eau . Cette fiche va aider les dresseurs à en savoir plus sur Carapuce. Avec le détails de ses attaques, de ses statistiques, de ses capacités et de ses faiblesses, les stratèges pourront determiner si Carapuce vaut le coup qu''on l''intègre à son équipe. Pour les joueurs actuellement dans la quête, la localisation de Carapuce, ses possibilités de reproduction et ses stats Pokéathlon seront d''une grande utilité. Enfin pour les curieux, les descriptions du Pokémon, ses caractéristiques physiques et ses sprites vous permettont de mieux connaitre Carapuce.\r\n', 0),
(3, 'Salameche', 'http://www.pokemontrash.com/pokedex/images/sprites/004.png', 'Numéro 4 du Pokédex, Salamèche est un Pokémon Lezard, aussi appelé Charmander en Amérique et Hitokage au Japon. Il est de type Feu . Cette fiche va aider les dresseurs à en savoir plus sur Salamèche. Avec le détails de ses attaques, de ses statistiques, de ses capacités et de ses faiblesses, les stratèges pourront determiner si Salamèche vaut le coup qu''on l''intègre à son équipe. Pour les joueurs actuellement dans la quête, la localisation de Salamèche, ses possibilités de reproduction et ses stats Pokéathlon seront d''une grande utilité. Enfin pour les curieux, les descriptions du Pokémon, ses caractéristiques physiques et ses sprites vous permettont de mieux connaitre Salamèche.\r\n', 0),
(4, 'Bulbizarre', 'http://www.pokemontrash.com/pokedex/images/sprites/001.png', 'Numéro 1 du Pokédex, Bulbizarre est un Pokémon Graine, aussi appelé Bulbasaur en Amérique et Fushigidane au Japon. Il est de type Plante Poison. Cette fiche va aider les dresseurs à en savoir plus sur Bulbizarre. Avec le détails de ses attaques, de ses statistiques, de ses capacités et de ses faiblesses, les stratèges pourront determiner si Bulbizarre vaut le coup qu''on l''intègre à son équipe. Pour les joueurs actuellement dans la quête, la localisation de Bulbizarre, ses possibilités de reproduction et ses stats Pokéathlon seront d''une grande utilité. Enfin pour les curieux, les descriptions du Pokémon, ses caractéristiques physiques et ses sprites vous permettont de mieux connaitre Bulbizarre.', 0),
(5, 'Miaouss', 'http://www.pokemontrash.com/pokedex/images/sprites/052.png', 'Il est de type Plante Poison. Cette fiche va aider les dresseurs à en savoir plus sur Bulbizarre. Avec le détails de ses attaques, de ses statistiques, de ses capacités et de ses faiblesses, les stratèges pourront determiner si Bulbizarre vaut le coup qu''on l''intègre à son équipe. Pour les joueurs actuellement dans la quête, la localisation de Bulbizarre, ses possibilités de reproduction et ses stats Pokéathlon seront d''une grande utilité. Enfin pour les curieux, les descriptions du Pokémon, ses caractéristiques physiques et ses sprites vous permettont de mieux connaitre Bulbizarre.\r\n', 5),
(6, 'Rondoudou', 'http://www.pokemontrash.com/pokedex/images/sprites/039.png', 'dsjdsdbchcb cdhcdsbhdsch', 4);

-- --------------------------------------------------------

--
-- Structure de la table `zf_special_log`
--

CREATE TABLE IF NOT EXISTS `zf_special_log` (
  `id` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lvl` varchar(10) NOT NULL,
  `msg` varchar(600) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `zf_special_log`
--

INSERT INTO `zf_special_log` (`id`, `lvl`, `msg`) VALUES
('2013-02-07 15:50:36', '7', '<pre><pre class=''xdebug-var-dump'' dir=''ltr''>\n<b>array</b>\n  ''module'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''pokemons''</font> <i>(length=8)</i>\n  ''controller'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''index''</font> <i>(length=5)</i>\n  ''action'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''index''</font> <i>(length=5)</i>\n</pre></pre>'),
('2013-02-07 15:51:58', '7', '<pre><pre class=''xdebug-var-dump'' dir=''ltr''>\n<b>array</b>\n  ''module'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''pokemons''</font> <i>(length=8)</i>\n  ''controller'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''index''</font> <i>(length=5)</i>\n  ''action'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''index''</font> <i>(length=5)</i>\n</pre></pre>'),
('2013-02-07 16:11:59', '7', '<pre><pre class=''xdebug-var-dump'' dir=''ltr''>\n<b>array</b>\n  ''module'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''pokemons''</font> <i>(length=8)</i>\n  ''controller'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''index''</font> <i>(length=5)</i>\n  ''action'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''index''</font> <i>(length=5)</i>\n</pre></pre>'),
('2013-02-07 16:13:47', '7', '<pre><pre class=''xdebug-var-dump'' dir=''ltr''>\n<b>array</b>\n  ''module'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''pokemons''</font> <i>(length=8)</i>\n  ''controller'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''index''</font> <i>(length=5)</i>\n  ''action'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''index''</font> <i>(length=5)</i>\n</pre></pre>'),
('2013-02-07 16:13:53', '7', '<pre><pre class=''xdebug-var-dump'' dir=''ltr''>\n<b>array</b>\n  ''module'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''pokemons''</font> <i>(length=8)</i>\n  ''controller'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''index''</font> <i>(length=5)</i>\n  ''action'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''index''</font> <i>(length=5)</i>\n</pre></pre>'),
('2013-02-07 16:14:03', '7', '<pre><pre class=''xdebug-var-dump'' dir=''ltr''>\n<b>array</b>\n  ''module'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''pokemons''</font> <i>(length=8)</i>\n  ''controller'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''index''</font> <i>(length=5)</i>\n  ''action'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''index''</font> <i>(length=5)</i>\n</pre></pre>'),
('2013-02-07 16:14:16', '7', '<pre><pre class=''xdebug-var-dump'' dir=''ltr''>\n<b>array</b>\n  ''module'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''pokemons''</font> <i>(length=8)</i>\n  ''controller'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''index''</font> <i>(length=5)</i>\n  ''action'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''index''</font> <i>(length=5)</i>\n</pre></pre>'),
('2013-02-07 16:31:48', '7', '<pre><pre class=''xdebug-var-dump'' dir=''ltr''>\n<b>array</b>\n  ''module'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''pokemons''</font> <i>(length=8)</i>\n  ''controller'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''index''</font> <i>(length=5)</i>\n  ''action'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''index''</font> <i>(length=5)</i>\n</pre></pre>'),
('2013-02-07 16:31:54', '7', '<pre><pre class=''xdebug-var-dump'' dir=''ltr''>\n<b>array</b>\n  ''module'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''pokemons''</font> <i>(length=8)</i>\n  ''controller'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''index''</font> <i>(length=5)</i>\n  ''action'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''index''</font> <i>(length=5)</i>\n</pre></pre>'),
('2013-02-07 16:32:42', '7', '<pre><pre class=''xdebug-var-dump'' dir=''ltr''>\n<b>array</b>\n  ''module'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''pokemons''</font> <i>(length=8)</i>\n  ''controller'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''index''</font> <i>(length=5)</i>\n  ''action'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''index''</font> <i>(length=5)</i>\n</pre></pre>'),
('2013-02-07 16:33:16', '7', '<pre><pre class=''xdebug-var-dump'' dir=''ltr''>\n<b>array</b>\n  ''module'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''pokemons''</font> <i>(length=8)</i>\n  ''controller'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''index''</font> <i>(length=5)</i>\n  ''action'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''index''</font> <i>(length=5)</i>\n</pre></pre>'),
('2013-02-07 16:33:36', '7', '<pre><pre class=''xdebug-var-dump'' dir=''ltr''>\n<b>array</b>\n  ''module'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''pokemons''</font> <i>(length=8)</i>\n  ''controller'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''index''</font> <i>(length=5)</i>\n  ''action'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''index''</font> <i>(length=5)</i>\n</pre></pre>'),
('2013-02-07 16:33:44', '7', '<pre><pre class=''xdebug-var-dump'' dir=''ltr''>\n<b>array</b>\n  ''module'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''pokemons''</font> <i>(length=8)</i>\n  ''controller'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''index''</font> <i>(length=5)</i>\n  ''action'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''index''</font> <i>(length=5)</i>\n</pre></pre>'),
('2013-02-07 16:36:26', '7', '<pre><pre class=''xdebug-var-dump'' dir=''ltr''>\n<b>array</b>\n  ''module'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''pokemons''</font> <i>(length=8)</i>\n  ''controller'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''index''</font> <i>(length=5)</i>\n  ''action'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''index''</font> <i>(length=5)</i>\n</pre></pre>'),
('2013-02-07 16:37:39', '7', '<pre><pre class=''xdebug-var-dump'' dir=''ltr''>\n<b>array</b>\n  ''module'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''pokemons''</font> <i>(length=8)</i>\n  ''controller'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''index''</font> <i>(length=5)</i>\n  ''action'' <font color=''#888a85''>=&gt;</font> <small>string</small> <font color=''#cc0000''>''index''</font> <i>(length=5)</i>\n</pre></pre>');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
