<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Game-pedia</title>
    <link rel="stylesheet" href="css/index.css">
</head>
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
    <section id="home">
        <br><br>
        <h1>Welcome to Game-pedia</h1><br>
        <p>Explore the world of video games with Game-pedia. Get detailed information about your favorite games and read reviews from our community.</p>
        <br>
    </section>

    <section id="games">
        <h2>Featured Games</h2><br>
        <a href="game.jsp?game=spider">
            <div class="gamecard">
                <img src="images/spider.jpg" >
                <div class="description">
                    <h2>Marvel's Spider-Man 2</h2>
                    <p>Spider-Men, Peter Parker and Miles Morales, return for an exciting new adventure in Marvel's Spider-Man franchise for PS5. Swing,
                        jump and utilize the new Web Wings to travel across Marvel's New York, quickly switching between Peter Parker and Miles Morales
                        to experience different stories and epic new powers, as the iconic villain Venom threatens to destroy their lives, their city and
                        the ones they love. The incredible power of the symbiote forces Peter and Miles to face the ultimate test of strength, both
                        inside and outside the mask, as they balance their lives, friendships and their duty to protect those in need. Quickly swap
                        between both Spider-Men as you explore an expanded Marvel's New York. Fight against a variety of new and iconic villains,
                        including an original take on the monstrous Venom, the ruthless Kraven the Hunter, the volatile Lizard and many more. Explore a
                        larger Marvel's New York than ever before, featuring two new boroughs - Brooklyn and Queens - as well as locations like Coney
                        Island and more
                    </p>
                </div>
            </div>
        </a>
        <br><br>
        <a href="game.jsp?game=mario">
            <div class="gamecard">
                <img src="images/mario.jpg" >
                <div class="description">
                    <h2>Super Mario Bros Wonder</h2>
                    <p>Mario, Luigi, Princess Peach, Princess Daisy and an entourage of Toads and Yoshis are invited to the neighboring Flower Kingdom
                        by its ruler, Prince Florian, to see a demonstration of a Wonder Flower; great treasures of the Flower Kingdom that can warp
                        reality. Bowser interrupts the ceremony and seizes the Wonder Flower, using its power to merge with Prince Florian's castle,
                        turning himself into a giant flying fortress and imprisoning the citizens of the Flower Kingdom. Mario volunteers to help Prince
                        Florian defeat Bowser and restore order to the land, with his friends following suit. Prince Florian accompanies the party, wearing
                         badges that enhance the group's abilities. As Mario, Prince Florian, and the gang work to collect the Wonder Seeds and save the
                         captured Poplins, they realize that by gathering six Royal Seeds, which are considered precious treasures in the Flower Kingdom,
                         they will grant access to Castle Bowser, as each time a Royal Seed is collected, it destroys one of the six Cloud Piranhas protecting
                         Castle Bowser.
                    </p>
                </div>
            </div>
        </a>

    </section>

    <section id="reviews">
        <h2>Game Reviews</h2>
        <p>Read reviews from our community about the latest and greatest video games.</p>
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
