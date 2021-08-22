<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dopostback_test.aspx.cs" Inherits="_10GridviewPractice.dopostback_test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
    <script>
        function callFunc() {
            hidden1.value = getName();
            __doPostBack('lb', '');
        }
        function getName() {
            var name = document.getElementById("<%=name1.ClientID%>");
            return name.innerText
        }
    </script>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="hl" runat="server" NavigateUrl="javascript:callFunc();">CallFunc</asp:HyperLink>
            <asp:LinkButton ID="lb" runat="server" OnClick="lb_Click"></asp:LinkButton>
            <asp:Label runat="server" Text="TOM" ID="name1" ></asp:Label>
            <asp:HiddenField  runat="server" ID="hidden1" ClientIDMode="Static" />
        </div>
    </form>
    
</body>
</html>
