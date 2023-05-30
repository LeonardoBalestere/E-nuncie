<?php

require "./conexaoMySql.php";
$pdo = mysqlConnect();

$mensagem = $_POST["mensagem"] ?? "";
$contato = $_POST["contato"] ?? "";
$datetime = date('Y-m-d H:i:s');
// PRECISO DE CONSEGUIR O CÓDIGO DO ANUNCIO AQUI

$sql1 = <<<SQL
  INSERT INTO interesse (mensagem, contato, datahora, codanuncio)
  VALUES (?, ?, ?, ?)
  SQL;

try{
    $stmt1 = $pdo->prepare($sql1);
    $stmt1->execute([$mensagem, $contato, $datetime, $codanuncio]);
    
    header("location: ../index.html");
    exit();
} catch (Exception $e) {
    exit('Falha ao cadastrar os dados: ' . $e->getMessage());
}