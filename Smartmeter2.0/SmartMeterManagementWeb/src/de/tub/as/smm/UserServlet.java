package de.tub.as.smm;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import de.tub.as.smm.dao.UserDao;
import de.tub.as.smm.models.User;

/**
 * Servlet implementation class UserServlet
 */

@WebServlet("/user")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// Injected DAO EJB:
    @EJB
    UserDao userDao;
 
    @Override
    protected void doGet(
        HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
    	HttpSession session = request.getSession();
    	if(session.getAttribute("username") != null){
    		session.removeAttribute("username");
    		session.removeAttribute("pass");
    		session.invalidate();
    	}
    	
        // Display the list of guests:
        request.setAttribute("user", userDao.getAllUsers());
        request.getRequestDispatcher("/user.jsp").forward(request, response);
    }
 
    @Override
    protected void doPost(
        HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        // Handle a new guest:
//        String name = request.getParameter("name");
//        if (name != null)
//            userDao.persist(new User(name));
//        
        // Display the list of guests:
        doGet(request, response);
    }
}