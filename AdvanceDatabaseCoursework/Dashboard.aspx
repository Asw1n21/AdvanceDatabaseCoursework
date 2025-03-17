<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Management System</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        /* Custom Styles */
        .content {
            padding: 20px;
        }

        .box {
            text-align: center;
            border: 2px solid #343a40;
            border-radius: 8px;
            padding: 20px;
            margin: 10px;
            background-color: #f8f9fa;
            transition: all 0.3s;
            display: block; /* Make it behave like a block element */
        }

        .box:hover {
            background-color: #343a40;
            color: white;
        }

        .box a {
            color: inherit; /* Make link inherit color from parent */
            text-decoration: none;
            font-size: 18px;
            display: block; /* Make the link a block-level element */
            height: 100%; /* Ensure link fills the entire box */
            width: 100%;
            padding: 5px; /* Ensure padding is inherited */
        }

        .box a:hover {
            color: white; /* Hover effect for link inside */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Project Management Tool</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Main Content Area -->
    <div class="container content">
        <h2>Welcome to the Project Management Dashboard</h2>
        <p>Select a section to view details.</p>
        
        <!-- Buttons for each section -->
        <div class="row">
            <div class="col-md-3 mb-4">
                <div class="box">
                    <a href="Users.aspx">Users</a>
                </div>
            </div>
            <div class="col-md-3 mb-4">
                <div class="box">
                    <a href="Projects.aspx">Projects</a>
                </div>
            </div>
            <div class="col-md-3 mb-4">
                <div class="box">
                    <a href="Tasks.aspx">Tasks</a>
                </div>
            </div>
            <div class="col-md-3 mb-4">
                <div class="box">
                    <a href="Subtasks.aspx">Subtasks</a>
                </div>
            </div>
            <div class="col-md-3 mb-4">
                <div class="box">
                    <a href="Milestones.aspx">Milestones</a>
                </div>
            </div>
            <div class="col-md-3 mb-4">
                <div class="box">
                    <a href="UserProjects.aspx">User Projects</a>
                </div>
            </div>
            <div class="col-md-3 mb-4">
                <div class="box">
                    <a href="UserProjectTasks.aspx">User Project Tasks</a>
                </div>
            </div>
            <div class="col-md-3 mb-4">
                <div class="box">
                    <a href="ProjectMilestone.aspx">Project Milestones</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Include Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        
        <br/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Width="492px">
            <Series>
                <asp:Series Name="Series1" XValueMember="TASK_STATUS" YValueMembers="COUNT">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT task_status, COUNT(*) AS COUNT FROM tasks GROUP BY task_status"></asp:SqlDataSource>
        <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </form>
</body>
</html>
