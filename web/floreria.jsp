<%-- 
    Document   : floreria
    Created on : 21-jul-2020, 5:21:06
    Author     : DellPC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
        <title>Floreria Admin</title>
    </head>
    <body background="img/flores.jpg">
        <br>
        <form action="Salir">
        <div class="login col-lg-2">
        <input class="btn btn-danger btn-block" type="submit" name="accion" value="Cerrar Sesion">
        </div>
    </form>
        <br>
  
            <div class="container col-lg-3">
        <form action="agregarProducto.jsp">
             <div class="form-group text-center">
                    <p><strong>PANEL DE ADMINISTRACION</strong></p>
                </div>
            <form action="">
            <div class="form-group">
                    <input class="btn btn-danger btn-block" type="submit" value="AGREGAR PRODUCTOS">
                </div>
            </form>
            <br>
            <form action="gestionPedidos.jsp">
            <div class="form-group">
                    <input class="btn btn-danger btn-block" type="submit" value="GESTIONAR PRODUCTOS">
                </div>
            </form>
        </form>
            </div>
        <br>
        
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>


