using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _10GridviewPractice
{
    public partial class GridView_Update_2_Easy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Label lb=(Label)GridView1.Rows[0].FindControl("Label1");
                Response.Write(lb.Text);
            }
        }
        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
           //findcontrol找id
            Label lb = (Label)GridView1.Rows[e.NewSelectedIndex].FindControl("Label1");
            Response.Write(lb.Text);
            //可以取得選取那行 的 第四格的文字
            //string lb = GridView1.Rows[e.NewSelectedIndex].Cells[3].Text;
            //Response.Write(lb);
        }
    }
}