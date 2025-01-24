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
import com.entity.Expense;
import com.entity.User;
@WebServlet("/update")
public class UpdateServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		String title=req.getParameter("title");
		String date=req.getParameter("date");
		String price=req.getParameter("price");
		String descr=req.getParameter("description");
		
		
		HttpSession session=req.getSession();
		User user=(User) session.getAttribute("LoginUser");
		
		Expense ex=new Expense(title,date,descr,price,user);
		ex.setId(id);
		ExpenseDAO dao=new ExpenseDAO(HibernateUtil.getSessionFactory());
		boolean f=dao.updateExpense(ex);
		if(f==true)
		{
			session.setAttribute("mesg","Expense Updated Successfully");
				
			resp.sendRedirect("user/viewexp.jsp");
		}
		else
		{
			session.setAttribute("mesg","Something went wrong");
			
			resp.sendRedirect("user/addexp.jsp");		
		}
	}
	

}

