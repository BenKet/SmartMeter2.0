package de.tub.as.smm;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import de.tub.as.smm.dao.DetailansichtDao;
import de.tub.as.smm.dao.NutzereintragDao;
import de.tub.as.smm.models.Detailansicht;
import de.tub.as.smm.models.Nutzereintrag;
import de.tub.as.smm.models.SmartMeter;
import de.tub.as.smm.models.User;

@WebServlet("/detailansicht")
public class DetailansichtServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@EJB
    DetailansichtDao sm;
 
	@EJB
    NutzereintragDao ne;
    
	 @Override
    protected void doGet(
            HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
        	
        	
        	HttpSession session = request.getSession();
        	request.getRequestDispatcher("/Detailansicht.jsp").forward(request, response);;
        }
	
	protected void doGetValue(
        HttpServletRequest request, HttpServletResponse response, String kennung)
            throws ServletException, IOException {
    	
    	
    	HttpSession session = request.getSession();
    	
            request.setAttribute("sm", sm.getDetailSmartMeter(kennung));
            request.setAttribute("ne", ne.getAllNutzereintraege(kennung));
            request.getRequestDispatcher("/Detailansicht.jsp").forward(request, response);
    }
 
    @Override
    protected void doPost(
        HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
    	
        
        String kennung = request.getParameter("kennung");
        String nutzerkennung = request.getParameter("nutzerkennung");
        String verbrauchswert = request.getParameter("verbrauchswert");
        
        if (nutzerkennung != null && kennung != null && verbrauchswert != null){
        	ne.persist(new Nutzereintrag(verbrauchswert, nutzerkennung, kennung));
        	doGetValue(request, response, kennung);
        }else if (kennung != null){
        	doGetValue(request, response, kennung);
        }
 
    }
	
}