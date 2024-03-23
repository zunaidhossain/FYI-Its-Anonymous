package com.model;

public class Message {
	int messageId;
	int userId;
	String message;
	String msg_time;
	public Message(int messageId, int userId, String message, String msg_time) {
		super();
		this.messageId = messageId;
		this.userId = userId;
		this.message = message;
		this.msg_time = msg_time;
	}
	public int getMessageId() {
		return messageId;
	}
	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getMsg_time() {
		return msg_time;
	}
	public void setMsg_time(String msg_time) {
		this.msg_time = msg_time;
	}
}
