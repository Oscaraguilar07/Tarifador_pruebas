const input = document.getElementById("input");
const iconEyes = document.querySelector(".showHidePw");
const iconEyesTwo = document.querySelector(".eye_open");



iconEyes.addEventListener("click", function () {
    input.type = input.type === "password" ? "text" : "password";
    iconEyes.style.display = input.type === "password" ? "block" : "none";
    iconEyesTwo.style.display = input.type === "password" ? "none" : "flex";
});

iconEyesTwo.addEventListener("click", function () {
    input.type = "password";
    iconEyes.style.display = "block";
    iconEyesTwo.style.display = "none";
});