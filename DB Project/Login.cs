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
    public partial class Login : KryptonForm
    {
        Controller controllerObj;
        public Login()
        {
            InitializeComponent();
            controllerObj = new Controller();
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
            if (a == 0 && c == 0 && u == 0)
            {
                MessageBox.Show("Incorrect Username or Password");
                return;
            }

            if (a == 1)
            {
                int x = controllerObj.searchAdmin(kryptonTextBox1.Text.ToString(), Convert.ToInt32(kryptonTextBox2.Text));
                if (x == 0)
                {
                    MessageBox.Show("Incorrect Username or Password");
                    return;
                }

                this.Hide();
                Admin f = new Admin();
                f.Show();
            }

            if (c == 1)
            {
                int x = controllerObj.searchClub(kryptonTextBox1.Text.ToString(), Convert.ToInt32(kryptonTextBox2.Text));
                if (x == 0)
                {
                    MessageBox.Show("Incorrect Username or Password");
                    return;
                }

                this.Hide();
                Club f = new Club();
                f.Show();
            }

            if (u == 1)
            {
                int x = controllerObj.searchUser(kryptonTextBox1.Text.ToString(), Convert.ToInt32(kryptonTextBox2.Text));
                if (x == 0)
                {
                    MessageBox.Show("Incorrect Username or Password");
                    return;
                }

                this.Hide();
                User f = new User();
                f.Show();
            }
        }

        private void Login_Load(object sender, EventArgs e)
        {

        }

        private void kryptonLabel3_Paint(object sender, PaintEventArgs e)
        {

        }

        private void kryptonButton2_Click(object sender, EventArgs e)
        {
            this.Hide();
            SignUp f = new SignUp();
            f.Show();
        }
    }
}
