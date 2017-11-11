using CapaDatos;
using CapaDiseño;
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

// Kimberly Alejandra Rivera Gonzalez
// 0901-14-1072
// Me toco el area de movimientos de clientes y este form realiza
// el ingreso de todos los movimientos de los clientes

namespace Movimientos_clientes
{
    public partial class Mov_clientes : Form
    {
        int num_form = 6101;
        string MyConnection2 = "Driver ={ MySQL ODBC 3.51 Driver }; Dsn=servidor_hotel; UID=root; PWD = ;  ";

        //constructor de este form
        public Mov_clientes()
        {
            InitializeComponent();
            mostrar_cod_trans();
          //  mostrar_clientes();

        }

        private void mostrar_cod_trans()
        {
            CodigoDatos CD = new CodigoDatos();
            CD.conexion();
            //MessageBox.Show("Si conecta BD");

            try
            {
                OdbcCommand sentencia = new OdbcCommand();
                sentencia.Connection = CD.conexion();
                sentencia.CommandText = "SELECT CONCAT(cod_transacciones,', ', descripcion) AS DatosCombinados1 FROM transacciones";
                OdbcDataAdapter da1 = new OdbcDataAdapter(sentencia);
                DataTable dt = new DataTable();
                da1.Fill(dt);
                comboBox1.ValueMember = "cod_transacciones";
                comboBox1.DisplayMember = "DatosCombinados1";
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



        int idd;
        //muestra en los comboBox los datos de la base de datos sobre el nombre y apellido de clientes que hay ingresados.
        private void mostrar_clientes()
        {
            CodigoDatos CD = new CodigoDatos();
            CD.conexion();
            //MessageBox.Show("Si conecta BD");

            try
            {
                string variable = comboBox3.Text;
                //MessageBox.Show(variable);
                OdbcCommand sentencia = new OdbcCommand();
                sentencia.Connection = CD.conexion();
                sentencia.CommandText = "select idCliente,nombreCliente, apellidoCliente from cliente where idCliente=" + comboBox3.Text.ToString() + ";";
                OdbcDataAdapter da2 = new OdbcDataAdapter(sentencia);
                DataTable dt2 = new DataTable();
                da2.Fill(dt2);
                //comboBox3.ValueMember = "idCliente";
                //comboBox3.DisplayMember = "idCliente";
                //comboBox3.DataSource = dt2;
                comboBox4.DataSource = dt2;
                comboBox4.ValueMember = "nombreCliente";
                comboBox5.DataSource = dt2;
                comboBox5.ValueMember = "apellidoCliente";
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

        private void Lbl_cod_Click(object sender, EventArgs e)
        {

        }
        //redirecciona a otro form cuando este en el mismo para actualizar los datos nuevos
        private void Mov_clientes_Load(object sender, EventArgs e)
        {
            CodigoDatos CD = new CodigoDatos();
            CD.conexion();
            mostrar_clientes();
        }
        
        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            

        }


        string action;
        double total;
        double dato_accion;
        double total_resta;
        double total_suma;

        /*Esta es la programacion del boton guardar, el cual esta aparte y no en la barra de navegacion pero ya es solo de incorporarla
         */
        private void button1_Click(object sender, EventArgs e)
        {
            int codigo = Convert.ToInt32(comboBox1.Text.ToString());
            total = Convert.ToDouble(textBox2.Text);
            if (textBox3.Text == "")
            {
                textBox3.Text = "0";
            }
            dato_accion = Convert.ToDouble(textBox3.Text);
            
                string formateddate = dateTimePicker1.Value.ToString("yyyyMMdd");
                string formateddate2 = dateTimePicker2.Value.ToString("yyyyMMdd");
                string Query;
                OdbcConnection MyConn2; OdbcCommand MyCommand2; OdbcDataReader MyReader2;
                string Query3 = "select accion from transacciones where cod_transacciones =" + codigo + ";";
                OdbcConnection MyConn3 = new OdbcConnection(MyConnection2);
                OdbcCommand MyCommand3 = new OdbcCommand(Query3, MyConn3);
                MyConn3.Open();
                OdbcDataReader reader = MyCommand3.ExecuteReader();

            //lee el valor de la accion seleccionada

                if (reader.Read())
                {
                    action = (string)reader["accion"];
                }

                reader.Close();

                MyConn3.Close();
        //si el contenido de la accion es suma realiza suma e ingresa en tabla
                if (action == "+")
                {
                    total_suma = total + dato_accion;
                    Query = "insert into movimientos_cliente(Transacciones_cod_transacciones,cliente_idCliente,total_cobro,saldo,fecha,fechaVencimiento) values('" + Convert.ToInt32(comboBox1.Text.ToString()) + "',' " + Convert.ToInt32(comboBox3.Text.ToString()) + "',' " + Convert.ToDouble(textBox3.Text.ToString()) + "','" + total_suma + "','" + formateddate + "','" + formateddate2 + "')";
                    MyConn2 = new OdbcConnection(MyConnection2);
                    MyCommand2 = new OdbcCommand(Query, MyConn2);
                    MyConn2.Open();
                    MyReader2 = MyCommand2.ExecuteReader();
                    MessageBox.Show("Datos Ingresados Exitosamente");
                    Vision_movs vision = new Vision_movs();
                    vision.Show();
                    this.Hide();
            } //si el contenido de la accion es resta realiza resta e ingresa en tabla

            else if (action == "-")
                {
                         if (dato_accion > total)
                        {
                             MessageBox.Show("Ingresar una cantidad menor al saldo");
                        }
                            else
                        {
                    total_resta = total - dato_accion;
                    Query = "insert into movimientos_cliente(Transacciones_cod_transacciones,cliente_idCliente,total_cobro,saldo,fecha,fechaVencimiento) values('" + Convert.ToInt32(comboBox1.Text.ToString()) + "',' " + Convert.ToInt32(comboBox3.Text.ToString()) + "',' " + Convert.ToDouble(textBox3.Text.ToString()) + "','" + total_resta + "','" + formateddate + "','" + formateddate2 + "')";
                    MyConn2 = new OdbcConnection(MyConnection2);
                    MyCommand2 = new OdbcCommand(Query, MyConn2);
                    MyConn2.Open();
                    MyReader2 = MyCommand2.ExecuteReader();
                    MessageBox.Show("Datos Ingresados Exitosamente");
                    Vision_movs vision = new Vision_movs();
                    vision.Show();
                    this.Hide();
                }
                }
                else
                {
                //si el contenido de la accion no es igual a suma o resta, manda un mensaje de error

                MessageBox.Show("La accion de la transaccion es incorrecto.");
                }
            
            
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void label8_Click(object sender, EventArgs e)
        {

        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
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

            
            string valor2 = comboBox3.Text.ToString();
            //MessageBox.Show(conversion1);
            int conversion4 = Convert.ToInt32(valor2);


            int codigo = conversion2;
            total = Convert.ToDouble(textBox2.Text);
            if (textBox3.Text == "")
            {
                textBox3.Text = "0";
            }
            dato_accion = Convert.ToDouble(textBox3.Text);

            string formateddate = dateTimePicker1.Value.ToString("yyyyMMdd");
            string formateddate2 = dateTimePicker2.Value.ToString("yyyyMMdd");

            string Query; string QueryUp;
            OdbcConnection MyConnUp; OdbcCommand MyCommand2Up; OdbcDataReader MyReader2;
            OdbcConnection MyConn2; OdbcCommand MyCommand2; OdbcDataReader MyReader2Up;
            string Query3 = "select accion from transacciones where cod_transacciones =" + codigo + ";";
            OdbcConnection MyConn3 = new OdbcConnection(MyConnection2);
            OdbcCommand MyCommand3 = new OdbcCommand(Query3, MyConn3);
            MyConn3.Open();
            OdbcDataReader reader = MyCommand3.ExecuteReader();

            //lee el valor de la accion seleccionada

            if (reader.Read())
            {
                action = (string)reader["accion"];
            }

            reader.Close();
            int act = 1; int actu = 0;
            MyConn3.Close();
            //si el contenido de la accion es suma realiza suma e ingresa en tabla
            if (action == "+")
            {
                QueryUp = "UPDATE movimientos_cliente SET actual = '" + actu + "' WHERE Id_mov_cliente = '" + Globales.datoint + "'";
                MyConnUp = new OdbcConnection(MyConnection2);
                MyCommand2Up = new OdbcCommand(QueryUp, MyConnUp);
                MyConnUp.Open();
                MyReader2Up = MyCommand2Up.ExecuteReader();
                total_suma = total + dato_accion;
                Query = "insert into movimientos_cliente(Transacciones_cod_transacciones,cliente_idCliente,total_cobro,saldo,fecha,fechaVencimiento,actual) values('" + conversion2 + "',' " + conversion4 + "',' " + Convert.ToDouble(textBox3.Text.ToString()) + "','" + total_suma + "','" + formateddate + "','" + formateddate2 + "','" + act + "')";
                MyConn2 = new OdbcConnection(MyConnection2);
                MyCommand2 = new OdbcCommand(Query, MyConn2);
                MyConn2.Open();
                MyReader2 = MyCommand2.ExecuteReader();
                MessageBox.Show("Datos Ingresados Exitosamente");
                Vision_movs vision = new Vision_movs();
                vision.Show();
                this.Hide();
            } //si el contenido de la accion es resta realiza resta e ingresa en tabla

            else if (action == "-")
            {
                if (dato_accion > total)
                {
                    MessageBox.Show("Ingresar una cantidad menor al saldo");
                }
                else
                {
                    QueryUp = "UPDATE movimientos_cliente SET actual = '" + actu + "' WHERE Id_mov_cliente = '" + Globales.datoint + "'";
                    MyConnUp = new OdbcConnection(MyConnection2);
                    MyCommand2Up = new OdbcCommand(QueryUp, MyConnUp);
                    MyConnUp.Open();
                    MyReader2Up = MyCommand2Up.ExecuteReader();

                    total_resta = total - dato_accion;
                    Query = "insert into movimientos_cliente(Transacciones_cod_transacciones,cliente_idCliente,total_cobro,saldo,fecha,fechaVencimiento,actual) values('" + conversion2 + "',' " + conversion4 + "',' " + Convert.ToDouble(textBox3.Text.ToString()) + "','" + total_resta + "','" + formateddate + "','" + formateddate2 + "','" + act + "')";
                    MyConn2 = new OdbcConnection(MyConnection2);
                    MyCommand2 = new OdbcCommand(Query, MyConn2);
                    MyConn2.Open();
                    MyReader2 = MyCommand2.ExecuteReader();
                    MessageBox.Show("Datos Ingresados Exitosamente");
                    Vision_movs vision = new Vision_movs();
                    vision.Show();
                    this.Hide();
                }
            }
            else
            {
                //si el contenido de la accion no es igual a suma o resta, manda un mensaje de error

                MessageBox.Show("La accion de la transaccion es incorrecto.");
            }


        }

        private void navegador1_Load(object sender, EventArgs e)
        {

        }
    }
}
