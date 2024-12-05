<?php

namespace App\Models;

use CodeIgniter\Model;
use MongoDB\Driver\Server;

class StajModel extends Model
{
    public function login($nickName, $password)
    {
        $builder = $this->db->table('users');
        $builder->where([
            'nickName' => $nickName,
            'password' => $password
        ]);
        return $builder->get()->getRow();
    }
    public function userInfo($id)
    {
        $builder = $this->db->table('users');
        $builder->where(['Id' => $id, 'Deleted' => 'F', 'Status' => 1]);
        return $builder->get()->getRow();
    }
    public function userAuthorityQuery($grupId, $modulId)
    {
        $builder = $this->db->table('user_authority');
        $builder->where(['Grup_Id' => $grupId, 'Deleted' => 'F', 'Modul_Id' => $modulId]);
        return $builder->get()->getRow();
    }
    public function getGrupId($grupId)
    {
        $builder = $this->db->table('grups');
        $builder->where(['Id' => $grupId, 'Deleted' => 'F', 'Status' => 1]);
        return $builder->get()->getRow();
    }
    public function c_one($userId)
    {
        $builder = $this->db->table('users');
        $builder->where(['Id' => $userId, 'Deleted' => 'F', 'Status' => 1]);
        return $builder->get()->getRow();
    }
    public function logAdd($userId, $modulId, $process)
    {
        $ip = $_SERVER['REMOTE_ADDR'];
        $builder = $this->db->table('user_log');
        $builder->insert([
            'User_Id' => $userId,
            'Modul_Id' => $modulId,
            'Process' => $process,
            'Ip' => $ip,
            'Date' => date("Y-m-d H:i:s")
        ]);
        return $builder;
    }
    public function list($table)
    {
        $builder = $this->db->table($table);
        $builder->where(['Deleted' => 'F']);
        return $builder->get()->getResult();
    }


}