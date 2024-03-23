<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.model.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FYI: It's Anonymous</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" href="favicon.ico">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
		.acknowledgement-container-font{
			font-size: 20px;
			text-align: left;
		}
        .acknowledgement-container {
            text-align: center;
            background-color: #ecf0f1; /* Light Grayish Blue */
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            justify-content: left;
        }

        h2 {
            font-size: 26px;
            color: #3498db; /* Blue */
        }

        p {	
            font-size: 20px;
            color: #333;
            margin-bottom: 20px;
        }

        span {
            font-weight: bold;
            color: #2c3e50; /* Dark Blue */
        }

        .back-to-home {
            margin-top: 24px;
            margin-right: 0px;
        }
        .copy-button {
			background-color: none;
            border: none;
            padding-left: 5px;
            cursor: pointer;
		}

        a {
            text-decoration: none;
            color: #3498db; /* Blue */
            font-weight: bold;
            font-size: 22px;
        }

        a:hover {
            text-decoration: underline;
        }
        .tooltip {
  			position: relative;
  			display: inline-block;
  			text-align: left;
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
		input {
            width: 68%;
            padding: 8px;
            font-size: 16px;
            border: 1px solid #bdc3c7; /* Light Gray */
            border-radius: 4px;
            text-decoration: none;
            background-color: #fff;
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
    </style>
</head>
<%User user = (User) request.getAttribute("User");%>
<body>
    <div class="acknowledgement-container">
        <h2>Registration Successful!</h2>
        <p style="text-align: left;">Thank you for joining <strong>FYI: It's Anonymous.</strong></p>
        <p style="text-align: left;"><%=user.getName() %> your registration is complete.</p>
        <p class="acknowledgement-container-font"><strong>Account Details:</strong></p>
        <div class="tooltip">
			<input type="text" id="userId" disabled value=<%=user.getUserId() %>>
			<button class="copy-button" onclick="copyUserIdFunction()" onmouseout="outFunc()">
  			<span class="tooltiptext" id="myTooltip">Copy to Clipboard</span>
  			<i class="fa fa-copy"></i>
  			</button>
		</div>	
		
        <p style="color: red;"  class="acknowledgement-container-font">Note: Take a screenshot as you will need the User ID to Log In.</p>
        <div class="back-to-Login">
            <a href="login.jsp">Back to Login</a>
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
	
        // Display pop-up
        setTimeout(function () {
            alert("Redirecting to Log-In page.");
            // Redirect to login page after 15 seconds
            window.location.href = "login.jsp";
        }, 15000); // 15000 milliseconds (15 seconds)
    </script> 
</body>
</html>
