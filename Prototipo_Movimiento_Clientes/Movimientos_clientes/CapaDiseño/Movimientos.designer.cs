namespace Movimientos_clientes
{
    partial class Movimientos
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
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.movimientosClientesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.transaccionesClientesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.movimientosDeClientesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.reportesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.reporteDeSaldosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.reporteDeTransaccionesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.BackColor = System.Drawing.Color.DarkKhaki;
            this.menuStrip1.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.movimientosClientesToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(1031, 28);
            this.menuStrip1.TabIndex = 0;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // movimientosClientesToolStripMenuItem
            // 
            this.movimientosClientesToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.transaccionesClientesToolStripMenuItem,
            this.movimientosDeClientesToolStripMenuItem,
            this.reportesToolStripMenuItem});
            this.movimientosClientesToolStripMenuItem.Name = "movimientosClientesToolStripMenuItem";
            this.movimientosClientesToolStripMenuItem.Size = new System.Drawing.Size(163, 24);
            this.movimientosClientesToolStripMenuItem.Text = "Movimientos Clientes";
            this.movimientosClientesToolStripMenuItem.Click += new System.EventHandler(this.movimientosClientesToolStripMenuItem_Click);
            // 
            // transaccionesClientesToolStripMenuItem
            // 
            this.transaccionesClientesToolStripMenuItem.Name = "transaccionesClientesToolStripMenuItem";
            this.transaccionesClientesToolStripMenuItem.Size = new System.Drawing.Size(245, 26);
            this.transaccionesClientesToolStripMenuItem.Text = "Transacciones clientes";
            this.transaccionesClientesToolStripMenuItem.Click += new System.EventHandler(this.transaccionesClientesToolStripMenuItem_Click);
            // 
            // movimientosDeClientesToolStripMenuItem
            // 
            this.movimientosDeClientesToolStripMenuItem.Name = "movimientosDeClientesToolStripMenuItem";
            this.movimientosDeClientesToolStripMenuItem.Size = new System.Drawing.Size(245, 26);
            this.movimientosDeClientesToolStripMenuItem.Text = "Movimientos de clientes";
            this.movimientosDeClientesToolStripMenuItem.Click += new System.EventHandler(this.movimientosDeClientesToolStripMenuItem_Click);
            // 
            // reportesToolStripMenuItem
            // 
            this.reportesToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.reporteDeSaldosToolStripMenuItem,
            this.reporteDeTransaccionesToolStripMenuItem});
            this.reportesToolStripMenuItem.Name = "reportesToolStripMenuItem";
            this.reportesToolStripMenuItem.Size = new System.Drawing.Size(245, 26);
            this.reportesToolStripMenuItem.Text = "Reportes";
            // 
            // reporteDeSaldosToolStripMenuItem
            // 
            this.reporteDeSaldosToolStripMenuItem.Name = "reporteDeSaldosToolStripMenuItem";
            this.reporteDeSaldosToolStripMenuItem.Size = new System.Drawing.Size(251, 26);
            this.reporteDeSaldosToolStripMenuItem.Text = "Reporte de saldos";
            this.reporteDeSaldosToolStripMenuItem.Click += new System.EventHandler(this.reporteDeSaldosToolStripMenuItem_Click);
            // 
            // reporteDeTransaccionesToolStripMenuItem
            // 
            this.reporteDeTransaccionesToolStripMenuItem.Name = "reporteDeTransaccionesToolStripMenuItem";
            this.reporteDeTransaccionesToolStripMenuItem.Size = new System.Drawing.Size(251, 26);
            this.reporteDeTransaccionesToolStripMenuItem.Text = "Reporte de transacciones";
            this.reporteDeTransaccionesToolStripMenuItem.Click += new System.EventHandler(this.reporteDeTransaccionesToolStripMenuItem_Click);
            // 
            // Movimientos
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.DarkKhaki;
            this.ClientSize = new System.Drawing.Size(1031, 464);
            this.Controls.Add(this.menuStrip1);
            this.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.IsMdiContainer = true;
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "Movimientos";
            this.Text = "6103 Movimientos";
            this.TransparencyKey = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(224)))), ((int)(((byte)(192)))));
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.Movimientos_Load);
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem movimientosClientesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem transaccionesClientesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem movimientosDeClientesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem reportesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem reporteDeSaldosToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem reporteDeTransaccionesToolStripMenuItem;
    }
}

