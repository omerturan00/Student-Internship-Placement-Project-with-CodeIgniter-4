<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
$routes->group('login',  ['filter' => 'noauthfilter'], function ($routes) {
    $routes->match(['get', 'post'],'/', 'StajController::login');
});
$routes->group('', ['filter' => 'authfilter'], function ($routes) {
    $routes->get('/', 'StajController::index');
    $routes->get('/logout', 'StajController::logout');

    $routes->group('modul', function ($routes){
        $routes->get('list', 'StajController::modul');
        $routes->get('add', 'StajController::modulAdd');
    });
});
