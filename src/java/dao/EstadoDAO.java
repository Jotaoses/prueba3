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

/**
 *
 * @author DellPC
 */
public class EstadoDAO extends Conexion {
    public int registrar(Estado estado) throws SQLException{
        String sentencia = "Insert into estado (nombre) values (?)";
        try{
            Conexion();
            PreparedStatement ps = obtenerPS(sentencia);
            ps.setString(1, estado.getNombre());
            return ps.executeUpdate();
        }catch(Exception e){
            return -1;
        }finally{
            desconectar();
        }
    }
    
    public Estado obtenerEstado(int id) throws SQLException{
        String sentencia = "select * from estado where id=?";
        try{
            Conexion();
            PreparedStatement ps = obtenerPS(sentencia);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return (new Estado(rs.getInt("id"),rs.getString("nombre")));
            }else{
                return null;
            }
        }catch(Exception e ){
            return null;
        }finally{
            desconectar();
        }
    }
    
    public ArrayList<Estado> obtenerEstados() throws SQLException{
        String sentencia = "select * from estado";
        try{
            Conexion();
            PreparedStatement ps = obtenerPS(sentencia);
            ResultSet rs = ps.executeQuery();
            ArrayList<Estado> estados = new ArrayList();
            while(rs.next()){
                estados.add(new Estado(rs.getInt("id"),rs.getString("nombre")));
            }
            return estados;
        }catch(Exception e ){
            return new ArrayList();
        }finally{
            desconectar();
        }
    }
}
