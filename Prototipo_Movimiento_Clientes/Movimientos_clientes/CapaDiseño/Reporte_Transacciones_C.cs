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
    public partial class Reporte_Transacciones_C : Form
    {

        int num_form = 6105;
        string MyConnection2 = "Driver ={ MySQL ODBC 3.51 Driver }; Dsn=servidor_hotel; UID=root; PWD = ;  ";

        public Reporte_Transacciones_C()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {

            string Query3 = "alter view reporte_trans as select cod_transacciones,descripcion,accion,cuentacontabilidad_nomenclatura from transacciones";
            OdbcConnection MyConn3 = new OdbcConnection(MyConnection2);
            OdbcCommand MyCommand3 = new OdbcCommand(Query3, MyConn3);
            MyConn3.Open();
            OdbcDataReader reader = MyCommand3.ExecuteReader();

            Reporte_transacciones_cliente rpt = new Reporte_transacciones_cliente();
            rpt.ShowDialog();
            MyConn3.Close();
        }

        private void Reporte_Transacciones_C_Load(object sender, EventArgs e)
        {

        }
    }
}
