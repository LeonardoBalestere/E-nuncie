<?php

require "./conexaoMySql.php";
$pdo = mysqlConnect();

$email = $_POST["login"] ?? "";
$senha = $_POST["password"] ?? "";
$nome = $_POST["nome"] ?? "";
$cpf  = $_POST["cpf"] ?? "";
$telefone = $_POST["telefone"] ?? "";

$hashsenha = password_hash($senha, PASSWORD_DEFAULT);

$sql1 = <<<SQL
  INSERT INTO anunciante (nome, cpf, email, senhahash, telefone)
  VALUES (?, ?, ?, ?, ?)
  SQL;

try{
    $stmt1 = $pdo->prepare($sql1);
    $stmt1->execute([$nome, $cpf, $email, $hashsenha, $telefone]);
    
    header("location: ../login.html");
    exit();
} catch (Exception $e) {
    exit('Falha ao cadastrar os dados: ' . $e->getMessage());
}