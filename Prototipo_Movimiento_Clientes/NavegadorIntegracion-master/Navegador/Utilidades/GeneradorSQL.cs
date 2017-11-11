using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace Navegador.Utilidades
{
    public class GeneradorSQL
    {

            private int CodigoDML;
            private bool fullCampos;
            private string nombreTabla;
            private string textoComparativo;
            private ArrayList valores = new ArrayList();
            private Conector con;
            private ArrayList campos = new ArrayList();
            private string server, db, user, pass;

        public GeneradorSQL() {


        }

        public GeneradorSQL(string server,string db, string user, string pass,string tabla) {
            this.server = server;
            this.db = db;
            this.user = user;
            this.pass = pass;
            this.nombreTabla = tabla;
        }


        /**
            * Establece el tipo de SQL que se desea crear 'SELECT','INSERT','UPDATE','DELETE'
            * @param CodigoDML los parametros permitidos son los siguientes: <br />
              * 
              * 1.INSERT<br />
              * 2.UPDATE<br />
              * 3.DELETE<br />
        */
        public void setCodigoInstDML(int CodigoDML)
        {
            this.CodigoDML = CodigoDML;
        }
        
        /**
         * Permite establecer los campos que se afectaran en la tabla dependiendo de el codigoDML que fue ingresado.
        * @param campos Lista de todo los campos que se quieren afectar.
        * 
        * EJEMPLO:
        *  ArrayList campos = new ArrayList();
        *  campos.add("id");
        */
        public void setCampos(ArrayList campos)
        {
            this.campos = campos;
        }

        /**
         * Establece los valores que seran usado dependiendo de tipo de codigoDML
        * @param valores Lista de todo los valores que se quieren utilizar.
        * 
        * EJEMPLO:
        *  ArrayList valores = new ArrayList();
        *  valores.add("id");
        */
        public void setValores(ArrayList valores)
        {
            this.valores = valores;
        }


        public void setComparacion(String textoComparativo)
        {
            this.textoComparativo = textoComparativo;
        }

        public void setComparacion(String campo, String valor)
        {
            this.textoComparativo = "WHERE " + campo + "='" + valor + "'";
        }


        public void ejecutar()
        {
            string SQL;
            con = new Conector(this.server,this.db,this.user,this.pass);
            con.OpenConnection();
            if (this.CodigoDML != -1)
            {
                switch (this.CodigoDML)
                {
                    
                    case 1:
                        SQL = insert();
                        con.consultarSinRetorno(SQL);
                        break;
                    case 2:
                        SQL = update();
                        con.consultarSinRetorno(SQL);
                        break;
                    case 3:
                        SQL = delete();
                        con.consultarSinRetorno(SQL);
                        break;
                    default:
                        MessageBox.Show("Error opcion fuera del los parametros");
                        break;
                }
            }
            else
            {
                MessageBox.Show("No a selecionado una opcion");
            }
        }

        public string insert()
        {
            String SQL = "";
            if (this.fullCampos == true && this.valores != null && this.valores.Count != 0)
            {
                try
                {
                    SQL = "INSERT INTO " + this.nombreTabla;
                    SQL += " VALUES (";
                    for (int n = 0; n < this.valores.Count; n++)
                    {
                        if ((n + 1) != this.valores.Count)
                        {
                            SQL += "'" + this.valores[n] + "'" + ",";
                        }
                        else
                        {
                            SQL += "'" + this.valores[n] + "'";
                        }
                    }
                    SQL += ");";
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show(ex.Message);
                }
                    } else if(this.fullCampos==false && this.campos !=null && this.valores !=null && this.campos.Count != 0 && this.valores.Count != 0){
                 SQL = "INSERT INTO " + this.nombreTabla + " (";
                for (int n = 0; n < this.campos.Count; n++)
                     {
                         if ((n + 1) != this.campos.Count)
                    {
                        SQL += this.campos[n] + ",";
                    }
                    else
                    {
                    SQL += this.campos[n];
                    }
               }
            SQL += ") VALUES (";
                  for (int n = 0; n < this.valores.Count; n++)
                    {
                        if ((n + 1) != this.valores.Count)
                            {
                                SQL += "'" + this.valores[n]+ "'" + ",";
                            }
                            else
                             {
                                SQL += "'" + this.valores[n] + "'";
                              }
                    }
             SQL += ");";
            }
            return SQL;
            }


        public String update()
        {
            String SQL = "";
            if (this.fullCampos == true && this.valores != null && this.valores.Count != 0 && this.textoComparativo != null && this.textoComparativo.Length != 0)
            {
                try
                {
                    SQL = "UPDATE " + this.nombreTabla + " SET ";
                    for (int n = 0; n < this.campos.Count; n++)
                    {
                        if ((n + 1) != this.campos.Count)
                        {
                            SQL += this.campos[n] + "='" + this.valores[n] + "',";
                        }
                        else
                        {
                            SQL += this.campos[n] + "='" + this.valores[n] + "'";
                        }
                    }
                    SQL += " " + this.textoComparativo;
                    SQL += ";";
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show(ex.Message);
                }
                } else if(this.fullCampos==false && this.campos !=null && this.valores !=null && this.campos.Count != 0 && this.valores.Count != 0 && this.textoComparativo !=null && this.textoComparativo.Length != 0){
                    SQL = "UPDATE " + this.nombreTabla + " SET ";
                    for (int n = 0; n < this.campos.Count; n++)
                     {
                    if ((n + 1) != this.campos.Count)
                     {
                        SQL += this.campos[n] + "='" + this.valores[n] + "',";
                        }
                    else
                     {
                    SQL += this.campos[n] + "='" + this.valores[n] + "'";
                    }
                    }
                    SQL += " " + this.textoComparativo;
                     SQL += ";";
            }
             if(this.textoComparativo == null 
               || this.textoComparativo.Length == 0){
            MessageBox.Show("No ser permite update sin comparacion WHERE");
         }
            return SQL;

        }


        public string delete()
        {
            string SQL = "";
            if (this.textoComparativo != null && this.textoComparativo.Length != 0)
            {
                SQL = "DELETE FROM " + this.nombreTabla + " " + this.textoComparativo + " ;";
            }
            return SQL;
        }


    }
}
