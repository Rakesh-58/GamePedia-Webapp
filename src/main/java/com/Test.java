package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Test")
public class Test extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        username=username.trim();
        boolean usernameExists = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamepedia", "root", "root");
            String query = "SELECT * FROM login WHERE username=?";
            try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {
                preparedStatement.setString(1, username);
                ResultSet resultSet = preparedStatement.executeQuery();
                usernameExists = resultSet.next();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        if (usernameExists) {
            out.println("Username already exists. Choose a different username.");
        } else {
            out.println("Username is available");
        }
    }



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password=request.getParameter("password");
        String email=request.getParameter("email");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamepedia", "root", "root");
            Statement st=conn.createStatement();
            System.out.println(username+password+email);
            st.executeUpdate(String.format("INSERT INTO login VALUES('%s','%s','%s')",username,email,password));
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());
        }
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Registered Successfully');");
        out.println("window.location.href = 'login.jsp';");
        out.println("</script>");
    }

}
