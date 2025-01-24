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
		public boolean saveExpense(Expense expense) {
		    boolean success = false;
		    Session session = factory.openSession();
		    Transaction tx = null;
		    try {
		        tx = session.beginTransaction();
		        User user = expense.getUser();
		        if (user != null && user.getId() == 0) {  // Check if the user is unsaved
		            session.save(user);  // Save the user first
		        }
		        session.save(expense);  // Now save the expense
		        tx.commit();
		        success = true;
		    } catch (Exception e) {
		        if (tx != null) tx.rollback();
		        e.printStackTrace();
		    } finally {
		        if (session != null) session.close();
		    }
		    return success;
		}
		@Transactional
		public boolean updateExpense(Expense expense) {
			
			boolean success = false;
		    Session session = factory.openSession();
		    Transaction tx = null;
		    try {
		        tx = session.beginTransaction();
		        session.saveOrUpdate(expense);  // Save the user first
		        tx.commit();
		        success = true;
		    } catch (Exception e) {
		        if (tx != null) tx.rollback();
		        e.printStackTrace();
		    } 
		    return success;
		    
		}
		public List<Expense> getAllExpenseByUser(User user) {
		    List<Expense> expenses = new ArrayList<Expense>();
		    Session session = factory.openSession();
		    try {
		        // Ensure the User is loaded before executing the query
		        if (user != null && user.getId() > 0) {
		            Query<Expense> query = session.createQuery("from Expense where user=:us", Expense.class);
		            query.setParameter("us", user);
		            expenses = query.list();
		        } else {
		            System.out.println("User is not valid or not persisted");
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    } 
		    return expenses;
		}

		public Expense getExpenseById(int id) {
	        Expense ex =null;
	        try {
	            session=factory.openSession();
	            Query q = session.createQuery("from Expense where id =:id");
	            q.setParameter("id", id);
	            ex = (Expense)q.uniqueResult(); 
	        }catch (Exception e) {
				e.printStackTrace();
			}
	        
	        return ex; // Will return null if not found
	    }
		public boolean deleteExpense(int id) {
			boolean f=false;
			try {
				session=factory.openSession();
				tx=session.beginTransaction();
				Expense ex=session.get(Expense.class,id);
				session.delete(ex);
				tx.commit();
				f=true;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return f;
			
		}
	}
