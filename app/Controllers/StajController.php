<?php

namespace App\Controllers;

use App\Models\StajModel;

class StajController extends BaseController
{
    public function __construct()
    {
        $this->model = new StajModel();
        helper(['Tool_helper']);
        $this->Id = session()->get('Id');
        $this->data['user'] = $this->model->c_one($this->Id);
        $this->data['grup'] = $this->model->getGrupId($this->data['user']->Grup_Id);
        $this->data['pageTitle'] = "Anasayfa";
        $this->data['modulAuthority'] = $this->model->userAuthorityQuery($this->data['grup']->Id, 1);
        $this->data['logAuthority'] = $this->model->userAuthorityQuery($this->data['grup']->Id, 2);
    }
    public function login()
    {
        if ($this->request->getPost()){
            $userName = $this->request->getPost('userName');
            $userPassword = md5(sha1($this->request->getPost('userPassword')));
            $query = $this->model->login($userName, $userPassword);
            if($query){
                session()->set(['Id' => $query->Id]);

                $logAdd = $this->model->logAdd($this->Id, 0, 'Kullanıcı giriş yaptı.');
                return redirect()->to(base_url());
            }else{
                sfd('danger', 'Kullanıcı adı veya şifre hatalı.');
            }
        }
        $this->data['pageTitle'] = "Giriş Sayfası";

        echo view('login');
    }
    public function logout()
    {
        $logAdd = $this->model->logAdd($this->Id, 0, 'Kullanıcı çıkış yaptı.');
        session()->destroy();
        return redirect()->to(base_url());
    }
    public function index()
    {
        echo view('header', $this->data);
        echo view('index', $this->data);
        echo view('footer', $this->data);
    }
    public function modul()
    {
        $authorityQuery = $this->model->userAuthorityQuery($this->data['grup']->Id, 1);
        if ($authorityQuery->Seeing == 1) {
            $this->data['pageTitle'] = "Modül Liste";
            $this->data['datas'] = $this->model->list('moduls');
            $this->data['authorities'] = $this->model->list('user_authority');
            echo view('header', $this->data);
            echo view('modullist', $this->data);
            echo view('footer', $this->data);
        }else{
            sfd('danger', 'Bu işlemi gerçekleştirmek için yetkiniz bulunmamaktadır.');
            return redirect()->to(base_url());
        }
    }
    public function modulAdd()
    {
        $authorityQuery = $this->model->userAuthorityQuery($this->data['grup']->Id, 1);
        if ($authorityQuery->Seeing == 1) {
            $this->data['pageTitle'] = "Modül Liste";
            $this->data['datas'] = $this->model->list('moduls');
            $this->data['authorities'] = $this->model->list('user_authority');
            echo view('header', $this->data);
            echo view('moduladd', $this->data);
            echo view('footer', $this->data);
        }else{
            sfd('danger', 'Bu işlemi gerçekleştirmek için yetkiniz bulunmamaktadır.');
            return redirect()->to(base_url());
        }
    }
}