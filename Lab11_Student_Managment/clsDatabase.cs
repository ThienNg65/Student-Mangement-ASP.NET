using System;
using System.Data.SqlClient;

namespace Lab11_Student_Managment
{
    public class clsDatabase
    {
        public static SqlConnection con;

        public static bool OpenConnection()
        {
            try
            {
                con = new SqlConnection("Data Source=DESKTOP-6A8IVC0\\SQLEXPRESS;Initial Catalog=SINHVIEN;Integrated Security=true");
                con.Open();
            }
            catch (Exception)
            {
                return false;
            }
            return true;
        }

        public static bool CloseConnection()
        {
            try
            {
                con.Close();
            }
            catch (Exception)
            {
                return false;
            }
            return true;
        }
    }
}