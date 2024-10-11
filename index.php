<?php

require_once './vendor/autoload.php';
require_once 'file.php';

$loader = new \Twig\Loader\FilesystemLoader('./');
$twig = new \Twig\Environment($loader);
echo $twig->render('index.html.twig', ['name' => 'Fabien']);

try {
    $dbh = new PDO('mysql:host=192.168.1.21;dbname=docker_database;', 'root', '12345');
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    echo $e->getMessage();
    $errorCode = $e->getCode();
}