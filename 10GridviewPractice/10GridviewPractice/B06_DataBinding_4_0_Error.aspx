<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="B06_DataBinding_4_0_Error.aspx.cs" Inherits="B06_DataBinding_4_0_Error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>有錯誤！！</title>
    <style type="text/css">
        .style1
        {
            color: #0000FF;
            font-weight: bold;
            background-color: #99CCFF;
        }
        .style2
        {
            color: #FF0000;
            font-weight: bold;
            background-color: #FFFFFF;
        }
        .style3
        {
            color: #FF0000;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <span class="style1">計算學生的總分</span><span class="style2">......有錯誤！！<br />
        <br />
        </span><br />1).&nbsp; 先將後面兩個科目，設定為樣版。「國文」、「數學」分數，都採用「<span class="style2">公開變數</span>」來作。<br />
        2).&nbsp; 最後一個「總分」欄位，是自己動手添加的。<br />
        <span class="style3">3).&nbsp; GridView第一列資料永遠為零？？？使用 
        RowDataBound事件來寫會有這種狀況，RowCreate事件就會正確！</span><br />
        <br />
        GridView「黃底」已經改成樣板<br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="id"  DataSourceID="SqlDataSource1" 
            onrowcreated="GridView1_RowCreated" 
            onrowdatabound="GridView1_RowDataBound" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="student_id" HeaderText="student_id" 
                    SortExpression="student_id" />
                <asp:BoundField DataField="city" HeaderText="city" 
                    SortExpression="city" />
                <asp:TemplateField HeaderText="chinese" SortExpression="chinese">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# myNO1 %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle BackColor="#FFFF99" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="math" SortExpression="math">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# myNO2 %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle BackColor="#FFFF99" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="總分&lt;br&gt;（自己動手加入的欄位）">
                    <ItemTemplate>
                        <font color="blue"><b>
                        <%# myTotal %></b></font>
                    </ItemTemplate>
                    <ItemStyle BackColor="#FFFF99" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:TEST1ConnectionString %>" 
            SelectCommand="SELECT * FROM [student_test]"></asp:SqlDataSource>
    
        <br />
        <br />
    
    </div>
    <%--<asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" 
        DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
            <asp:BoundField DataField="student_id" HeaderText="student_id" 
                SortExpression="student_id" />
            <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
            <asp:BoundField DataField="chinese" HeaderText="chinese" 
                SortExpression="chinese" />
            <asp:BoundField DataField="math" HeaderText="math" SortExpression="math" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>--%>
    </form>
</body>
</html>