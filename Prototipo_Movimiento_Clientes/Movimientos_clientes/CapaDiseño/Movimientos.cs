using CapaDiseño;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

/*   Kimberly Alejandra Rivera Gonzalez
     0901-14-1072
     Me toco el area de movimientos de clientes y este form realiza
     es el form padre de todo el proyecto
*/

namespace Movimientos_clientes
{
    public partial class Movimientos : Form
    {

        int num_form = 6103;
        //constructor de este form
        public Movimientos()
        {
            InitializeComponent();
        }

        // se redirecciona a otro form el de transacciones
        private void transaccionesClientesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Vision_trans trans = new Vision_trans();
            trans.MdiParent = this;
            trans.Show();
        }

        // se redirecciona a otro form el de movimientos de clientes
        private void movimientosDeClientesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Vision_movs vision = new Vision_movs();
            vision.MdiParent = this;
            vision.Show();
        }

        private void Movimientos_Load(object sender, EventArgs e)
        {

        }

        private void movimientosClientesToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void reporteDeSaldosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Reporte_Saldos RS = new Reporte_Saldos();
            RS.Show();
        }

        private void reporteDeTransaccionesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Reporte_Transacciones_C trans_report = new Reporte_Transacciones_C();
            trans_report.Show();
        }
    }
}
