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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		UserDAO dao=new UserDAO(HibernateUtil.getSessionFactory());
		
		User u=dao.login(email, password);
		HttpSession session=req.getSession();
		UserService us=new UserService();
		String pass=u.getPassword();
		us.checkPassword(password, pass);
		if(u==null)
		{
			session.setAttribute("msg","Invalid Credentials");
			resp.sendRedirect("login.jsp");
		}
		else
		{
			session.setAttribute("LoginUser",u);
			resp.sendRedirect("user/home.jsp");
		}
		
	}
	
	

}
