package de.tub.as.smm.models;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "SmartMeter")
public class SmartMeter implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
Long id;
	private String kennung;
	private String Stromspannung;
	private String maxStromstärke;

	public SmartMeter() {
	}

	public SmartMeter(String kennung, String maxStärke) {
		this.kennung = kennung;
		this.maxStromstärke = maxStärke;
		// +zufällige Spannung
	}

	@Override
	public String toString() {
		return "Kennung: " + kennung;
	}

	@Column(name = "Kennung")
	public String getKennung() {
		return kennung;
	}

	@Column(name = "Stromspannung")
	public String getStromSpannung() {
		return Stromspannung;
	}

	@Column(name="ID")
	public Long getId() {
		return id;
	}

	
	@Column(name = "Stromstärke")
	public String getStromStärke() {
		return maxStromstärke;
	}

	public void setKennung(String kennung) {
		this.kennung = kennung;
	}

	public void setStromspannung(String stromspannung) {
		Stromspannung = stromspannung;
	}

	public void setStromstärke(String stromstärke) {
		maxStromstärke = stromstärke;
	}
}
