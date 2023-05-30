<?php

class Product
{
  public $codigo;
  public $titulo;
  public $descricao;
  public $preco;
  public $imagem;
  public $datahora;

  function __construct($codigo, $titulo, $descricao, $preco, $imagem, $datahora)
  {
    $this->codigo = $codigo;
    $this->titulo = $titulo; 
    $this->descricao = $descricao;
    $this->preco = $preco;
    $this->imagem = $imagem;
    $this->datahora = $datahora;
  }
}

require "./conexaoMySql.php";
$pdo = mysqlConnect();

$searchText = isset($_GET['search']) ? $_GET['search'] : '';

$sql = <<<SQL
    SELECT codigo, titulo, descricao, preco, datahora, nomearqfoto
    FROM anuncio
    LEFT JOIN foto ON anuncio.codigo = foto.codanuncio
    WHERE descricao LIKE ?
    ORDER BY datahora DESC
    LIMIT 6 OFFSET 0
    SQL;

$stmt = $pdo->prepare($sql);
$stmt->execute(array("%$searchText%"));

$products = array();
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
  $product = new Product($row['codigo'], $row['titulo'], $row['descricao'], $row['preco'], $row['nomearqfoto'], $row['datahora']);
  $products[] = $product;
}

header('Content-type: application/json');
echo json_encode($products);

?>