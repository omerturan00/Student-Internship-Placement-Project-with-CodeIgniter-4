<?php

namespace App\Controllers;

class StajController extends BaseController
{
    public function __construct()
    {
        $this->data['pageTitle'] = "Anasayfa";
    }
    public function login()
    {
        if ($this->request->getPost()){
            print_r($this->request->getPost());
        }
        $this->data['pageTitle'] = "Giriş Sayfası";

        echo view('login');
    }
}