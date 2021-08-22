<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test_GridView_1.aspx.cs" Inherits="test_GridView_1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #CC0000;
            font-weight: bold;
        }
        .auto-style1 {
            color: #FF0000;
        }
    	.auto-style2 {
			text-decoration: underline;
		}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <p>
        資料來源：<a href="http://www.allenkuo.com/EBook5/view.aspx?a=1&TreeNodeID=82&id=1373">http://www.allenkuo.com/EBook5/view.aspx?a=1&amp;TreeNodeID=82&amp;id=1373</a>
        <br />
    </p>
    <p>
        Allen Kuo文章裡面提到：</p>
    <p>
        如果程式寫在RowDataBound或是 RowCreated事件這兩處都可以, 是不是沒差別呢?
    </p>
    <p>
        其實還是有差別的, 若網頁<strong>第一次載入, Repeater 會有 DataBinding 事件</strong>, </p>
		<p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 但<span class="auto-style1"><strong>若按了<span class="auto-style2">網頁上的 Button</span> （選取）導致 postback 時, 其實 Repeater 並不會觸發 DataBinding 事件</strong></span>, ......</p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 如果按下GridView的「分頁」、「編輯」，仍會觸發DataBinding事件</p>
        <br />
        測試 GridView兩大<span class="style1">事件 -- RowDataBound與 RowCreated</span><br />
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="id" DataSourceID="SqlDataSource1" 
            onrowcreated="GridView1_RowCreated" onrowdatabound="GridView1_RowDataBound" AllowPaging="True" OnDataBinding="GridView1_DataBinding" PageSize="5" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="test_time" HeaderText="test_time" 
                    SortExpression="test_time" />
            </Columns>
        	<FooterStyle BackColor="White" ForeColor="#000066" />
			<HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
			<PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
			<RowStyle ForeColor="#000066" />
			<SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
			<SortedAscendingCellStyle BackColor="#F1F1F1" />
			<SortedAscendingHeaderStyle BackColor="#007DBB" />
			<SortedDescendingCellStyle BackColor="#CAC9C9" />
			<SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:TEST1ConnectionString %>" 
            SelectCommand="SELECT [id], [title], [test_time] FROM [test]" DeleteCommand="DELETE FROM [test] WHERE [id] = @id" InsertCommand="INSERT INTO [test] ([title], [test_time]) VALUES (@title, @test_time)" UpdateCommand="UPDATE [test] SET [title] = @title, [test_time] = @test_time WHERE [id] = @id">
			<DeleteParameters>
				<asp:Parameter Name="id" Type="Int32" />
			</DeleteParameters>
			<InsertParameters>
				<asp:Parameter Name="title" Type="String" />
				<asp:Parameter Name="test_time" Type="DateTime" />
			</InsertParameters>
			<UpdateParameters>
				<asp:Parameter Name="title" Type="String" />
				<asp:Parameter Name="test_time" Type="DateTime" />
				<asp:Parameter Name="id" Type="Int32" />
			</UpdateParameters>
        </asp:SqlDataSource>
    
    	<br />
		<br />
		<br />
		<asp:Label ID="Label1" runat="server"></asp:Label>
    
    </div>
    </form>
</body>
</html>

