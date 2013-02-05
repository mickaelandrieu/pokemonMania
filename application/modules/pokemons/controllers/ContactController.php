<?php

class Pokemons_ContactController extends Zend_Controller_Action
{
    public function indexAction()
    {
        $form = $this->getForm();
        $request = $this->getRequest();
        $post = $request->getPost();

        if ($request->isPost()) {

            if ($form->isValid($post)) {
                // send mail
                $this->mailAction($post['message'], $post['name'], 'un message vous est parvenu', 'andrieu.travail@gmail.com');
                $this->_redirect('/pokemons/index');
            }
        }

        // give form to view (needed in index.phtml file)
        $this->view->form = $form;
    }

    public function getForm()
    {
        $name = new Zend_Form_Element_Text('name');
        $name->setLabel('Nom')
             ->setDescription('Insérez votre nom')
             ->setRequired(true)
             ->addValidator('StringLength', false, array(6, 20))
             ->addFilters(array('StringTrim'));

        $email = new Zend_Form_Element_Text('email');
        $email->setLabel('Email')
              ->setDescription('Fournissez votre email')
              ->addFilter('StringToLower')
              ->setRequired(true)
              ->addValidator('NotEmpty')
              ->addValidator('EmailAddress');

        $message = new Zend_Form_Element_Textarea('message');
        $message->setLabel('Message')
            ->setRequired(false)
            ->setDescription('Votre Message');

        $submit = new Zend_Form_Element_Submit('submit');
        $submit->setLabel('Valider le formulaire')
            ->setIgnore(true);

        $form = new Zend_Form();
        $form->addElements(array($name, $email, $message, $submit));
        return $form; // return the form
    }

    public function mailAction($body, $from, $subject, $to)
    {
        $config = array('auth' => 'login',
            'username' => 'pokezend@gmail.com',
            'password' => 'pokezend123');

        $transport = new Zend_Mail_Transport_Smtp('smtp.gmail.com', $config);

        $mail = new Zend_Mail();
        $mail->setBodyText($body);
        $mail->setFrom($from);
        $mail->addTo($to);
        $mail->setSubject($subject);

        $mail->send($transport);

        $this->_redirect('/pokemons/index');
    }

}

