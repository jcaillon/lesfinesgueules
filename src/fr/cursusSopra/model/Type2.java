/**
 * File modified by : Julien Caillon
 */
package fr.cursusSopra.model;

import java.sql.SQLException;

import fr.cursusSopra.dataLayer.Type2Dal;

/**
 *
 * @author Julien J
 *
 */
public class Type2 {

	private long idType2;
	private long idType1;
	private String libelle2;

	/**
	 * Constructeur permettant d'enregistrer un elemeent type2 dans la base de donnée
	 *
	 * @param libelle2 the libelle2
	 * @param idType1 the id type1
	 * @throws SQLException the SQL exception
	 */
	public Type2 (String libelle2,long idType1) throws SQLException{
		this.libelle2=libelle2;
		this.idType1=idType1;
		this.save();
	}

	/**
	 * Constructeur récuperant les attributs d'un type2 déja existant depuis la couche d'accès aux données
	 *
	 * @param idType2 the id type2
	 * @throws SQLException
	 */
	public Type2 (long idType2) {
		this.idType2=idType2;
		Type2Dal t2d;
		try {
			t2d = new Type2Dal(idType2);
			idType1 = t2d.getIdType1();
			libelle2= t2d.getLibelle2();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * Crée un objet type2 réutilisé dans les listes de type 2
	 *
	 * @param idType2 the id type2
	 * @param libelle2 the libelle2
	 */
	public Type2 (long idType2, String libelle2){
		this.libelle2= libelle2;
		this.idType2=idType2;
	}

	/**
	 * Transmition des informations de sauvegardes vers la couche d'accès aux données qui sauvegardera ensuite
	 *
	 * @throws SQLException the SQL exception
	 */
	public void save() throws SQLException {

		Type2Dal t2Dal = new Type2Dal(idType2);
		idType2 = t2Dal.save();
	}

	public void modify() throws SQLException {
		Type2Dal t2Dal = new Type2Dal(idType2);
		t2Dal.setLibelle2(libelle2);
		t2Dal.setIdType1(idType1);

		t2Dal.modify();
	}


	/**
	 * constructeur complet
	 * @param idType2
	 * @param idType1
	 * @param libelle2
	 */
	public Type2(long idType2, long idType1, String libelle2) {
		this.idType2 = idType2;
		this.idType1 = idType1;
		this.libelle2 = libelle2;
	}

	public long getIdType2() {return idType2;}
	public long getIdType1() {return idType1;}
	public String getLibelle2() {return libelle2;}

	public void setIdType1(long idType1) {this.idType1 = idType1;}
	public void setIdType2(long idType2) {this.idType2 = idType2;}
	public void setLibelle2(String libelle2) {this.libelle2 = libelle2;}
}
