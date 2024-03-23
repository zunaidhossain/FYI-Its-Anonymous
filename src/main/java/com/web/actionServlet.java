package com.web;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Message;
import com.model.User;
import com.service.Service;


@WebServlet("/actionServlet")
public class actionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public actionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String action = request.getParameter("action");
		//RequestDispatcher red = null;
		
		//rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		RequestDispatcher rd = null;
		HttpSession session = request.getSession();
		if("register".equals(action)) {
			
			String name = request.getParameter("name");
			String password = request.getParameter("newPassword");
			Random random = new Random();
	        int userId = random.nextInt(900000) + 100000;
			User user = new User(userId, name, password);
			Service service = new Service();
			try {
				boolean result = service.register(user);
				if(result) {
				rd = request.getRequestDispatcher("success.jsp");
				request.setAttribute("User", user);
				}else {
				rd = request.getRequestDispatcher("register.jsp");
				request.setAttribute("Status", "Failed");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if("login".equals(action)) {
			int userId = Integer.parseInt(request.getParameter("userId"));
			String password = request.getParameter("password");
			Service service = new Service();
			User user = null;
			try {
				user = service.loginValidator(userId, password);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(user != null) {
				try {
					session.setAttribute("MESSAGE", service.findMessages(userId));
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				session.setAttribute("USER", user);
				rd = request.getRequestDispatcher("dashboard.jsp");
			}else {
				request.setAttribute("CHECK", "wrongpass");
				rd = request.getRequestDispatcher("login.jsp");
			}
		}
		else if("search".equals(action)) {
			int userId = Integer.parseInt(request.getParameter("userId"));
			Service service = new Service();
			String name="";
			try {
				name = service.search(userId);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(name.length()>0) {
				request.setAttribute("userId", userId);
				request.setAttribute("name", name);
			}else {
				request.setAttribute("name", "notFound");
			}
			rd = request.getRequestDispatcher("home.jsp");
		}
		else if("sendMessage".equals(action)) {
			int userId = Integer.parseInt(request.getParameter("userId"));
			String msg = request.getParameter("question");
			
			Random random = new Random();
	        int messageId = random.nextInt(900000) + 100000;
	        
	        LocalDateTime currentDateTime = LocalDateTime.now();
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	        String formattedDateTime = currentDateTime.format(formatter);
	        
	        Message message = new Message(messageId, userId, msg, formattedDateTime);
	        Service service = new Service();
	        try {
				service.insertMessage(message);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        rd = request.getRequestDispatcher("home.jsp");
		}
		else if(action.startsWith("deleteMessage")) {
			User user = (User) session.getAttribute("USER");
			if(user != null) {
				int messageId = Integer.parseInt(action.substring(13, 19));
				Service service = new Service();
				try {
					if(service.deleteMessage(messageId)) {
						session.setAttribute("MESSAGE", service.findMessages(user.getUserId()));
						rd = request.getRequestDispatcher("dashboard.jsp");
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		else if("logout".equals(action)) {
			session.removeAttribute("USER");
			session.removeAttribute("MESSAGE");
			session.invalidate();
	        rd = request.getRequestDispatcher("home.jsp");
		}
		rd.forward(request, response);
	}
}
