<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GridView_Multi_PK.aspx.cs" Inherits="_10GridviewPractice.GridView_Multi_PK" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>[多個] P.K.主索引鍵 #1 </title>
    <style type="text/css">
        .style1 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            GridView對應的資料表，有 [多個] P.K.主索引鍵。<br />
            請看 GridView的<span class="style1">「DataKeyNames」屬性</span><br />
            &nbsp;&nbsp;&nbsp;
        （本範例設定為 id與 title為主索引鍵）<br />
            <br />
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Style="color: #FF0000"></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                CellPadding="4" DataKeyNames="Job_GUID,Type" DataSourceID="SqlDataSource1"
                ForeColor="#333333" GridLines="None"
                OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <RowStyle BackColor="#E3EAEB" />
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
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#7C6F57" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Feib_DevOpsConnectionString %>"
                SelectCommand="SELECT DISTINCT [Job_GUID], [fullname], [name], [Type] FROM [Jenkins_Job_Master] ORDER BY [Job_GUID]"></asp:SqlDataSource>

        </div>
    </form>
</body>
</html>
