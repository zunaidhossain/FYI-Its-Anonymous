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
            text-align: center;
        }

        h1 {
            color: #3498db; /* Blue */
        }

        p {
            color: #2c3e50; /* Dark Blue */
            margin-bottom: 20px;
        }

        .home-button {
            background-color: #3498db; /* Blue */
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .home-button:hover {
            background-color: #2980b9; /* Darker Blue */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Oops! You are logged out!</h1>
        <p>You do not have permission to access this page.</p>
        <a href="home.jsp" class="home-button">Go to Home Page</a>
    </div>
</body>
</html>
