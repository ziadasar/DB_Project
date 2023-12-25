using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Windows.Forms;

namespace DB_Project
{
    public class Controller
    {
        DBManager dbMan;
        public Controller()
        {
            dbMan = new DBManager();
        }


        public void TerminateConnection()
        {
            dbMan.CloseConnection();
        }

        public int InsertUser(string Username, int Password)
        {
            string query = "INSERT INTO Users (User_Name, Password)" +
                            "Values ('" + Username + "'," + Password + ");";
            return dbMan.ExecuteNonQuery(query);
        }

        public int InsertAdmin(string Username, int Password)
        {
            string query = "INSERT INTO Admin (Admin_User_Name, Password)" +
                            "Values ('" + Username + "'," + Password + ");";
            return dbMan.ExecuteNonQuery(query);
        }

        public int InsertClub(string Username, int Password)
        {
            int k = NewClubId();
            string query = "INSERT INTO Clubs (Club_Id, Club_Name, Password)" +
                            "Values (" + k + ", '" + Username + "'," + Password + ");";
            return dbMan.ExecuteNonQuery(query);
        }

        public int NewClubId()
        {
            string query = "SELECT MAX(Club_Id) FROM Clubs;";

            return (int)dbMan.ExecuteScalar(query) + 1;
        }

        public int isFoundUser(string Username)
        {
            string query = "SELECT count(User_Name) FROM Users WHERE User_Name = '" + Username + "';";

            return (int)dbMan.ExecuteScalar(query);
        }

        public int isFoundAdmin(string Username)
        {
            string query = "SELECT count(Admin_User_Name) FROM Admin WHERE Admin_User_Name = '" + Username + "';";

            return (int)dbMan.ExecuteScalar(query);
        }

        public int isFoundClub(string Username)
        {
            string query = "SELECT count(Club_Name) FROM Clubs WHERE Club_Name = '" + Username + "';";

            return (int)dbMan.ExecuteScalar(query);
        }

        public int searchUser(string Username, int Password)
        {
            string query = "SELECT count(User_Name) FROM Users WHERE User_Name = '" + Username + "' AND Password = " + Password + ";";

            return (int)dbMan.ExecuteScalar(query);
        }

        public int searchAdmin(string Username, int Password)
        {
            string query = "SELECT count(Admin_User_Name) FROM Admin WHERE Admin_User_Name = '" + Username + "' AND Password = " + Password + ";";

            return (int)dbMan.ExecuteScalar(query);
        }

        public int searchClub(string Username, int Password)
        {
            string query = "SELECT count(Club_Name) FROM Clubs WHERE Club_Name = '" + Username + "' AND Password = " + Password + ";";

            return (int)dbMan.ExecuteScalar(query);
        }

        /// ////////////////////////////////////////////////////////////////////
        
        public DataTable SelectAllEmp()
        {
            string query = "SELECT * FROM Employee;";
            return dbMan.ExecuteReader(query);
        }


        public int InsertProject(string Pname, int pnumber, string Plocation, int Dnum)
        {
            string query = "INSERT INTO Project (Pname, Pnumber, Plocation, Dnum)" +
                            "Values ('" + Pname + "'," + pnumber + ",'" + Plocation + "'," + Dnum + ");";
            return dbMan.ExecuteNonQuery(query);
        }

        public DataTable SelectDepartments()
        {
            string query = "SELECT Dnumber,Dname FROM Department;";
            return dbMan.ExecuteReader(query);
        }
        public DataTable SelectDepLoc()
        {
            string query = "SELECT DISTINCT Dlocation FROM Dept_Locations;";
            return dbMan.ExecuteReader(query);
        }

        public DataTable SelectProject(string location)
        {
            string query = "SELECT Pname,Dname FROM Department D, Project P, Dept_Locations L"
             + " where P.Dnum=D.Dnumber and L.Dnumber=D.Dnumber and L.Dlocation='" + location + "';";

            return dbMan.ExecuteReader(query);
        }
        public DataTable SelectEmployees()
        {
            string query = "SELECT SSN,FName FROM Employee"
             + " where Salary<40000;";

            return dbMan.ExecuteReader(query);
        }
        public int MaxSalary()
        {
            string query = "SELECT MAX(Salary) FROM Employee;";

            return (int)dbMan.ExecuteScalar(query);
        }
        public int AvgSalary()
        {
            string query = "SELECT AVG(Salary) FROM Employee;";

            return (int)dbMan.ExecuteScalar(query);
        }
        public int InsertDep(string Dname, int Dnum, int SSN, string Date)
        {
            string query = "INSERT INTO Department (Dname, Dnumber, Mgr_SSN, Mgr_Start_Date)" +
                            "Values ('" + Dname + "'," + Dnum + "," + SSN + ",'" + Date + "');";
            return dbMan.ExecuteNonQuery(query);
        }

        public int SelectDepNum(string Dname)
        {
            string query = "SELECT Dnumber FROM Department where Dname ='" + Dname + "';";

            return (int)dbMan.ExecuteScalar(query);
        }
        public int InsertDepLocation(string Dname, string Location)
        {
            int x = SelectDepNum(Dname);
            string query = "INSERT INTO Dept_Locations (Dnumber, Dlocation)" +
                            "Values (" + x + ",'" + Location + "');";
            return dbMan.ExecuteNonQuery(query);
        }
        public DataTable SelectDepNames()
        {
            string query = "SELECT * FROM Department;";

            return dbMan.ExecuteReader(query);
        }
        public DataTable SelectEmpNames()
        {
            string query = "SELECT * FROM Employee;";

            return dbMan.ExecuteReader(query);
        }
        public int SelectEmpSSN(string Fname)
        {
            string query = "SELECT SSN FROM Employee where Fname ='" + Fname + "';";

            return (int)dbMan.ExecuteScalar(query);
        }
        public int UpdateDeptManager(string Fname, string DepName)
        {
            int x = SelectEmpSSN(Fname);
            string query = "UPDATE Department SET Mgr_SSN = " + x + " WHERE Dname = '" + DepName + "';";
            return dbMan.ExecuteNonQuery(query);
        }

    }
}
