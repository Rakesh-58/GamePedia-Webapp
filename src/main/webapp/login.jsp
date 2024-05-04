<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="css/signup.css">
    <style>

    .card {

    height: 350px;

    }
    </style>
</head>

<body>

  <section class="bg">
    <header>

    </header>
    <div class="container">
      <h1>Welcome Back!</h1>
        <div class="card">

          <div class="card_title">
            <h2>Login</h2>
          </div>
          <div class="form">
          <form  id="loginForm">
            <input type="name" name="username" placeholder="User Name" id="username" required>
            <input type="password" name="password" placeholder="Password" id="password"  required>
            <div id="errorMessage" class="user" style"color:red;"></div>
            <input type="submit" value="Login">

            <a href="signup.jsp"><p>Don't have an Account? Create Here</p></a>
        </form>
          </div>
        </div>
      </div>
    </section>
</body>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
   <script>
           $(document).ready(function () {
               $("#loginForm").submit(function (event) {
                   event.preventDefault(); // Prevent the form from submitting in the traditional way

                   // Collect the form data
                   var formData = {
                       username: $("#username").val(),
                       password: $("#password").val()
                   };

                   // Send an AJAX request
                   $.ajax({
                       type: "POST",
                       url: "login",
                       data: formData,
                       success: function (response) {
                           if (response.includes("success")) {
                               // Redirect to home page
                               window.location.href = "index.jsp";
                           } else {
                               // Display error message
                               $("#errorMessage").text(response);
                           }
                       }
                   });
               });
           });
       </script>
</html>

