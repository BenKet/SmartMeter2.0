 package de.tub.as.smm.dao;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import de.tub.as.smm.models.Detailansicht;
import de.tub.as.smm.models.SmartMeter;
import de.tub.as.smm.models.User;

/**
 * Session Bean implementation class UserDaoEJB
 */
@Stateless
public class DetailansichtDao {
	
	@PersistenceContext
	private EntityManager em;

	public void persistDe(Detailansicht detailansicht) {
		em.persist(detailansicht);
	}

	public List<SmartMeter> getDetailSmartMeter(String kennung) {
		return em.createQuery("SELECT sm FROM SmartMeter sm WHERE sm.kennung LIKE :Kennnung", SmartMeter.class)
				.setParameter("Kennnung", kennung)
				.setMaxResults(1)
				.getResultList();


	}




}