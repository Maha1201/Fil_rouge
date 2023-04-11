// Vérification du formulaire d'inscription
const inscr = document.getElementById("envoyerInscr");
inscr.addEventListener("click", validerInscr);

document.getElementById("formulaire_inscr").reset();

let nom_inscr = document.getElementById("nom_inscr");
let nom_err = document.getElementById("nom_err");
let nom_regex = /^[A-Z][a-z]+([-'\s][a-zA-Z][a-z]+)?/

let prenom_inscr = document.getElementById("prenom_inscr");
let prenom_err = document.getElementById("prenom_err");

let mail_inscr = document.getElementById("mail_inscr");
let mail_err = document.getElementById("mail_err");
let mail_regex = /^[a-zA-Z0-9.-]+[@]{1}[a-zA-Z0-9.-]+[.]{1}[a-z]{2,10}$/

let mdp_inscr = document.getElementById("mdp_inscr");
let mdp_err = document.getElementById("mdp_err");

function validerInscr(event) {

    // Vérification du nom
    if (nom_inscr.validity.valueMissing == true) {
        event.preventDefault();
        nom_err.textContent = "Saisissez un nom";
        nom_err.style.color = "red";
    }
    else if (nom_regex.test(nom_inscr.value) == false) {
        event.preventDefault();
        nom_err.textContent = "Saisissez un nom valide";
        nom_err.style.color = "orange";
    }
    else if (nom_inscr.validity.valueMissing == false) {
        nom_err.textContent = "";
    }

    // Vérification du prénom
    if (prenom_inscr.validity.valueMissing == true) {
        event.preventDefault();
        prenom_err.textContent = "Saisissez un prénom";
        prenom_err.style.color = "red";
    }
    else if (nom_regex.test(prenom_inscr.value) == false) {
        event.preventDefault();
        prenom_err.textContent = "Saisissez un prénom valide";
        prenom_err.style.color = "orange";
    }
    else if (prenom_inscr.validity.valueMissing == false) {
        prenom_err.textContent = "";
    }

    // Vérification du mail
    if (mail_inscr.validity.valueMissing == true) {
        event.preventDefault();
        mail_err.textContent = "Saisissez un mail";
        mail_err.style.color = "red";
    }
    else if (mail_regex.test(mail_inscr.value) == false) {
        event.preventDefault();
        mail_err.textContent = "Saisissez un mail valide";
        mail_err.style.color = "orange";
    }
    else if (mail_inscr.validity.valueMissing == false) {
        mail_err.textContent = "";
    }

    // Vérification du mdp
    if (mdp_inscr.validity.valueMissing == true) {
        event.preventDefault();
        mdp_err.textContent = "Saisissez un mot de passe";
        mdp_err.style.color = "red";
    }
    else if (mdp_inscr.validity.valueMissing == false) {
        mdp_err.textContent = "";
    }
};