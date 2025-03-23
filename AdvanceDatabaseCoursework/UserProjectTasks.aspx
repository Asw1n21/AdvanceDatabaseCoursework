<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProjectTasks.aspx.cs" Inherits="AdvanceDatabaseCoursework.UserProjectTasks" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="/content/bootstrap.min.css" rel ="stylesheet" />
    <style>
    /* Custom Styles */
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
        margin: 0;
        padding: 20px;
    }

    .container {
        margin-top: 20px;
    }

    /* Style for the GridView */
    #GridView1 {
        margin-top: 20px;
        width: 80%; /* Set GridView width */
        border-collapse: collapse;
        background-color: white;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        margin-left: auto;
        margin-right: auto;
    }

    #GridView1 th, #GridView1 td {
        padding: 10px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    #GridView1 th {
        background-color: #343a40;
        color: white;
        font-weight: bold;
    }

    #GridView1 tr:hover {
        background-color: #f1f1f1;
    }

    /* Style for the DropDownList */
    #DropDownList1 {
        padding: 10px;
        border-radius: 5px;
        border: 1px solid #ccc;
        font-size: 1em;
        margin-top: 20px;
        width: 250px;
        display: block;
        margin-left: auto;
        margin-right: auto;
    }

    /* Container for the DropDownList */
    .dropdown-container {
        text-align: center;
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
            <asp:SqlDataSource ID="SqlDataSource1"    runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM (
    SELECT 
        u.user_id, 
        u.user_name, 
        u.user_email, 
        p.project_name, 
        COUNT(t.task_id) AS &quot;Completed&quot;,
        ROW_NUMBER() OVER (ORDER BY COUNT(t.task_id) DESC) AS rn
    FROM users u
    JOIN userprojecttasks upt ON u.user_id = upt.user_id
    JOIN projects p ON upt.project_id = p.project_id
    JOIN tasks t ON upt.task_id = t.task_id
    WHERE t.task_status = 'Completed' 
    AND p.project_id = :projects
    GROUP BY u.user_id, u.user_name, u.user_email, p.project_name
) subquery
WHERE rn &lt;= 3
">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="projects" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1">
            </asp:GridView>
        </div>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot; FROM &quot;PROJECTS&quot;"></asp:SqlDataSource>
    </form>
</body>
</html>
