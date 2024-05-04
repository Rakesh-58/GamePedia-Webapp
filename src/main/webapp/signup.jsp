<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="css/signup.css">
</head>
<script>
        function showAlert(message) {
            alert(message);
        }
    </script>
<body>

  <section class="bg">
    <div class="container">
      <h1>Welcome to Game-pedia</h1>
        <div class="card">

          <div class="card_title">
            <h2>Create Account</h2>
          </div>
          <div class="form">
          <form action="Test" method="post">
            <input type="name" name="username" placeholder="User Name" id="username" required minlength="3">
            <div id="usernameMessage" class="user"></div>
            <input type="email" name="email" placeholder="Email" id="email" required>
            <input type="password" name="password" placeholder="Password" id="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>

            <input type="submit" value="Submit">

        </form>
          </div>
        </div>
      </div>
    </section>
</body>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#username").blur(function () {
                var username = $(this).val();
                $.ajax({
                    type: "GET",
                    url: "Test",
                    data: { username: username },
                    success: function (response) {
                        $("#usernameMessage").html(response);
                    }
                });
            });
        });
    </script>
</html>

