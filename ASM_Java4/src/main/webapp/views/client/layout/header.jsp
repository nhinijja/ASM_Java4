<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<nav class="navbar navbar-expand-lg bg-dark rounded">
    <div class="container-fluid">
        <!-- Logo -->
        <a class="navbar-brand fw-bold text-white" href="${pageContext.request.contextPath}/">
            ONLINE ENTERTAINMENT
        </a>

        <!-- Toggler for mobile view -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>

        <!-- Navbar links -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link fw-bold text-primary" href="${pageContext.request.contextPath}/admin">My Favorites</a>
                </li>
                

                <!-- Dropdown menu for My Account -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-primary fw-bold" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
                        My Account
                    </a>
                    <ul class="dropdown-menu">
                     
                         <li><a class="dropdown-item" href="${pageContext.request.contextPath}/editProfile">Edit Profile</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/changePassword">Change Password</a></li>
                    </ul>
                </li>
            </ul>

        <!-- Right-aligned links -->
<ul class="navbar-nav d-flex">
    <!-- Nếu chưa đăng nhập -->
  <li class="nav-item dropdown">
  
            <a class="nav-link fw-bold text-primary" href="${pageContext.request.contextPath}/signin">
                <span class="glyphicon glyphicon-log-in"></span> Login
            </a>
            
        </li>
   

    <!-- Nếu đã đăng nhập -->

       
        
  


        </div>
    </div>
</nav>
