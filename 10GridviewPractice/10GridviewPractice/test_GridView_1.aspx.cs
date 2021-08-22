using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class test_GridView_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = "";
    }

    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {

        Label1.Text += "<font color=blue>";

        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        Label1.Text += "** RowCreated事件 -- " + e.Row.RowType + "....." + System.DateTime.Now.ToString("hh:mm:ss.ffff tt");
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            var something = e.Row.DataItem;
        }

        //}
        Label1.Text += "</font><br>";
    }


    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        Label1.Text += "<font color=red>";
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            var something = e.Row.DataItem;
        }

        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        Label1.Text += "RowDataBound事件 -- " + e.Row.RowType + "....." + System.DateTime.Now.ToString("hh:mm:ss.ffff tt");
        //}
        Label1.Text += "</font><br>";
    }

    protected void GridView1_DataBinding(object sender, EventArgs e)
    {
        Label1.Text += "<br>===GridView1_DataBinding事件===" + System.DateTime.Now.ToString("hh:mm:ss.ffff tt") + "<br><br>";
    }
}
