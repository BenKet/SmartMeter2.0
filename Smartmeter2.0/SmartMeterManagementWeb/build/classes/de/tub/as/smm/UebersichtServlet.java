package de.tub.as.smm;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import de.tub.as.smm.dao.SmartMeterDao;
import de.tub.as.smm.dao.UserDao;
import de.tub.as.smm.models.SmartMeter;
import de.tub.as.smm.models.User;

@WebServlet("/uebersicht")
public class UebersichtServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@EJB
	SmartMeterDao sm;
	
	@EJB
	UserDao u;
	

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		if(request.getParameter("name") != null && request.getParameter("pass") != null){
			
			String name = request.getParameter("name");
			String pass = request.getParameter("pass");
			
			session.setAttribute("username", name);
			session.setAttribute("pass", pass);
			
			request.setAttribute("sm", sm.getAllSmartMeter());
			request.getRequestDispatcher("/uebersicht.jsp").forward(request, response);
		}else{
			request.setAttribute("sm", sm.getAllSmartMeter());
			request.getRequestDispatcher("/uebersicht.jsp").forward(request, response);;
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(request.getParameter("kennung") != null){
		String kennung = request.getParameter("kennung");
		String maxStärke = request.getParameter("maxStaerke");
		sm.persist(new SmartMeter(kennung, maxStärke));
		
		}
		
		
		doGet(request, response);
	}

}