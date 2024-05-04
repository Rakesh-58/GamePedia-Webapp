<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Games</title>
    <link rel="stylesheet" href="css/all.css">
</head>
<%@ page import="java.sql.*" %>
<%
    String user=(String)session.getAttribute("user");
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

                 <li class="nav__item">
                    <a href="#contact" class="nav__link">Contact Us</a>
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
     <section>
        <br><br>

        <h2>All Games</h2>
        <br>
        <div class="card-container">
            <%
                try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamepedia", "root", "root");
                    Statement st=conn.createStatement();
                    ResultSet r=st.executeQuery("select * from games");
                    while(r.next())
                    {
                        String game=r.getString("game_id");
                        game="images/"+game+".jpg";
                        %>
                        <div class="game-card">
                            <a href="game.jsp?game=<%= r.getString("game_id") %>">
                            <img src="<%= game %>" alt="<%= r.getString("game_name") %>">
                            <h3><%= r.getString("game_name") %></h3>
                            </a>
                        </div>
                        <%

                    }
                }
                catch (Exception e)
                {
                    System.out.println(e.getMessage());
                }
            %>
        </div>
        <br><br>
     </section>
    <footer>
        <section id="contact">
            <h2>Contact Us</h2>
            <p>Have questions or suggestions? Reach out to us:</p>
            <address>
                Email: info@gamepedia.com<br>
                Phone: (555) 123-4567
            </address>
        </section>
        &copy; 2024 Game-pedia. All rights reserved.
    </footer>
</body>
</html>