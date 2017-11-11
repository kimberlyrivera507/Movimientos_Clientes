using CapaDatos;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Odbc;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CapaDiseño
{
    public partial class Reporte_Saldos : Form
    {
        int num_form = 6104;
        string MyConnection2 = "Driver ={ MySQL ODBC 3.51 Driver }; Dsn=servidor_hotel; UID=root; PWD = ;  ";


        public Reporte_Saldos()
        {
            InitializeComponent();
            mostrar_clientes();
        }

        private void mostrar_clientes()
        {
            CodigoDatos CD = new CodigoDatos();
            CD.conexion();
            //MessageBox.Show("Si conecta BD");

            try
            {
                OdbcCommand sentencia = new OdbcCommand();
                sentencia.Connection = CD.conexion();
                sentencia.CommandText = "SELECT CONCAT(idCliente,', ', nombreCliente,' ', apellidoCliente) AS DatosCombinados2 FROM cliente";
                OdbcDataAdapter da2 = new OdbcDataAdapter(sentencia);
                DataTable dt2 = new DataTable();
                da2.Fill(dt2);
                comboBox3.ValueMember = "idCliente";
                comboBox3.DisplayMember = "DatosCombinados2";
                comboBox3.DataSource = dt2;
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

        
        private void button1_Click(object sender, EventArgs e)
        {
            string conversion3;
            string valor2 = comboBox3.Text.ToString();
            char delimiter = ',';
            string[] substrings2 = valor2.Split(delimiter);
            conversion3 = substrings2[0];
            //MessageBox.Show(conversion1);
            int conversion4 = Convert.ToInt32(conversion3);

            string Query3 = "alter view reporte_movs as select cliente_idCliente,saldo from movimientos_cliente where actual = 1 and cliente_idCliente like ('" + conversion4 + "%')";
            OdbcConnection MyConn3 = new OdbcConnection(MyConnection2);
            OdbcCommand MyCommand3 = new OdbcCommand(Query3, MyConn3);
            MyConn3.Open();
            OdbcDataReader reader = MyCommand3.ExecuteReader();

            Reporte_movimientos_cliente rpt = new Reporte_movimientos_cliente();
            rpt.ShowDialog();
            MyConn3.Close();
        }

        private void Reporte_Saldos_Load(object sender, EventArgs e)
        {

        }
    }
}
