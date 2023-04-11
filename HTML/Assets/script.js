// Vérification du formulaire de connexion

const envoi = document.getElementById("envoyer");
envoi.addEventListener("click", validerConn);

document.getElementById("formulaire").reset();

let mail_connexion = document.getElementById("mail_connexion");
let mail_err = document.getElementById("mail_err");
let mail_regex = /^[a-zA-Z0-9.-]+[@]{1}[a-zA-Z0-9.-]+[.]{1}[a-z]{2,10}$/

let mdp_connexion = document.getElementById("mdp_connexion");
let mdp_err = document.getElementById("mdp_err");

function validerConn(event) {

    // Vérification du mail
    if (mail_connexion.validity.valueMissing == true) {
        event.preventDefault();
        mail_err.textContent = "Saisissez un mail";
        mail_err.style.color = "red";
    }
    else if (mail_regex.test(mail_connexion.value) == false) {
        event.preventDefault();
        mail_err.textContent = "Saisissez un mail valide";
        mail_err.style.color = "orange";
    }
    else if (mail_connexion.validity.valueMissing == false) {
        mail_err.textContent = "";
    }

    //Vérification du mdp
    if (mdp_connexion.validity.valueMissing == true) {
        event.preventDefault();
        mdp_err.textContent = "Saisissez un mot de passe"
        mdp_err.style.color = "red";
    }
    else if (mdp_connexion.validity.valueMissing == false) {
        mdp_err.textContent = "";
    }
};