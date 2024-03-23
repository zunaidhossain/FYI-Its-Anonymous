package com.model;

public class User {
	int userId;
	String name;
	String password;
	public User(int userId, String name, String password) {
		super();
		this.userId = userId;
		this.name = name;
		this.password = password;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
