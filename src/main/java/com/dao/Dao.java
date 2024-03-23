package com.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.helper.Helper;
import com.model.Message;
import com.model.User;

	public class Dao {
		public int register(User user) throws SQLException {
			Connection con = Helper.createConnection();
			PreparedStatement dbSelector = con.prepareStatement("use sql6689792");
			PreparedStatement ps = con.prepareStatement("INSERT INTO userTable VALUES(?, ?, ?)");
			ps.setInt(1, user.getUserId());
			ps.setString(2, user.getName());
			ps.setString(3, user.getPassword());
			dbSelector.executeQuery();
			int result = ps.executeUpdate();
			Helper.closeAll(con, ps, null);
			return result;
		}
		public String search(int userId) throws SQLException {
			Connection con = Helper.createConnection();
			PreparedStatement dbSelector = con.prepareStatement("use sql6689792");
			PreparedStatement ps = con.prepareStatement("SELECT name FROM userTable WHERE userId = ?");
			ps.setInt(1, userId);
			dbSelector.executeQuery();
			ResultSet rs = ps.executeQuery();
			String name="";
			while(rs.next()) {
				name = rs.getString(1);
			}
			Helper.closeAll(con, ps, rs);
			return name;
		}
		public int insertMessage(Message message) throws SQLException {
			Connection con = Helper.createConnection();
			PreparedStatement dbSelector = con.prepareStatement("use sql6689792");
			PreparedStatement ps = con.prepareStatement("INSERT INTO messageTable VALUES(?, ?, ?, ?)");
			ps.setInt(1, message.getMessageId());
			ps.setInt(2, message.getUserId());
			ps.setString(3, message.getMessage());
			ps.setString(4, message.getMsg_time());
			dbSelector.executeQuery();
			int result = ps.executeUpdate();
			Helper.closeAll(con, ps, null);
			return result;
		}
		public User loginValidator(int userId, String password) throws SQLException {
			Connection con = Helper.createConnection();
			PreparedStatement dbSelector = con.prepareStatement("use sql6689792");
			PreparedStatement ps = con.prepareStatement("SELECT * FROM userTable WHERE userId = ? AND password = ?");
			ps.setInt(1, userId);
			ps.setString(2, password);
			dbSelector.executeQuery();
			ResultSet rs = ps.executeQuery();
			User user=null;
			while(rs.next()) {
				user = new User(rs.getInt(1), rs.getString(2), rs.getString(3));
			}
			Helper.closeAll(con, ps, rs);
			return user;
		}
		public ArrayList<Message> findMessages(int userId) throws SQLException{
			ArrayList<Message> arr = new ArrayList<>();
			Message msg = null;
			Connection con = Helper.createConnection();
			PreparedStatement dbSelector = con.prepareStatement("use sql6689792");
			PreparedStatement ps = con.prepareStatement("SELECT * FROM messageTable WHERE userId = ? ORDER BY msg_time DESC");
			ps.setInt(1, userId);
			dbSelector.executeQuery();
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				msg = new Message(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4));
				arr.add(msg);
			}
			Helper.closeAll(con, ps, rs);
			return arr;
		}
		public int deleteMessage(int messageId) throws SQLException {
			Connection con = Helper.createConnection();
			PreparedStatement dbSelector = con.prepareStatement("use sql6689792");
			PreparedStatement ps = con.prepareStatement("DELETE FROM messageTable WHERE messageId = ?");
			ps.setInt(1, messageId);
			dbSelector.executeQuery();
			int result = ps.executeUpdate();
			Helper.closeAll(con, ps, null);
			return result;
		}

	}

