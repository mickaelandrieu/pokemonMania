<?php

class Bootstrap extends Zend_Application_Bootstrap_Bootstrap
{
    public function _initAutoloader()
    {
        $loader = Zend_Loader_Autoloader::getInstance();
        $loader->setFallbackAutoloader(true);
    }

    protected function _initDatabase()
    {
        $adapter = Zend_Db::factory('pdo_mysql', array(
            'host' => 'localhost',
            'username' => 'amplurimedia',
            'password' => 'A1nges6!',
            'dbname' => 'pokemonmania',
            'charset' => 'utf8'
        ));
        Zend_Db_Table_Abstract::setDefaultAdapter($adapter);
    }
}

