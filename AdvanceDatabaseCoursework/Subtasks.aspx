<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Subtasks.aspx.cs" Inherits="AdvanceDatabaseCoursework.Subtasks" %>

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
        margin-top:  0px;
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;SUBTASKS&quot; WHERE &quot;SUBTASK_ID&quot; = :SUBTASK_ID" InsertCommand="INSERT INTO &quot;SUBTASKS&quot; (&quot;SUBTASK_ID&quot;, &quot;SUBTASK_NAME&quot;, &quot;SUBTASK_ENDDATE&quot;, &quot;SUBTASK_STARTDATE&quot;, &quot;SUBTASK_STATUS&quot;, &quot;USER_ID&quot;, &quot;TASK_ID&quot;) VALUES (:SUBTASK_ID, :SUBTASK_NAME, :SUBTASK_ENDDATE, :SUBTASK_STARTDATE, :SUBTASK_STATUS, :USER_ID, :TASK_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;SUBTASK_ID&quot;, &quot;SUBTASK_NAME&quot;, &quot;SUBTASK_ENDDATE&quot;, &quot;SUBTASK_STARTDATE&quot;, &quot;SUBTASK_STATUS&quot;, &quot;USER_ID&quot;, &quot;TASK_ID&quot; FROM &quot;SUBTASKS&quot;" UpdateCommand="UPDATE &quot;SUBTASKS&quot; SET &quot;SUBTASK_NAME&quot; = :SUBTASK_NAME, &quot;SUBTASK_ENDDATE&quot; = :SUBTASK_ENDDATE, &quot;SUBTASK_STARTDATE&quot; = :SUBTASK_STARTDATE, &quot;SUBTASK_STATUS&quot; = :SUBTASK_STATUS, &quot;USER_ID&quot; = :USER_ID, &quot;TASK_ID&quot; = :TASK_ID WHERE &quot;SUBTASK_ID&quot; = :SUBTASK_ID">
                <DeleteParameters>
                    <asp:Parameter Name="SUBTASK_ID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="SUBTASK_ID" Type="Decimal" />
                    <asp:Parameter Name="SUBTASK_NAME" Type="String" />
                    <asp:Parameter Name="SUBTASK_ENDDATE" Type="DateTime" />
                    <asp:Parameter Name="SUBTASK_STARTDATE" Type="DateTime" />
                    <asp:Parameter Name="SUBTASK_STATUS" Type="String" />
                    <asp:Parameter Name="USER_ID" Type="Decimal" />
                    <asp:Parameter Name="TASK_ID" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SUBTASK_NAME" Type="String" />
                    <asp:Parameter Name="SUBTASK_ENDDATE" Type="DateTime" />
                    <asp:Parameter Name="SUBTASK_STARTDATE" Type="DateTime" />
                    <asp:Parameter Name="SUBTASK_STATUS" Type="String" />
                    <asp:Parameter Name="USER_ID" Type="Decimal" />
                    <asp:Parameter Name="TASK_ID" Type="Decimal" />
                    <asp:Parameter Name="SUBTASK_ID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" CssClass ="table table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="SUBTASK_ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="SUBTASK_ID" HeaderText="SUBTASK_ID" ReadOnly="True" SortExpression="SUBTASK_ID" />
                    <asp:BoundField DataField="SUBTASK_NAME" HeaderText="SUBTASK_NAME" SortExpression="SUBTASK_NAME" />
                    <asp:BoundField DataField="SUBTASK_ENDDATE" HeaderText="SUBTASK_ENDDATE" SortExpression="SUBTASK_ENDDATE" />
                    <asp:BoundField DataField="SUBTASK_STARTDATE" HeaderText="SUBTASK_STARTDATE" SortExpression="SUBTASK_STARTDATE" />
                    <asp:BoundField DataField="SUBTASK_STATUS" HeaderText="SUBTASK_STATUS" SortExpression="SUBTASK_STATUS" />
                    <asp:BoundField DataField="USER_ID" HeaderText="USER_ID" SortExpression="USER_ID" />
                    <asp:BoundField DataField="TASK_ID" HeaderText="TASK_ID" SortExpression="TASK_ID" />
                    <asp:TemplateField HeaderText="USER_NAME">
                        <ItemTemplate>
                            <asp:DropDownList Enabled ="false" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="USER_NAME" DataValueField="USER_ID" SelectedValue='<%# Bind("USER_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;USER_ID&quot;, &quot;USER_NAME&quot; FROM &quot;USERS&quot;"></asp:SqlDataSource>
                           
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="TASK_NAME">
                        <ItemTemplate>
                            <asp:DropDownList Enabled ="false" ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="TASK_NAME" DataValueField="TASK_ID" SelectedValue='<%# Bind("TASK_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;TASK_ID&quot;, &quot;TASK_NAME&quot; FROM &quot;TASKS&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="SUBTASK_ID" DataSourceID="SqlDataSource1">
            <EditItemTemplate>
                
                SUBTASK_ID:
                <asp:Label ID="SUBTASK_IDLabel1" runat="server" Text='<%# Eval("SUBTASK_ID") %>' />
                <br />
                SUBTASK_NAME:
                <asp:TextBox ID="SUBTASK_NAMETextBox" runat="server" Text='<%# Bind("SUBTASK_NAME") %>' />
                <br />
                SUBTASK_ENDDATE:
                <asp:TextBox ID="SUBTASK_ENDDATETextBox" runat="server" Text='<%# Bind("SUBTASK_ENDDATE") %>' />
                <br />
                SUBTASK_STARTDATE:
                <asp:TextBox ID="SUBTASK_STARTDATETextBox" runat="server" Text='<%# Bind("SUBTASK_STARTDATE") %>' />
                <br />
                SUBTASK_STATUS:
                <asp:TextBox ID="SUBTASK_STATUSTextBox" runat="server" Text='<%# Bind("SUBTASK_STATUS") %>' />
                <br />
                USER_ID:
                <asp:TextBox ID="USER_IDTextBox" runat="server" Text='<%# Bind("USER_ID") %>' />
                <br />
                TASK_ID:
                <asp:TextBox ID="TASK_IDTextBox" runat="server" Text='<%# Bind("TASK_ID") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                   
            </EditItemTemplate>
            <InsertItemTemplate>
                <div class="form-container">
                SUBTASK_ID:
                <asp:TextBox ID="SUBTASK_IDTextBox" runat="server" Text='<%# Bind("SUBTASK_ID") %>' />
                <br />
                SUBTASK_NAME:
                <asp:TextBox ID="SUBTASK_NAMETextBox" runat="server" Text='<%# Bind("SUBTASK_NAME") %>' />
                <br />
                SUBTASK_ENDDATE:
                <asp:TextBox ID="SUBTASK_ENDDATETextBox" runat="server" Text='<%# Bind("SUBTASK_ENDDATE") %>' />
                <br />
                SUBTASK_STARTDATE:
                <asp:TextBox ID="SUBTASK_STARTDATETextBox" runat="server" Text='<%# Bind("SUBTASK_STARTDATE") %>' />
                <br />
                SUBTASK_STATUS:
                <asp:TextBox ID="SUBTASK_STATUSTextBox" runat="server" Text='<%# Bind("SUBTASK_STATUS") %>' />
                <br />
                USER_ID:
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="USER_NAME" DataValueField="USER_ID" SelectedValue='<%# Bind("USER_ID") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;USER_ID&quot;, &quot;USER_NAME&quot; FROM &quot;USERS&quot;"></asp:SqlDataSource>
                <br />
                TASK_ID:
                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource3" DataTextField="TASK_NAME" DataValueField="TASK_ID" SelectedValue='<%# Bind("TASK_ID") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;TASK_ID&quot;, &quot;TASK_NAME&quot; FROM &quot;TASKS&quot;"></asp:SqlDataSource>
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                     </div>
            </InsertItemTemplate>
            <ItemTemplate>
               
               <div class="button-container">
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New Subtask" CssClass="btn" />
                </div>
            </ItemTemplate>
        </asp:FormView>
    </form>
</body>
</html>
