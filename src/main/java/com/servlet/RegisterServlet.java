package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDAO;
import com.dao.UserService;
import com.db.HibernateUtil;
import com.entity.User;


@WebServlet("/register")
public class RegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name=req.getParameter("fullname");
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		User u=new User(name,email,password);
		//System.out.println(u);
		UserDAO dao=new UserDAO(HibernateUtil.getSessionFactory());
		boolean f=dao.saveuser(u);
		HttpSession session=req.getSession();
		UserService us=new UserService();
		us.hashPassword(password);
		if(f==true)
		{
			session.setAttribute("mesg","Registered Successfully");
			//System.out.println("Registered Successfully");	
			resp.sendRedirect("login.jsp");
		}
		else
		{
			session.setAttribute("mesg","Something went wrong");
			//System.out.println("Something went wrong");
			resp.sendRedirect("register.jsp");
		}
	}
}
