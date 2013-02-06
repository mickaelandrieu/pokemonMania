<?php

class Pokemons_IndexController extends Zend_Controller_Action
{

    public function init()
    {
        $stream = @fopen(APPLICATION_PATH . '/configs/application.xml', 'a', false);
        if (! $stream) {
            $this::GenererConfig();
        }
        session_start();
        $test = $this->getRequest()->getParam('value');
        var_dump($_COOKIE['config'], $test);
        if(empty($test)) {
          if(empty($_COOKIE["config"])) {
            $this::ConfigIni();
          } else {
            $this::ChangeConfig($_COOKIE["config"]);
          }
        } else {
           $this::ChangeConfig($test);
        }
        if($_COOKIE["config"] != "php") {
          $adapter = Zend_Db::factory($this->config->database->adapter, array(
              'host' => $this->config->database->params->host,
              'username' => $this->config->database->params->username,
              'password' => $this->config->database->params->password,
              'dbname' => $this->config->database->params->dbname,
              'charset' => $this->config->database->params->charset
          ));
        } else {
        $adapter = Zend_Db::factory($this->config->production->database->adapter, array(
              'host' => $this->config->production->database->params->host,
              'username' => $this->config->production->database->params->username,
              'password' => $this->config->production->database->params->password,
              'dbname' => $this->config->production->database->params->dbname,
              'charset' => $this->config->production->database->params->charset
          ));        
        }
        Zend_Db_Table_Abstract::setDefaultAdapter($adapter);                                                        
        $this->pokemons = new Pokemons(); 
    }

    public function indexAction()
    {   
        $this->debug = $this::GetDebug();
        if(!empty($_COOKIE)) {
          if($_COOKIE['config'] == 'yaml') {
            $this::AddFireFoxLog($this->debug);
          }
          if($_COOKIE['config'] == 'xml') {
            $this::AddDBLog($this->debug);
          }
        }
        $this::AddWriteLog($this->debug);
        $this->view->pokemons = $this->pokemons->fetchAll();
    }

    public function addAction()
    {
        $this->debug = $this::GetDebug();
        $form = $this->getForm();
        if($this->getRequest()->isPost())
        {
            $pokemonData = $this->getRequest()->getPost();
            if($form->isValid($pokemonData))
            {
                $formData = $form->getValues();
                $this->pokemons->insert($formData);
            }
            else
            {
                $form->populate($pokemonData);
            }
        }
        $this->view->form = $form;
    }

    public function showAction()
    {
        $this->debug = $this::GetDebug();
        $id = $this->getRequest()->getParam('id');
        if ($id > 0)
        {
            $pokemon = $this->pokemons->find($id)->current();
            $this->view->pokemon = $pokemon;
        }
        else $this->view->message = 'This Pokemon was not discovered yet !';
    }
    
    public function editAction()
    {
        $this->debug = $this::GetDebug();
        $form = $this->getForm();
        $id = $this->getRequest()->getParam('id');
        if ($id > 0) {
            if ($this->getRequest()->isPost())
            {
                $pokemonData = $this->getRequest()->getPost();
                if ($form->isValid($pokemonData))
                {
                    $formData = $form->getValues();
                    $this->pokemons->update($formData, "id = $id");
                    $this->_redirect('/pokemons/index');
                }
                else $form->populate($pokemonData);
            }
            else {
                $pokemon = $this->pokemons->find($id)->current();
                $form->populate($pokemon->toArray());
                $hidden = new Zend_Form_Element_Hidden('id');
                $hidden->setValue($id);
                $form->addElement($hidden);
            }
        }
        else $this->view->message = 'You tryin\' to edit an undiscovered Pokemon!' ;
        $this->view->form = $form;
    }

    public function delAction()
    {
        $id = $this->getRequest()->getParam('id');
        if ($id > 0)
        {
            $pokemon = $this->pokemons->find($id)->current();
            $pokemon->delete();
            $this->_redirect('/pokemons/index');
        }
    }
    
