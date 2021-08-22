using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _10GridviewPractice
{
    public partial class Gridview1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Write("<br>GridView1.SelectedIndex--" + GridView1.SelectedIndex);
            Response.Write("<br>GridView1.SelectedRow.RowIndex--"+GridView1.SelectedRow.RowIndex);

            Response.Write("<br>GridView1.SelectedValue(資料庫主索引鍵)--"+GridView1.SelectedValue);
            Response.Write("<br>GridView1.SelectedDataKey.Value(資料庫主索引鍵--"+GridView1.SelectedDataKey.Value);
            //測試用的
             //GridView1.EditIndex = GridView1.SelectedIndex;
            //註解：這一行程式碼，可以這樣解釋--
            //    使用者選取的這一行（GridView1.SelectedIndex），進入GridView的「編輯」模式（GridView1.EditIndex）。



        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            //== 進入「選取」模式（光棒效果）==
            GridView1.SelectedIndex = e.NewSelectedIndex;

            //測試用的
              GridView1.SelectedIndex = GridView1.SelectedIndex;

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //離開選取模式(取消光棒)
            if(e.CommandName == "Cancel_Select")
            {
                GridView1.SelectedIndex = -1;
            }

            //被點選那一列的index
            int pk_index= Convert.ToInt32(e.CommandArgument);
            //--下面這一列成是在某些頁數會出錯，例如第五頁。因為您點選第五頁，e.CommandArgument會是 5。
            //-- 而這個 GridView每一頁只有五列（RowIndex為 0~4）所以會出錯。
            //-- 進一步的說明，請看我的文章 -- http://www.dotblogs.com.tw/mis2000lab/archive/2013/06/20/rowcommand_commandargument_page_20130620.aspx
            //使用者點選的那一列所對應的表格主索引鍵值
            //Response.Write("被點選這一列的主索引鍵值--"+GridView1.DataKeys[pk_index].Value);


            Response.Write("<br /><font color=red>被點選的這一列，e.CommandArgument-- </font>" + pk_index.ToString());
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            // 進入「編輯」模式 ==
            GridView1.EditIndex = e.NewEditIndex;
            //註解：這裡還要重新執行 DataBinding。例如：GridView1.DataBind()。
            //          但因為我們事先設定好 GridView的「SqlDataSourceID」屬性=SqlDataSource1。
            //          SqlDataSource會自動幫我們完成，所以這裡省略了。

            //測試用的，這行可正確執行！
            GridView1.EditIndex = GridView1.SelectedIndex;
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            // 離開「編輯」模式（取消「編輯」模式）==
            GridView1.EditIndex = -1;
            //註解：這裡還要重新執行 DataBinding。例如：GridView1.DataBind()。
            //          但因為我們事先設定好 GridView的「SqlDataSourceID」屬性=SqlDataSource1。
            //          SqlDataSource會自動幫我們完成，所以這裡省略了
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //== GridView的分頁 == e.CommandArgument是1 但 e.NewPageIndex 卻是0
            GridView1.PageIndex = e.NewPageIndex;

            //註解：這裡還要重新執行 DataBinding。例如：GridView1.DataBind()。
            //          但因為我們事先設定好 GridView的「SqlDataSourceID」屬性=SqlDataSource1。
            //          SqlDataSource會自動幫我們完成，所以這裡省略了。
        }
    }
}