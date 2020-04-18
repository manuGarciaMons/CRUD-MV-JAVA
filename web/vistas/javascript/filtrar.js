function ajaxRequest(e) {
    var filtro = $('#txtFiltro').val();
    var indFiltro = $('#selFiltro').val();
    $.post({url: "Controlador",
        data: {
            filtro: filtro,
            indFiltro: indFiltro
        },
        success: function (result) {
            var jsonResult = JSON.parse(result);
            var tbEmpleados = document.getElementById('tbEmpleados').getElementsByTagName('tbody')[0];
            vaciarTablaEmpleados();
            for (var i = 0; i < jsonResult.length; i++) {
                var jsonItem = jsonResult[i];
                var row = tbEmpleados.insertRow(i);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                var cell3 = row.insertCell(2);
                var cell4 = row.insertCell(3);
                var cell5 = row.insertCell(4);
                var cell6 = row.insertCell(5);
                var cell7 = row.insertCell(6);
                cell1.innerHTML = jsonItem["id"].toString();
                cell2.innerHTML = jsonItem["dni"].toString();
                cell3.innerHTML = jsonItem["nombres"].toString();
                cell4.innerHTML = jsonItem["apellidos"].toString();
                cell5.innerHTML = jsonItem["cargo"].toString();
                cell6.innerHTML = jsonItem["sexo"].toString();
                cell7.innerHTML = "<a class=\"btn btn-warning\" href=\"Controlador?accion=editar&id=" + jsonItem["id"].toString() + "\">Editar</a><a class=\"btn btn-danger\" href=\"Controlador?accion=eliminar&id=" + jsonItem["id"].toString() + "\">Remove</a>";
                cell7.classList.add("text-center");
            }
        }});
}

function vaciarTablaEmpleados() {
    var tbEmpleados = document.getElementById("tbodyEmpleados");

    while (tbEmpleados.childNodes.length > 1) {
        tbEmpleados.removeChild(tbEmpleados.lastChild);
    }
}


