document.getElementById("calcularBtn").addEventListener("click", function(event) {
    // Evitar que la página se recargue
    event.preventDefault();
  
    // Obtener los valores de los inputs
    var num = parseFloat(document.getElementById("input").value);


    var data = parseFloat(document.getElementById("input").getAttribute("data-valor"));

    // Realizar las operaciones (puedes cambiarlas según lo que quieras hacer)
    var resultado = num * data

    // Mostrar los resultados en los inputs correspondientes
    document.getElementById("resultado").value = resultado;
});



