using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _10GridviewPractice
{
    public partial class dopostback_test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lb_Click(object sender, EventArgs e)
        {
            Response.Write("我被點擊了");
        }
    }
}