const iconEyes = document.querySelector(".showHidePw");
const iconEyesTwo = document.querySelector(".eye_open");
const input = document.getElementById("input");

iconEyes.addEventListener("click", function () {
    if (input.type === "password") {
        input.type = "text";
        iconEyes.style.display = "none";
        iconEyesTwo.style.display = "block";
} else {
    input.type = "password";
    iconEyes.style.display = "none";
    iconEyesTwo.style.display = "block";
}
});