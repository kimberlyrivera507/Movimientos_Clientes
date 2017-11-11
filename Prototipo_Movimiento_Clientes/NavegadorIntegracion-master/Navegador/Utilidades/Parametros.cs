using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Navegador.Utilidades
{
    public class Parametros
    {
        private string sServidor,sBD,sUsuario,sContra;
        private string msg;

        public string Msg
        {
            get { return msg; }
            set { msg = value; }
            
        }

        public String Servidor
        {
            get{  return sServidor; } set { sServidor = value; }
        }
        public String BD{
            get { return sBD; } set { sBD = value; } 
        }
        public String Usuario
        {
            get { return sUsuario; } set { sUsuario = value; }
        }
        public String Contraseña
        {
            get {return sContra; } set {sContra = value; }
        }
        

    }
}
