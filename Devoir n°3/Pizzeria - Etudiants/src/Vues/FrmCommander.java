package Vues;

import Controlers.*;
import Tools.ConnexionBDD;
import Tools.ModelJTable;
import com.mysql.cj.xdevapi.Client;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.SQLException;

public class FrmCommander extends JFrame{
    private JPanel pnlRoot;
    private JLabel lblTitre;
    private JLabel lblNumCommande;
    private JTextField txtNumCommande;
    private JLabel lblClients;
    private JComboBox cboClients;
    private JLabel lblLivreurs;
    private JTable tblPizzas;
    private JComboBox cboLivreurs;
    private JButton btnCommander;

    CtrlCommande ctrlCommande;
    CtrlClient ctrlClient;
    CtrlPizza ctrlPizza;
    CtrlLivreur ctrlLivreur;
    CtrlLigneCommande ctrlLigneCommande;

    ModelJTable mdl;

    public FrmCommander() throws SQLException, ClassNotFoundException {
        this.setTitle("Commander");
        this.setContentPane(pnlRoot);
        this.pack();
        this.setDefaultCloseOperation(DISPOSE_ON_CLOSE);
        this.setLocationRelativeTo(null);

        ConnexionBDD maCnx = new ConnexionBDD();
        ctrlCommande = new CtrlCommande();
        ctrlLigneCommande = new CtrlLigneCommande();
        ctrlClient = new CtrlClient();
        ctrlLivreur = new CtrlLivreur();
        ctrlPizza = new CtrlPizza();

        mdl = new ModelJTable();
        mdl.loadDatasPizzas(ctrlPizza.getAllPizzas());
        tblPizzas.setModel(mdl);

        //for (Client client : ctrlClient.getAllClients())
        //{
            //cboClients.addItem(client.getNomCli());
        //}
        //for (Livreur livreur : ctrlLivreur.getAllLivreurs()) {
            //cboLivreurs.addItem(livreur.getNomLiv());
        //}



        btnCommander.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {


                if(tblPizzas.getSelectedRowCount() == 0)
                {
                    JOptionPane.showMessageDialog(null, "Sélectionner une pizza","Choix de la commande",JOptionPane.WARNING_MESSAGE);
                }

                int nomLiv = ctrlLivreur.getIdLivreurByName(cboLivreurs.getSelectedItem().toString());
                int nomCli = ctrlClient.getIdClientByName(cboClients.getSelectedItem().toString());

                ctrlLigneCommande.InsertLigneCommande(txtNumCommande;tblPizzas.getValueAt());

            }
        });
    }
}
