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

        .right-section {
            width: 45%;
            background-color: #ecf0f1; /* Light Grayish Blue */
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .login-form {
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
<%String check = (String) request.getAttribute("CHECK"); %>
<body>
    <div class="container">
        <div class="left-section">
            <h1>FYI: It's Anonymous</h1>
            <p>Share your feedback anonymously.<br>Message others without revealing your identity.</p>
            <a href="register.jsp" class="registration-link">Want to get anonymous feedback? Register now.</a>
            <a href="home.jsp" class="registration-link">Want to give feedback to your friend? Click here.</a>
        </div>
        <div class="right-section">
            <div class="login-form">
                <h2>Login</h2>
                <form method="post" action="actionServlet">
                    <div class="form-group">
                        <label for="userId">User Id:</label>
                        <input type="text" id="userId" name="userId" placeholder="Enter 6 digit User Id." required>
                    </div>
                    <div class="form-group">
                        <label for="password">Password:</label>
                        <input type="password" id="password" name="password" placeholder="Enter password." required>
                    </div>
                    <%if("wrongpass".equals(check)){ %>
                    <div class="wrongPassword"><h3 style="color: red;"><strong>Log-in Failed! Please re-enter!</strong></h3></div>
                    <%} %>
                    <%if("Log-Out".equals(check)){ %>
                    <div class="wrongPassword"><h3 style="color: red;"><strong>User logged out! Please login!</strong></h3></div>
                    <%} %>
                    <button type="submit" name="action" value="login">Login</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
