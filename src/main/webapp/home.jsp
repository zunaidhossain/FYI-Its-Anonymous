<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FYI: It's Anonymous</title>
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
.container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 80%;
}

.form {
    width: 100%;
    border-radius: 24px;
}
.bubble {
    display: block;
    border-radius: 24px; 
    background-color: #ecf0f1;
}

.header {
    padding:16px 16px 12px;
    font-size:16px;
    background-color: white;
    border-radius: 32px 32px 0 0;
    display: flex;
    align-items: top;
    justify-content: left;
}
.pfp-container {
    border-radius:300px;
    width:40px;
    height:40px;
    background-color: #F1F1F1;
    background-image: url('https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Default_pfp.svg/1200px-Default_pfp.svg.png');
    background-position:center center;
    background-size: 40px 40px;
    background-repeat: no-repeat;
    overflow: hidden;
    position: relative;
    flex-shrink: 0;
    display: block;
  }
  
.pfp {
    width: 100%;
    height: 100%;
    object-fit: contain;
    border-radius: 20px;
}

.user-container {
    margin-left:12px;
    font-size: 14px;
}
.username {
    font-weight: 500;
}

.prompt {
    font-weight: bold;
}

.textarea-container {
    width:100%;
    margin-bottom:10px;
    background-color:rgba(255,255,255,0.4);
    backdrop-filter: blur(24px);
    -webkit-backdrop-filter: blur(6px);
    border-radius: 0 0 24px 24px;
    position: relative;
    -webkit-appearance: none;
}
textarea {
    width:100%;
    padding:18px 24px;
    height:140px;
    box-sizing: border-box;
    font-size:20px;
    font-weight: 600;
    border:none;
    outline:none;
    background-color: transparent;
}

textarea::placeholder {
    color: rgba(0,0,0,0.25);  
}
.left-section {
     width: 45%;
     padding-right: 20px;
}

.left-section h1 {
     font-size: 36px;
     color: #2c3e50; /* Dark Blue */
 }

.left-section p {
     font-size: 16px;
     color: #7f8c8d; /* Grayish Blue */
     line-height: 1.6;
}
.right-section {
      width: 45%;
      background-color: #ecf0f1; /* Light Grayish Blue */
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
.registration-link {
      display: block;
      margin-top: 20px;
      text-decoration: none;
      color: #3498db; /* Blue */
      font-weight: bold;
      transition: color 0.3s ease;
}

.registration-link:hover {
      color: #2980b9; /* Darker Blue */
}
.form-group {
      margin-bottom: 20px;
}

label {
	display: block;
	font-size: 14px;
	color: #2c3e50; /* Dark Blue */
	margin-bottom: 8px;
}
input {
	width: 78%;
	padding: 10px;
	font-size: 16px;
	border: 1px solid #bdc3c7; /* Light Gray */
	border-radius: 8px;
}
button {
     background-color: #3498db; /* Blue */
     color: #fff;
     padding: 10px 20px;
     font-size: 16px;
     border: none;
     border-radius: 8px;
     cursor: pointer;
 }
button:hover {
      background-color: #2980b9; /* Darker Blue */
}
.notification {
            display: none;
            position: fixed;
            top: 0;
            left: 50%;
            transform: translateX(-50%);
            background-color: #4CAF50; /* Green */
            color: #fff;
            text-align: center;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            z-index: 1;
        }
</style>
</head>
<body>
<div class="container">
<div class="left-section">
            <h1>FYI: It's Anonymous</h1>
            <p>Share your feedback anonymously.<br>Message others without revealing your identity.</p>
            <a href="register.jsp" class="registration-link">Want to get anonymous feedback? Register now.</a>
            <a href="login.jsp" class="registration-link">Already have an account? Click here to Log In.</a>
        </div>
   <div class="right-section">
   <div id="notification" class="notification"></div>
   <form action="actionServlet" method="post">
   		<div class="form-group">
        <label for="userId">Enter UserId to give anonymous feedback:</label>
        <input type="text" id="userId" name="userId" placeholder="Enter 6 digit userId:" required>
        <button type="submit" name="action" value="search">Search</button>
        </div>
        <%String name = (String) request.getAttribute("name");%> 
        <%int userId = 0; %>
   </form>   
   <%if(name != null){ %>
   <%if("notFound".equals(name)){ %>
   	<h3 style="color: red;">UserId not found!</h3>
	<%}else{%>
	<%userId = (int)request.getAttribute("userId"); %>
	<div class="messageForm"> 
	<form class="form" method="post">
		<div class="bubble">
			<div class="header">
				<div class="pfp-container">
				</div>
				<div class="user-container">
					<div class="username">@<%=name%></div>
					<div class="prompt">You are entering anonymous feedback for <%=name%></div>
				</div></div>
			<div class="textarea-container">
				<input type="hidden" value=<%=userId %> name="userId">
				<textarea placeholder="Enter your feedback here." name="question" autocomplete="off" maxlength="300" id="question" style="width: 567px; height: 265px;"></textarea>
			</div>
		</div>
		<button type="submit" name="action" value="sendMessage" style="float: right;" onclick="showNotification()">Submit</button>
	</form>
	</div>
	<%}} %>
	</div>
</div>
<script>
        function showNotification() {
            // Display the notification
            var notification = document.getElementById("notification");
            notification.innerHTML = "Message sent successfully!";
            notification.style.display = "block";

            // Hide the notification after 3 seconds (adjust as needed)
            setTimeout(function () {
                notification.style.display = "none";
            }, 6000);
        }
    </script>
</body>
</html>