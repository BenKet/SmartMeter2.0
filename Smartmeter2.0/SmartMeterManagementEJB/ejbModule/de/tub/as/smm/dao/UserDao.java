  package de.tub.as.smm.dao;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import de.tub.as.smm.models.User;

/**
 * Session Bean implementation class UserDaoEJB
 */
@Stateless
public class UserDao {
	
	private static boolean angemeldet = false;

	// Injected database connection:
    @PersistenceContext private EntityManager em;
 
    // Stores a new user:
    public void persist(User user) {
        em.persist(user);
    }
 
    // Retrieves all the users:
    public List<User> getAllUsers() {
        TypedQuery<User> query = em.createQuery(
            "SELECT u FROM User u ORDER BY u.id", User.class);
        return query.getResultList();
    }
    
    
    public void anmelden(){
    	angemeldet = true;
    }
    
    public boolean istAngemeldet(){
    	return angemeldet;
    }
    

}