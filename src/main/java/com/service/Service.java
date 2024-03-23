package com.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.dao.Dao;
import com.model.Message;
import com.model.User;

public class Service {
	public boolean register(User user) throws SQLException {
		Dao dao = new Dao();
		int result = dao.register(user);
		if(result > 0) {
			return true;
		}else {
			return false;
		}
	}
	public String search(int userId) throws SQLException {
		Dao dao = new Dao();
		return dao.search(userId);
	}
	public boolean insertMessage(Message message) throws SQLException {
		Dao dao = new Dao();
		if(dao.insertMessage(message) > 0){
			return true;
		}else {
			return false;
		}	
	}
	public User loginValidator(int userId, String password) throws SQLException {
		Dao dao = new Dao();
		return dao.loginValidator(userId, password);
	}
	public ArrayList<Message> findMessages(int userId) throws SQLException{
		Dao dao = new Dao();
		return dao.findMessages(userId);

	}
	public boolean deleteMessage(int messageId) throws SQLException {
		Dao dao = new Dao();
		if(dao.deleteMessage(messageId) > 0){
			return true;
		}else {
			return false;
		}	
	}
}
