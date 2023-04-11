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
        mail_err.textContent = "OK";
        mail_err.style.color = "green";
    }

    //Vérification du mdp
    if (mdp_connexion.validity.valueMissing == true) {
        event.preventDefault();
        mdp_err.textContent = "Saisissez un mot de passe"
        mdp_err.style.color = "red";
    }
    else if (mdp_connexion.validity.valueMissing == false) {
        mdp_err.textContent = "OK";
        mdp_err.style.color = "green";
    }
};


// Vérification du formulaire d'inscription
const inscr = document.getElementById("envoyerInscr");
inscr.addEventListener("click", validerInscr);

document.getElementById("formulaire_inscr").reset();

let nom_inscr = document.getElementById("nom_inscr");
let nom_err = document.getElementById("nom_err");

function validerInscr(event) {

    // Vérification du nom
    if (nom_inscr.validity.valueMissing == true) {
        event.preventDefault();
        nom_err.textContent = "Saisissez un nom";
        nom_err.style.color = "red";
    }
    else if (nom_inscr.validity.valueMissing == false) {
        nom_err.textContent = "OK";
        nom_err.style.color = "green";
    }
};