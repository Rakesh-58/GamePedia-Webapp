package com;

import com.mysql.cj.Session;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/login")
public class login extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        session.removeAttribute("user");
        response.sendRedirect("index.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamepedia", "root", "root");
            Statement st=conn.createStatement();
            ResultSet r=st.executeQuery(String.format("select * from login where username='%s' and password='%s'",username,password));

            if (r.next()) {
                HttpSession session=request.getSession();
                session.setAttribute("user",username);
                response.getWriter().write("success");

            } else {
                response.getWriter().write("Wrong username or password");

            }
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());
        }
    }

}
