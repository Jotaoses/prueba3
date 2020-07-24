/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modelos.Estado;
import modelos.Producto;

/**
 *
 * @author DellPC
 */
public class ProductoDAO extends Conexion {
    public int registrar(Producto producto) throws SQLException{
        try{
            String sentencia ="Insert into producto values (?,?,?,?,?,?)";
            Conexion();
            PreparedStatement ps = obtenerPS(sentencia);
            ps.setLong(1, producto.getCodigo());
            ps.setString(2, producto.getNombre());
            ps.setString(3, producto.getDescripcion());
            ps.setInt(4, producto.getPrecio());
            ps.setString(5, producto.getEmail());
            ps.setInt(6, producto.getEstado().getId());
            return ps.executeUpdate();
        }catch(Exception e){
            return -1;
        }finally{
            desconectar();
        }
    }
    
    public int modificar(Producto producto) throws SQLException{
        try{
            String sentencia ="update producto set email = ?, id_estado=? where codigo = ?";
            Conexion();
            PreparedStatement ps = obtenerPS(sentencia);
            ps.setString(1, producto.getEmail());
            ps.setInt(2, producto.getEstado().getId());
            ps.setLong(3, producto.getCodigo());
            return ps.executeUpdate();
        }catch(Exception e){
            return -1;
        }finally{
            desconectar();
        }
    }
    
    public Producto obtenerProducto(long codigo) throws SQLException{
        try{
            String sentencia = "select * from v_productos where codigo = ?";
            Conexion();
            PreparedStatement ps = obtenerPS(sentencia);
            ps.setLong(1, codigo);
            ResultSet rs = ps.executeQuery();
            Producto po = null;
            if(rs.next()){
                Estado e = new Estado(rs.getInt("id"),rs.getString("e_nombre"));
                po = new Producto(rs.getLong("codigo"),rs.getString("nombre"),rs.getString("descripcion"),
                        rs.getInt("precio"),rs.getString("email"),e);
            }
            
            return po;
        }catch(Exception e){
            return null;
        }finally{
            desconectar();
        }
    }
    
    public ArrayList<Producto> obtenerProductos() throws SQLException{
        try{
            String sentencia = "select * from v_productos";
            Conexion();
            PreparedStatement ps = obtenerPS(sentencia);
            ResultSet rs = ps.executeQuery();
            ArrayList<Producto> productos = new ArrayList();
            while(rs.next()){
                Estado e = new Estado(rs.getInt("id"),rs.getString("e_nombre"));
                productos.add(new Producto(rs.getLong("codigo"),rs.getString("nombre"),rs.getString("descripcion"),
                rs.getInt("precio"),rs.getString("email"),e));
            }
            return productos;
        }catch(Exception e){
            return new ArrayList();
        }finally{
            desconectar();
        }
    }
}
