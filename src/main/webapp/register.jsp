<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
		
		.login-link {
            display: block;
            margin-top: 20px;
            text-decoration: none;
            color: #3498db; /* Blue */
            font-weight: bold;
            transition: color 0.3s ease;
        }

        .login-link:hover {
            color: #2980b9; /* Darker Blue */
        }
		
        .right-section {
            width: 45%;
            background-color: #ecf0f1; /* Light Grayish Blue */
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .registration-form {
            max-width: 400px;
            margin: 0 auto;
            margin-bottom: 20px;
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
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #bdc3c7; /* Light Gray */
            border-radius: 4px;
        }

        button {
            background-color: #3498db; /* Blue */
            color: #fff;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #2980b9; /* Darker Blue */
        }
    </style>
</head>
<%String Status = (String) request.getAttribute("Status"); %>
<body>
    <div class="container">
        <div class="left-section">
            <h1>FYI: It's Anonymous</h1>
            <p>Share your feedback anonymously.<br>Message others without revealing your identity.</p>
        	<a href="login.jsp" class="login-link">Already have an account? Click here to Log In.</a>
        	<a href="home.jsp" class="login-link">Want to give feedback to your friend? Click here.</a>
        </div>
        <div class="right-section">
            <div class="registration-form">
                <h2>Registration</h2>
                <form onsubmit="return validateForm()" action="actionServlet" method="post">
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" id="name" name="name" placeholder="Enter your name." required>
                    </div>
                    <div class="form-group">
                        <label for="newPassword">Password:</label>
                        <input type="password" id="newPassword" name="newPassword" placeholder="Enter password, min 8 characters." oninput="validateLength()" required>
                    	<span id="passwordError" style="color: red;"></span>
                    </div>
                    <div class="form-group">
                        <label for="confirmPassword">Confirm Password:</label>
                        <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Re-enter password." oninput="validateConfirmPassword()" required>
                    	 <span id="confirmPasswordError" style="color: red;"></span>
                    </div>
                    <div class="registrationFailed">
                    <%if("Failed".equals(Status)){ %>
                    <h3 style="color: red;"><strong> Registration Failed! Please retry!</strong></h3>
                    <%} %>
                    </div>
                    <button type="submit" name="action" value="register">Register</button>
                </form>
            </div>
        </div>
    </div>
    <script>
    function validateLength(){
        var password = document.getElementById("newPassword").value;
        var passwordError = document.getElementById("passwordError");
        if (password.length < 8) {
            passwordError.textContent = "Minimum password length is 8 characters!";
        } else {
            passwordError.textContent = "";
        }
    }
        function validateConfirmPassword() {
            var password = document.getElementById("newPassword").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            var confirmPasswordError = document.getElementById("confirmPasswordError");

            if (password !== confirmPassword) {
                confirmPasswordError.textContent = "Passwords do not match!";
            } else {
                confirmPasswordError.textContent = "";
            }
        }
        function validateForm() {
            var password = document.getElementById("newPassword").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            var passwordError = document.getElementById("passwordError");
            var confirmPasswordError = document.getElementById("confirmPasswordError");

            if (password !== confirmPassword) {
                confirmPasswordError.textContent = "Passwords do not match!";
                return false;
            }else if(password.length < 8){
            	passwordError.textContent = "Minimum password length is 8 characters!";
            	return false;
            } else {
                passwordError.textContent = "";
                return true;
            }
        }
    </script>
</body>
</html>
