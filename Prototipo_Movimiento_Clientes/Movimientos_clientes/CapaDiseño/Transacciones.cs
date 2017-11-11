using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CapaDatos;
using MySql.Data.MySqlClient;
using System.Data.Odbc;
using CapaDiseño;

/* Kimberly Alejandra Rivera Gonzalez
   0901-14-1072
   Me toco el area de movimientos de clientes y este form realiza
   el ingreso de todas las transacciones nuevas que tenga el hotel
*/


namespace Movimientos_clientes
{
    public partial class Transacciones : Form
    {

        int num_form = 6106;
        string MyConnection2 = "Driver ={ MySQL ODBC 3.51 Driver }; Dsn=servidor_hotel; UID=root; PWD = ; ";

        //constructor de este form
        public Transacciones()
        {
            InitializeComponent();
            mostrar_cod_cuenta();

        }

        // funcion que llena los combobox de codigo de cuenta
        private void mostrar_cod_cuenta()
        {
            CodigoDatos CD = new CodigoDatos();
            CD.conexion();
            //MessageBox.Show("Si conecta BD");

            try
            {
                OdbcCommand sentencia = new OdbcCommand();
                sentencia.Connection = CD.conexion();

                sentencia.CommandText = "SELECT CONCAT(nomenclatura,', ', nombre) AS DatosCombinados FROM cuentacontabilidad";

                //sentencia.CommandText = "SELECT nomenclatura + ' ' + nombre as NOM_COMPLETO from cuentacontabilidad";
                OdbcDataAdapter da1 = new OdbcDataAdapter(sentencia);
                DataTable dt = new DataTable();
                da1.Fill(dt);
                comboBox1.ValueMember = "nomenclatura";
                comboBox1.DisplayMember = "DatosCombinados";
                comboBox1.DataSource = dt;
            }
            catch (MySqlException ex)
            {
                MessageBox.Show("no encntrado. " + ex);
            }

            finally
            {
                CD.conexion().Close();
            }
        }


        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {


        }

        // se redirecciona a otro form
        private void Transacciones_Load(object sender, EventArgs e)
        {

            CodigoDatos CD = new CodigoDatos();
            CD.conexion();
            //MessageBox.Show("Si conecta BD");
            //CD.CloseConnection();
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        private void navegador1_Load(object sender, EventArgs e)
        {

        }

        // guarda en tabla transacciones los datos que ingrese desde la aplicacion
        private void button1_Click(object sender, EventArgs e)
        {

            string Query = "insert into transacciones(descripcion,accion,cuentacontabilidad_nomenclatura) values('" + textBox1.Text + "','" + comboBox2.Text + "','" + Convert.ToInt32(comboBox1.ValueMember.ToString()) + "')";

            OdbcConnection MyConn1 = new OdbcConnection(MyConnection2);
            OdbcCommand MyCommand1 = new OdbcCommand(Query, MyConn1);
            OdbcDataReader MyReader1;
            //MessageBox.Show(comboBox2.Text.ToString());
            MyConn1.Open();
            MyReader1 = MyCommand1.ExecuteReader();
            while (MyReader1.Read())
            {
            }
            MyConn1.Close();
            Vision_trans visiion = new Vision_trans();
            visiion.Show();
            this.Hide();
        }

        //aqui va la funcion de la barra de navegacion para guardar
        private void navegador1_InsertReceive(object sender, EventArgs e)
        {
            //string campo1 = textBox2.Text;
        }

        private void comboBox2_MouseClick(object sender, MouseEventArgs e)
        {
        }

        
        private void navegador1_RecibidorInsertar(object sender, EventArgs e)
        {
            string conversion1;
            string valor1 = comboBox1.Text.ToString();
            char delimiter = ',';
            string[] substrings = valor1.Split(delimiter);
            conversion1 = substrings[0];
            //MessageBox.Show(conversion1);
            int conversion2 = Convert.ToInt32(conversion1);
            
            string Query = "insert into transacciones(descripcion,accion,cuentacontabilidad_nomenclatura) values('" + textBox1.Text + "','" + comboBox2.Text + "','" + conversion2 + "')";

            OdbcConnection MyConn1 = new OdbcConnection(MyConnection2);
            OdbcCommand MyCommand1 = new OdbcCommand(Query, MyConn1);
            OdbcDataReader MyReader1;
            //MessageBox.Show(comboBox2.Text.ToString());
            MyConn1.Open();
            MyReader1 = MyCommand1.ExecuteReader();
            while (MyReader1.Read())
            {
            }
            MyConn1.Close();
            Vision_trans visiion = new Vision_trans();
            visiion.Show();
            this.Hide();

        }
    }
}
