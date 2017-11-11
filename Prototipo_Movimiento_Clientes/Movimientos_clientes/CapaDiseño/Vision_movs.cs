using CapaDatos;
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
    el se visualiza la lista de los movimientos de los clientes
    al presionar dos veces cualquier datos de la tabla nos redireccionara a 
    otro form con los datos que estan en la base de datos sobre la fila que seleccionamos
*/

namespace CapaDiseño
{
    public partial class Vision_movs : Form
    {
        int num_form = 6107;
        //constructor
        public Vision_movs()
        {
            InitializeComponent();
            llenarTablaM();
        }

        // se redirecciona a otro form
        private void button1_Click(object sender, EventArgs e)
        {
            
            Mov_clientes_nuevo movess = new Mov_clientes_nuevo();
            movess.Show();
            this.Hide();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        string MyConnection2 = "Driver ={ MySQL ODBC 3.51 Driver }; Dsn=servidor_hotel; UID=root; PWD = ;  ";


        // llena una tabla al iniciar con los datos de una vista realizada en la base de datos
        public void llenarTablaM()
        {
            try
            {
                string Query = "select * from vista_movimientos;";
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

        // llena una tabla con lo que se inicializa que es la vista realizada en la base de datos
        private void Vision_movs_Load(object sender, EventArgs e)
        {
            llenarTablaM();
        }

        /*      se redirecciona a otro form al darle doble clic en la tabla
                 al presionar dos veces cualquier datos de la tabla nos redireccionara a 
                 otro form con los datos que estan en la base de datos sobre la fila que seleccionamos
        */
        string nuevo_nombre;
        private void dataGridView1_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            this.Hide();
            Mov_clientes moves = new Mov_clientes();

            string columna = dataGridView1.CurrentCell.RowIndex.ToString();//selecciona numero de columna
            int columna_id = Convert.ToInt32(columna);
            string dato1 = dataGridView1.Rows[columna_id].Cells[0].Value.ToString();
            Globales.datoint = Convert.ToInt32(dato1);
            //MessageBox.Show(Globales.datoint.ToString());


            string Query = "select m.total_cobro,m.saldo,m.fecha,m.Transacciones_cod_transacciones,m.cliente_idCliente,m.fechaVencimiento,m.actual from movimientos_cliente m" +
               " where Id_mov_cliente = " + Globales.datoint + ";";
            OdbcConnection MyConn2 = new OdbcConnection(MyConnection2);
            OdbcCommand MyCommand2 = new OdbcCommand(Query, MyConn2);
            MyConn2.Open();
            OdbcDataReader reader = MyCommand2.ExecuteReader();
            //lee datos de la base de datos y los coloca en sus correspondientes combobox y textBox
            if (reader.Read())
            {
                float t_total_cobro = (float)reader["total_cobro"];
                moves.textBox3.Text = t_total_cobro.ToString();
                float t_saldo= (float)reader["saldo"];
                moves.textBox2.Text = t_saldo.ToString();
                //int t_cod_trans = (int)reader["Transacciones_cod_transacciones"];
                //moves.comboBox1.Text = t_cod_trans.ToString();
                int t_cliente = (int)reader["cliente_idCliente"];
                moves.comboBox3.Text = t_cliente.ToString();
                
                DateTime t_fecha = (DateTime)reader["fecha"];
                string formateddate3 = t_fecha.ToString("yyyy-MM-dd");
                DateTime fecha_anterior = DateTime.Parse(formateddate3);
                moves.dateTimePicker1.Value = fecha_anterior;
                DateTime t_fecha2 = (DateTime)reader["fechaVencimiento"];
                string formateddate4 = t_fecha2.ToString("yyyy-MM-dd");
                DateTime fecha_anterior2 = DateTime.Parse(formateddate4);
                moves.dateTimePicker2.Value = fecha_anterior2;
                moves.textBox2.Enabled = false;
                int dato_actual = (int)reader["actual"];
                if (dato_actual == 0)
                {
                    moves.textBox3.Enabled = false;
                }
            }

            reader.Close();

            MyConn2.Close();
            moves.Show();
        }
        //se realizo la prueba para que obtuviera el id de la celda que presionara, la cual fue usada cuando se da doble clic, es decir, en la funcion de arriba

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            string columna = dataGridView1.CurrentCell.RowIndex.ToString();//selecciona numero de columna
            int columna_id = Convert.ToInt32(columna);

            //MessageBox.Show(dataGridView1.Rows[columna_id].Cells[0].Value.ToString());  
            
        }

        //se intento realizar una busqueda sobre los nombres en la base de datos para los movimientos de los clientes.
        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            //Select* from table where name like '%' + search_criteria + '%'
            //int numero = Convert.ToInt32(textBox1.Text);
            //Query = "select * from movimientos_cliente where cliente_idCliente like '%' + numero + '%'";
            
        }
    }
}
