<?php


function sfd($durum, $mesaj)
{
    $sfd = '<div class="alert alert-'.$durum.'" role="alert">'.$mesaj.'</div>';
    $ci = Config\Services::session();
    return $ci->setFlashdata("durum", $sfd);
}
function fdata()
{
    $ci = Config\Services::session();
    return $ci->getFlashdata("durum");
}

