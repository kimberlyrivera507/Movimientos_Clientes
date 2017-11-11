using Movimientos_clientes;
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

/*  Kimberly Alejandra Rivera Gonzalez
    0901-14-1072
    Me toco el area de movimientos de clientes y este form realiza
    aqui solo se visualiza la lista de transacciones que se hay, 
    al presionar dos veces cualquier datos de la tabla nos redireccionara a 
    otro form con los datos que estan en la base de datos sobre la fila que seleccionamos
*/

namespace CapaDiseño
{
    public partial class Vision_trans : Form
    {
        int num_form = 6108;
        // el constructor de este form
        public Vision_trans()
        {
            InitializeComponent();
            llenarTablaT();
        }

        string MyConnection2 = "Driver ={ MySQL ODBC 3.51 Driver }; Dsn=servidor_hotel; UID=root; PWD = ;";

        // llena tabla al inicio con una vista realizada en la base de datos
        public void llenarTablaT()
        {
            try
            {
                string Query = "select * from vista_transacciones;";
                OdbcConnection MyConn2 = new OdbcConnection(MyConnection2);
                OdbcCommand MyCommand2 = new OdbcCommand(Query, MyConn2);
                OdbcDataAdapter MyAdapter = new OdbcDataAdapter();
                MyAdapter.SelectCommand = MyCommand2;
                DataTable dTable = new DataTable();
                MyAdapter.Fill(dTable);
                dataGridView1.DataSource = dTable;
                
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        // se redirecciona a otro form al presionar el boton nuevo
        private void button1_Click(object sender, EventArgs e)
        {
            
            Transacciones trans_m = new Transacciones();
            trans_m.Show();
            this.Hide();
        }

        // llena la tabla al inicio de los datos de la tabla de transacciones de la base de datos
        private void Vision_trans_Load(object sender, EventArgs e)
        {
            llenarTablaT();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        // se redirecciona a otro form al darle el doble clic a alguna celda de la tabla,  y coloca los datos en su posicion correspondiente.
        private void dataGridView1_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            this.Hide();
            Transacciones trans_m = new Transacciones();
            
            string columna = dataGridView1.CurrentCell.RowIndex.ToString();//selecciona numero de columna
            int columna_id = Convert.ToInt32(columna);
            string dato1 = dataGridView1.Rows[columna_id].Cells[0].Value.ToString();
            int datoint = Convert.ToInt32(dato1);
            //MessageBox.Show(datoint.ToString()); 


            string Query = "select descripcion,accion,cuentacontabilidad_nomenclatura from transacciones where cod_transacciones =" + datoint + ";";
            OdbcConnection MyConn2 = new OdbcConnection(MyConnection2);
            OdbcCommand MyCommand2 = new OdbcCommand(Query, MyConn2);
            MyConn2.Open();
            OdbcDataReader reader = MyCommand2.ExecuteReader();
            // coloca en los textBox, y comboBox correspondientes la informacion que se obtiene de la base de datos
            if (reader.Read())
            {
                trans_m.textBox1.Text = (string)reader["descripcion"];
                trans_m.comboBox2.Text = (string)reader["accion"];
                int cuenta_num = (int) reader["cuentacontabilidad_nomenclatura"];
                trans_m.comboBox1.Text = cuenta_num.ToString();
            }

            reader.Close();

            MyConn2.Close();
            trans_m.Show();
        }

        //se realizo la prueba para que obtuviera el id de la celda que presionara, la cual fue usada cuando se da doble clic, es decir, en la funcion de arriba
        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            string columna = dataGridView1.CurrentCell.RowIndex.ToString();//selecciona numero de columna
            int columna_id = Convert.ToInt32(columna);

            //MessageBox.Show(dataGridView1.Rows[columna_id].Cells[0].Value.ToString());  

        }
    }
}
