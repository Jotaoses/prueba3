<%-- 
    Document   : solicitarProducto
    Created on : 24-jul-2020, 14:50:24
    Author     : DellPC
--%>

<%@page import="dao.ProductoDAO"%>
<%@page import="modelos.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.EstadoDAO"%>
<%@page import="dao.EstadoDAO"%>
<%@page import="modelos.Estado"%>
<%@page import="modelos.Estado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% if(session.getAttribute("usuario")==null){
            response.sendRedirect("index.jsp?msj=Acceso Denegado");
        }else{
        Producto p = new Producto();
        if(request.getParameter("codigo")!=null){
         p = new ProductoDAO().obtenerProducto(Long.parseLong(request.getParameter("codigo")));
                }
            %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
        <title>Solicita Producto</title>
    </head>
    <body background="img/flores2.jpg">
        <br>
        <form action="floreria.jsp">
        <div class="login col-lg-2">
        <input class="btn btn-danger btn-block" type="submit" name="accion" value="Volver a Inicio">
        </div>
    </form>
        <br>
  
            <div class="container col-lg-3">
        <form action="ControladorCliente" method="post">
             <div class="form-group text-center">
                    <p><strong>PANEL DE SOLICITUD DE PRODUCTOS</strong></p>
                </div>
            <div class="form-group">
                    <label>ID del Producto:</label>
                    <input class="form-control" type="number" name="codigo" value="<%= p.getCodigo() %>" readonly="true">
                </div>
            <div class="form-group">
                    <label>Nombre:</label>
                    <input type="text" name="nombre" class="form-control" value="<%= p.getNombre() %>" readonly="true">
                </div>
            <div class="form-group">
                    <label>Descripcion:</label>
                    <textarea cols="10" rows="2" name="descripcion" class="form-control" readonly="true">
                        <%= p.getDescripcion()%>
                    </textarea>
                </div>
            <div class="form-group">
                    <label>Precio:</label>
                    <input type="number" name="precio" class="form-control" value="<%= p.getPrecio() %>" readonly="true">
                </div>
            <div class="form-group">
                    <label>Email:</label>
                    <input type="email" name="email" value="usuario@example.cl" placeholder="" class="form-control" value="<%= p.getEmail() %>">
                </div>
            <div class="form-group">
                    <label>Estado:</label>
                        <select name="estado" class="form-control" readonly="true">
                            
                            <<% ArrayList<Estado> estados = new EstadoDAO().obtenerEstados(); 
                            for(Estado e:estados){%>
                            <option value="<%= e.getId() %>" 
                                  <% if(e.getId()== p.getEstado().getId()){ out.print("selected='selected'"); }%>  
                                    ><%= e %></option>
                            <% } %>
                        </select>
            </div>
            <input class="btn btn-danger btn-block" type="submit" value="Solicitar">
            <input type="hidden" name="accion" value="2"/>
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
<% } %>