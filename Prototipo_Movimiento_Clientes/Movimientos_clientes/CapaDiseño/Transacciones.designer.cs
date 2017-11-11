namespace Movimientos_clientes
{
    partial class Transacciones
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.Lbl_des = new System.Windows.Forms.Label();
            this.Lbl_cuenta = new System.Windows.Forms.Label();
            this.Lbl_accion = new System.Windows.Forms.Label();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.comboBox2 = new System.Windows.Forms.ComboBox();
            this.button1 = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.navegador1 = new Navegador.Navegador();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // Lbl_des
            // 
            this.Lbl_des.AutoSize = true;
            this.Lbl_des.Location = new System.Drawing.Point(208, 34);
            this.Lbl_des.Name = "Lbl_des";
            this.Lbl_des.Size = new System.Drawing.Size(86, 17);
            this.Lbl_des.TabIndex = 1;
            this.Lbl_des.Text = "Descripcion:";
            // 
            // Lbl_cuenta
            // 
            this.Lbl_cuenta.AutoSize = true;
            this.Lbl_cuenta.Location = new System.Drawing.Point(183, 155);
            this.Lbl_cuenta.Name = "Lbl_cuenta";
            this.Lbl_cuenta.Size = new System.Drawing.Size(127, 17);
            this.Lbl_cuenta.TabIndex = 2;
            this.Lbl_cuenta.Text = "Codigo de cuenta: ";
            // 
            // Lbl_accion
            // 
            this.Lbl_accion.AutoSize = true;
            this.Lbl_accion.Location = new System.Drawing.Point(252, 95);
            this.Lbl_accion.Name = "Lbl_accion";
            this.Lbl_accion.Size = new System.Drawing.Size(58, 17);
            this.Lbl_accion.TabIndex = 3;
            this.Lbl_accion.Text = "Accion: ";
            // 
            // comboBox1
            // 
            this.comboBox1.DisplayMember = "-Seleccionar-";
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Location = new System.Drawing.Point(326, 150);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(330, 24);
            this.comboBox1.TabIndex = 7;
            this.comboBox1.Tag = "";
            this.comboBox1.Text = "-Seleccionar-";
            this.comboBox1.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(323, 58);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(269, 32);
            this.label1.TabIndex = 9;
            this.label1.Text = "TRANSACCIONES";
            // 
            // comboBox2
            // 
            this.comboBox2.DisplayMember = "-Seleccionar-";
            this.comboBox2.FormattingEnabled = true;
            this.comboBox2.Items.AddRange(new object[] {
            "+",
            "-"});
            this.comboBox2.Location = new System.Drawing.Point(326, 92);
            this.comboBox2.Name = "comboBox2";
            this.comboBox2.Size = new System.Drawing.Size(121, 24);
            this.comboBox2.TabIndex = 24;
            this.comboBox2.Tag = "";
            this.comboBox2.Text = "-Seleccionar-";
            this.comboBox2.MouseClick += new System.Windows.Forms.MouseEventHandler(this.comboBox2_MouseClick);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(685, 506);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(122, 23);
            this.button1.TabIndex = 31;
            this.button1.Text = "GUARDAR";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Visible = false;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.textBox1);
            this.groupBox1.Controls.Add(this.Lbl_des);
            this.groupBox1.Controls.Add(this.Lbl_accion);
            this.groupBox1.Controls.Add(this.comboBox2);
            this.groupBox1.Controls.Add(this.comboBox1);
            this.groupBox1.Controls.Add(this.Lbl_cuenta);
            this.groupBox1.Location = new System.Drawing.Point(85, 247);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(741, 230);
            this.groupBox1.TabIndex = 32;
            this.groupBox1.TabStop = false;
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(326, 34);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(142, 22);
            this.textBox1.TabIndex = 25;
            // 
            // navegador1
            // 
            this.navegador1.Location = new System.Drawing.Point(81, 116);
            this.navegador1.Margin = new System.Windows.Forms.Padding(4);
            this.navegador1.Name = "navegador1";
            this.navegador1.Size = new System.Drawing.Size(745, 58);
            this.navegador1.sNombreBD = null;
            this.navegador1.sNombreTabla = null;
            this.navegador1.sPass = null;
            this.navegador1.sResult = null;
            this.navegador1.sServidor = null;
            this.navegador1.sUsuario = null;
            this.navegador1.TabIndex = 33;
            this.navegador1.RecibidorInsertar += new System.EventHandler(this.navegador1_RecibidorInsertar);
            // 
            // Transacciones
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.DarkKhaki;
            this.ClientSize = new System.Drawing.Size(897, 551);
            this.Controls.Add(this.navegador1);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.label1);
            this.Name = "Transacciones";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "6106 Mantenimiento de transacciones";
            this.Load += new System.EventHandler(this.Transacciones_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Label Lbl_des;
        private System.Windows.Forms.Label Lbl_cuenta;
        private System.Windows.Forms.Label Lbl_accion;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.GroupBox groupBox1;
        public System.Windows.Forms.TextBox textBox1;
        public System.Windows.Forms.ComboBox comboBox2;
        public System.Windows.Forms.ComboBox comboBox1;
        private Navegador.Navegador navegador1;
    }
}