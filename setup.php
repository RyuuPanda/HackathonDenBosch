<?php
session_start();

//Class compiler
require(ABSPATH.'admin/classcompiler.php');
require(ABSPATH.'admin/database/database.php');
require(ABSPATH.'admin/core/pagebuild.php');
require(ABSPATH.'admin/core/marketproduct.php');

//maakt een nieuw db object naar hackathondenbosch
$pdo = ConnectDB();

include(ABSPATH.'admin/core/login.php');

//Maakt een router object voor pagination
$router = new Router;
//Redirect naar de goede url
$uri = str_replace('/'.$website_name.'/', '', $_SERVER['REQUEST_URI']);
$uri = rtrim($uri, '/');
if(strpos($uri, '?'))
{
	$uri = substr($uri, 0, strpos($uri, '?'));
}
if(!array_key_exists($uri, $router->routes)) {
    $uri = '';
}

include_once(ABSPATH.'content/load.php');