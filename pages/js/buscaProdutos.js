function renderProducts(newProducts) {

    const prodsSection = document.getElementById("products");
    const template = document.getElementById("template");

    for (let product of newProducts) {
      let html = template.innerHTML
        .replace("{{prod-image}}", product.imagem)
        .replace("{{prod-name}}", product.titulo)
        .replace("{{prod-price}}", product.preco);

      prodsSection.insertAdjacentHTML("beforeend", html);
    };
  }

  async function loadProducts() {

    try {
      let response = await fetch("buscaProdutos.php");
      if (!response.ok) throw new Error(response.statusText);
      var products = await response.json();
    }
    catch (e) {
      console.error(e);
      return;
    }

    renderProducts(products);
  }

  window.onload = function () {
    loadProducts();
  }

  window.onscroll = function () {
    if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
      loadProducts();
    }
  };