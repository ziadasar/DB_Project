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
    public partial class AddAdmin : KryptonForm
    {
        Controller controllerObj;
        public AddAdmin()
        {
            InitializeComponent();
            controllerObj = new Controller();
        }

        private void AddAdmin_Load(object sender, EventArgs e)
        {

        }

        private void kryptonButton1_Click(object sender, EventArgs e)
        {
            if (kryptonTextBox1.Text == "" || kryptonTextBox2.Text == "")
            {
                MessageBox.Show("Please enter Username and Password");
                return;
            }

            int u = controllerObj.isFoundUser(kryptonTextBox1.Text);
            int c = controllerObj.isFoundClub(kryptonTextBox1.Text);
            int a = controllerObj.isFoundAdmin(kryptonTextBox1.Text);
            if (a == 1 || c == 1 || u == 1)
            {
                MessageBox.Show("Username already exists!");
                return;
            }

            int x = controllerObj.InsertAdmin(kryptonTextBox1.Text.ToString(), Convert.ToInt32(kryptonTextBox2.Text));
            if (x == 1)
                MessageBox.Show("Admin created successfully");
        }
    }
}
