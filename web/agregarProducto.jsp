<%-- 
    Document   : agregarProducto
    Created on : 21-jul-2020, 6:20:56
    Author     : DellPC
--%>

<%@page import="dao.EstadoDAO"%>
<%@page import="modelos.Estado"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
        <title>Ingreso Producto</title>
    </head>
    <body >
        <br>
        <form action="floreria.jsp">
        <input  type="submit" name="accion" value="Volver a Inicio">
        </div>
    </form>
        <br>
  
            <div class="container ">
        <form action="ControladorProducto" method="post">
             <div class="form-group ">
                    <p><strong>PANEL DE REGISTRO DE PRODUCTOS</strong></p>
                </div>
            <div class="form-group">
                    <label>ID del Producto:</label>
                    <input class="form-control" type="number" name="codigo" placeholder="Ingrese el Codigo Unico">
                </div>
            <div class="form-group">
                    <label>Nombre:</label>
                    <input type="text" name="nombre" placeholder="Nombre del producto" class="form-control">
                </div>
            <div class="form-group">
                    <label>Descripcion:</label>
                    <textarea cols="10" rows="2" name="descripcion" placeholder="Descripcion del producto" class="form-control"></textarea>
                </div>
            <div class="form-group">
                    <label>Precio:</label>
                    <input type="number" name="precio" placeholder="Precio del producto" class="form-control">
                </div>
            <div class="form-group">
                    <label>Email:</label>
                    <input type="email" name="email" value="usuario@example.cl" placeholder="" class="form-control" readonly="true">
                </div>
            <div class="form-group">
                    <label>Estado:</label>
                        <select name="estado" class="form-control" readonly="true">
                            
                            <% ArrayList<Estado> estados = new EstadoDAO().obtenerEstados(); 
                            for(Estado e:estados){%>
                            <option value="<%= e.getId() %>"><%= e %></option>
                            <% } %>
                        </select>
            </div>
            <input  type="submit" value="Registrar">
            <input type="hidden" name="accion" value="1"/>
            <br>
            <center>
        <% if(request.getParameter("msj")!= null){%>
        <h3><%= request.getParameter("msj") %></h3>
        <%}%>
            </center>
        </form>
            </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>