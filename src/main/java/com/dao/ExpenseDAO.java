package com.dao;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entity.Expense;
import com.entity.User;

public class ExpenseDAO {

	private SessionFactory factory=null;
	private Session session=null;
	private Transaction tx=null;
	
	public ExpenseDAO(SessionFactory factory) {
		super();
		this.factory=factory;
		
	}
	@Transactional
	public boolean saveExpense(Expense ex) {
		
		boolean f=false;
		try {
			session=factory.openSession();
			tx=session.beginTransaction();
			session.save(ex);
			tx.commit();
			f=true;
		}catch (Exception e) {
			if(tx!=null) {
				f=false;
				e.printStackTrace();
			}
		}
		return f;
		
	}
	public List<Expense> getAllExpenseByUser(User user){
		List<Expense> list=new ArrayList<Expense>();
		
		try {
			session=factory.openSession();
			Query q=session.createQuery("from Expense where user=:us");
			q.setParameter("us", user);
			list=q.list();
		}catch (Exception e) {
			e.printStackTrace();
		}
		finally {
            if (session != null) {
                session.close();
            }
		
	}
		return list;
}
}
