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
                cmd.ExecuteNonQuery();

                Response.Write("<script>alert('Đăng nhập thành công!')</script>");
                Response.Redirect("HomePage.aspx");

                clsDatabase.CloseConnection();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
                Response.Write("<script>alert('Mã CB hoặc MK không chính xác!')</script>");
            }
        }
    }
}