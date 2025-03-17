<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Entertainment - Sign In</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <style>
        /* Tổng quát */
        body {
            height: 100%;
            margin: 0;
            background-color: #ffffff;
            background-attachment: fixed;
        }

        .container-content {
            background-color: #2c2c2c;
            color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
        }

        .form-control {
            background-color: #ffffff;
            border: 1px solid #cccccc;
            color: #000000;
        }

        .form-control:focus {
            border-color: #E9CC5D;
            background-color: #ffffff;
        }

        /* Navbar */
        .navbar {
            margin-bottom: 0;
            border-radius: 0;
        }

        .navbar-brand {
            font-weight: bold;
            font-size: 1.2rem;
        }

        .navbar-nav>li>a {
            font-weight: bold;
            color: white !important;
        }

        .navbar-toggler {
            background-color: white;
        }

        /* Login */
        .login-container {
            max-width: 400px;
            margin: 0 auto;
            padding-top: 100px;
        }

        .logo-badge {
            font-size: 80px;
            font-weight: 800;
            margin-bottom: 20px;
        }

        /* Buttons */
        .form-button {
            background-color: rgba(255, 235, 59, 0.24);
            border: 1px solid rgba(255, 235, 59, 0.24);
            color: #e6e6e6;
        }

        .form-button:hover {
            background-color: rgba(255, 235, 59, 0.5);
        }

        /* Modal */
        .modal-content {
            background-color: #2c2c2c;
            color: white;
            border-radius: 10px;
        }

        .modal-header {
            border-bottom: 1px solid #FFEB3B;
        }

        .modal-header h4 {
            color: white;
            text-align: center;
        }

        .modal-body .form-control {
            background-color: #ffffff;
        }

        .modal-footer {
            border-top: none;
        }

        /* Links */
        .text-darkyellow {
            color: rgba(255, 235, 59, 0.6);
            text-decoration: none;
        }

        .text-darkyellow:hover {
            color: rgba(255, 235, 59, 1);
        }
    </style>
</head>

<body>
    <!-- Navbar -->
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
               
        <!-- Logo -->
        <a class="navbar-brand fw-bold text-white" href="${pageContext.request.contextPath}/">
            ONLINE ENTERTAINMENT
        </a>
            </div>
            <ul class="nav navbar-nav">
                <li><a href="${pageContext.request.contextPath}/admin">Admin</a></li>
                <li><a href="${pageContext.request.contextPath}/videoFavorite">My Favorites</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">My Account
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="${pageContext.request.contextPath}/editProfile">Edit Profile</a></li>
                        <li><a href="${pageContext.request.contextPath}/changePassword">Change Password</a></li>
                    </ul>
                </li>
                 <li><a href="${pageContext.request.contextPath}/signin"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
            </ul>
            
           
        </div>
    </nav>

    <!-- Login Form -->
    <div class="login-container text-center">
        <h1 class="logo-badge"><span class="fa fa-user-circle"></span></h1>
        <h3>Sign In to Online Entertainment</h3>
        <p class="text-danger">${error}</p>
        <div class="container-content">
            <form action="/Login" method="post">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Username" name="username" required>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="Password" name="password" required>
                </div>
                <button type="submit" class="form-button btn btn-primary btn-block">Sign In</button>
            </form>
            <a href="#" class="text-darkyellow" data-toggle="modal" data-target="#modalForgot">Forgot your password?</a>
            <p>Do not have an account? <a href="#" class="text-darkyellow" data-toggle="modal" data-target="#modalSignUp">Sign Up</a></p>
        </div>
    </div>

    <!-- Sign Up Modal -->
    <div class="modal fade" id="modalSignUp" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4>Sign Up</h4>
                </div>
                <form action="/SignUp" method="post">
                    <div class="modal-body">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="User Name" name="usernameR" required>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" placeholder="Password" name="passwordR" required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Full Name" name="fullnameR" required>
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control" placeholder="Email" name="emailR" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="form-button btn btn-primary">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Forgot Password Modal -->
  <!-- Forgot Password Modal -->
<div class="modal fade" id="modalForgot" role="dialog">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4>Forgot Password</h4>
            </div>
            <form action="/ForgotPassword" method="post">
                 <div class="form-floating mb-3">
                  <div class="modal-body">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="User Name" name="usernameR" required>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" placeholder="Email" name="passwordR" required>
                        </div>
                </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="form-button btn btn-primary">Submit</button>
                </div>
            </form>
        </div>
    </div>
</div>   
</body>

</html>
