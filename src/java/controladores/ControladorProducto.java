/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import dao.EstadoDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.Producto;

/**
 *
 * @author DellPC
 */
import dao.ProductoDAO;
@WebServlet(name = "ControladorProducto", urlPatterns = {"/ControladorProducto"})
public class ControladorProducto extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         if(request.getParameter("accion")!=null){
        String accion = request.getParameter("accion");
        switch(accion){
            case "1": registrar(request,response);
                 break;
                 case "2": modificar(request,response);
                 break;
           
        }
         }else{
             response.sendRedirect("agregarProducto.jsp?msj=Acceso Denegado");
         }
    }
    
    private void modificar(HttpServletRequest request, HttpServletResponse response) throws IOException{
         try{
            long codigo =Long.parseLong(request.getParameter("codigo").trim());
            String nombre = request.getParameter("nombre").trim();
            String descripcion = request.getParameter("descripcion").trim();
            int precio = Integer.parseInt(request.getParameter("precio").trim());
            String email = request.getParameter("email").trim();
            int estado = Integer.parseInt( request.getParameter("estado").trim());
            if(codigo<1||nombre.equals("")||descripcion.equals("")||precio<1||
                    email.equals("")||estado<1){
                response.sendRedirect("solicitarProducto.jsp?msj=valores erroneos");
            }else{
                EstadoDAO ed = new EstadoDAO();
                Producto nuevoProducto = new Producto (codigo,nombre,descripcion,precio,email,ed.obtenerEstado(estado));
                ProductoDAO pd = new ProductoDAO();
                if(pd.obtenerProducto(nuevoProducto.getCodigo())==null){
                    response.sendRedirect("solicitarProducto.jsp?msj=Codigo de producto inexistente");
                }else{
                   int respuesta = pd.modificar(nuevoProducto);
                   if(respuesta>0){
                       response.sendRedirect("solicitarProducto.jsp?msj=Estado de Reparacion modificada");
                   }else{
                       response.sendRedirect("solicitarProducto.jsp?msj=El estado no se pudo modificar");
                   }
                }
            }
         }catch(Exception e){
             
         }
    }
    
    
    private void registrar(HttpServletRequest request, HttpServletResponse response) throws IOException{
           try{
            long codigo =Long.parseLong(request.getParameter("codigo").trim());
            String nombre = request.getParameter("nombre").trim();
            String descripcion = request.getParameter("descripcion").trim();
            int precio = Integer.parseInt(request.getParameter("precio").trim());
            String email = request.getParameter("email").trim();
            int estado = Integer.parseInt( request.getParameter("estado").trim());
            if(codigo<1||nombre.equals("")||descripcion.equals("")||precio<1||
                    email.equals("")||estado<1)
            {
                response.sendRedirect("agregarProducto.jsp?msj=Debe seleccionar un estado");
            }else{
                EstadoDAO ed = new EstadoDAO();
                Producto nuevoProducto = new Producto (codigo,nombre,descripcion,precio,email,ed.obtenerEstado(estado));
                
                ProductoDAO pd = new ProductoDAO();
                
                if(pd.obtenerProducto(nuevoProducto.getCodigo())==null){
                    int respuesta = pd.registrar(nuevoProducto);
                    if(respuesta==1){
                    response.sendRedirect("agregarProducto.jsp?msj=Producto Registrado con Exito!");
                    }else{
                    response.sendRedirect("agregarProducto.jsp?msj=El producto no se pudo ingresar"); // For input String: ""
                    }
                }else{
                    response.sendRedirect("agregarProducto.jsp?msj=El Codigo del prodcuto ya existe");
                }
            }
           }catch(Exception e){
               response.sendRedirect("agregarProducto.jsp?msj="+e.getMessage());
           }
        }
    
   
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
