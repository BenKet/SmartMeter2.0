package de.tub.as.smm.models;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import de.tub.as.smm.models.Nutzereintrag;

@Entity
@Table(name="User")
public class User implements Serializable {
    private static final long serialVersionUID = 1L;
 
    // Persistent Fields:
    @Id @GeneratedValue
    Long id;
    private String name;
    private String pw;
    private Date signingDate;
//    private List<Nutzereintrag> nutzereinträge = null;
    
    // Constructors:
    public User() {
    }
    
    public User(String name, String pw) {
        this.name = name;
        this.pw = pw;
        this.signingDate = new Date(System.currentTimeMillis());
//        this.nutzereinträge = new ArrayList<>();
    }
    
    @Column(name="ID")
    public Long getId() {
		return id;
	}
    @Column(name="Name")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	@Column(name="signingDate")
	public Date getSigningDate() {
		return signingDate;
	}

	public void setSigningDate(Date signingDate) {
		this.signingDate = signingDate;
	}
//    
//    @ManyToMany(mappedBy="User")
//	public List<Nutzereintrag> getEinträge(){
//	    	return this.nutzereinträge;
//	    }
    
 
    // String Representation:
    @Override
    public String toString() {
        return name + " (signed on " + signingDate + ")";
    }
}