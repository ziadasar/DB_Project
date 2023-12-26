using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ComponentFactory.Krypton.Toolkit;

namespace DB_Project
{
    public partial class Admin : KryptonForm
    {
        public Admin()
        {
            InitializeComponent();
        }

        private void Admin_Load(object sender, EventArgs e)
        {

        }

        private void kryptonButton4_Click(object sender, EventArgs e)
        {
            if (kryptonPanel1.Visible)
                kryptonPanel1.Visible = false;
            else
                kryptonPanel1.Visible = true;
        }

        private void kryptonButton1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Login f = new Login();
            f.Show();
        }

        private void kryptonButton2_Click(object sender, EventArgs e)
        {
            AddAdmin f = new AddAdmin();
            this.Hide();
            f.Show();
        }
    }
}
