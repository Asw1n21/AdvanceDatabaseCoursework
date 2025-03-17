<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tasks.aspx.cs" Inherits="AdvanceDatabaseCoursework.Tasks" %>

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
        <div>
            <asp:GridView ID="GridView1"  CssClass ="table table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="TASK_ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True"  ButtonType="Link"/>
                    
                    <asp:BoundField DataField="TASK_ID" HeaderText="TASK_ID" ReadOnly="True" SortExpression="TASK_ID" />
                    <asp:BoundField DataField="TASK_NAME" HeaderText="TASK_NAME" SortExpression="TASK_NAME" />
                    <asp:BoundField DataField="TASK_STARTDATE" HeaderText="TASK_STARTDATE" SortExpression="TASK_STARTDATE" />
                    <asp:BoundField DataField="TASK_DUEDATE" HeaderText="TASK_DUEDATE" SortExpression="TASK_DUEDATE" />
                    <asp:BoundField DataField="TASK_STATUS" HeaderText="TASK_STATUS" SortExpression="TASK_STATUS" />
                    <asp:BoundField DataField="MILESTONE_ID" HeaderText="MILESTONE_ID" SortExpression="MILESTONE_ID" />
                </Columns>
            </asp:GridView>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="TASK_ID" DataSourceID="SqlDataSource1">
                <EditItemTemplate>
                    
                </EditItemTemplate>
                <InsertItemTemplate>
                   <div class="form-container">  
                    TASK_ID:
                    <asp:TextBox ID="TASK_IDTextBox" runat="server" Text='<%# Bind("TASK_ID") %>' />
                    <br />
                    TASK_NAME:
                    <asp:TextBox ID="TASK_NAMETextBox" runat="server" Text='<%# Bind("TASK_NAME") %>' />
                    <br />
                    TASK_STARTDATE:
                    <asp:TextBox ID="TASK_STARTDATETextBox" runat="server" Text='<%# Bind("TASK_STARTDATE") %>' />
                    <br />
                    TASK_DUEDATE:
                    <asp:TextBox ID="TASK_DUEDATETextBox" runat="server" Text='<%# Bind("TASK_DUEDATE") %>' />
                    <br />
                    TASK_STATUS:
                    <asp:TextBox ID="TASK_STATUSTextBox" runat="server" Text='<%# Bind("TASK_STATUS") %>' />
                    <br />
                    MILESTONE_ID:
                    
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="MILESONE_NAME" DataValueField="MILESTONE_ID" SelectedValue='<%# Bind("MILESTONE_ID") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;MILESTONE_ID&quot;, &quot;MILESONE_NAME&quot; FROM &quot;MILESTONES&quot;"></asp:SqlDataSource>
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                   
                    <div class="button-container">
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New Task" CssClass="btn btn-new"/>
                        </div>
                </ItemTemplate>
            </asp:FormView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;TASKS&quot; WHERE &quot;TASK_ID&quot; = :TASK_ID" InsertCommand="INSERT INTO &quot;TASKS&quot; (&quot;TASK_ID&quot;, &quot;TASK_NAME&quot;, &quot;TASK_STARTDATE&quot;, &quot;TASK_DUEDATE&quot;, &quot;TASK_STATUS&quot;, &quot;MILESTONE_ID&quot;) VALUES (:TASK_ID, :TASK_NAME, :TASK_STARTDATE, :TASK_DUEDATE, :TASK_STATUS, :MILESTONE_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;TASK_ID&quot;, &quot;TASK_NAME&quot;, &quot;TASK_STARTDATE&quot;, &quot;TASK_DUEDATE&quot;, &quot;TASK_STATUS&quot;, &quot;MILESTONE_ID&quot; FROM &quot;TASKS&quot;" UpdateCommand="UPDATE &quot;TASKS&quot; SET &quot;TASK_NAME&quot; = :TASK_NAME, &quot;TASK_STARTDATE&quot; = :TASK_STARTDATE, &quot;TASK_DUEDATE&quot; = :TASK_DUEDATE, &quot;TASK_STATUS&quot; = :TASK_STATUS, &quot;MILESTONE_ID&quot; = :MILESTONE_ID WHERE &quot;TASK_ID&quot; = :TASK_ID">
            <DeleteParameters>
                <asp:Parameter Name="TASK_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TASK_ID" Type="Decimal" />
                <asp:Parameter Name="TASK_NAME" Type="String" />
                <asp:Parameter Name="TASK_STARTDATE" Type="DateTime" />
                <asp:Parameter Name="TASK_DUEDATE" Type="DateTime" />
                <asp:Parameter Name="TASK_STATUS" Type="String" />
                <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TASK_NAME" Type="String" />
                <asp:Parameter Name="TASK_STARTDATE" Type="DateTime" />
                <asp:Parameter Name="TASK_DUEDATE" Type="DateTime" />
                <asp:Parameter Name="TASK_STATUS" Type="String" />
                <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
                <asp:Parameter Name="TASK_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
