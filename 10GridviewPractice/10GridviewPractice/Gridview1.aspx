<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gridview1.aspx.cs" Inherits="_10GridviewPractice.Gridview1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server"
                BackColor="#DEBA84" BorderColor="#DEBA84" PageSize="5" 
                BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2"
                AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Style="margin-right: 69px" DataKeyNames="Job_GUID,Type" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowCommand="GridView1_RowCommand" OnRowEditing="GridView1_RowEditing" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" OnPageIndexChanging="GridView1_PageIndexChanging">
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                    <asp:ButtonField ButtonType="Button" CommandName="Cancel_Select" Text="Cancel Select（取消「選取模式」）" />
                    <asp:CommandField ShowDeleteButton="True" />
                    <asp:BoundField DataField="Job_GUID" HeaderText="Job_GUID" SortExpression="Job_GUID" />
                    <asp:BoundField DataField="fullname" HeaderText="fullname" SortExpression="fullname" />
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                    <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                </Columns>
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True"  />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Feib_DevOpsConnectionString %>" SelectCommand="SELECT DISTINCT [Job_GUID], [fullname], [name], [Type] FROM [Jenkins_Job_Master] ORDER BY [Job_GUID]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
