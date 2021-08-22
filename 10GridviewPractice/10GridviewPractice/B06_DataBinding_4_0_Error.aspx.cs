using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//----自己寫的（宣告）----
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
//----自己寫的----



public partial class B06_DataBinding_4_0_Error : System.Web.UI.Page
{ //== 重點 =================================
    //== 必須設定為 public。否則就會視為 private而發生錯誤。
    public int myNO1, myNO2, myTotal;
    public int i = 0;    //方法一，才會用到。
                         //=======================================


    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //==這是錯誤版本！！
    //*** 重點。 **********************************
    //*** 改寫 RowCreated()事件，在就會正確囉！！
    //*** 您可以參閱另外一支程式 test_GridView_1.aspx，就會知道這兩個事件的差異。
    //*******************************************
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        ////***  方法一  *** （錯誤，資料會延遲一列出現！）
        ////-- 資料存取寫在這裡，會重複執行多次，很消耗資源！

        //SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
        //SqlDataAdapter myAdapter = new SqlDataAdapter("select * from student_test", Conn);
        //DataSet ds = new DataSet();

        ////Conn.Open();   //---- 不用寫，DataAdapter會自動開啟
        //myAdapter.Fill(ds, "s_test");    //---- 這時候執行SQL指令。取出資料，放進 DataSet。
        ////註解：執行SQL指令之後，把資料庫撈出來的結果，交由畫面上 DataBinding Expression來呈現。
        ////****************************************

        ////Response.Write(e.Row.RowType.ToString() + "<br>");

        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    myNO1 = Convert.ToInt32(ds.Tables["s_test"].Rows[i]["chinese"]);
        //    myNO2 = Convert.ToInt32(ds.Tables["s_test"].Rows[i]["math"]);

        //    myTotal = myNO1 + myNO2;
        //    i++;
        //}
        ////****************************************
        ////Conn.Close();   //---- 不用寫，DataAdapter會自動關閉


        //***  方法二  ***（錯誤，資料會延遲一列出現！）
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            myNO1 = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "chinese"));
            myNO2 = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "math"));
            myTotal = myNO1 + myNO2;
        }

        ////***  方法三  ***（錯誤！）
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    myNO1 = Convert.ToInt32(e.Row.Cells[4].Text);
        //    myNO2 = Convert.ToInt32(e.Row.Cells[5].Text);
        //    myTotal = myNO1 + myNO2;
        //}
    }


    //====================================
    //== 正確版本！！ ==
    //== RowCreated事件的執行，比上面的RowDataBound事件早一步。請看範例 test_GridView_1.aspx的比較。
    //====================================
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        ////***  方法一  ***  （成功！）
        ////-- 資料存取寫在這裡，會重複執行多次，很消耗資源！
        ////----連結資料庫----
        //SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["TEST1ConnectionString"].ConnectionString);
        //SqlDataAdapter myAdapter = new SqlDataAdapter("select * from student_test", Conn);
        //DataSet ds = new DataSet();

        ////Conn.Open();   //---- 不用寫，DataAdapter會自動開啟
        //myAdapter.Fill(ds, "s_test");    //---- 這時候執行SQL指令。取出資料，放進 DataSet。

        ////    //註解：執行SQL指令之後，把資料庫撈出來的結果，交由畫面上 DataBinding Expression來呈現。
        ////    //****************************************

        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    myNO1 = Convert.ToInt32(ds.Tables["s_test"].Rows[i]["chinese"]);
        //    myNO2 = Convert.ToInt32(ds.Tables["s_test"].Rows[i]["math"]);

        //    myTotal = myNO1 + myNO2;
        //    i++;
        //}
        ////    //****************************************
        ////    //Conn.Close();   //---- 不用寫，DataAdapter會自動關閉


        //***  方法二  ***（成功！） 分頁也會成功！！
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    myNO1 = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "chinese"));
        //    myNO2 = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "math"));

        //    myTotal = myNO1 + myNO2;
        //}
    }
}
