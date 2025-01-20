package com.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import net.bytebuddy.utility.nullability.NeverNull;
@Entity
@Table(name="expense")
public class Expense {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@NeverNull
	private String title;
	@NeverNull
	private String date;
	@NeverNull
	private String descr;
	@NeverNull
	private String price;
	@ManyToOne
	public User user;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String desc) {
		this.descr = descr;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Expense() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Expense(String title, String date, String descr, String price,User user) {
		super();
		this.title = title;
		this.date = date;
		this.descr = descr;
		this.price = price;
		this.user = user;
	}
	
}
