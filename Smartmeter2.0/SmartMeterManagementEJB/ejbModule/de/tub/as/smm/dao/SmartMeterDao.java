package de.tub.as.smm.dao;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import de.tub.as.smm.models.SmartMeter;

@Stateless
public class SmartMeterDao {

	@PersistenceContext
	private EntityManager em;

	public void persist(SmartMeter sm) {
		em.persist(sm);
	}

	public List<SmartMeter> getAllSmartMeter() {
		TypedQuery<SmartMeter> query = em.createQuery("SELECT sm FROM SmartMeter sm ORDER BY sm.id", SmartMeter.class);

		return query.getResultList();
	}

}
