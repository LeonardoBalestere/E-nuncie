async function sendForm(form) {
    try {
      let response = await fetch("validaLogin.php", { method: 'post', body: new FormData(form) });
      if (!response.ok) throw new Error(response.statusText);
      var result = await response.json();
  
      console.log(result); // Exibe a resposta recebida do servidor no console
  
      if (result.success) {
        window.location.href = result.detail; // Utiliza window.location.href para redirecionar
      } else {
        alert("Dados Incorretos");
      }
    } catch (e) {
      console.error(e);
    }
  }
  
  window.onload = function () {
    const form = document.forms.formLogin;
    form.onsubmit = function (e) {
      sendForm(form);
      e.preventDefault();
    }
  }
  