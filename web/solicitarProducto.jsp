
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        
        <title>Solicita Producto</title>
    </head>
    <body>
        <br>
        <form action="index.jsp">
        
        <input class="btn btn-danger btn-block" type="submit" name="accion" value="Volver a Inicio">
        </div>
    </form>
        <br>
        <%
                Connection conn;
                String USERNAME = "root"; 
                String PASSWORD = ""; 
                String BD = "floreria"; 
                String DRIVER = "com.mysql.jdbc.Driver";
                String URL = "jdbc:mysql://localhost:3306/"; 
                Class.forName(DRIVER);
                conn = DriverManager.getConnection(URL+BD,USERNAME,PASSWORD);
                
                PreparedStatement ps;
                ResultSet rs;
                long codigo = Long.parseLong(request.getParameter("codigo"));
                ps = conn.prepareStatement("select * from producto where codigo="+codigo);
                rs = ps.executeQuery();
                while(rs.next()){
            %>
  
            <div class="container col-lg-3">
        <form action="ControladorProducto" method="post">
             <div class="form-group text-center">
                    <p><strong>PANEL DE SOLICITUD DE PRODUCTOS</strong></p>
                </div>
            <div class="form-group">
                    <label>ID del Producto:</label>
                    <input class="form-control" type="number" name="codigo" value="<%= rs.getLong("codigo")%>" readonly="true">
                </div>
            <div class="form-group">
                    <label>Nombre Producto:</label>
                    <input type="text" name="nombre" class="form-control" value="<%= rs.getString("nombre") %>" readonly="true">
                </div>
            <div class="form-group">
                    <label>Caracteristicas del Producto:</label>
                    <textarea cols="10" rows="3" name="descripcion" class="form-control" readonly="true">
                        <%= rs.getString("descripcion")%>
                    </textarea>
                </div>
            <div class="form-group">
                    <label>Precio Actual:</label>
                    <input type="number" name="precio" class="form-control" value="<%= rs.getInt("precio") %>" readonly="true">
                </div>
            <div class="form-group">
                    <label>(Ingrese su Email para ver el estado del prodcuto)</label>
                    <input type="email" name="email" placeholder="" class="form-control" value="<%= rs.getString("email") %>">
                </div>
            <div class="form-group">
                    <label>Estado:</label>
                        <select name="estado" class="form-control">
                            <option value="Solicitud Pendiente">Solicitud Pendiente</option>                           
                        </select>
            </div>
                <br>
            <input class="btn btn-danger btn-block" type="submit" value="Modificar">
            <input type="hidden" name="accion" value="2" />                   
        </form>
            <%}%>
            </div>
            <center>
            <% if(request.getParameter("msj")!= null){%>
        <h3><%= request.getParameter("msj") %></h3>
        <%}%>
        </center>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>