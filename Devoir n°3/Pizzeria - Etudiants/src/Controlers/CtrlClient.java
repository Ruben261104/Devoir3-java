package Controlers;

import Tools.ConnexionBDD;
import com.mysql.cj.xdevapi.Client;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CtrlClient
{
    private Connection cnx;
    private PreparedStatement ps;
    private ResultSet rs;

    public CtrlClient() {
        cnx = ConnexionBDD.getCnx();
    }

    public ArrayList<String> getAllClients()
    {
        ArrayList<String> lesClients = new ArrayList<>();
        try {
            ps = cnx.prepareStatement("select nomCli from clients");
            rs = ps.executeQuery();
            while (rs.next()) {
                lesClients.add(rs.getString("Nom"));
            }
            rs.next();
            ps.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(CtrlClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lesClients;
    }
    public int getIdClientByName(String nomCli)
    {
        int numCli = 0;

        try {
            ps = cnx.prepareStatement("select numCli from clients where nomCli = ?");
            ps.setString(1, nomCli);
            rs = ps.executeQuery();
            rs.next();
            numCli = rs.getInt("numCli");
            ps.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(CtrlLivreur.class.getName()).log(Level.SEVERE, null, ex);
        }
        return numCli;
    }
}
