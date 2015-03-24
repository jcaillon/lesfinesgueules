/**
 *  Modified By Julien J
 */
package fr.cursusSopra.jUnit;

import static org.junit.Assert.assertEquals;

import org.junit.Before;
import org.junit.Test;

import fr.cursusSopra.model.Type1;
import fr.cursusSopra.tech.HostnameConnection;



public class TestTypes {

	@Before
	public void init() {

		// instancie l'objet HostnameConnection
		HostnameConnection hostnameConnexion = HostnameConnection.getInstance();
		hostnameConnexion.setHostName("localhost");
	}
	
	@Test
	public void testType1() {

		// Creation object type1 de clé 1
		
		Type1 type1 = new Type1 (1);

		//Essai de récuperation de valeur
		assertEquals("Vin", type1.getLibelle1());
		System.out.println(type1.getListeType2());
		assertEquals("Vin rouge", type1.getListeType2().get(0).getLibelle2());
		assertEquals("vin blanc", type1.getListeType2().get(1).getLibelle2());

	}
	
}
