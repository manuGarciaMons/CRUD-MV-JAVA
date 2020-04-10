
<%@page import="Modelo.Empleado"%>
<%@page import="ModeloDAO.EmpleadoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Empleados</title>
    </head>
    <body>
        <div class="container">
            <div class="col-lg-6">
              <%
              EmpleadoDAO dao = new EmpleadoDAO();
              int id=Integer.parseInt((String)request.getAttribute("idper"));
              Empleado p = (Empleado)dao.list(id);
          %>
            <h1>Modificar Informacion del Empleado</h1>
            <form action="Controlador">
                DNI:<br>
                <input class="form-control" type="text" name="txtDni" value="<%= p.getDni()%>"><br>
                Nombres: <br>
                <input class="form-control" type="text" name="txtNom" value="<%= p.getNom()%>"><br>
                Apellidos: <br>
                <input class="form-control" type="text" name="txtApe" value="<%= p.getApe()%>"><br>
                Cargo: <br>
                <input class="form-control" type="text" name="txtCar" value="<%= p.getCar()%>"><br>
                Sexo:  <br>
                <select name="selSex" class="form-control" selected="<%= p.getSex()%>">
                    <option value="H">Hombre</option>
                    <option value="M">Mujer</option>
                </select><br>
                <input type="hidden" name="txtid" value="<%= p.getId()%>">
                <input class="btn btn-primary" type="submit" name="accion" value="Actualizar"> 
                <a href="Controlador?accion=listar">Regresar</a>
            </form>
          </div>
          
        </div>
    </body>
</html>
