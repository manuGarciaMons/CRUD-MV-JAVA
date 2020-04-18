
<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Empleado"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.EmpleadoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/paginar.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script type="text/javascript" src="vistas/javascript/validar.js"></script>
        <script type="text/javascript" src="vistas/javascript/filtrar.js"></script>
        <script type="text/javascript" src="vistas/javascript/paginar.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                paginarTabla();
            });
        </script>
        <title>Empleados</title>
    </head>
    <body>
        <div class="container">
            <h1>Empleados</h1>
            <a class="btn btn-success" href="Controlador?accion=add">Agregar Nuevo</a>
            <br>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-3"></div>
                <div class="col-md-3">
                    <select name="selFiltro" id="selFiltro" class="form-control">
                        <option value="1">ID</option>
                        <option value="2">Nombres</option>
                        <option value="3">Apellidos</option>
                        <option value="4">Cargo</option>
                        <option value="5">Sexo</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <input type="text" name="txtFiltro" id="txtFiltro" class="form-control" onkeyup=" ajaxRequest()">
                </div>
            </div>
            <br>
            <table class="table table-bordered" id="tbEmpleados">
                <thead>
                    <tr>
                        <th class="text-center">ID</th>
                        <th class="text-center">DNI</th>
                        <th class="text-center">NOMBRES</th>
                        <th class="text-center">APELLIDOS</th>
                        <th class="text-center">CARGO</th>
                        <th class="text-center">SEXO</th>
                        <th class="text-center">ACCIONES</th>
                    </tr>
                </thead>

                <tbody id="tbodyEmpleados">
                    <%
                        EmpleadoDAO dao = new EmpleadoDAO();
                        List<Empleado> list = dao.listar();
                        Iterator<Empleado> iter = list.iterator();
                        Empleado emp = null;
                        while (iter.hasNext()) {
                            emp = iter.next();

                    %>
                    <tr>
                        <td class="text-center"><%= emp.getId()%></td>
                        <td class="text-center"><%= emp.getDni()%></td>
                        <td><%= emp.getNom()%></td>
                        <td><%= emp.getApe()%></td>
                        <td><%= emp.getCar()%></td>
                        <td><%= emp.getSex()%></td>
                        <td class="text-center">
                            <a class="btn btn-warning" href="Controlador?accion=editar&id=<%= emp.getId()%>">Editar</a>
                            <a class="btn btn-danger" href="Controlador?accion=eliminar&id=<%= emp.getId()%>">Remove</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
            <table style="width: 100%;">
                <tr>
                    <td><input class="btn btn-primary" type="button" id="cargar_primera_pagina" value="<< Primero"/></td>
                    <td><input class="btn btn-primary" type="button" id="cargar_anterior_pagina" value="< Anterior"/></td>
                    <td id="indicador_paginas"></td>
                    <td><input class="btn btn-primary" type="button" id="cargar_siguiente_pagina" value="Siguiente >"/></td>
                    <td><input class="btn btn-primary" type="button" id="cargar_ultima_pagina" value="Ultimo >>"/></td>
                </tr>
            </table>
        </div>
    </body>
</html>
