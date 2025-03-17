<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProjects.aspx.cs" Inherits="AdvanceDatabaseCoursework.UserProjects" %>

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
            padding: 20px;
        }

        .container {
            margin-top: 20px;
        }

        .gridview-container {
            margin-top: 15px; /* Reduced gap */
        }

        .dropdown-container {
            margin-bottom: 10px; /* Reduced gap */
        }

        .chart-container {
            margin-top: 15px; /* Reduced gap */
        }

        .panel {
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .panel-heading {
            font-size: 1.5em;
            margin-bottom: 15px;
            font-weight: bold;
        }

        .panel-body {
            padding: 0;
        }

       
        .dropdown-container select {
            padding: 5px 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        /* Style for the dropdown */
        #DropDownList1 {
            margin-bottom: 10px; /* Reduced gap */
            width: 250px;
            font-size: 14px;
            padding: 8px;
        }

        /* Style for the GridView */
        #GridView1 {
            margin-top: 10px; /* Reduced gap */
            width: 80%; /* Reduced table width */
            border-collapse: collapse;
            background-color: white;
            border-radius: 8px;
            box-shadow: #343a40;
        }

        #GridView1 th, #GridView1 td {
            padding: 8px; /* Reduced padding */
            text-align: left;
            border-bottom: #343a40;
        }

        #GridView1 th {
            background-color: #343a40;
            color: white;
        }

        #GridView1 tr:hover {
            background-color: #f1f1f1;
        }

        /* Style for the chart */
       #Chart1 {
    margin-top: 15px; /* Reduced gap */
    background-color: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    
    /* Center the chart */
    display: block;
    margin-left: auto;
    margin-right: auto;
    width: 80%; /* Optional: Adjust width as needed */
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <div>
            <asp:SqlDataSource ID="SqlDataSource1"  runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="
SELECT 
    u.user_id, u.user_name,  u.user_email,  u.user_contact,  u.user_role, 
    p.project_id,  p.project_name,   p.project_startdate,  p.project_duedate,  p.project_status FROM users u
    JOIN userprojects up ON u.user_id = up.user_id
    JOIN projects p ON p.project_id = up.project_id where u.user_id = :users


">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="users" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>

            <div class ="dropdown-container">
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="USER_NAME" DataValueField="USER_ID">
            </asp:DropDownList>
            </div>
            <div class="gridview-container">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="USER_ID,PROJECT_ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="USER_ID" HeaderText="USER_ID" ReadOnly="True" SortExpression="USER_ID" />
                    <asp:BoundField DataField="USER_NAME" HeaderText="USER_NAME" SortExpression="USER_NAME" />
                    <asp:BoundField DataField="USER_EMAIL" HeaderText="USER_EMAIL" SortExpression="USER_EMAIL" />
                    <asp:BoundField DataField="USER_CONTACT" HeaderText="USER_CONTACT" SortExpression="USER_CONTACT" />
                    <asp:BoundField DataField="USER_ROLE" HeaderText="USER_ROLE" SortExpression="USER_ROLE" />
                    <asp:BoundField DataField="PROJECT_ID" HeaderText="PROJECT_ID" ReadOnly="True" SortExpression="PROJECT_ID" />
                    <asp:BoundField DataField="PROJECT_NAME" HeaderText="PROJECT_NAME" SortExpression="PROJECT_NAME" />
                    <asp:BoundField DataField="PROJECT_STARTDATE" HeaderText="PROJECT_STARTDATE" SortExpression="PROJECT_STARTDATE" />
                    <asp:BoundField DataField="PROJECT_DUEDATE" HeaderText="PROJECT_DUEDATE" SortExpression="PROJECT_DUEDATE" />
                    <asp:BoundField DataField="PROJECT_STATUS" HeaderText="PROJECT_STATUS" SortExpression="PROJECT_STATUS" />
                </Columns>
            </asp:GridView>
                </div>
        </div>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;USER_ID&quot;, &quot;USER_NAME&quot; FROM &quot;USERS&quot;"></asp:SqlDataSource>
       
        <div class ="chart-container">
        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Width="490px">
            <Series>
                <asp:Series Name="Series1" XValueMember="PROJECT_NAME" YValueMembers="USER_ID">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
        </div>
    </form>
</body>
</html>
