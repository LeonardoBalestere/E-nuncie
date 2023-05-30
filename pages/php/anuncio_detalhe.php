<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalhe Anuncio</title>
    <link rel="stylesheet" href="./css/detalhesAnuncio.css">
</head>
<body>
    <nav>
        <a href="./index.html"><img src="./images/logo.png" alt="logo" class="logo"></a>
        <ul>
            <li><a href="./login.html" class="login-button">
                    <button type="button">Login</button>
                </a></li>
            <li><a href="./cadastro_usuario.html" class="cadastro-button">
                    <button type="button">Cadastre-se</button>
                </a></li>
        </ul>
    </nav>
    <main class="container">
        <div class="anuncio">
            <div class="imagem">
                <img src="./images/notebook.jfif" alt="Imagem do Produto">
            </div>
            <div class="informacoes">
                <h2>Nome do Produto</h2>
                <h3>Preço: R$ 99,99</h3>
            </div>
            <div class="descricao">
                <p>Descrição do Produto</p>
            </div>
            <div class="detalhes">
                <p>23/05/2023 | Bairro | Cidade</p>
            </div>
            <div class="botoes">
                <form action="cadastraInteresse.php" method="POST">
                    <input type="text" name="mensagem" placeholder="Deixe uma mensagem" required>
                    <br>
                    <input type="text" name="contato" placeholder="Deixe seu contato" required>
                    <br>
                    <button type="submit">Tenho Interesse</button>
                </form>
            </div>
        </div>
    </main>
</body>
</html>