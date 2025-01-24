package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ExpenseDAO;
import com.db.HibernateUtil;

@WebServlet("/delete")
public class deleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		ExpenseDAO dao=new ExpenseDAO(HibernateUtil.getSessionFactory());
		boolean f=dao.deleteExpense(id);
		HttpSession session=req.getSession();
		if(f==true)
		{
			session.setAttribute("msg", "Deleted Sucessfully");
			resp.sendRedirect("user/viewexp.jsp");
		}
		
	}
	

}
