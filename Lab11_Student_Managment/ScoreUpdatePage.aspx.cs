using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Lab11_Student_Managment
{
    public partial class ScoreUpdatePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["MaMon"] != null)
                {
                    loadStudentDetails();
                }
                else
                {
                    Response.Write("<script>alert('Không tìm thấy mã môn học!')</script>");
                    Response.Redirect("LoginForm.aspx");
                }
            }
        }

        void loadStudentDetails()
        {
            string courseId = Request.QueryString["MaMon"];

            try
            {
                clsDatabase.OpenConnection();
                string query = "SELECT MonHoc.MaMon, MonHoc.TenMon, Diem.MSSV, SinhVien.HoTen, SinhVien.MaLop, Diem.Diem " +
                    "FROM Diem INNER JOIN SinhVien ON Diem.MSSV = SinhVien.MSSV INNER JOIN MonHoc ON " +
                    "MonHoc.MaMon = Diem.MaMon WHERE Diem.MaMon = @MaMon";
                SqlCommand cmd = new SqlCommand(query, clsDatabase.con);
                cmd.Parameters.AddWithValue("@MaMon", courseId);

                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    gvStudent.DataSource = dt;
                    gvStudent.DataBind();
                }
                else
                {
                    dt.Rows.Add(dt.NewRow());
                    gvStudent.DataSource = dt;
                    gvStudent.DataBind();
                    gvStudent.Rows[0].Cells.Add(new TableCell());
                    gvStudent.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                    gvStudent.Rows[0].Cells[0].Text = "No Data found...!";
                    gvStudent.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                }
                clsDatabase.CloseConnection();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void gvStudent_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string newScore = e.NewValues["Diem"].ToString();
            string studentId = gvStudent.DataKeys[e.RowIndex].Value.ToString(); // Get the student ID
            string courseId = Request.QueryString["MaMon"];

            try
            {
                clsDatabase.OpenConnection();
                string query = "Update Diem set Diem=@Diem WHERE MSSV=@MSSV AND MaMon=@MaMon";
                SqlCommand cmd = new SqlCommand(query, clsDatabase.con);
                cmd.Parameters.AddWithValue("@Diem", newScore);
                cmd.Parameters.AddWithValue("@MSSV", studentId);
                cmd.Parameters.AddWithValue("@MaMon", courseId);
                cmd.ExecuteNonQuery();

                gvStudent.EditIndex = -1;
                loadStudentDetails();
                Response.Write("<script>alert('Updated!');</script>");

                clsDatabase.CloseConnection();
            }
            catch
            {
            }
        }

        protected void gvStudent_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvStudent.EditIndex = e.NewEditIndex;
            loadStudentDetails();
        }

        protected void gvStudent_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvStudent.EditIndex = -1;
            loadStudentDetails();
        }
    }
}