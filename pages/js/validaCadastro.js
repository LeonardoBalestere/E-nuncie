window.onload = function(){
    document.forms.formCadastro.onsubmit = validaForm;
}

function validaForm(e){
    let form = e.target;
    let formValido = true;

    if(form.password.value != form.cpassword.value){
        formValido = false;
        alert("Senhas não conferem!");
    }

    if((form.login.value === "") || (form.password.value === "") || (form.cpassword.value === "") || (form.nome.value === "")
    || (form.cpf.value === "") || (form.telefone.value === "")){
        formValido = false;
        alert("Preencher todos os dados!");
    }

    if(!formValido)
        e.preventDefault();
}