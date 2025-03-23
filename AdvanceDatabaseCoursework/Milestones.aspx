<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Milestones.aspx.cs" Inherits="AdvanceDatabaseCoursework.Milestones" %>

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
       /* Dropdown styling */
    .form-container select {
        width: 100%;
        padding: 8px;
        margin-bottom: 5px;
        border: 1px solid #ccc;
        border-radius: 4px;
        background-color: white;
        font-size: 16px;
        cursor: pointer;
    }

    .form-container select:focus {
        border-color: #343a40;
        outline: none;
        box-shadow: 0 0 5px rgba(52, 58, 64, 0.5);
    }

    .form-container label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
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
                <div class="button-container" style="margin-bottom: 20px;">
    <asp:HyperLink ID="btnBackToDashboard" runat="server" NavigateUrl="Dashboard.aspx" CssClass="btn btn-secondary">
        ← Go Back to Dashboard
    </asp:HyperLink>
</div>
        <div>
            <asp:GridView ID="GridView1"   CssClass ="table table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="MILESTONE_ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True"  ButtonType="Link"/>
                    <asp:BoundField DataField="MILESTONE_ID" HeaderText="MILESTONE_ID" ReadOnly="True" SortExpression="MILESTONE_ID" />
                    <asp:BoundField DataField="MILESONE_NAME" HeaderText="MILESONE_NAME" SortExpression="MILESONE_NAME" />
                    <asp:BoundField DataField="MILESTONE_STARTDATE" HeaderText="MILESTONE_STARTDATE" SortExpression="MILESTONE_STARTDATE" />
                    <asp:BoundField DataField="MILESTONE_DUEDATE" HeaderText="MILESTONE_DUEDATE" SortExpression="MILESTONE_DUEDATE" />
                    <asp:BoundField DataField="MILESTONE_STATUS" HeaderText="MILESTONE_STATUS" SortExpression="MILESTONE_STATUS" />
                    <asp:BoundField DataField="PROJECT_ID" HeaderText="PROJECT_ID" SortExpression="PROJECT_ID" />
                    <asp:TemplateField HeaderText="project_name">
                        <ItemTemplate>
                            <asp:DropDownList Enabled="false" ID="DropDownList2" runat="server" DataSourceID="projectdata" DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID" SelectedValue='<%# Bind("PROJECT_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="projectdata" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot; FROM &quot;PROJECTS&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;MILESTONES&quot; WHERE &quot;MILESTONE_ID&quot; = :MILESTONE_ID" InsertCommand="INSERT INTO &quot;MILESTONES&quot; (&quot;MILESTONE_ID&quot;, &quot;MILESONE_NAME&quot;, &quot;MILESTONE_STARTDATE&quot;, &quot;MILESTONE_DUEDATE&quot;, &quot;MILESTONE_STATUS&quot;, &quot;PROJECT_ID&quot;) VALUES (:MILESTONE_ID, :MILESONE_NAME, :MILESTONE_STARTDATE, :MILESTONE_DUEDATE, :MILESTONE_STATUS, :PROJECT_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;MILESTONE_ID&quot;, &quot;MILESONE_NAME&quot;, &quot;MILESTONE_STARTDATE&quot;, &quot;MILESTONE_DUEDATE&quot;, &quot;MILESTONE_STATUS&quot;, &quot;PROJECT_ID&quot; FROM &quot;MILESTONES&quot;" UpdateCommand="UPDATE &quot;MILESTONES&quot; SET &quot;MILESONE_NAME&quot; = :MILESONE_NAME, &quot;MILESTONE_STARTDATE&quot; = :MILESTONE_STARTDATE, &quot;MILESTONE_DUEDATE&quot; = :MILESTONE_DUEDATE, &quot;MILESTONE_STATUS&quot; = :MILESTONE_STATUS, &quot;PROJECT_ID&quot; = :PROJECT_ID WHERE &quot;MILESTONE_ID&quot; = :MILESTONE_ID">
                <DeleteParameters>
                    <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
                    <asp:Parameter Name="MILESONE_NAME" Type="String" />
                    <asp:Parameter Name="MILESTONE_STARTDATE" Type="DateTime" />
                    <asp:Parameter Name="MILESTONE_DUEDATE" Type="DateTime" />
                    <asp:Parameter Name="MILESTONE_STATUS" Type="String" />
                    <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="MILESONE_NAME" Type="String" />
                    <asp:Parameter Name="MILESTONE_STARTDATE" Type="DateTime" />
                    <asp:Parameter Name="MILESTONE_DUEDATE" Type="DateTime" />
                    <asp:Parameter Name="MILESTONE_STATUS" Type="String" />
                    <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                    <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="MILESTONE_ID" DataSourceID="SqlDataSource1">
                <EditItemTemplate>
                   
                </EditItemTemplate>
                <InsertItemTemplate>
                     <div class="form-container">
                    MILESTONE_ID:
                    <asp:TextBox ID="MILESTONE_IDTextBox" runat="server" Text='<%# Bind("MILESTONE_ID") %>' />
                    <br />
                    MILESONE_NAME:
                    <asp:TextBox ID="MILESONE_NAMETextBox" runat="server" Text='<%# Bind("MILESONE_NAME") %>' />
                    <br />
                    MILESTONE_STARTDATE:
                    <asp:TextBox ID="MILESTONE_STARTDATETextBox" runat="server" Text='<%# Bind("MILESTONE_STARTDATE") %>' />
                    <br />
                    MILESTONE_DUEDATE:
                    <asp:TextBox ID="MILESTONE_DUEDATETextBox" runat="server" Text='<%# Bind("MILESTONE_DUEDATE") %>' />
                    <br />
                    MILESTONE_STATUS:
                    <asp:TextBox ID="MILESTONE_STATUSTextBox" runat="server" Text='<%# Bind("MILESTONE_STATUS") %>' />
                    <br />
                    PROJECT_ID:
                    
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID" SelectedValue='<%# Bind("PROJECT_ID") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot; FROM &quot;PROJECTS&quot;"></asp:SqlDataSource>
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                         </div>
                </InsertItemTemplate>
                <ItemTemplate>
                    <div class="button-container">
                   <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New Milestone"  CssClass="btn btn-new"/>
                     </div>
                </ItemTemplate>
            </asp:FormView>
        </div>
    </form>
</body>
</html>