    public function configAction()
    {
       $this->_redirect('/pokemons/index');
    }

    public function getForm()
    {
        $name = new Zend_Form_Element_Text('name');
        $name->setLabel('Nom')
            ->setDescription('Insérez le nom du Pokemon ici')
            ->setRequired(true)
            ->addValidator('StringLength', false, array(6, 20))
            ->addFilters(array('StringTrim'));

        $picture = new Zend_Form_Element_Text('picture');
        $picture->setLabel('Url de l\'image')
            ->setDescription('Insérez l\'url d\'accès à l\'image du Pokemon')
            ->setRequired(true);

        $description = new Zend_Form_Element_Textarea('description');
        $description->setLabel('Description')
            ->setRequired(false)
            ->setDescription('Description du pokemon');

        $submit = new Zend_Form_Element_Submit('submit');
        $submit->setLabel('Valider le formulaire')
            ->setIgnore(true);

        $form = new Zend_Form();
        $form->addElements(array($name, $picture, $description, $submit));
        return $form; // return the form
    }

    public function pdfAction()
    {
        $id = $this->getRequest()->getParam('id');
        if ($id) {
            $pdf= $this->getPokemonPdf($id);
        }
        else{
            $pdf= $this->getPokemonsPdf();
        }
        $this->getResponse()->setHeader('Content-type', 'application/pdf', true);
        $this->getResponse()->setBody($pdf->render());
    }

    public function getPokemonsPdf()
    {
        $this->pokemons = $this->pokemons->fetchAll();

        // Création d'un fichier pdf
        $pdf = new Zend_Pdf();
        foreach ($this->pokemons as $pokemon) {
            $this::pokemonPdfViewAction($pdf, $pokemon);
        }
        return $pdf;
    }

    //Permet de générer un pdf d'un seul pokémon
    public function getPokemonPdf($id)
    {
        $pokemon = $this->pokemons->find($id)->current();
        $pdf = new Zend_Pdf();
        return $this::pokemonPdfViewAction($pdf, $pokemon);
    }

    public function mailAction()
    {
        $config = array('auth' => 'login',
                'username' => 'pokezend@gmail.com',
                'password' => 'pokezend123');
 
        $transport = new Zend_Mail_Transport_Smtp('smtp.gmail.com', $config);
         
        $mail = new Zend_Mail();
        $mail->setBodyText('Voici ton pokedex !!!!! ');
        $mail->setFrom('pokezend@gmail.com', 'Docteur chen');
        $mail->addTo('andrieu.travail@gmail.com', 'jeremy');
        $mail->setSubject('Voici ton pokedex !!!!! ');

        //Selection pokemon
        $id = $this->getRequest()->getParam('id');
        if ($id) {
            $pdf= $this->getPokemonPdf($id);
        }
        else{
            $pdf= $this->getPokemonsPdf();
        }

        $at = $mail->createAttachment($pdf->render());
        $at->filename = "Pokedex.pdf";         
        $mail->send($transport);

        $this->_redirect('/pokemons/index');
    }

    private function pokemonPdfViewAction($pdf, $pokemon) {
        // Création d'un fichier pdf
        $font = Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA);
        $pdf->pages[] = ($page = $pdf->newPage(Zend_Pdf_Page::SIZE_A4));

        // Ajout infos sur le pokemon
        $page->setFont($font, 36);
        $page->drawText($pokemon->name, 72, 720, 'UTF-8');
        $page->setFont($font, 12);

        $filename = basename($pokemon->picture);
        $extension=strrchr($filename,'.');
        $tmpName = tempnam(sys_get_temp_dir(), 'img');
        copy($pokemon->picture, $tmpName);
        rename ($tmpName, str_replace( '.tmp', $extension, $tmpName));
        $tmpName = str_replace( '.tmp', $extension, $tmpName);

        $image = Zend_Pdf_Image::imageWithPath($tmpName);

