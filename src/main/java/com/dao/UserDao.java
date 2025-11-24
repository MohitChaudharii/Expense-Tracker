package com.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entity.User;

public class UserDao {

	private SessionFactory factory = null;
	private Session session = null;
	private Transaction tx = null;

	public UserDao(SessionFactory factory) {
		super();
		// TODO Auto-generated constructor stub
		this.factory = factory;
	}

	public boolean saveUser(User user) {
		boolean f = false;

		try {

			session = factory.openSession();
			tx = session.beginTransaction();

			session.save(user); // Hibernate automatically generates the SQL "INSERT INTO ..." statement
			tx.commit(); // (permanently save the data in DB)
			f = true;

		} catch (Exception e) {

			if (tx != null) {
				f = false;
				e.printStackTrace();
			}
		}

		return f;
	}

	public User login(String email, String password) {
		User u = null;

		session = factory.openSession();

		Query q = session.createQuery("from User where email=:em and password=:ps");
		q.setParameter("em", email);
		q.setParameter("ps", password);

		u = (User) q.uniqueResult();

		return u;
	}

}
