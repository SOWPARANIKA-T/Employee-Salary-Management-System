using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace EmpSalMgntSystem
{
    public partial class ListofEmployees : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
        }

        private void BindGrid()
        {
            SqlConnection con = new SqlConnection(@"Data Source=LENOVO\SQLEXPRESS;Initial Catalog=SystemTask;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("select * from tblEmployee inner join tblSalary on tblEmployee.Empid=tblSalary.EmpID;", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();


        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            this.BindGrid();
        }

        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            GridView1.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=LENOVO\SQLEXPRESS;Initial Catalog=SystemTask;Integrated Security=True");
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int empid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string name = (row.FindControl("txtName") as TextBox).Text;
            string dept = (row.FindControl("txtDept") as TextBox).Text;
            string sex = (row.FindControl("txtSex") as TextBox).Text;
            string status = (row.FindControl("txtStatus") as TextBox).Text;
            string address = (row.FindControl("txtAddress") as TextBox).Text;
            string salary = (row.FindControl("txtSalary") as TextBox).Text;
            SqlCommand cmd = new SqlCommand("update tblEmployee set name=@empname,dept=@empdept,sex=@empsex,maritalstatus=@empmaritalstatus,address=@empaddress where id=Empid ", con);

            cmd.Parameters.AddWithValue("@Empid", empid);
            cmd.Parameters.AddWithValue("@EmpName", name);
            cmd.Parameters.AddWithValue("@EmpDept", dept);
            cmd.Parameters.AddWithValue("@EmpSex", sex);
            cmd.Parameters.AddWithValue("@EmpMaritalStatus", status);
            cmd.Parameters.AddWithValue("@EmpAddress", address);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            SqlCommand cmd1 = new SqlCommand("update tblSalary set salary=@empsalary where id=EmpID", con);
            cmd1.Parameters.AddWithValue("@EmpSalary", salary);
            con.Open();
            cmd1.ExecuteNonQuery();
            con.Close();


            GridView1.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int empid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            SqlConnection con = new SqlConnection(@"Data Source=LENOVO\SQLEXPRESS;Initial Catalog=SystemTask;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("Delete from  tblEmployee where empid=Empid", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            con.Close();
            SqlCommand cmd1 = new SqlCommand("Delete from  tblSalary where empid=EmpID", con);
            con.Open();
            dr = cmd1.ExecuteReader();
            con.Close();
            this.BindGrid();
        }
    }

}