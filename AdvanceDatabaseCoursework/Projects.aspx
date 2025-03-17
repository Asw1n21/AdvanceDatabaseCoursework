<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="AdvanceDatabaseCoursework.Projects" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="/content/bootstrap.min.css" rel ="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

       <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
    }

    /* Style for GridView */
    .table {
        margin-top: 0px;
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
        <div>
          
            <asp:GridView ID="GridView1"   CssClass ="table table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="PROJECT_ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True"  ButtonType="Link"/>
                    <asp:BoundField DataField="PROJECT_ID" HeaderText="PROJECT_ID" ReadOnly="True" SortExpression="PROJECT_ID" />
                    <asp:BoundField DataField="PROJECT_NAME" HeaderText="PROJECT_NAME" SortExpression="PROJECT_NAME" />
                    <asp:BoundField DataField="PROJECT_STARTDATE" HeaderText="PROJECT_STARTDATE" SortExpression="PROJECT_STARTDATE" />
                    <asp:BoundField DataField="PROJECT_DUEDATE" HeaderText="PROJECT_DUEDATE" SortExpression="PROJECT_DUEDATE" />
                    <asp:BoundField DataField="PROJECT_STATUS" HeaderText="PROJECT_STATUS" SortExpression="PROJECT_STATUS" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;PROJECTS&quot; WHERE &quot;PROJECT_ID&quot; = :PROJECT_ID" InsertCommand="INSERT INTO &quot;PROJECTS&quot; (&quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot;, &quot;PROJECT_STARTDATE&quot;, &quot;PROJECT_DUEDATE&quot;, &quot;PROJECT_STATUS&quot;) VALUES (:PROJECT_ID, :PROJECT_NAME, :PROJECT_STARTDATE, :PROJECT_DUEDATE, :PROJECT_STATUS)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot;, &quot;PROJECT_STARTDATE&quot;, &quot;PROJECT_DUEDATE&quot;, &quot;PROJECT_STATUS&quot; FROM &quot;PROJECTS&quot;" UpdateCommand="UPDATE &quot;PROJECTS&quot; SET &quot;PROJECT_NAME&quot; = :PROJECT_NAME, &quot;PROJECT_STARTDATE&quot; = :PROJECT_STARTDATE, &quot;PROJECT_DUEDATE&quot; = :PROJECT_DUEDATE, &quot;PROJECT_STATUS&quot; = :PROJECT_STATUS WHERE &quot;PROJECT_ID&quot; = :PROJECT_ID">
                <DeleteParameters>
                    <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                    <asp:Parameter Name="PROJECT_NAME" Type="String" />
                    <asp:Parameter Name="PROJECT_STARTDATE" Type="DateTime" />
                    <asp:Parameter Name="PROJECT_DUEDATE" Type="DateTime" />
                    <asp:Parameter Name="PROJECT_STATUS" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="PROJECT_NAME" Type="String" />
                    <asp:Parameter Name="PROJECT_STARTDATE" Type="DateTime" />
                    <asp:Parameter Name="PROJECT_DUEDATE" Type="DateTime" />
                    <asp:Parameter Name="PROJECT_STATUS" Type="String" />
                    <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="PROJECT_ID" DataSourceID="SqlDataSource1">
                <EditItemTemplate>
                 
                </EditItemTemplate>
                <InsertItemTemplate>
                    <div class="form-container">
                        <h3>Add new project</h3>
                    PROJECT_ID:
                    <asp:TextBox ID="PROJECT_IDTextBox" runat="server" Text='<%# Bind("PROJECT_ID") %>' />
                    <br />
                    PROJECT_NAME:
                    <asp:TextBox ID="PROJECT_NAMETextBox" runat="server" Text='<%# Bind("PROJECT_NAME") %>' />
                    <br />
                    PROJECT_STARTDATE:
                    <asp:TextBox ID="PROJECT_STARTDATETextBox" runat="server" Text='<%# Bind("PROJECT_STARTDATE") %>' />
                    <br />
                    PROJECT_DUEDATE:
                    <asp:TextBox ID="PROJECT_DUEDATETextBox" runat="server" Text='<%# Bind("PROJECT_DUEDATE") %>' />
                    <br />
                    PROJECT_STATUS:
                    <asp:TextBox ID="PROJECT_STATUSTextBox" runat="server" Text='<%# Bind("PROJECT_STATUS") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                      
                </InsertItemTemplate>
                <ItemTemplate>
                    <div class="button-container">
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New Project" CssClass="btn btn-new" />
                     </div>
                </ItemTemplate>
            </asp:FormView>
        </div>
    </form>
</body>
</html>
