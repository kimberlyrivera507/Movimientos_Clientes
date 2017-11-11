using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using System.Windows.Forms;
using System.Data.Odbc;
using System.Data;

/*   Kimberly Alejandra Rivera Gonzalez
     0901-14-1072
     Me toco el area de movimientos de clientes y este forma es de la capa de datos y se realiza la conexion a la base de datos
*/

namespace CapaDatos
{
    public class CodigoDatos
    {
        //establece conexion a la base de datos por ODBC
        public OdbcConnection conexion()
        {
            OdbcConnection con = new OdbcConnection();
            con = new OdbcConnection("Driver ={ MySQL ODBC 3.51 Driver }; Dsn=servidor_hotel; UID=root; PWD = ;");
            con.Open();
            return con;
        }

        //comprueba la conexion
        public bool comprobacionConexion()
        {
            try
            {
                conexion();
                return true;
            }
            catch (OdbcException ex)
            {
                return false;
            }
        }

        

    }
}
