using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class test_01_Error : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //=======================版本二
        Session["RowIndex"] = 0;
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //=======================版本二
        //-- 這個事件僅供參考，
        //-- 是用來瞭解 參數e的型態。GridView1.SelectedIndex=-1
        Session["RowIndex"] = GridView1.SelectedIndex;
        Response.Write("<font color=green>DropDownList1_SelectedIndexChanged</font><br>");
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        //=======================版本一試錯
        //DropDownList my_DDL = new DropDownList();  // 缺少最後的符號() 會錯喔！
        //my_DDL = (DropDownList)GridView1.Rows[GridView1.SelectedIndex].FindControl("DropDownList1");

        //Response.Write("<font color=blue>Button1_Click</font><br>");

        //if (my_DDL.SelectedIndex >= 0)
        //{
        //    Response.Write("OK~~OK~~<br>");
        //}
        //==== 這兩列程式碼會出錯 ！GridView1.SelectedIndex會顯示-1 產生超過index範圍的錯誤 ==========


        //=======================版本二
        //確認事件觸發，是抓不到GridView1.SelectedIndex的
        DropDownList my_DDL =new DropDownList();
        my_DDL = (DropDownList)GridView1.Rows[Convert.ToInt32(Session["RowIndex"])].FindControl("DropDownList1");

        Response.Write("<font color=blue>您觸發了 Button1_Click事件！</font><br>");

        Response.Write("<font color=red>");
        Response.Write("您選的 DropDownList的 ClientID是「" + my_DDL.ClientID + "」。<br>");
        Response.Write("您選的 DropDownList的 子選項是「" + my_DDL.SelectedValue + "」。<br>");
        Response.Write("您選的 DropDownList的 行數是「" + Convert.ToInt32(Session["RowIndex"]) + "」。<br>");
        Response.Write("</font >");
    }
}
