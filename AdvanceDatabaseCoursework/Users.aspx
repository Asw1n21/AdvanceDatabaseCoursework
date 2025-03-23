<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="AdvanceDatabaseCoursework.Users" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/content/bootstrap.min.css" rel ="stylesheet" />
    
    <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
       
    }

    /* Style for GridView */
    .table {
        margin-top: 20px;
        width: 100%;
        border-collapse: collapse;
    }

    .table-bordered {
        border: 1px solid #ddd;
    }

    .table-bordered th, .table-bordered td {
        padding: 8px 12px;
        text-align: left;
    }

    .table-bordered th {
        background-color: #343a40;
        color: white;
    }

    .table-bordered td {
        background-color: white;
    }
    .form-container {
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        margin-top: 20px;
    }

    .form-container label {
        font-weight: bold;
        margin-bottom: 10px;
    }

    .form-container input[type="text"] {
        width: 100%;
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    .button-container {
        margin-top: 0px;
    }

    .button-container .btn,
    .form-container .btn,
    .form-container a {
        padding: 10px 20px;
        font-size: 16px;
        margin: 0px;
        cursor: pointer;
        border: none;
        border-radius: 4px;
        background-color: #343a40;
        color: white;
        text-decoration: none;
        display: inline-block;
    }

    .button-container .btn:hover,
    .form-container .btn:hover,
    .form-container a:hover {
        background-color: #23272b;
    }

    /* Specific button styles */
    .button-container .btn-insert,
    .form-container #InsertButton {
        background-color: #343a40;
    }

    .button-container .btn-cancel,
    .form-container #InsertCancelButton {
        background-color: #343a40;
    }

    .button-container .btn-new,
    .form-container #NewButton {
        background-color: #343a40;
    }
    /* Edit Button */
    .table a {
    padding: 5px 8px;
    border-radius: 0px;
   color: #343a40;
    
}

.table a[title="Edit"] {
    background-color: #007bff;
    color: white !important;
}

.table a[title="Edit"]:hover {
    background-color: #0056b3;
}

.table a[title="Delete"] {
    background-color: #dc3545;
    color: white !important;
}

.table a[title="Delete"]:hover {
    background-color: #c82333;
}
    
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="button-container" style="margin-bottom: 20px;">
    <asp:HyperLink ID="btnBackToDashboard" runat="server" NavigateUrl="Dashboard.aspx" CssClass="btn btn-secondary">
        ← Go Back to Dashboard
    </asp:HyperLink>
</div>
        <div>
        </div>
        <asp:GridView ID="GridView1" CssClass ="table table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="USER_ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True"  ButtonType="Link"/>
                <asp:BoundField DataField="USER_ID" HeaderText="USER_ID" ReadOnly="True" SortExpression="USER_ID" />
                <asp:BoundField DataField="USER_NAME" HeaderText="USER_NAME" SortExpression="USER_NAME" />
                <asp:BoundField DataField="USER_EMAIL" HeaderText="USER_EMAIL" SortExpression="USER_EMAIL" />
                <asp:BoundField DataField="USER_CONTACT" HeaderText="USER_CONTACT" SortExpression="USER_CONTACT" />
                <asp:BoundField DataField="USER_ROLE" HeaderText="USER_ROLE" SortExpression="USER_ROLE" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" OnSelecting="SqlDataSource1_Selecting" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;USER_ID&quot;, &quot;USER_ROLE&quot;, &quot;USER_NAME&quot;, &quot;USER_EMAIL&quot;, &quot;USER_CONTACT&quot; FROM &quot;USERS&quot;" DeleteCommand="DELETE FROM &quot;USERS&quot; WHERE &quot;USER_ID&quot; = :USER_ID" InsertCommand="INSERT INTO &quot;USERS&quot; (&quot;USER_ID&quot;, &quot;USER_ROLE&quot;, &quot;USER_NAME&quot;, &quot;USER_EMAIL&quot;, &quot;USER_CONTACT&quot;) VALUES (:USER_ID, :USER_ROLE, :USER_NAME, :USER_EMAIL, :USER_CONTACT)" UpdateCommand="UPDATE &quot;USERS&quot; SET &quot;USER_ROLE&quot; = :USER_ROLE, &quot;USER_NAME&quot; = :USER_NAME, &quot;USER_EMAIL&quot; = :USER_EMAIL, &quot;USER_CONTACT&quot; = :USER_CONTACT WHERE &quot;USER_ID&quot; = :USER_ID">
            <DeleteParameters>
                <asp:Parameter Name="USER_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="USER_ID" Type="Decimal" />
                <asp:Parameter Name="USER_ROLE" Type="String" />
                <asp:Parameter Name="USER_NAME" Type="String" />
                <asp:Parameter Name="USER_EMAIL" Type="String" />
                <asp:Parameter Name="USER_CONTACT" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="USER_ROLE" Type="String" />
                <asp:Parameter Name="USER_NAME" Type="String" />
                <asp:Parameter Name="USER_EMAIL" Type="String" />
                <asp:Parameter Name="USER_CONTACT" Type="String" />
                <asp:Parameter Name="USER_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="USER_ID" DataSourceID="SqlDataSource1">
            <EditItemTemplate>
               
            </EditItemTemplate>
            <InsertItemTemplate>
                <div class="form-container">
                    <h3>Add new User</h3>
                USER_ID:
                <asp:TextBox ID="USER_IDTextBox" runat="server" Text='<%# Bind("USER_ID") %>' />
                <br />
                USER_NAME:
                <asp:TextBox ID="USER_NAMETextBox" runat="server" Text='<%# Bind("USER_NAME") %>' />
                <br />
                USER_EMAIL:
                <asp:TextBox ID="USER_EMAILTextBox" runat="server" Text='<%# Bind("USER_EMAIL") %>' />
                <br />
                USER_CONTACT:
                <asp:TextBox ID="USER_CONTACTTextBox" runat="server" Text='<%# Bind("USER_CONTACT") %>' />
                <br />
                USER_ROLE:
                <asp:TextBox ID="USER_ROLETextBox" runat="server" Text='<%# Bind("USER_ROLE") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Add" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />

            </InsertItemTemplate>
          <ItemTemplate>
    <div class="button-container">
        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text=" Add New User" CssClass="btn btn-new" />
    </div>
</ItemTemplate>


        </asp:FormView>
    </form>
</body>
</html>
