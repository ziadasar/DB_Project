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
    public partial class Welcome : KryptonForm
    {
        Controller controllerObj;
        public Welcome()
        {
            InitializeComponent();
            controllerObj = new Controller();
        }

        private void Welcome_Load(object sender, EventArgs e)
        {

        }

        private void Username_TextChanged(object sender, EventArgs e)
        {

        }

        private void kryptonWrapLabel1_Click(object sender, EventArgs e)
        {

        }

        private void kryptonButton1_Click(object sender, EventArgs e)
        {
            if (kryptonTextBox1.Text == "" || kryptonTextBox2.Text == "")
            {
                MessageBox.Show("Please enter Username and Password");
                return;
            }
            kryptonLabel1.Text = "Sign up as:";
            kryptonLabel1.Visible = true;
            kryptonButton3.Visible = true;
            kryptonButton4.Visible = true;
            kryptonButton5.Visible = true;
        }

        private void kryptonButton2_Click(object sender, EventArgs e)
        {
            kryptonLabel1.Visible = false;
            kryptonButton3.Visible = false;
            kryptonButton4.Visible = false;
            kryptonButton5.Visible = false;

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
                User f = new User();
                f.Show();
            }
        }

        private void kryptonButton3_Click(object sender, EventArgs e)
        {
            int x = controllerObj.InsertUser(kryptonTextBox1.Text.ToString(), Convert.ToInt32(kryptonTextBox2.Text));
            if (x == 1)
                MessageBox.Show("User created successfully");
        }

        private void kryptonButton5_Click(object sender, EventArgs e)
        {
            int x = controllerObj.InsertAdmin(kryptonTextBox1.Text.ToString(), Convert.ToInt32(kryptonTextBox2.Text));
            if (x == 1)
                MessageBox.Show("Admin added successfully");
        }

        private void kryptonButton4_Click(object sender, EventArgs e)
        {
            int x = controllerObj.InsertClub(kryptonTextBox1.Text.ToString(), Convert.ToInt32(kryptonTextBox2.Text));
            if (x == 1)
                MessageBox.Show("Club created successfully");
        }
    }
}
