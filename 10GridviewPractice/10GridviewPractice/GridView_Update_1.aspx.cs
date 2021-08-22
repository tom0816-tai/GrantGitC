using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _10GridviewPractice
{
    public partial class GridView_Update_1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Label lb=(Label)GridView1.Rows[0].Cells[2].Controls[0];
            //Response.Write(lb.Text);
            // (1).  上面的程式會出錯，必須把 Label改成 LiteralControl才對！
            //-- 任何不在伺服器上處理的 HTML 標記或文字字串，都會被視為 LiteralControl 物件。
            //-- 參考網址  http://msdn.microsoft.com/zh-tw/library/system.web.ui.control.controls%28v=vs.80%29

            // (2). 修正以後，還是錯！！！
            //--     還是抓不到！  ......錯誤訊息：指定的引數超出有效值的範圍。
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Response.Write("<big>對應test資料表的主索引鍵--" + GridView1.DataKeys[e.RowIndex].Value.ToString());
           

            if(GridView1.Rows[e.RowIndex].Cells[2].HasControls())//判斷是否有子控制項
            {
                TextBox tb = new TextBox();
                tb = GridView1.Rows[e.RowIndex].Cells[2].Controls[0] as TextBox ;

                Response.Write("<br/>title--" + tb.Text + "</big>");
            }

        }

    }
}