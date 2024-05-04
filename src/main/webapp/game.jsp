<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Marvel's Spider-Man 2</title>
    <link rel="stylesheet" href="css/game.css">

</head>
<%@ page import="java.sql.*" %>
<%
    String user=(String)session.getAttribute("user");
    String name=request.getParameter("game");
     try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamepedia", "root", "root");
        Statement st=conn.createStatement();
        ResultSet r=st.executeQuery(String.format("select * from games where game_id='%s'",name));
        r.next();

%>
<body>
    <header class="header" id="header">
        <nav class="nav container">
           <a href="#" class="nav__logo"><b>Game-Pedia &#127918;</b></a>

           <div class="nav__menu" id="nav-menu">
              <ul class="nav__list">
                 <li class="nav__item">
                    <a href="index.jsp" class="nav__link">Home</a>
                 </li>

                 <li class="nav__item">
                    <a href="all.jsp" class="nav__link">All Games</a>
                 </li>
                 <li>
                      <%
                         if(user==null)
                         {
                      %>
                      <a href="login.jsp" class="nav__button">Login</a>
                      <%
                         }
                         else
                         {
                      %>
                      <div class="dropdown">
                          <button class="dropbtn"> <img src="images/logo.gif" alt="Hello"></button>
                          <div class="dropdown-content">
                            <a href="">Hello, <%= user  %></a>
                            <a href="/GamePedia/login">Logout</a>
                          </div>
                        </div>
                      <%
                         }
                      %>
                 </li>
              </ul>
           </div>
        </nav>
     </header>
    <br>


    <div class="cover" style="background-image: url('images/<%= r.getString(1) %>.jpg')">
        <h1><%= r.getString(2) %></h1>
    </div>
    <section>
           <br>
    <h3>Plot</h3><br>
    <%
        String[] para=r.getString(3).split("@");
        for(String s:para)
        { %>
            <p>
                <%= s %><br><br>
            </p>
        <%
        }
    %>
    <br>
    <h3>Gameplay</h3><br>
    <div style="align-items: center; text-align: center;">
        <iframe src="<%= r.getString(4) %>">
        </iframe>
    </div><br>

    <h3>Image Gallery</h3><br>
    <div class="gallery">
        <img src="images/<%= r.getString(1) %>/img1.jpg" alt="" class="myImg">
        <img src="images/<%= r.getString(1) %>/img2.jpg" alt="" class="myImg">
        <img src="images/<%= r.getString(1) %>/img3.jpg" alt="" class="myImg">
        <img src="images/<%= r.getString(1) %>/img4.jpg" alt="" class="myImg">
        <img src="images/<%= r.getString(1) %>/img5.jpg" alt="" class="myImg">
        <img src="images/<%= r.getString(1) %>/img6.jpg" alt="" class="myImg">
    </div>
    <div id="myModal" class="modal">
        <span class="close">&times;</span>
        <img class="modal-content" id="img01">
    </div>
</section>
<br>
<%
}
    catch (Exception e)
    {
        System.out.println(e.getMessage());
    }
%>

</body>

<script>

    var modal = document.getElementById("myModal");
    var images = document.querySelectorAll(".myImg");
    var modalImg = document.getElementById("img01");
    var span = document.getElementsByClassName("close")[0];

    images.forEach(function (img) {
        img.onclick = function () {
            modal.style.display = "block";
            modalImg.src = this.src;
        };
    });

    span.onclick = function () {
        modal.style.display = "none";
    };

 </script>
</html>