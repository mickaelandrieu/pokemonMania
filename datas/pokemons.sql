CREATE TABLE `pokemons` (
    `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
    `name` varchar(120) DEFAULT NULL,
    `picture` varchar(100) DEFAULT NULL,
    `description` text,
    PRIMARY KEY (`id`)
);