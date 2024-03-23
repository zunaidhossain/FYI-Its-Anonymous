<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.model.User"%>
<%@page import="com.model.Message"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>FYI: It's Anonymous</title>
    <link rel="icon" href="favicon.ico">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
        }

        header {
            background-color: #3498db; /* Blue */
            color: #fff;
            padding: 20px;
            text-align: center;
        }
        h1{
        	font-size: 36px;;
        }

        .dashboard-container {
            max-width: 800px;
            margin: 20px auto;
            background-color: #ecf0f1; /* Light Grayish Blue */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .welcome-section {
            margin-bottom: 18px;
        }

        .table-container {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #bdc3c7; /* Light Gray */
        }

        th {
            background-color: #3498db; /* Blue */
            color: #fff;
        }
        th:first-child,
		td:first-child {
    		width: 20px; 
		}
		
		.noMessages {
			margin-left: 15px;
		}
		input {
            width: 68%;
            padding: 8px;
            font-size: 16px;
            border: 1px solid #bdc3c7; /* Light Gray */
            border-radius: 4px;
            text-decoration: none;
            background-color: #fff;
        }

        .delete-button {
            background-color: #e74c3c; /* Red */
            color: #fff;
            border: none;
            padding: 8px 15px;
            border-radius: 4px;
            cursor: pointer;
        }

        .delete-button:hover {
            background-color: #c0392b; /* Darker Red */
        }
		
		.copy-button {
			background-color: #3498db;
            color: #fff;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            float: right;
            margin-right: 15px;
		}
		.copy-button:hover {
            background-color: #2980b9; /* Darker Blue */
		}
		
        .logout-button {
            background-color: #000;
            color: #fff;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            float: right;
            margin-right: 15px;
        }

        .logout-button:hover {
            background-color: #2980b9; /* Darker Blue */
        }
        .tooltip {
  			position: relative;
  			display: inline-block;
		}

		.tooltip .tooltiptext {
  			visibility: hidden;
  			width: 140px;
  			background-color: #555;
  			color: #fff;
  			text-align: center;
  			border-radius: 6px;
  			padding: 5px;
  			position: absolute;
  			z-index: 1;
  			bottom: 150%;
  			left: 50%;
  			margin-left: -75px;
  			opacity: 0;
  			transition: opacity 0.3s;
		}

		.tooltip .tooltiptext::after {
  			content: "";
  			position: absolute;
  			top: 100%;
  			left: 50%;
  			margin-left: -5px;
  			border-width: 5px;
  			border-style: solid;
  			border-color: #555 transparent transparent transparent;
		}

		.tooltip:hover .tooltiptext {
  			visibility: visible;
  			opacity: 1;
		}
    </style>
</head>
<%
User user = (User) session.getAttribute("USER"); 
String name = user.getName();
int userId = user.getUserId();
ArrayList<Message> messages = (ArrayList<Message>) session.getAttribute("MESSAGE");
%>
<body>
    <header>
        <h1>FYI: It's Anonymous</h1>
    </header>

    <div class="dashboard-container">
    <form action="actionServlet" method="post">
        <div class="welcome-section">
            <span style="font-size: 30px; font-family: 'Arial'; margin-left: 15px;"><strong>Welcome, <%=name %>!</strong></span>
            <button class="logout-button" value="logout" name="action">Logout</button>
        </div>
		</form>
		
				
        <div class="table-container">
        <%if(messages.size()>0){ %>
            <table>
                <thead>
                    <tr>
                        <th>Sl. No</th>
                        <th>Message</th>
                        <th style="text-align: right; padding-right: 28px;">Action</th>
                    </tr>
                </thead>
                <tbody>
                <%for(int i=0; i<messages.size(); i++){ %>
                    <tr>
                        <td><%=(i+1)%>.</td>
                        <td><%=messages.get(i).getMessage()%></td>
                        <%int msg = messages.get(i).getMessageId(); String temp = "deleteMessage"+msg;%>
                        <td style="text-align: right;"><form action="actionServlet" method="post" id="deleteForm"><button class="delete-button" name="action" value=<%=temp%> onclick="confirmDelete()">Delete</button></form></td>
                    </tr>
                    <%} %>
                </tbody>
            </table>
        <%}else{ %>
        <div class="noMessages">
        
        <h3>No messages in your inbox now! Share your userId with your friends to get messages!</h3>
		
		<div class="tooltip">
			<input type="text" value=<%=userId %> id="userId" disabled>
			<button class="copy-button" onclick="copyUserIdFunction()" onmouseout="outFunc()">
  			<span class="tooltiptext" id="myTooltip">Copy to Clipboard</span>
  			<i class="fa fa-copy"></i>
  		</button>
		</div>		
		
		</div>
        <%} %>
        </div>
        
    </div>
    <script>
    	function copyUserIdFunction() {
    	  	var copyText = document.getElementById("userId");
    	    copyText.select();
    	    copyText.setSelectionRange(0, 99999);
    	    navigator.clipboard.writeText(copyText.value);
    	    
    	    var tooltip = document.getElementById("myTooltip");
    	    tooltip.innerHTML = "Copied: " + copyText.value;
    	}
    	function outFunc() {
    		  var tooltip = document.getElementById("myTooltip");
    		  tooltip.innerHTML = "Copy to Clipboard";
    	}
        function confirmDelete() {
            var isConfirmed = confirm("Are you sure you want to delete?");
            if (isConfirmed) {
                document.getElementById("deleteForm").submit();
            }
        }
    </script>
</body>
</html>
