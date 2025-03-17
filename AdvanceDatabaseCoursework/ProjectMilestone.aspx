<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectMilestone.aspx.cs" Inherits="AdvanceDatabaseCoursework.ProjectMilestone" %>

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
            margin-top: 5px; /* Reduced gap */
            width: 30%; /* Reduced table width */
            border-collapse: collapse;
            background-color: white;
            border-radius: 8px;
            box-shadow: #343a40;
        }

        #GridView1 th, #GridView1 td {
            padding: 1px; /* Reduced padding */
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
    <form id="form1"  runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT p.project_id ,p.project_name,project_startdate, project_duedate, project_status, 
    m.milestone_id ,  milesone_name, milestone_startdate,milestone_duedate, milestone_status from projects p
    left join milestones m on p.project_id = m.project_id where p.project_id =:projects">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="projects" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <div class ="dropdown-container">
            <asp:GridView ID="GridView1"   CssClass ="table table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="PROJECT_ID" HeaderText="PROJECT_ID" SortExpression="PROJECT_ID" />
                    <asp:BoundField DataField="PROJECT_NAME" HeaderText="PROJECT_NAME" SortExpression="PROJECT_NAME" />
                    <asp:BoundField DataField="PROJECT_STARTDATE" HeaderText="PROJECT_STARTDATE" SortExpression="PROJECT_STARTDATE" />
                    <asp:BoundField DataField="PROJECT_DUEDATE" HeaderText="PROJECT_DUEDATE" SortExpression="PROJECT_DUEDATE" />
                    <asp:BoundField DataField="PROJECT_STATUS" HeaderText="PROJECT_STATUS" SortExpression="PROJECT_STATUS" />
                    <asp:BoundField DataField="MILESTONE_ID" HeaderText="MILESTONE_ID" SortExpression="MILESTONE_ID" />
                    <asp:BoundField DataField="MILESONE_NAME" HeaderText="MILESONE_NAME" SortExpression="MILESONE_NAME" />
                    <asp:BoundField DataField="MILESTONE_STARTDATE" HeaderText="MILESTONE_STARTDATE" SortExpression="MILESTONE_STARTDATE" />
                    <asp:BoundField DataField="MILESTONE_DUEDATE" HeaderText="MILESTONE_DUEDATE" SortExpression="MILESTONE_DUEDATE" />
                    <asp:BoundField DataField="MILESTONE_STATUS" HeaderText="MILESTONE_STATUS" SortExpression="MILESTONE_STATUS" />
                </Columns>
            </asp:GridView>
                </div>
        </div>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot; FROM &quot;PROJECTS&quot;"></asp:SqlDataSource>
        <p>
            <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Width="490px">
                <Series>
                    <asp:Series Name="Series1" XValueMember="MILESONE_NAME" YValueMembers="PROJECT_ID">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
        </p>
    </form>
</body>
</html>
