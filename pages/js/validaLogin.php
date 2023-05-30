<?php

require "./conexaoMySql.php";
require "./";

class RequestResponse
{
  public $success;
  public $detail;

  function __construct($success, $detail)
  {
    $this->success = $success;
    $this->detail = $detail;
  }
}

function checkLogin($pdo, $email, $senha)
{
  $sql = <<<SQL
    SELECT senhahash
    FROM anunciante
    WHERE email = ?
    SQL;

  try {
    $stmt = $pdo->prepare($sql);
    $stmt->execute([$email]);
    $row = $stmt->fetch();
    if (!$row || !password_verify($senha, $row['senhahash'])) return false;

    return true;
  } catch (Exception $e) {
    exit('Falha inesperada: ' . $e->getMessage());
  }
}

$pdo = mysqlConnect();

$email = $_POST["login"] ?? "";
$senha = $_POST["password"] ?? "";

if (checkLogin($pdo, $email, $senha)) {
  session_start();
  $_SESSION['loggedIn'] = true;
  $_SESSION['user'] = $email;
  $response = new RequestResponse(true, '../index.html');
} else {
  $response = new RequestResponse(false, '../login.html');
}

header('Content-Type: application/json');

echo json_encode($response);

?>
