using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _10GridviewPractice
{
    public partial class GridView_Update_2_Template : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Response.Write("對應test資料表的主索引鍵--" + GridView1.DataKeys[e.RowIndex].Value.ToString());

            //TextBox tb=GridView1.Rows[e.RowIndex].FindControl("TextBox1") as TextBox;
            TextBox tb = (TextBox)GridView1.Rows[e.RowIndex].Cells[2].FindControl("TextBox1");
            Response.Write("<br/>title--" + tb.Text);
            //Response.End(); 
            //==因為本範例的 GridView搭配 SqlDataSource，不寫這一列程式會出現錯誤。
        }
    }
}