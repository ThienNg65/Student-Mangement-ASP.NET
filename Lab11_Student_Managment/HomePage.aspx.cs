using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Lab11_Student_Managment
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["MaCB"] != null)
                {
                    loadTeacherDetails();
                    loadCourseDetails();
                }
                else
                {
                    Response.Redirect("LoginForm.aspx");
                }

            }
        }

        void loadTeacherDetails()
        {
            string MaCB = Session["MaCB"].ToString();

            try
            {
                clsDatabase.OpenConnection();
                SqlCommand cmd = new SqlCommand("select MaCB, TenCB from CanBo WHERE MaCB = @MaCB", clsDatabase.con);
                cmd.Parameters.AddWithValue("@MaCB", MaCB);

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    maCB.Text = reader["MaCB"].ToString();
                    tenCB.Text = reader["TenCB"].ToString();
                }
                reader.Close();

                clsDatabase.CloseConnection();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        void loadCourseDetails()
        {
            string MaCB = Session["MaCB"].ToString();

            try
            {
                clsDatabase.OpenConnection();
                string query = "SELECT MonHoc.MaMon, TenMon FROM GiangDay " +
                                "INNER JOIN MonHoc ON GiangDay.MaMon = MonHoc.MaMon " +
                                "WHERE GiangDay.MaCB = @MaCB";
                SqlCommand cmd = new SqlCommand(query, clsDatabase.con);
                cmd.Parameters.AddWithValue("@MaCB", MaCB);

                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    gvCourse.DataSource = dt;
                    gvCourse.DataBind();
                }
                else
                {
                    dt.Rows.Add(dt.NewRow());
                    gvCourse.DataSource = dt;
                    gvCourse.DataBind();
                    gvCourse.Rows[0].Cells.Add(new TableCell());
                    gvCourse.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                    gvCourse.Rows[0].Cells[0].Text = "No Data found...!";
                    gvCourse.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                }
                clsDatabase.CloseConnection();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void gvCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Redirect to UpdateScorePage passing selected course ID
            string maMon = gvCourse.SelectedRow.Cells[0].Text;
            Response.Redirect("ScoreUpdatePage.aspx?MaMon=" + maMon);
        }
    }
}