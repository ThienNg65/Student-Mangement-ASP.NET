using System;
using System.Data.SqlClient;

namespace Lab11_Student_Managment
{
    public partial class LoginForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                clsDatabase.OpenConnection();
                SqlCommand cmd = new SqlCommand("select MaCB, MatKhau from CanBo where MaCB=@MaCB and MatKhau=@MatKhau", clsDatabase.con);
                cmd.Parameters.AddWithValue("@MaCB", txtMaCB.Text);
                cmd.Parameters.AddWithValue("@MatKhau", txtMK.Text);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    // If login is successful, store MaCB in session and redirect to HomePage
                    Session["MaCB"] = reader["MaCB"].ToString();
                    Response.Redirect("HomePage.aspx");
                }
                else
                {
                    // If login fails, display error message
                    Response.Write("<script>alert('Mã CB hoặc MK không chính xác!')</script>");
                }

                reader.Close();

                clsDatabase.CloseConnection();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}