<?php

function mysqlConnect()
{
  $db_host = "sql111.epizy.com";
  $db_username = "epiz_33710508";
  $db_password = "XmCb0QEtvZcjfy";
  $db_name = "epiz_33710508_trabppi";

  $dsn = "mysql:host=$db_host;dbname=$db_name;charset=utf8mb4";

  $options = [
    PDO::ATTR_EMULATE_PREPARES => false,
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,   
    PDO::ATTR_PERSISTENT    => true,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
  ];

  try {
    $pdo = new PDO($dsn, $db_username, $db_password, $options);
    return $pdo;
  } 
  catch (Exception $e) {
    exit('Ocorreu uma falha na conexão com o BD: ' . $e->getMessage());
  }
}

?>
