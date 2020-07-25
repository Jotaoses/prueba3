<%-- 
    Document   : index
    Created on : 21-jul-2020, 5:20:44
    Author     : DellPC
--%>

<%@page import="modelos.Estado"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductoDAO"%>
<%@page import="modelos.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        
        <title>Floreria Web</title>
    </head>
    <body background="img/portada3.jpg">
        <br>
        <form action="login.jsp">
        
        <input  type="submit" name="accion" value="Iniciar Sesion">
     
    </form>
        <br>
    <center>
        <h2></h2>
    </center>

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
                ps = conn.prepareStatement("select P.nombre as nombre, P.descripcion as descripcion, P.precio as precio, E.nombre as estado, P.codigo as codigo from producto P, estado E where  P.id_estado = E.id");
                rs = ps.executeQuery();
            %>
            <center>
                <form action="">
            
                <div class="form-group ">
                    <p><strong>Solicitar Pedido</strong></p>
                </div>
                <table border="1" style="border-collapse: collapse;">
                    <tr>
                        <td>Nombre</td>
                        <td>Descripcion</td>
                        <td>Precio</td>
                        <td>Estado</td>
                    </tr>
                    <%
                        while(rs.next()){ 
                    %>
                    <tr>
                        <td><%= rs.getString("nombre")%></td>
                        <td><%= rs.getString("descripcion")%></td>
                        <td><%= rs.getInt("precio")%></td>
                        <td><%= rs.getString("estado")%></td>
                        <td></td>
                        <td><a href="solicitarProducto.jsp?codigo=<%= rs.getLong("codigo")%>">
                        <button type="button">Solicitar</button>
                    </a></td>
                    </tr>
                    <%}%>
                </table>
            </div>
                </form>
            </center>
    
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>