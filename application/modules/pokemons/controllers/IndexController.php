<?php

class Pokemons_IndexController extends Zend_Controller_Action
{

    public function init()
    {
        $this->pokemons = new Pokemons();
    }

    public function indexAction()
    {

        $this->view->pokemons = $this->pokemons->fetchAll();
    }

    public function addAction()
    {
        $form = $this->getForm();
        if($this->getRequest()->isPost())
        {
            $pokemonData = $this->getRequest()->getPost();
            if($form->isValid($pokemonData))
            {
                $formData = $form->getValues();
                $this->Pokemons->insert($formData);
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
            $pokemon = $this->Pokemons->find($id)->current();
            $pokemon->delete();
            $this->_redirect('/pokemons/index');
        }
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


}

