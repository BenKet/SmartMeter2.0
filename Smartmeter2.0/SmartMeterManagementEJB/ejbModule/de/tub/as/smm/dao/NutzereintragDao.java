package de.tub.as.smm.dao;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import de.tub.as.smm.models.Nutzereintrag;
import de.tub.as.smm.models.SmartMeter;

@Stateless
public class NutzereintragDao {
	
	@PersistenceContext
	private EntityManager em;

	public void persist(Nutzereintrag eintrag) {
		em.persist(eintrag);
	}

	public List<Nutzereintrag> getAllNutzereintraege(String kennung) {
		return em.createQuery("SELECT eintrag FROM Nutzereintrag eintrag WHERE eintrag.SmartMeterKennung LIKE :Kennnung", Nutzereintrag.class)
				.setParameter("Kennnung", kennung)
				.getResultList();
		
	}
	

}
