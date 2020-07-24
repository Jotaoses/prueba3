/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author DellPC
 */
public class Conexion {
    String USERNAME = "root"; 
    String PASSWORD = ""; 
    String BD = "floreria"; 
    String DRIVER = "com.mysql.jdbc.Driver";
    String URL = "jdbc:mysql://localhost:3306/"; 
    
    Connection conn; 
    

    public void Conexion() throws ClassNotFoundException, SQLException {
            Class.forName(DRIVER);
            conn = DriverManager.getConnection(URL+BD,USERNAME,PASSWORD);
            }
    
    public void desconectar() throws SQLException{
        if(!conn.isClosed()){
            conn.close();
        }
    }
    public Statement obtenerStatement() throws SQLException{
        return conn.createStatement();
    }
    public PreparedStatement obtenerPS(String sentencia) throws SQLException{
        return conn.prepareStatement(sentencia);
    }
 }

