<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test01_Solve2.aspx.cs" Inherits="test01_Solve2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1 {
            color: #FFFFFF;
            font-weight: bold;
            background-color: #006600;
        }

        .style2 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            GridView「裡面」的子控制項（如Button、DropDownList），如何觸發子控制項的事件？<b>#3</b><br />
            自己增加一欄<span
                class="style1"> 資料行（按鈕） </span>
            <br />
            <hr />
            <br />
            1). 自己編輯資料行，並加入一欄「自訂按鈕」。<br />
            2). 設定為「樣版」。<br />
            3). 修改HTML原始碼，把按鈕的 <b>CommandName設定為 &lt;% # Eval(&quot;id&quot;)&nbsp; %&gt;</b><br />
            4). 修改HTML原始碼，把按鈕的 <b>Command<span class="style2">Argument</span>設定為 &lt;% #
        <span class="style2">Container.DataItemIndex</span> %&gt;</b>。（代表每一列的 RowIndex）<br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                DataKeyNames="student_id" DataSourceID="SqlDataSource1"
                OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="student_id" HeaderText="student_id" SortExpression="student_id" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server"
                                DataSourceID="SqlDataSource1" DataTextField="city" DataValueField="city"
                                SelectedValue='<%# Eval("city") %>'
                                OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            </asp:DropDownList>&nbsp;
                             
                        <asp:Button ID="Button1" runat="server" CausesValidation="false"
                            CommandName='<%# Eval("student_id") %>'
                            CommandArgument='<%# Container.DataItemIndex %>'
                            Text="自訂按鈕" />

                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="chinese" HeaderText="chinese" SortExpression="chinese" />
                    <asp:BoundField DataField="math" HeaderText="math"
                        SortExpression="math" />
                </Columns>
                <SelectedRowStyle BackColor="#FFFF99" />
            </asp:GridView>


            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:TEST1ConnectionString %>"
                DeleteCommand="DELETE FROM [student_test] WHERE [student_id] = @student_id"
                SelectCommand="SELECT * FROM [student_test]"
                UpdateCommand="UPDATE [student_test] SET [city] = @city  WHERE [student_id] = @student_id">
                <DeleteParameters>
                    <asp:Parameter Name="student_id" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="math" Type="String" />
                    <asp:Parameter Name="chinese" Type="String" />
                    <asp:Parameter Name="city" Type="String" />
                    <asp:Parameter Name="student_id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
    </form>
</body>
</html>