        $page->drawImage($image,400,700, 500, 800);
        $descriptionLines = wordwrap($pokemon->description, 90, "--*--");
        $descriptionLines = explode("--*--", $descriptionLines);
        $y = 660;
        foreach ($descriptionLines as $descriptionLine) {
            $page->drawText($descriptionLine, 72, $y, 'UTF-8');
            $y=$y-11;
        }
        unlink($tmpName);
        return $pdf;
    }
    
    private function GetDebug() {
        return Zend_Debug::dump($this->getRequest()->getParams());
    }
    
    private function AddWriteLog($log) {   
        $stream = @fopen('../application/logs/debug.log', 'a', false);
        if (! $stream) {
            throw new Exception('Failed to open stream');
        }
        
        $writer = new Zend_Log_Writer_Stream($stream);
        $logger = new Zend_Log($writer);
         
        $logger->debug($log);    
    }
    
    private function AddDBLog($log) {
        $params = array ($this->config->database->params->host,
                         $this->config->database->params->username,
                         $this->config->database->params->password,
                         $this->config->database->params->dbname);
        $db = Zend_Db::factory($this->config->database->params->adapter, $params);
         
        $columnMapping = array('lvl' => 'DEBUG', 'msg' => $log);
        $writer = new Zend_Log_Writer_Db($db, 'zf_special_log', $columnMapping);
         
        $logger = new Zend_Log($writer);
         
        $logger->debug($log); 
    }

    private function AddFireFoxLog($log) {
        // Place this in your bootstrap file before dispatching your front controller
        $writer = new Zend_Log_Writer_Firebug();
        $logger = new Zend_Log($writer);
         
        // Use this in your model, view and controller files
        $logger->log($log, Zend_Log::DEBUG); 
    }
    
    private function GenererConfig() {
        $this->config = new Zend_Config_Ini(APPLICATION_PATH . '/configs/application.ini');
        
        $writerPhp = new Zend_Config_Writer_Array();
        $writerJson = new Zend_Config_Writer_Json();
        $writerYaml = new Zend_Config_Writer_Yaml();
        $writerXml = new Zend_Config_Writer_Xml();
         
        $writerXml->setConfig($this->config)
        ->setFilename(APPLICATION_PATH . '/configs/application.xml')
        ->write();
        $writerPhp->setConfig($this->config)
        ->setFilename(APPLICATION_PATH . '/configs/application.php')
        ->write();
        $writerJson->setConfig($this->config)
        ->setFilename(APPLICATION_PATH . '/configs/application.json')
        ->write();
        $writerYaml->setConfig($this->config)
        ->setFilename(APPLICATION_PATH . '/configs/application.Yaml')
        ->write();     
    }  
    
    private function ChangeConfig($value) {
        switch($value) {
          case "php" :
            $config = "php";
            $this::ConfigPhp();
            break;            
          case "xml" :
            $config = "xml";
            $this::ConfigXml();
            break; 
          case "json" :
            $config = "json";
            $this::ConfigJson();
            break;   
          case "yaml" :
            $config = "yaml";
            $this::ConfigYaml();
            break; 
          case "ini" :
            $config = "ini";
            $this::ConfigIni();
            break;                    
        }    
        setcookie("config", $value, time()+3600);
    }
    
    private function ConfigPhp() {
        $this->config = new Zend_Config(require APPLICATION_PATH . '/configs/application.php');
    }
    
    private function ConfigIni() {
        $this->config = new Zend_Config_Ini(APPLICATION_PATH . '/configs/application.ini', 'production');
    }
    
    private function ConfigXml() {
      $this->config = new Zend_Config_Xml(APPLICATION_PATH . '/configs/application.xml', 'production');
    }
    
    private function ConfigJson() {
      $this->config = new Zend_Config_Json(APPLICATION_PATH . '/configs/application.json', 'production');
    }
    
    private function ConfigYaml() {
      $this->config = new Zend_Config_Yaml(APPLICATION_PATH . '/configs/application.yaml', 'production');       
    }      
}