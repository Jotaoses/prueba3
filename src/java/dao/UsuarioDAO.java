/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import modelos.Usuario;

/**
 *
 * @author DellPC
 */
public class UsuarioDAO extends Conexion {
    
    public Usuario obtenerUsuario(Usuario usuario) throws ClassNotFoundException, SQLException{
        String sentencia = "select * from usuario where id = ?";
        try{
        Conexion();
        PreparedStatement ps= obtenerPS(sentencia);
        ps.setString(1, usuario.getId());
        ResultSet rs = ps.executeQuery();
        Usuario u = null;
        if(rs.next()){
           u = new Usuario(rs.getString("id"),rs.getString("nombre"), rs.getString("apellido"),rs.getString("password"));
        }
        return u;
        }catch(Exception e){
            return null;
        }finally{
            desconectar();
        }
    }
}
